--[[
    ███████╗██╗  ██╗████████╗██████╗  █████╗ ██╗         ██████╗ ██████╗ 
    ██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██║        ██╔════╝██╔════╝ 
    █████╗   ╚███╔╝    ██║   ██████╔╝███████║██║        ██║     ██║      
    ██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║██║        ██║     ██║      
    ███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║███████╗   ╚██████╗╚██████╗ 
    ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚═════╝ 
    extral.cc | sigma edition | advanced universal script
--]]

-- ==================== SERVICES ====================
local TweenService     = game:GetService("TweenService")
local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local Workspace        = game:GetService("Workspace")
local Stats            = game:GetService("Stats")
local Lighting         = game:GetService("Lighting")
local StarterGui       = game:GetService("StarterGui")
local CoreGui          = game:GetService("CoreGui")
local LocalPlayer      = Players.LocalPlayer
local Mouse            = LocalPlayer:GetMouse()
local Camera           = Workspace.CurrentCamera

-- ==================== SIGMA COLOR PALETTE ====================
local Colors = {
    BG          = Color3.fromRGB(10,  10,  14),   -- near-black
    BG2         = Color3.fromRGB(16,  16,  22),   -- panel bg
    BG3         = Color3.fromRGB(22,  22,  32),   -- item bg
    Accent      = Color3.fromRGB(90,  180, 255),  -- cyan-blue
    AccentDim   = Color3.fromRGB(45,  100, 160),  -- dimmed accent
    AccentGlow  = Color3.fromRGB(0,   200, 255),  -- neon glow
    Red         = Color3.fromRGB(255, 60,  80),
    Green       = Color3.fromRGB(60,  255, 130),
    Yellow      = Color3.fromRGB(255, 210, 50),
    Purple      = Color3.fromRGB(160, 90,  255),
    White       = Color3.fromRGB(230, 235, 245),
    Text        = Color3.fromRGB(190, 200, 220),
    TextDim     = Color3.fromRGB(100, 115, 140),
    Border      = Color3.fromRGB(35,  40,  60),
    ToggleOn    = Color3.fromRGB(90,  180, 255),
    ToggleOff   = Color3.fromRGB(40,  44,  60),
}

-- ==================== CONFIG ====================
local Config = {
    Aimlock = {
        Enabled    = false,
        Keybind    = Enum.KeyCode.Q,
        Smooth     = 0.2,
        FOV        = 250,
        Prediction = 0,
        Part       = "Head",  -- "Head" | "HumanoidRootPart" | "Torso"
        TeamCheck  = false,
        VisCheck   = true,
    },
    SilentAim = {
        Enabled    = false,
        Supported  = true,
        Prediction = 0,
        Part       = "Head",
    },
    AutoShoot      = false,
    AutoPrediction = false,
    ESP = {
        Enabled        = false,
        Boxes          = false,
        Names          = false,
        Distance       = false,
        HealthBars     = false,
        Tracers        = false,
        MaxDistance    = 500,
        TeamColor      = false,
        ChamsEnabled   = false,
    },
    Movement = {
        WalkspeedEnabled = false,
        WalkspeedValue   = 50,
        WalkspeedKey     = Enum.KeyCode.T,
        JumpPowerEnabled = false,
        JumpPowerValue   = 100,
        InfiniteJump     = false,
        BHop             = false,
        FlyEnabled       = false,
        FlySpeed         = 50,
        FlyKey           = Enum.KeyCode.F,
        GravityEnabled   = false,
        GravityValue     = 196.2,
    },
    Noclip = {
        Enabled = false,
        Keybind = Enum.KeyCode.N,
    },
    Player = {
        OutlineTarget    = false,
        KillAura         = false,
        KillAuraRange    = 10,
        AntiAFK          = true,
        FreezeSelf       = false,
        HitboxExpand     = false,
        HitboxSize       = 5,
        SprintEnabled    = false,
        SprintKey        = Enum.KeyCode.LeftShift,
        SprintSpeed      = 30,
        ReachEnabled     = false,
        ReachValue       = 10,
    },
    World = {
        FullbrightEnabled = false,
        TimeSet           = false,
        TimeValue         = 14,
        FogEnabled        = false,
        InfiniteAmmo      = false,
    },
    FOVCircle = {
        Enabled   = false,
        Radius    = 250,
        Thickness = 1.5,
        Color     = Color3.fromRGB(90, 180, 255),
    },
}

-- ==================== STATE ====================
local CurrentTarget   = nil
local CurrentOutline  = nil
local LastHealth      = {}
local Connections     = {}
local silentTarget    = nil
local ESPObjects      = {}
local AimlockConnection = nil
local originalLighting = {}
local flyBodyVelocity = nil
local flyBodyGyro    = nil
local isSprinting    = false

-- ==================== UTILITIES ====================
local function IsMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function isAlive(plr)
    if not plr or not plr.Character then return false end
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    local be = plr.Character:FindFirstChild("BodyEffects")
    if be then
        local ko = be:FindFirstChild("K.O")
        local grabbed = be:FindFirstChild("GRABBING_CONSTRAINT")
        if (ko and ko.Value) or (grabbed and grabbed.Value) then return false end
    end
    return true
end

local function isVisible(pos, player)
    if not Config.Aimlock.VisCheck then return true end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.IgnoreWater = true
    local direction = pos - Camera.CFrame.Position
    local result = Workspace:Raycast(Camera.CFrame.Position, direction.Unit * direction.Magnitude, params)
    if not result or result.Instance:IsDescendantOf(player.Character) then return true end
    return false
end

local function isSameTeam(player)
    if not Config.Aimlock.TeamCheck then return false end
    return player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team
end

local function GetClosestPlayerToCursor(fov)
    fov = fov or Config.Aimlock.FOV
    local closestPlayer = nil
    local shortestDist = fov
    local mousePos = IsMobile()
        and Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        or Vector2.new(Mouse.X, Mouse.Y)
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isAlive(player) and not isSameTeam(player) and player.Character then
            local part = player.Character:FindFirstChild(Config.Aimlock.Part)
                or player.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist2d = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    local dist3d = (part.Position - Camera.CFrame.Position).Magnitude
                    if dist2d < shortestDist and dist3d <= Config.ESP.MaxDistance then
                        shortestDist = dist2d
                        closestPlayer = player
                    end
                end
            end
        end
    end
    return closestPlayer
end

local function GetPartToAim(target, partOverride)
    if not target or not target.Character then return nil end
    local partName = partOverride or Config.Aimlock.Part
    return target.Character:FindFirstChild(partName)
        or target.Character:FindFirstChild("HumanoidRootPart")
end

-- ==================== FOV CIRCLE ====================
local fovCircle = Drawing.new("Circle")
fovCircle.Visible    = false
fovCircle.Radius     = Config.FOVCircle.Radius
fovCircle.Color      = Config.FOVCircle.Color
fovCircle.Thickness  = Config.FOVCircle.Thickness
fovCircle.Filled     = false
fovCircle.Transparency = 1
table.insert(Connections, RunService.RenderStepped:Connect(function()
    fovCircle.Visible = Config.FOVCircle.Enabled
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    fovCircle.Radius   = Config.FOVCircle.Radius
    fovCircle.Color    = Config.FOVCircle.Color
end))

