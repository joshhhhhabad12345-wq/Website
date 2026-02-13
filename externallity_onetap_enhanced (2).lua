--[[
    Externallity - ONE TAP (Enhanced)
    Advanced Combat Script with Silent Aim (w/ Prediction), ESP, Skeleton ESP, and Gun Modifications
    Using Isotopia UI Library
]]

-- Load Isotopia UI Library
local Isotopia = loadstring(game:HttpGet("https://raw.githubusercontent.com/azurelw/isotopia/refs/heads/main/loader.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Settings Storage
local Settings = {
    SilentAim = {
        Enabled = true,
        FOV = 150,
        TargetPart = "Head",
        ShowFOV = true,
        ShowSnapline = true,
        Prediction = {
            Enabled = true,
            Amount = 0.13,
        },
    },
    ESP = {
        Enabled = true,
        ShowBox = true,
        ShowName = true,
        ShowDistance = true,
        ShowSkeleton = true,
        BoxColor = Color3.fromRGB(255, 0, 0),
        NameColor = Color3.fromRGB(255, 255, 255),
        SkeletonColor = Color3.fromRGB(255, 255, 255),
    },
    GunMods = {
        InfiniteAmmo = true,
        NoReload = true,
        FastFireRate = true,
        FireRate = 500,
    },
    Misc = {
        NoShove = true,
        GunTracker = false,
    }
}

-- Create Main Window
local Window = Isotopia:Window({
    Title = "Externallity - ONE TAP",
    Icon = "crosshair",
    Transparent = false,
    Size = UDim2.fromOffset(720, 500),
    MainColor = Color3.fromRGB(100, 130, 255),
    Spinning = true,
    AnimatedTitle = {
        AnimationColor = Color3.fromRGB(150, 180, 255),
        AnimationSide = "Right",
        AnimationSpeed = 3
    }
})
Window:SetToggleKey(Enum.KeyCode.RightShift)

-- Create Tabs
local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "crosshair"
})
local VisualsTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye"
})
local WeaponTab = Window:Tab({
    Title = "Weapon",
    Icon = "zap"
})
local MiscTab = Window:Tab({
    Title = "Misc",
    Icon = "settings"
})

-- Create Sections
local SilentAimSection = CombatTab:Section({ Side = "left" })
local ESPSection = VisualsTab:Section({ Side = "left" })
local WeaponSection = WeaponTab:Section({ Side = "left" })
local MiscSection = MiscTab:Section({ Side = "left" })
local InfoSection = MiscTab:Section({ Side = "right" })

-- ========== SILENT AIM MODULE ==========
local SilentAimModule = SilentAimSection:Module({
    Title = "Silent Aim",
    Desc = "Automatically aims at closest target within FOV",
    Flag = "module_silentaim",
    Locked = false,
    Callback = function(state)
        Settings.SilentAim.Enabled = state
        Isotopia:Notify({
            Title = "Silent Aim",
            Description = state and "Enabled" or "Disabled",
            Duration = 2
        })
    end
})

SilentAimModule:Slider({
    Title = "FOV Radius",
    Value = { Min = 10, Max = 500, Default = Settings.SilentAim.FOV },
    Flag = "silentaim_fov",
    Locked = false,
    Callback = function(value)
        Settings.SilentAim.FOV = value
    end
})

SilentAimModule:Dropdown({
    Title = "Target Part",
    Values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    Value = Settings.SilentAim.TargetPart,
    Flag = "silentaim_targetpart",
    Locked = false,
    Callback = function(option)
        Settings.SilentAim.TargetPart = option
    end
})

SilentAimModule:Checkbox({
    Title = "Show FOV Circle",
    Flag = "silentaim_showfov",
    Locked = false,
    Callback = function(state)
        Settings.SilentAim.ShowFOV = state
    end
})

SilentAimModule:Checkbox({
    Title = "Show Snapline",
    Flag = "silentaim_snapline",
    Locked = false,
    Callback = function(state)
        Settings.SilentAim.ShowSnapline = state
    end
})