-- ==================== NOTIFICATION SYSTEM ====================
local function Notify(message, duration, color)
    duration = duration or 3
    color = color or Colors.Accent
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "extralNotif"
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    notifGui.Parent = CoreGui
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 60)
    frame.Position = UDim2.new(1, 10, 0.88, 0)
    frame.AnchorPoint = Vector2.new(0, 0.5)
    frame.BackgroundColor3 = Colors.BG2
    frame.BorderSizePixel = 0
    frame.Parent = notifGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = color
    stroke.Thickness = 1.5
    -- Colored left bar
    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(0, 3, 1, -10)
    bar.Position = UDim2.new(0, 6, 0, 5)
    bar.BackgroundColor3 = color
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    -- Icon
    local icon = Instance.new("TextLabel", frame)
    icon.Size = UDim2.new(0, 28, 1, 0)
    icon.Position = UDim2.new(0, 14, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = "⚡"
    icon.Font = Enum.Font.GothamBold
    icon.TextSize = 18
    icon.TextColor3 = color
    -- Text
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -50, 1, 0)
    lbl.Position = UDim2.new(0, 44, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = message
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 13
    lbl.TextColor3 = Colors.Text
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    -- Watermark line
    local wm = Instance.new("TextLabel", frame)
    wm.Size = UDim2.new(1, -10, 0, 12)
    wm.Position = UDim2.new(0, 5, 1, -14)
    wm.BackgroundTransparency = 1
    wm.Text = "extral.cc"
    wm.Font = Enum.Font.Gotham
    wm.TextSize = 9
    wm.TextColor3 = Colors.TextDim
    wm.TextXAlignment = Enum.TextXAlignment.Right
    TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 0.88, 0)
    }):Play()
    task.delay(duration, function()
        TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 10, 0.88, 0)
        }):Play()
        task.delay(0.25, function() notifGui:Destroy() end)
    end)
end

-- ==================== TARGET MESSAGES ====================
local TargetLeftMessages = {
    "[ TARGET LEFT ] Disconnected or reset",
    "[ TARGET LEFT ] Enemy bailed out",
    "[ TARGET LEFT ] They couldn't handle it",
    "[ TARGET LEFT ] Rage quit detected",
}
local TargetDiedMessages = {
    "[ ELIMINATED ] Target neutralized",
    "[ ELIMINATED ] Clean kill, no witnesses",
    "[ ELIMINATED ] Another one down",
    "[ ELIMINATED ] Sigma move executed",
}
local function RandMsg(t) return t[math.random(1, #t)] end

-- ==================== OUTLINE / CHAMS ====================
local function ClearOutline()
    if CurrentOutline then CurrentOutline:Destroy() CurrentOutline = nil end
end

local function CreateOutline(character, fillColor, outlineColor)
    ClearOutline()
    if not character then return end
    local h = Instance.new("Highlight")
    h.Name = "extralOutline"
    h.Adornee = character
    h.FillColor = fillColor or Colors.Accent
    h.FillTransparency = 0.9
    h.OutlineColor = outlineColor or Colors.AccentGlow
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = character
    CurrentOutline = h
end

local function FlashOutline(color, duration)
    if CurrentOutline then
        local orig = CurrentOutline.OutlineColor
        TweenService:Create(CurrentOutline, TweenInfo.new(0.08), {OutlineColor = color}):Play()
        task.delay(duration or 0.5, function()
            if CurrentOutline then
                TweenService:Create(CurrentOutline, TweenInfo.new(0.3), {OutlineColor = orig}):Play()
            end
        end)
    end
end

-- ==================== TARGET MANAGEMENT ====================
local function SetTarget(player)
    ClearOutline()
    CurrentTarget = player
    if player and player.Character then
        CreateOutline(player.Character)
        Notify("LOCKED: " .. player.DisplayName, 2, Colors.AccentGlow)
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            LastHealth[player] = hum.Health
            table.insert(Connections, hum.HealthChanged:Connect(function(hp)
                if LastHealth[player] and hp < LastHealth[player] then
                    FlashOutline(Colors.Red, 0.4)
                end
                LastHealth[player] = hp
            end))
            table.insert(Connections, hum.Died:Connect(function()
                if CurrentTarget == player then
                    Notify(RandMsg(TargetDiedMessages), 3, Colors.Green)
                end
            end))
        end
        table.insert(Connections, player.CharacterRemoving:Connect(function()
            if CurrentTarget == player then
                Notify(RandMsg(TargetLeftMessages), 3, Colors.Yellow)
                SetTarget(nil)
            end
        end))
    else
        Notify("UNLOCKED", 1.5, Colors.TextDim)
    end
end

-- ==================== AIMLOCK ====================
local function StartAimlock()
    if AimlockConnection then AimlockConnection:Disconnect() end
    AimlockConnection = RunService.RenderStepped:Connect(function()
        if not Config.Aimlock.Enabled or not CurrentTarget then return end
        if not isAlive(CurrentTarget) then return end
        local part = GetPartToAim(CurrentTarget)
        if not part then return end
        local root = CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local pred = Config.AutoPrediction and getAutoPred() or Config.Aimlock.Prediction
        local targetPos = part.Position + root.AssemblyLinearVelocity * pred
        if not isVisible(targetPos, CurrentTarget) then return end
        local targetCF = CFrame.new(Camera.CFrame.Position, targetPos)
        Camera.CFrame = Camera.CFrame:Lerp(targetCF, Config.Aimlock.Smooth)
    end)
end

-- ==================== SILENT AIM ====================
local SilentAimOK = pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldIndex = mt.__index
    mt.__index = newcclosure(function(self, idx)
        if Config.SilentAim.Enabled and self == Mouse and (idx == "Hit" or idx == "Target") then
            local target = silentTarget
            if not target or not target.Character then return oldIndex(self, idx) end
            local char = target.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            local part = char:FindFirstChild(Config.SilentAim.Part) or char:FindFirstChild("Head")
            if not root or not part or not isAlive(target) then return oldIndex(self, idx) end
            local pred = Config.AutoPrediction and getAutoPred() or Config.SilentAim.Prediction
            local predicted = part.Position + root.AssemblyLinearVelocity * pred
            if idx == "Hit" then return CFrame.new(predicted)
            elseif idx == "Target" then return part end
        end
        return oldIndex(self, idx)
    end)
    setreadonly(mt, true)
end)
if not SilentAimOK then Config.SilentAim.Supported = false end

-- ==================== AUTO PREDICTION ====================
function getAutoPred()
    local ok, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if not ok then return 0.14 end
    if ping < 20  then return 0.125
    elseif ping < 40  then return 0.135
    elseif ping < 60  then return 0.145
    elseif ping < 80  then return 0.155
    elseif ping < 100 then return 0.163
    elseif ping < 130 then return 0.170
    else return 0.185 end
end

-- ==================== AUTO SHOOT ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.AutoShoot then return end
    local shootTarget = (Config.Aimlock.Enabled and CurrentTarget) or
                        (Config.SilentAim.Enabled and silentTarget)
    if not shootTarget or not isAlive(shootTarget) then return end
    local part = GetPartToAim(shootTarget)
    if not part then return end
    local root = shootTarget.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local pred = Config.AutoPrediction and getAutoPred() or Config.Aimlock.Prediction
    local targetPos = part.Position + root.AssemblyLinearVelocity * pred
    if not isVisible(targetPos, shootTarget) then return end
    local char = LocalPlayer.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end
    local ammo = tool:FindFirstChild("Ammo")
    if ammo and ammo:IsA("IntValue") and ammo.Value > 0 then
        tool:Activate()
    else
        pcall(mouse1press) pcall(function() task.wait() end) pcall(mouse1release)
    end
end))

-- ==================== SILENT TARGET UPDATE ====================
table.insert(Connections, RunService.RenderStepped:Connect(function()
    if Config.SilentAim.Enabled then
        silentTarget = GetClosestPlayerToCursor()
    else
        silentTarget = nil
    end
end))

-- ==================== AUTO PREDICTION UPDATER ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if Config.AutoPrediction then
        local pred = getAutoPred()
        Config.Aimlock.Prediction = pred
        Config.SilentAim.Prediction = pred
    end
end))

-- ==================== WALKSPEED ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if Config.Player.SprintEnabled and isSprinting then
        hum.WalkSpeed = Config.Player.SprintSpeed
    elseif Config.Movement.WalkspeedEnabled then
        hum.WalkSpeed = Config.Movement.WalkspeedValue
    else
        -- Don't reset if fly is active
        if not Config.Movement.FlyEnabled then
            hum.WalkSpeed = 16
        end
    end
end))

-- ==================== JUMP POWER ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if Config.Movement.JumpPowerEnabled then
        hum.JumpPower = Config.Movement.JumpPowerValue
    else
        hum.JumpPower = 50
    end
end))

-- ==================== INFINITE JUMP ====================
table.insert(Connections, UserInputService.JumpRequest:Connect(function()
    if not Config.Movement.InfiniteJump then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end))

-- ==================== BHOP ====================
table.insert(Connections, RunService.Stepped:Connect(function()
    if not Config.Movement.BHop then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if hum and root and hum:GetState() == Enum.HumanoidStateType.Landed then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end))

-- ==================== NOCLIP ====================
table.insert(Connections, RunService.Stepped:Connect(function()
    if not Config.Noclip.Enabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    for _, p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then p.CanCollide = false end
    end
end))

-- ==================== FLY ====================
local function SetFly(enabled)
    Config.Movement.FlyEnabled = enabled
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum  = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end
    if enabled then
        hum.PlatformStand = true
        flyBodyVelocity = Instance.new("BodyVelocity", root)
        flyBodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        flyBodyVelocity.Velocity = Vector3.zero
        flyBodyGyro = Instance.new("BodyGyro", root)
        flyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        flyBodyGyro.P = 1e4
        flyBodyGyro.CFrame = root.CFrame
    else
        hum.PlatformStand = false
        if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
        if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
    end
end

table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.Movement.FlyEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root or not flyBodyVelocity or not flyBodyGyro then return end
    local dir = Vector3.zero
    local speed = Config.Movement.FlySpeed
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        dir = dir + Camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        dir = dir - Camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        dir = dir - Camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        dir = dir + Camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        dir = dir + Vector3.yAxis
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        dir = dir - Vector3.yAxis
    end
    flyBodyVelocity.Velocity = dir.Magnitude > 0 and dir.Unit * speed or Vector3.zero
    flyBodyGyro.CFrame = Camera.CFrame
end))

-- ==================== KILL AURA ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.Player.KillAura then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and isAlive(plr) and plr.Character then
            local enemyRoot = plr.Character:FindFirstChild("HumanoidRootPart")
            if enemyRoot and (enemyRoot.Position - root.Position).Magnitude <= Config.Player.KillAuraRange then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    pcall(function() tool:Activate() end)
                end
            end
        end
    end
end))

-- ==================== HITBOX EXPANDER ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.Player.HitboxExpand then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.Size = Vector3.new(
                    Config.Player.HitboxSize,
                    Config.Player.HitboxSize,
                    Config.Player.HitboxSize
                )
                root.Transparency = 0.7
                root.CanCollide = false
            end
        end
    end
end))

-- ==================== REACH / TOOL RANGE ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.Player.ReachEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end
    local handle = tool:FindFirstChild("Handle")
    if handle then
        local weld = handle:FindFirstChildOfClass("ManualWeld") or handle:FindFirstChildOfClass("Weld")
        if weld then
            weld.C0 = CFrame.new(0, 0, -Config.Player.ReachValue)
        end
    end
end))

-- ==================== ANTI AFK ====================
local VirtualUser = game:GetService("VirtualUser")
table.insert(Connections, LocalPlayer.Idled:Connect(function()
    if Config.Player.AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end))

-- ==================== FREEZE SELF ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if not Config.Player.FreezeSelf then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then root.Anchored = true end
end))

-- ==================== GRAVITY ====================
table.insert(Connections, RunService.Heartbeat:Connect(function()
    if Config.Movement.GravityEnabled then
        Workspace.Gravity = Config.Movement.GravityValue
    else
        Workspace.Gravity = 196.2
    end
end))

-- ==================== FULLBRIGHT ====================
local function SetFullbright(on)
    Config.World.FullbrightEnabled = on
    if on then
        originalLighting.Brightness     = Lighting.Brightness
        originalLighting.ClockTime      = Lighting.ClockTime
        originalLighting.FogEnd         = Lighting.FogEnd
        originalLighting.GlobalShadows  = Lighting.GlobalShadows
        originalLighting.Ambient        = Lighting.Ambient
        Lighting.Brightness    = 2
        Lighting.ClockTime     = 14
        Lighting.FogEnd        = 1e9
        Lighting.GlobalShadows = false
        Lighting.Ambient       = Color3.fromRGB(255,255,255)
    else
        if originalLighting.Brightness then
            Lighting.Brightness    = originalLighting.Brightness
            Lighting.ClockTime     = originalLighting.ClockTime
            Lighting.FogEnd        = originalLighting.FogEnd
            Lighting.GlobalShadows = originalLighting.GlobalShadows
            Lighting.Ambient       = originalLighting.Ambient
        end
    end
end

-- ==================== ESP SYSTEM ====================
local function GetTeamColor(player)
    if Config.ESP.TeamColor and player.Team then
        return player.Team.TeamColor.Color
    end
    return Colors.Accent
end