SilentAimModule:Divider()

SilentAimModule:Checkbox({
    Title = "Enable Prediction",
    Flag = "silentaim_prediction",
    Locked = false,
    Callback = function(state)
        Settings.SilentAim.Prediction.Enabled = state
    end
})

SilentAimModule:Slider({
    Title = "Prediction Amount",
    Value = { Min = 0.05, Max = 0.5, Default = Settings.SilentAim.Prediction.Amount },
    Flag = "silentaim_prediction_amount",
    Locked = false,
    Callback = function(value)
        Settings.SilentAim.Prediction.Amount = value
    end
})

-- ========== ESP MODULE ==========
local ESPModule = ESPSection:Module({
    Title = "Player ESP",
    Desc = "Shows player information on screen",
    Flag = "module_esp",
    Locked = false,
    Callback = function(state)
        Settings.ESP.Enabled = state
        Isotopia:Notify({
            Title = "Player ESP",
            Description = state and "Enabled" or "Disabled",
            Duration = 2
        })
    end
})

ESPModule:Checkbox({
    Title = "Show Box",
    Flag = "esp_box",
    Locked = false,
    Callback = function(state)
        Settings.ESP.ShowBox = state
    end
})

ESPModule:Checkbox({
    Title = "Show Name",
    Flag = "esp_name",
    Locked = false,
    Callback = function(state)
        Settings.ESP.ShowName = state
    end
})

ESPModule:Checkbox({
    Title = "Show Distance",
    Flag = "esp_distance",
    Locked = false,
    Callback = function(state)
        Settings.ESP.ShowDistance = state
    end
})

ESPModule:Checkbox({
    Title = "Show Skeleton",
    Flag = "esp_skeleton",
    Locked = false,
    Callback = function(state)
        Settings.ESP.ShowSkeleton = state
    end
})

-- ========== WEAPON MODIFICATIONS MODULE ==========
local WeaponModule = WeaponSection:Module({
    Title = "Weapon Modifications",
    Desc = "Modify weapon properties for enhanced performance",
    Flag = "module_weapon",
    Locked = false,
    Callback = function(state)
        -- Module toggle callback
    end
})

WeaponModule:Checkbox({
    Title = "Infinite Ammo",
    Flag = "weapon_infiniteammo",
    Locked = false,
    Callback = function(state)
        Settings.GunMods.InfiniteAmmo = state
    end
})

WeaponModule:Checkbox({
    Title = "No Reload",
    Flag = "weapon_noreload",
    Locked = false,
    Callback = function(state)
        Settings.GunMods.NoReload = state
    end
})

WeaponModule:Checkbox({
    Title = "Fast Fire Rate",
    Flag = "weapon_fastfire",
    Locked = false,
    Callback = function(state)
        Settings.GunMods.FastFireRate = state
    end
})

WeaponModule:Slider({
    Title = "Fire Rate",
    Value = { Min = 100, Max = 1000, Default = Settings.GunMods.FireRate },
    Flag = "weapon_firerate",
    Locked = false,
    Callback = function(value)
        Settings.GunMods.FireRate = value
    end
})

-- ========== MISC MODULE ==========
local MiscModule = MiscSection:Module({
    Title = "Miscellaneous",
    Desc = "Additional features and utilities",
    Flag = "module_misc",
    Locked = false,
    Callback = function(state)
        -- Module toggle callback
    end
})

MiscModule:Checkbox({
    Title = "Disable Shove",
    Flag = "misc_noshove",
    Locked = false,
    Callback = function(state)
        Settings.Misc.NoShove = state
    end
})

MiscModule:Checkbox({
    Title = "Gun Tracker Line",
    Flag = "misc_guntracker",
    Locked = false,
    Callback = function(state)
        Settings.Misc.GunTracker = state
    end
})

MiscModule:Divider()

MiscModule:Button({
    Title = "Copy Scriptblox",
    Locked = false,
    Callback = function()
        setclipboard("https://scriptblox.com/u/Ternal")
        Isotopia:Notify({
            Title = "Scriptblox",
            Description = "Invite link copied to clipboard!",
            Duration = 3
        })
    end
})