local function ClearESP(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            pcall(function() obj:Remove() end)
        end
        ESPObjects[player] = nil
    end
end

local function CreateESP(player)
    if ESPObjects[player] then ClearESP(player) end
    ESPObjects[player] = {}
    -- Box
    if Config.ESP.Boxes then
        local box = Drawing.new("Square")
        box.Visible     = false
        box.Color       = GetTeamColor(player)
        box.Thickness   = 1.5
        box.Filled      = false
        box.Transparency = 1
        ESPObjects[player].box = box
    end
    -- Name
    if Config.ESP.Names then
        local name = Drawing.new("Text")
        name.Visible  = false
        name.Color    = GetTeamColor(player)
        name.Size     = 13
        name.Center   = true
        name.Outline  = true
        name.OutlineColor = Color3.new(0,0,0)
        name.Font     = Drawing.Fonts.Plex
        ESPObjects[player].name = name
    end
    -- Distance
    if Config.ESP.Distance then
        local dist = Drawing.new("Text")
        dist.Visible  = false
        dist.Color    = Colors.TextDim
        dist.Size     = 11
        dist.Center   = true
        dist.Outline  = true
        dist.OutlineColor = Color3.new(0,0,0)
        dist.Font     = Drawing.Fonts.Plex
        ESPObjects[player].dist = dist
    end
    -- Tracer
    if Config.ESP.Tracers then
        local tracer = Drawing.new("Line")
        tracer.Visible    = false
        tracer.Color      = GetTeamColor(player)
        tracer.Thickness  = 1
        tracer.Transparency = 1
        ESPObjects[player].tracer = tracer
    end
    -- Health bar
    if Config.ESP.HealthBars then
        local hpBg = Drawing.new("Square")
        hpBg.Visible   = false
        hpBg.Color     = Color3.new(0,0,0)
        hpBg.Filled    = true
        hpBg.Transparency = 0.5
        ESPObjects[player].hpBg = hpBg
        local hpBar = Drawing.new("Square")
        hpBar.Visible  = false
        hpBar.Color    = Colors.Green
        hpBar.Filled   = true
        hpBar.Transparency = 1
        ESPObjects[player].hpBar = hpBar
    end
end

local function UpdateESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if not Config.ESP.Enabled then
            ClearESP(player)
            continue
        end
        if not ESPObjects[player] then
            CreateESP(player)
        end
        local obj = ESPObjects[player]
        if not player.Character or not isAlive(player) then
            for _, d in pairs(obj) do pcall(function() d.Visible = false end) end
            continue
        end
        local char = player.Character
        local root  = char:FindFirstChild("HumanoidRootPart")
        local head  = char:FindFirstChild("Head")
        if not root or not head then continue end
        local dist3d = (root.Position - Camera.CFrame.Position).Magnitude
        if dist3d > Config.ESP.MaxDistance then
            for _, d in pairs(obj) do pcall(function() d.Visible = false end) end
            continue
        end
        local rootScreen, rootOnScreen = Camera:WorldToViewportPoint(root.Position)
        local headScreen, headOnScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
        local feetScreen = Camera:WorldToViewportPoint(root.Position - Vector3.new(0,3,0))
        if not rootOnScreen then
            for _, d in pairs(obj) do pcall(function() d.Visible = false end) end
            continue
        end
        local charH = math.abs(headScreen.Y - feetScreen.Y)
        local charW = charH * 0.5
        local color = GetTeamColor(player)
        -- Box
        if obj.box then
            obj.box.Visible  = true
            obj.box.Color    = color
            obj.box.Size     = Vector2.new(charW, charH)
            obj.box.Position = Vector2.new(rootScreen.X - charW/2, headScreen.Y)
        end
        -- Name
        if obj.name then
            obj.name.Visible   = true
            obj.name.Text      = player.DisplayName
            obj.name.Position  = Vector2.new(headScreen.X, headScreen.Y - 16)
            obj.name.Color     = color
        end
        -- Distance
        if obj.dist then
            obj.dist.Visible   = true
            obj.dist.Text      = string.format("[%.0f]", dist3d)
            obj.dist.Position  = Vector2.new(rootScreen.X, feetScreen.Y + 2)
        end
        -- Tracer
        if obj.tracer then
            obj.tracer.Visible  = true
            obj.tracer.Color    = color
            obj.tracer.From     = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
            obj.tracer.To       = Vector2.new(rootScreen.X, rootScreen.Y)
        end
        -- Health bar
        if obj.hpBar and obj.hpBg then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                local barX = rootScreen.X - charW/2 - 6
                local barTop = headScreen.Y
                obj.hpBg.Visible  = true
                obj.hpBg.Size     = Vector2.new(4, charH)
                obj.hpBg.Position = Vector2.new(barX, barTop)
                obj.hpBar.Visible = true
                obj.hpBar.Size    = Vector2.new(4, charH * hp)
                obj.hpBar.Position= Vector2.new(barX, barTop + charH * (1-hp))
                obj.hpBar.Color   = hp > 0.5 and Colors.Green or hp > 0.25 and Colors.Yellow or Colors.Red
            end
        end
    end
end
table.insert(Connections, RunService.RenderStepped:Connect(UpdateESP))

-- ==================== CHAMS (Highlight all) ====================
local ChamsHighlights = {}
local function UpdateChams()
    if not Config.ESP.ChamsEnabled then
        for player, h in pairs(ChamsHighlights) do
            pcall(function() h:Destroy() end)
            ChamsHighlights[player] = nil
        end
        return
    end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if not ChamsHighlights[player] or not ChamsHighlights[player].Parent then
                local h = Instance.new("Highlight")
                h.FillColor = Color3.fromRGB(0, 150, 255)
                h.FillTransparency = 0.5
                h.OutlineColor = Color3.fromRGB(0, 200, 255)
                h.OutlineTransparency = 0
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.Adornee = player.Character
                h.Parent = player.Character
                ChamsHighlights[player] = h
            end
        end
    end
end
table.insert(Connections, RunService.Heartbeat:Connect(UpdateChams))

-- ==================== PLAYER CLEANUP ====================
Players.PlayerRemoving:Connect(function(player)
    ClearESP(player)
    if ChamsHighlights[player] then
        pcall(function() ChamsHighlights[player]:Destroy() end)
        ChamsHighlights[player] = nil
    end
end)

-- ==================== CREATE GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name            = "extralcc"
ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn    = false
ScreenGui.DisplayOrder    = 999
ScreenGui.Parent          = CoreGui

-- Main Window
local MainFrame = Instance.new("Frame")
MainFrame.Name              = "MainFrame"
MainFrame.Size              = UDim2.new(0, 320, 0, 46)
MainFrame.Position          = UDim2.new(0.5, -160, 0, 18)
MainFrame.BackgroundColor3  = Colors.BG
MainFrame.BorderSizePixel   = 0
MainFrame.ClipsDescendants  = true
MainFrame.Parent            = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color      = Colors.Border
MainStroke.Thickness  = 1.5

-- Topbar
local Topbar = Instance.new("Frame", MainFrame)
Topbar.Name             = "Topbar"
Topbar.Size             = UDim2.new(1, 0, 0, 46)
Topbar.BackgroundColor3 = Colors.BG2
Topbar.BorderSizePixel  = 0
Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0, 12)

-- Accent line on topbar bottom
local AccentLine = Instance.new("Frame", Topbar)
AccentLine.Size             = UDim2.new(1, 0, 0, 1)
AccentLine.Position         = UDim2.new(0, 0, 1, -1)
AccentLine.BackgroundColor3 = Colors.Accent
AccentLine.BorderSizePixel  = 0

-- Logo / Title
local Logo = Instance.new("TextLabel", Topbar)
Logo.Size               = UDim2.new(0, 28, 0, 28)
Logo.Position           = UDim2.new(0, 10, 0.5, -14)
Logo.BackgroundColor3   = Colors.Accent
Logo.BorderSizePixel    = 0
Logo.Text               = "X"
Logo.Font               = Enum.Font.GothamBlack
Logo.TextSize           = 14
Logo.TextColor3         = Colors.BG
Instance.new("UICorner", Logo).CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel", Topbar)
Title.Size               = UDim2.new(0, 140, 1, 0)
Title.Position           = UDim2.new(0, 44, 0, 0)
Title.BackgroundTransparency = 1
Title.Text               = "extral.cc"
Title.Font               = Enum.Font.GothamBlack
Title.TextSize           = 15
Title.TextColor3         = Colors.White
Title.TextXAlignment     = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel", Topbar)
SubTitle.Size             = UDim2.new(0, 80, 0, 12)
SubTitle.Position         = UDim2.new(0, 44, 0.5, 2)
SubTitle.BackgroundTransparency = 1
SubTitle.Text             = "sigma edition"
SubTitle.Font             = Enum.Font.Gotham
SubTitle.TextSize         = 9
SubTitle.TextColor3       = Colors.AccentDim
SubTitle.TextXAlignment   = Enum.TextXAlignment.Left

-- Expand button
local ExpandBtn = Instance.new("TextButton", Topbar)
ExpandBtn.Size           = UDim2.new(0, 30, 0, 30)
ExpandBtn.Position       = UDim2.new(1, -38, 0.5, -15)
ExpandBtn.BackgroundColor3 = Colors.BG3
ExpandBtn.BorderSizePixel = 0
ExpandBtn.Text           = "▼"
ExpandBtn.Font           = Enum.Font.GothamBold
ExpandBtn.TextSize       = 12
ExpandBtn.TextColor3     = Colors.TextDim
ExpandBtn.AutoButtonColor = false
Instance.new("UICorner", ExpandBtn).CornerRadius = UDim.new(0, 8)

-- Tab bar
local TabBar = Instance.new("Frame", MainFrame)
TabBar.Name             = "TabBar"
TabBar.Size             = UDim2.new(1, -20, 0, 30)
TabBar.Position         = UDim2.new(0, 10, 0, 54)
TabBar.BackgroundColor3 = Colors.BG2
TabBar.BorderSizePixel  = 0
Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 8)
local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder     = Enum.SortOrder.LayoutOrder
TabLayout.Padding       = UDim.new(0, 2)
local TabPad = Instance.new("UIPadding", TabBar)
TabPad.PaddingLeft   = UDim.new(0, 4)
TabPad.PaddingRight  = UDim.new(0, 4)
TabPad.PaddingTop    = UDim.new(0, 3)
TabPad.PaddingBottom = UDim.new(0, 3)

-- Content frame
local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Name                  = "Content"
Content.Size                  = UDim2.new(1, -20, 0, 0)
Content.Position              = UDim2.new(0, 10, 0, 94)
Content.BackgroundTransparency = 1
Content.BorderSizePixel       = 0
Content.ScrollBarThickness    = 3
Content.ScrollBarImageColor3  = Colors.AccentDim
Content.CanvasSize            = UDim2.new(0, 0, 0, 0)
Content.AutomaticCanvasSize   = Enum.AutomaticSize.Y
local ContentLayout = Instance.new("UIListLayout", Content)
ContentLayout.Padding    = UDim.new(0, 6)
ContentLayout.SortOrder  = Enum.SortOrder.LayoutOrder

-- ==================== TAB SYSTEM ====================
local Tabs = {}
local ActiveTab = nil
local TabPages = {}

local function CreateTab(name, icon)
    local btn = Instance.new("TextButton", TabBar)
    btn.Size             = UDim2.new(0, 54, 1, 0)
    btn.BackgroundColor3 = Colors.BG2
    btn.BorderSizePixel  = 0
    btn.Text             = icon .. " " .. name
    btn.Font             = Enum.Font.GothamBold
    btn.TextSize         = 10
    btn.TextColor3       = Colors.TextDim
    btn.AutoButtonColor  = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local page = Instance.new("Frame", Content)
    page.Name             = name
    page.Size             = UDim2.new(1, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel  = 0
    page.AutomaticSize    = Enum.AutomaticSize.Y
    page.Visible          = false
    local pageLayout = Instance.new("UIListLayout", page)
    pageLayout.Padding   = UDim.new(0, 6)
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder

    TabPages[name] = page
    table.insert(Tabs, {btn = btn, page = page, name = name})

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.page.Visible     = false
            t.btn.TextColor3   = Colors.TextDim
            t.btn.BackgroundColor3 = Colors.BG2
        end
        page.Visible        = true
        btn.TextColor3      = Colors.Accent
        btn.BackgroundColor3 = Colors.BG3
        ActiveTab           = name
    end)

    return page
end

-- ==================== UI COMPONENT FACTORY ====================
local function Section(parent, labelText)
    local f = Instance.new("Frame", parent)
    f.Size             = UDim2.new(1, 0, 0, 20)
    f.BackgroundTransparency = 1
    f.BorderSizePixel  = 0
    local lbl = Instance.new("TextLabel", f)
    lbl.Size             = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text             = "— " .. labelText:upper() .. " —"
    lbl.Font             = Enum.Font.GothamBold
    lbl.TextSize         = 10
    lbl.TextColor3       = Colors.AccentDim
    lbl.TextXAlignment   = Enum.TextXAlignment.Left
    return f
end