-- ========== INFO SECTION ==========
InfoSection:Label({ Content = "Externallity - ONE TAP" })
InfoSection:Label({ Content = "Version: 2.0 Enhanced" })
InfoSection:Label({ Content = "Features:" })
InfoSection:Label({ Content = "• Silent Aim with Prediction" })
InfoSection:Label({ Content = "• Full ESP (Box, Name, Distance, Skeleton)" })
InfoSection:Label({ Content = "• Weapon Modifications" })
InfoSection:Label({ Content = "• Anti-Shove" })

-- Initialize Weapon Manager
local WeaponManager = require(ReplicatedStorage.Common.Managers.WeaponManager)

-- Apply Weapon Modifications
local function applyWeaponMods()
    if Settings.GunMods.InfiniteAmmo then
        WeaponManager.Constants.DEFAULT_MAGAZINE = 9e9
    end
    if Settings.GunMods.NoReload then
        WeaponManager.Constants.DEFAULT_PISTOL_RELOAD_TIME = 0
        WeaponManager.Constants.DEFAULT_RELOAD_TIME = 0
    end
    if Settings.GunMods.FastFireRate then
        WeaponManager.Constants.DEFAULT_PISTOL_FIRERATE = Settings.GunMods.FireRate
    end
end

applyWeaponMods()

-- FOV Circle (Outline)
local fovCircleOutline = Drawing.new("Circle")
fovCircleOutline.Color = Color3.fromRGB(0, 0, 0)
fovCircleOutline.Thickness = 3
fovCircleOutline.Transparency = 0.8
fovCircleOutline.Filled = false

-- FOV Circle (Main)
local fovCircle = Drawing.new("Circle")
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Thickness = 1
fovCircle.Transparency = 0.6
fovCircle.Filled = false

-- Snapline (Outline)
local snaplineOutline = Drawing.new("Line")
snaplineOutline.Color = Color3.fromRGB(0, 0, 0)
snaplineOutline.Thickness = 3
snaplineOutline.Transparency = 0.8

-- Snapline (Main)
local snapline = Drawing.new("Line")
snapline.Color = Color3.fromRGB(255, 255, 255)
snapline.Thickness = 1
snapline.Transparency = 0.6

-- Gun Tracker Line
local gunTrackerLine = Drawing.new("Line")
gunTrackerLine.Thickness = 2
gunTrackerLine.Color = Color3.fromRGB(0, 255, 0)
gunTrackerLine.Visible = false

-- Current Target
local CurrentTarget = nil
local CurrentTargetPart = nil

-- Get Silent Aim Target with Prediction
local function getSilentTarget()
    local screenCenter = Camera.ViewportSize / 2
    local closest, closestDist, closestPart = nil, math.huge, nil

    for _, model in ipairs(Workspace:GetChildren()) do
        if model == LocalPlayer.Character then continue end
        if not model:GetAttribute("deployed") then continue end
        if model:FindFirstChild("ForceField") then continue end

        local hum = model:FindFirstChildWhichIsA("Humanoid")
        local part = model:FindFirstChild(Settings.SilentAim.TargetPart) or model:FindFirstChild("Head") or model:FindFirstChild("HumanoidRootPart")
        if not hum or hum.Health <= 0 or not part then continue end

        -- Calculate predicted position
        local targetPos = part.Position
        if Settings.SilentAim.Prediction.Enabled and part:IsA("BasePart") then
            local velocity = part.AssemblyLinearVelocity or part.Velocity or Vector3.new(0, 0, 0)
            targetPos = targetPos + (velocity * Settings.SilentAim.Prediction.Amount)
        end

        local screenPos, visible = Camera:WorldToViewportPoint(targetPos)
        if not visible then continue end

        local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
        if dist < Settings.SilentAim.FOV and dist < closestDist then
            closestDist = dist
            closest = targetPos
            closestPart = part
        end
    end

    return closest, closestPart