local function Toggle(parent, labelText, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size             = UDim2.new(1, 0, 0, 34)
    frame.BackgroundColor3 = Colors.BG3
    frame.BorderSizePixel  = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color       = Colors.Border
    stroke.Thickness   = 1
    stroke.Transparency = 0.3

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size             = UDim2.new(1, -64, 1, 0)
    lbl.Position         = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text             = labelText
    lbl.Font             = Enum.Font.GothamMedium
    lbl.TextSize         = 13
    lbl.TextColor3       = Colors.Text
    lbl.TextXAlignment   = Enum.TextXAlignment.Left

    local track = Instance.new("TextButton", frame)
    track.Size           = UDim2.new(0, 40, 0, 20)
    track.Position       = UDim2.new(1, -48, 0.5, -10)
    track.BackgroundColor3 = default and Colors.ToggleOn or Colors.ToggleOff
    track.BorderSizePixel = 0
    track.Text           = ""
    track.AutoButtonColor = false
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", track)
    knob.Size            = UDim2.new(0, 16, 0, 16)
    knob.Position        = default and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    knob.BackgroundColor3 = Colors.White
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local enabled = default or false
    track.MouseButton1Click:Connect(function()
        enabled = not enabled
        TweenService:Create(track, TweenInfo.new(0.18), {
            BackgroundColor3 = enabled and Colors.ToggleOn or Colors.ToggleOff
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
            Position = enabled and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
        }):Play()
        if callback then callback(enabled) end
    end)
    return frame
end

local function Slider(parent, labelText, min, max, default, step, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size             = UDim2.new(1, 0, 0, 48)
    frame.BackgroundColor3 = Colors.BG3
    frame.BorderSizePixel  = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color       = Colors.Border
    stroke.Thickness   = 1
    stroke.Transparency = 0.3

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size             = UDim2.new(1, -65, 0, 22)
    lbl.Position         = UDim2.new(0, 10, 0, 2)
    lbl.BackgroundTransparency = 1
    lbl.Text             = labelText
    lbl.Font             = Enum.Font.GothamMedium
    lbl.TextSize         = 12
    lbl.TextColor3       = Colors.Text
    lbl.TextXAlignment   = Enum.TextXAlignment.Left

    local valLbl = Instance.new("TextLabel", frame)
    valLbl.Size          = UDim2.new(0, 55, 0, 22)
    valLbl.Position      = UDim2.new(1, -60, 0, 2)
    valLbl.BackgroundTransparency = 1
    valLbl.Text          = tostring(default)
    valLbl.Font          = Enum.Font.GothamBold
    valLbl.TextSize      = 12
    valLbl.TextColor3    = Colors.Accent
    valLbl.TextXAlignment = Enum.TextXAlignment.Right

    local track = Instance.new("Frame", frame)
    track.Size           = UDim2.new(1, -20, 0, 4)
    track.Position       = UDim2.new(0, 10, 1, -12)
    track.BackgroundColor3 = Colors.BG
    track.BorderSizePixel = 0
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame", track)
    fill.Size            = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Colors.Accent
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", track)
    knob.Size            = UDim2.new(0, 12, 0, 12)
    knob.Position        = UDim2.new((default-min)/(max-min), -6, 0.5, -6)
    knob.BackgroundColor3 = Colors.AccentGlow
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local ks = Instance.new("UIStroke", knob)
    ks.Color = Colors.BG2 ; ks.Thickness = 2

    local dragging = false
    local value = default
    local function updateSlider(input)
        local pct = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        value = min + (max - min) * pct
        if step then value = math.floor(value / step + 0.5) * step end
        value = math.clamp(value, min, max)
        valLbl.Text = (step and step < 1) and string.format("%.3f", value) or tostring(math.floor(value))
        TweenService:Create(fill, TweenInfo.new(0.08), {Size = UDim2.new(pct, 0, 1, 0)}):Play()
        TweenService:Create(knob, TweenInfo.new(0.08), {Position = UDim2.new(pct, -6, 0.5, -6)}):Play()
        if callback then callback(value) end
    end
    track.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true updateSlider(inp)
        end
    end)
    track.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(inp)
        end
    end)
    return {frame = frame, valLbl = valLbl, fill = fill, knob = knob, min = min, max = max}
end

local function Dropdown(parent, labelText, options, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size             = UDim2.new(1, 0, 0, 34)
    frame.BackgroundColor3 = Colors.BG3
    frame.BorderSizePixel  = 0
    frame.ClipsDescendants = false
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Colors.Border ; stroke.Thickness = 1 ; stroke.Transparency = 0.3

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size  = UDim2.new(0, 120, 1, 0) ; lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1 ; lbl.Text = labelText
    lbl.Font  = Enum.Font.GothamMedium ; lbl.TextSize = 12
    lbl.TextColor3 = Colors.Text ; lbl.TextXAlignment = Enum.TextXAlignment.Left

    local selBtn = Instance.new("TextButton", frame)
    selBtn.Size  = UDim2.new(0, 130, 0, 22)
    selBtn.Position = UDim2.new(1, -138, 0.5, -11)
    selBtn.BackgroundColor3 = Colors.BG
    selBtn.BorderSizePixel = 0
    selBtn.Text = default or options[1] or ""
    selBtn.Font = Enum.Font.GothamBold ; selBtn.TextSize = 11
    selBtn.TextColor3 = Colors.Accent ; selBtn.AutoButtonColor = false
    Instance.new("UICorner", selBtn).CornerRadius = UDim.new(0, 6)
    local ss = Instance.new("UIStroke", selBtn) ; ss.Color = Colors.AccentDim ; ss.Thickness = 1

    local dropFrame = Instance.new("Frame", frame)
    dropFrame.Size  = UDim2.new(0, 130, 0, 0)
    dropFrame.Position = UDim2.new(1, -138, 1, 2)
    dropFrame.BackgroundColor3 = Colors.BG2
    dropFrame.BorderSizePixel = 0 ; dropFrame.Visible = false
    dropFrame.ZIndex = 20 ; dropFrame.ClipsDescendants = true
    Instance.new("UICorner", dropFrame).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", dropFrame).Color = Colors.Border
    local dfl = Instance.new("UIListLayout", dropFrame)
    dfl.SortOrder = Enum.SortOrder.LayoutOrder ; dfl.Padding = UDim.new(0, 2)
    local dp2 = Instance.new("UIPadding", dropFrame)
    dp2.PaddingTop = UDim.new(0,4) ; dp2.PaddingBottom = UDim.new(0,4)
    dp2.PaddingLeft = UDim.new(0,4) ; dp2.PaddingRight = UDim.new(0,4)

    local open = false
    local function Close()
        open = false
        TweenService:Create(dropFrame, TweenInfo.new(0.15), {Size = UDim2.new(0,130,0,0)}):Play()
        task.delay(0.15, function() dropFrame.Visible = false end)
    end

    for _, opt in ipairs(options) do
        local ob = Instance.new("TextButton", dropFrame)
        ob.Size = UDim2.new(1, 0, 0, 24)
        ob.BackgroundColor3 = Colors.BG3 ; ob.BorderSizePixel = 0
        ob.Text = opt ; ob.Font = Enum.Font.GothamMedium ; ob.TextSize = 11
        ob.TextColor3 = Colors.Text ; ob.AutoButtonColor = false
        Instance.new("UICorner", ob).CornerRadius = UDim.new(0, 6)
        ob.MouseButton1Click:Connect(function()
            selBtn.Text = opt
            if callback then callback(opt) end
            Close()
        end)
    end

    selBtn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            local numOpts = #options
            local targetH = numOpts * 26 + 8
            dropFrame.Visible = true
            TweenService:Create(dropFrame, TweenInfo.new(0.15), {
                Size = UDim2.new(0, 130, 0, targetH)
            }):Play()
        else
            Close()
        end
    end)

    return frame
end

local function Label(parent, text, color)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size             = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text             = text
    lbl.Font             = Enum.Font.Gotham
    lbl.TextSize         = 11
    lbl.TextColor3       = color or Colors.TextDim
    lbl.TextXAlignment   = Enum.TextXAlignment.Left
    return lbl
end

-- ==================== TABS ====================
local AimPage      = CreateTab("Aim",    "🎯")
local ESPPage      = CreateTab("ESP",    "👁")
local MovePage     = CreateTab("Move",   "⚡")
local PlayerPage   = CreateTab("Player", "👤")
local WorldPage    = CreateTab("World",  "🌍")

-- Activate first tab
Tabs[1].page.Visible         = true
Tabs[1].btn.TextColor3       = Colors.Accent
Tabs[1].btn.BackgroundColor3 = Colors.BG3

-- ==================== AIM TAB ====================
Section(AimPage, "Aimlock")
Toggle(AimPage, "Aimlock", false, function(v)
    Config.Aimlock.Enabled = v
    if v then StartAimlock()
    else
        if AimlockConnection then AimlockConnection:Disconnect() end
        SetTarget(nil)
    end
end)
Toggle(AimPage, "Team Check", false, function(v) Config.Aimlock.TeamCheck = v end)
Toggle(AimPage, "Visibility Check", true, function(v) Config.Aimlock.VisCheck = v end)
Dropdown(AimPage, "Aim Part", {"Head","HumanoidRootPart","Torso"}, "Head", function(v)
    Config.Aimlock.Part = v
end)
Slider(AimPage, "Smooth (lower = faster)", 0.01, 1, 0.2, 0.01, function(v)
    Config.Aimlock.Smooth = v
end)
Slider(AimPage, "FOV Radius", 10, 600, 250, 1, function(v)
    Config.Aimlock.FOV = v
    Config.FOVCircle.Radius = v
end)
Slider(AimPage, "Prediction", 0, 1, 0, 0.001, function(v)
    Config.Aimlock.Prediction = v
end)

Section(AimPage, "Silent Aim")
if Config.SilentAim.Supported then
    Toggle(AimPage, "Silent Aim", false, function(v) Config.SilentAim.Enabled = v end)
else
    Label(AimPage, "⚠ Executor doesn't support Silent Aim", Colors.Red)
end
Dropdown(AimPage, "Silent Part", {"Head","HumanoidRootPart","Torso"}, "Head", function(v)
    Config.SilentAim.Part = v
end)
Slider(AimPage, "Silent Prediction", 0, 1, 0, 0.001, function(v)
    Config.SilentAim.Prediction = v
end)

Section(AimPage, "Assist")
Toggle(AimPage, "Auto Shoot", false, function(v) Config.AutoShoot = v end)
Toggle(AimPage, "Auto Prediction (ping-based)", false, function(v) Config.AutoPrediction = v end)
Toggle(AimPage, "Outline Locked Target", false, function(v)
    Config.Player.OutlineTarget = v
    if not v then ClearOutline() end
end)

Section(AimPage, "FOV Circle")
Toggle(AimPage, "Show FOV Circle", false, function(v) Config.FOVCircle.Enabled = v end)

-- ==================== ESP TAB ====================
Section(ESPPage, "ESP Options")
Toggle(ESPPage, "Enable ESP", false, function(v)
    Config.ESP.Enabled = v
    if not v then
        for _, player in pairs(Players:GetPlayers()) do ClearESP(player) end
    end
end)
Toggle(ESPPage, "Boxes", false, function(v) Config.ESP.Boxes = v end)
Toggle(ESPPage, "Names", false, function(v) Config.ESP.Names = v end)
Toggle(ESPPage, "Distance", false, function(v) Config.ESP.Distance = v end)
Toggle(ESPPage, "Health Bars", false, function(v) Config.ESP.HealthBars = v end)
Toggle(ESPPage, "Tracers", false, function(v) Config.ESP.Tracers = v end)
Toggle(ESPPage, "Team Colors", false, function(v) Config.ESP.TeamColor = v end)
Slider(ESPPage, "Max Distance", 50, 2000, 500, 10, function(v) Config.ESP.MaxDistance = v end)

Section(ESPPage, "Chams")
Toggle(ESPPage, "Chams (Through walls)", false, function(v)
    Config.ESP.ChamsEnabled = v
    if not v then
        for _, h in pairs(ChamsHighlights) do pcall(function() h:Destroy() end) end
        ChamsHighlights = {}
    end
end)

-- ==================== MOVEMENT TAB ====================
Section(MovePage, "Speed")
Toggle(MovePage, "WalkSpeed", false, function(v) Config.Movement.WalkspeedEnabled = v end)
Slider(MovePage, "Speed Value", 1, 400, 50, 1, function(v) Config.Movement.WalkspeedValue = v end)
Toggle(MovePage, "Sprint (LShift)", false, function(v)
    Config.Player.SprintEnabled = v
end)
Slider(MovePage, "Sprint Speed", 20, 200, 30, 1, function(v) Config.Player.SprintSpeed = v end)

Section(MovePage, "Jump")
Toggle(MovePage, "Custom Jump Power", false, function(v) Config.Movement.JumpPowerEnabled = v end)
Slider(MovePage, "Jump Power", 0, 300, 100, 1, function(v) Config.Movement.JumpPowerValue = v end)
Toggle(MovePage, "Infinite Jump", false, function(v) Config.Movement.InfiniteJump = v end)
Toggle(MovePage, "BHop (auto jump)", false, function(v) Config.Movement.BHop = v end)

Section(MovePage, "Fly (F to toggle)")
Toggle(MovePage, "Fly Mode", false, function(v) SetFly(v) end)
Slider(MovePage, "Fly Speed", 5, 300, 50, 1, function(v) Config.Movement.FlySpeed = v end)

Section(MovePage, "Misc")
Toggle(MovePage, "Noclip (N)", false, function(v) Config.Noclip.Enabled = v end)
Toggle(MovePage, "Custom Gravity", false, function(v) Config.Movement.GravityEnabled = v end)
Slider(MovePage, "Gravity Value", 0, 500, 196, 1, function(v) Config.Movement.GravityValue = v end)

-- ==================== PLAYER TAB ====================
Section(PlayerPage, "Combat")
Toggle(PlayerPage, "Kill Aura", false, function(v) Config.Player.KillAura = v end)
Slider(PlayerPage, "Kill Aura Range", 5, 100, 10, 1, function(v) Config.Player.KillAuraRange = v end)
Toggle(PlayerPage, "Hitbox Expander", false, function(v) Config.Player.HitboxExpand = v end)
Slider(PlayerPage, "Hitbox Size", 1, 30, 5, 0.5, function(v) Config.Player.HitboxSize = v end)
Toggle(PlayerPage, "Reach (Tool extend)", false, function(v) Config.Player.ReachEnabled = v end)
Slider(PlayerPage, "Reach Value", 5, 50, 10, 1, function(v) Config.Player.ReachValue = v end)