end

-- Update FOV Circle and Target
RunService.RenderStepped:Connect(function()
    local center = Camera.ViewportSize / 2
    
    -- Update FOV Circle
    fovCircleOutline.Visible = Settings.SilentAim.Enabled and Settings.SilentAim.ShowFOV
    fovCircle.Visible = Settings.SilentAim.Enabled and Settings.SilentAim.ShowFOV
    fovCircleOutline.Position = center
    fovCircle.Position = center
    fovCircleOutline.Radius = Settings.SilentAim.FOV
    fovCircle.Radius = Settings.SilentAim.FOV
    
    -- Get Target
    if Settings.SilentAim.Enabled then
        CurrentTarget, CurrentTargetPart = getSilentTarget()
    else
        CurrentTarget = nil
        CurrentTargetPart = nil
    end
    
    -- Update Snapline
    if CurrentTarget and Settings.SilentAim.ShowSnapline then
        local screenPos = Camera:WorldToViewportPoint(CurrentTarget)
        snaplineOutline.From = center
        snaplineOutline.To = Vector2.new(screenPos.X, screenPos.Y)
        snapline.From = center
        snapline.To = Vector2.new(screenPos.X, screenPos.Y)
        snaplineOutline.Visible = true
        snapline.Visible = true
    else
        snaplineOutline.Visible = false
        snapline.Visible = false
    end
    
    -- Update Gun Tracker
    if Settings.Misc.GunTracker and CurrentTarget then
        local pos, onScreen = Camera:WorldToViewportPoint(CurrentTarget)
        if onScreen then
            gunTrackerLine.From = center
            gunTrackerLine.To = Vector2.new(pos.X, pos.Y)
            gunTrackerLine.Visible = true
        else
            gunTrackerLine.Visible = false
        end
    else
        gunTrackerLine.Visible = false
    end
end)

-- Silent Aim Hook with Prediction
local originalCast = WeaponManager.cast
WeaponManager.cast = function(origin, direction, bulletSpeed, maxDistance, ...)
    if Settings.SilentAim.Enabled and CurrentTarget then
        bulletSpeed = 9e9
        maxDistance = 9e9
        direction = (CurrentTarget - origin).Unit
    end
    return originalCast(origin, direction, bulletSpeed, maxDistance, ...)
end

-- Disable Shove
local shove = filtergc("function", { Name = "shove" }, true)
if shove then
    local originalShove = shove
    shove = function(...)
        if Settings.Misc.NoShove then
            return
        end
        return originalShove(...)
    end
end

-- ========== ESP SYSTEM WITH SKELETON ==========
local ESP = {}

-- Skeleton bone connections (R15)
local SkeletonConnections = {
    -- Head to Torso
    {"Head", "UpperTorso"},
    -- Torso
    {"UpperTorso", "LowerTorso"},
    -- Left Arm
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    -- Right Arm
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    -- Left Leg
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    -- Right Leg
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"},
}

local function createESP(player)
    if ESP[player] then return end

    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Color = Settings.ESP.BoxColor
    box.Visible = false

    local nameTag = Drawing.new("Text")
    nameTag.Size = 14
    nameTag.Center = true
    nameTag.Outline = true
    nameTag.Color = Settings.ESP.NameColor
    nameTag.Visible = false

    local distanceTag = Drawing.new("Text")
    distanceTag.Size = 13
    distanceTag.Center = true
    distanceTag.Outline = true
    distanceTag.Color = Color3.fromRGB(180, 180, 180)
    distanceTag.Visible = false

    -- Create skeleton lines
    local skeletonLines = {}
    for i = 1, #SkeletonConnections do
        local line = Drawing.new("Line")
        line.Thickness = 1
        line.Color = Settings.ESP.SkeletonColor
        line.Transparency = 1
        line.Visible = false
        table.insert(skeletonLines, line)
    end

    ESP[player] = { 
        Box = box, 
        Name = nameTag, 
        Distance = distanceTag,
        Skeleton = skeletonLines
    }
end

Players.PlayerRemoving:Connect(function(player)
    if ESP[player] then
        for _, obj in pairs(ESP[player]) do
            if type(obj) == "table" then
                for _, line in pairs(obj) do
                    line:Remove()
                end
            else
                obj:Remove()
            end
        end
        ESP[player] = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if not Settings.ESP.Enabled then
        for _, espData in pairs(ESP) do
            espData.Box.Visible = false
            espData.Name.Visible = false
            espData.Distance.Visible = false
            for _, line in pairs(espData.Skeleton) do
                line.Visible = false
            end
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local head = char and char:FindFirstChild("Head")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if not (char and hrp and head and hum) or hum.Health <= 0 then
                if ESP[player] then
                    ESP[player].Box.Visible = false
                    ESP[player].Name.Visible = false
                    ESP[player].Distance.Visible = false
                    for _, line in pairs(ESP[player].Skeleton) do
                        line.Visible = false
                    end
                end
                continue
            end

            createESP(player)

            local box = ESP[player].Box
            local nameTag = ESP[player].Name
            local distanceTag = ESP[player].Distance
            local skeletonLines = ESP[player].Skeleton

            local hrpPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
            local feetPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2.5, 0))

            if onScreen then
                local boxHeight = math.abs(headPos.Y - feetPos.Y)
                local boxWidth = boxHeight / 2

                -- Box ESP
                if Settings.ESP.ShowBox then
                    box.Size = Vector2.new(boxWidth, boxHeight)
                    box.Position = Vector2.new(hrpPos.X - boxWidth / 2, headPos.Y)
                    box.Color = Settings.ESP.BoxColor
                    box.Visible = true
                else
                    box.Visible = false
                end

                -- Name ESP
                if Settings.ESP.ShowName then
                    nameTag.Text = player.Name
                    nameTag.Position = Vector2.new(hrpPos.X, headPos.Y - 16)
                    nameTag.Color = Settings.ESP.NameColor
                    nameTag.Visible = true
                else
                    nameTag.Visible = false
                end

                -- Distance ESP
                if Settings.ESP.ShowDistance then
                    local distance = math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)
                    distanceTag.Text = tostring(distance) .. " studs"
                    distanceTag.Position = Vector2.new(hrpPos.X, headPos.Y + boxHeight + 2)
                    distanceTag.Visible = true
                else
                    distanceTag.Visible = false
                end

                -- Skeleton ESP
                if Settings.ESP.ShowSkeleton then
                    for i, connection in ipairs(SkeletonConnections) do
                        local part1 = char:FindFirstChild(connection[1])
                        local part2 = char:FindFirstChild(connection[2])
                        
                        if part1 and part2 then
                            local pos1, visible1 = Camera:WorldToViewportPoint(part1.Position)
                            local pos2, visible2 = Camera:WorldToViewportPoint(part2.Position)
                            
                            if visible1 and visible2 then
                                local line = skeletonLines[i]
                                line.From = Vector2.new(pos1.X, pos1.Y)
                                line.To = Vector2.new(pos2.X, pos2.Y)
                                line.Color = Settings.ESP.SkeletonColor
                                line.Visible = true
                            else
                                skeletonLines[i].Visible = false
                            end
                        else
                            skeletonLines[i].Visible = false
                        end
                    end
                else
                    for _, line in pairs(skeletonLines) do
                        line.Visible = false
                    end
                end
            else
                box.Visible = false
                nameTag.Visible = false
                distanceTag.Visible = false
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
            end
        end
    end
end)

-- Load the Window
Window:load()

-- Success Notification
Isotopia:Notify({
    Title = "Externallity - ONE TAP Enhanced",
    Description = "Successfully loaded! Press Right Shift to toggle UI.",
    Duration = 5
})

print("✅ Externallity - ONE TAP Enhanced Loaded Successfully")
print("✅ All Features: Silent Aim w/ Prediction, ESP w/ Skeleton, Weapon Mods, Anti-Shove")
print("✅ Toggle UI: Right Shift")