Section(PlayerPage, "Utilities")
Toggle(PlayerPage, "Anti-AFK", true, function(v) Config.Player.AntiAFK = v end)
Toggle(PlayerPage, "Freeze Self", false, function(v)
    Config.Player.FreezeSelf = v
    if not v then
        local char = LocalPlayer.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then root.Anchored = false end
        end
    end
end)

-- ==================== WORLD TAB ====================
Section(WorldPage, "Lighting")
Toggle(WorldPage, "Fullbright", false, function(v) SetFullbright(v) end)
Toggle(WorldPage, "Remove Fog", false, function(v)
    Config.World.FogEnabled = v
    Lighting.FogEnd = v and 1e9 or 100000
end)

Section(WorldPage, "Time")
Toggle(WorldPage, "Custom Time of Day", false, function(v) Config.World.TimeSet = v end)
Slider(WorldPage, "Clock Time", 0, 24, 14, 0.5, function(v)
    if Config.World.TimeSet then Lighting.ClockTime = v end
    Config.World.TimeValue = v
end)

Section(WorldPage, "Info")
Label(WorldPage, "extral.cc | universal sigma script", Colors.AccentDim)
Label(WorldPage, "Keybinds: Q=Aimlock  N=Noclip  F=Fly", Colors.TextDim)

-- ==================== SPRINT KEYBIND ====================
table.insert(Connections, UserInputService.InputBegan:Connect(function(inp, gp)
    if gp then return end
    if inp.KeyCode == Enum.KeyCode.LeftShift and Config.Player.SprintEnabled then
        isSprinting = true
    end
    if inp.KeyCode == Config.Aimlock.Keybind then
        if CurrentTarget then SetTarget(nil)
        else SetTarget(GetClosestPlayerToCursor()) end
    end
    if inp.KeyCode == Config.Noclip.Keybind then
        Config.Noclip.Enabled = not Config.Noclip.Enabled
        Notify(Config.Noclip.Enabled and "Noclip ON" or "Noclip OFF", 1.5, Colors.Accent)
    end
    if inp.KeyCode == Config.Movement.FlyKey then
        SetFly(not Config.Movement.FlyEnabled)
        Notify(Config.Movement.FlyEnabled and "Fly ON" or "Fly OFF", 1.5, Colors.Purple)
    end
end))
table.insert(Connections, UserInputService.InputEnded:Connect(function(inp)
    if inp.KeyCode == Enum.KeyCode.LeftShift then isSprinting = false end
end))

-- ==================== EXPAND / COLLAPSE ====================
local IsExpanded = false
ExpandBtn.MouseButton1Click:Connect(function()
    IsExpanded = not IsExpanded
    local contentH = ContentLayout.AbsoluteContentSize.Y
    local targetH = IsExpanded and (46 + 8 + 30 + 8 + contentH + 14) or 46
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 320, 0, math.min(targetH, 520))
    }):Play()
    TweenService:Create(ExpandBtn, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        Rotation = IsExpanded and 180 or 0
    }):Play()
    TabBar.Visible  = IsExpanded
    Content.Visible = IsExpanded
end)

-- Auto-size on content change
ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    if IsExpanded then
        local contentH = ContentLayout.AbsoluteContentSize.Y
        local targetH = 46 + 8 + 30 + 8 + contentH + 14
        MainFrame.Size = UDim2.new(0, 320, 0, math.min(targetH, 520))
    end
end)

-- Initially hide tab bar and content
TabBar.Visible  = false
Content.Visible = false

-- ==================== DRAGGING ====================
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
Topbar.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = inp.Position
        startPos  = MainFrame.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
Topbar.InputChanged:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
        dragInput = inp
    end
end)
UserInputService.InputChanged:Connect(function(inp)
    if dragging and inp == dragInput then
        local delta = inp.Position - dragStart
        TweenService:Create(MainFrame, TweenInfo.new(0.07), {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        }):Play()
    end
end)

-- ==================== WATERMARK ====================
local WatermarkGui = Instance.new("ScreenGui", CoreGui)
WatermarkGui.Name = "extralWatermark"
WatermarkGui.ResetOnSpawn = false
WatermarkGui.DisplayOrder = 1000
local WMFrame = Instance.new("Frame", WatermarkGui)
WMFrame.Size = UDim2.new(0, 200, 0, 22)
WMFrame.Position = UDim2.new(0, 10, 0, 10)
WMFrame.BackgroundColor3 = Colors.BG
WMFrame.BorderSizePixel = 0
WMFrame.BackgroundTransparency = 0.2
Instance.new("UICorner", WMFrame).CornerRadius = UDim.new(0, 6)
local WMStroke = Instance.new("UIStroke", WMFrame)
WMStroke.Color = Colors.Accent ; WMStroke.Thickness = 1
local WMText = Instance.new("TextLabel", WMFrame)
WMText.Size = UDim2.new(1, -10, 1, 0)
WMText.Position = UDim2.new(0, 6, 0, 0)
WMText.BackgroundTransparency = 1
WMText.Font = Enum.Font.GothamBold
WMText.TextSize = 11
WMText.TextColor3 = Colors.Accent
WMText.TextXAlignment = Enum.TextXAlignment.Left

-- Update watermark every second
task.spawn(function()
    while task.wait(1) do
        local ok, ping = pcall(function()
            return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        local pingStr = ok and (tostring(ping) .. "ms") or "?ms"
        WMText.Text = "extral.cc | " .. pingStr .. " | fps:" .. math.floor(1/RunService.RenderStepped:Wait())
    end
end)

-- ==================== MOBILE BUTTONS ====================
if IsMobile() then
    local function MobileBtn(icon, xOff, yOff, onPress)
        local btn = Instance.new("TextButton", ScreenGui)
        btn.Size = UDim2.new(0, 55, 0, 55)
        btn.Position = UDim2.new(0, xOff, 0.5, yOff)
        btn.BackgroundColor3 = Colors.BG2
        btn.BorderSizePixel = 0
        btn.Text = icon
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 22
        btn.TextColor3 = Colors.Accent
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        local s = Instance.new("UIStroke", btn) ; s.Color = Colors.Accent ; s.Thickness = 2
        btn.MouseButton1Click:Connect(onPress)
        return btn
    end
    MobileBtn("🎯", 15, -90, function()
        if CurrentTarget then SetTarget(nil)
        else SetTarget(GetClosestPlayerToCursor()) end
    end)
    MobileBtn("⚡", 15, -28, function()
        Config.Movement.WalkspeedEnabled = not Config.Movement.WalkspeedEnabled
    end)
    MobileBtn("👁", 15, 34, function()
        Config.ESP.Enabled = not Config.ESP.Enabled
    end)
    MobileBtn("🚀", 15, 96, function()
        SetFly(not Config.Movement.FlyEnabled)
    end)
end

-- ==================== WELCOME ====================
task.wait(1.2)
Notify("Welcome " .. LocalPlayer.DisplayName, 3, Colors.AccentGlow)
task.wait(0.4)
Notify("extral.cc loaded | sigma edition", 3, Colors.Accent)
