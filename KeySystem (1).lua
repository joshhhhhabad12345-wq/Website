--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║           ✦ AZURE KEY SYSTEM ✦                               ║
    ║           Powered by Panda Development                       ║
    ║           Mobile-Ready · Draggable · Compact UI              ║
    ╚══════════════════════════════════════════════════════════════╝
    
    HOW TO USE:
    1. Paste this at the TOP of your script
    2. Replace "YOUR_SCRIPT_HERE" at the bottom with your actual script
    3. The key link is: https://new.pandadevelopment.net/getkey/externalliltyserviceidentifier
]]

-- ══════════════════════════════════════
--           CONFIGURATION
-- ══════════════════════════════════════
local CONFIG = {
    Title        = "Azure Hub",
    Subtitle     = "Key System",
    Version      = "v2.0",
    Discord      = "discord.gg/yourdiscord",
    ServiceID    = "externalliltyserviceidentifier",
    APIToken     = "3f739883-8408-403e-bcfe-fbe8c8241b8d",
    KeyLink      = "https://new.pandadevelopment.net/getkey/externalliltyserviceidentifier",
    SaveFileName = "AzureHub_Key.txt",
    ValidateURL  = "https://new.pandadevelopment.net/v2_validation",
}

-- ══════════════════════════════════════
--           SERVICES
-- ══════════════════════════════════════
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local HttpService      = game:GetService("HttpService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════
--           HWID & KEY UTILS
-- ══════════════════════════════════════
local function GetHWID()
    local uid = tostring(LocalPlayer.UserId)
    local ok, machineID = pcall(function()
        return tostring(game:GetService("RbxAnalyticsService"):GetClientId())
    end)
    if ok and machineID and machineID ~= "" then
        return machineID
    end
    return uid
end

local function SaveKey(key)
    pcall(function() writefile(CONFIG.SaveFileName, key) end)
end

local function LoadKey()
    local ok, data = pcall(function() return readfile(CONFIG.SaveFileName) end)
    if ok and data and data ~= "" then return data end
    return nil
end

local function ValidateKey(key)
    local hwid = GetHWID()
    local url = CONFIG.ValidateURL
        .. "?service=" .. CONFIG.ServiceID
        .. "&hwid="    .. HttpService:UrlEncode(hwid)
        .. "&key="     .. HttpService:UrlEncode(key)
        .. "&token="   .. CONFIG.APIToken

    local ok, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if not ok then return false, "Network error" end

    if response and (response:lower():find("success") or response:lower():find('"true"') or response:lower():find('"valid"')) then
        return true, "Authenticated"
    elseif response and response:lower():find("expired") then
        return false, "Key Expired"
    elseif response and response:lower():find("invalid") then
        return false, "Invalid Key"
    else
        local s, d = pcall(HttpService.JSONDecode, HttpService, response)
        if s and d then
            local auth = d["V2_Authentication"] or d["v2_authentication"]
            if auth and (tostring(auth):lower() == "success" or tostring(auth) == "true") then
                return true, "Authenticated"
            end
            local info = d["Key_Information"]
            if info then
                local exp = info["expiresAt"]
                return false, "Key Invalid | Expires: " .. tostring(exp or "N/A")
            end
        end
        return false, "Validation Failed"
    end
end

-- ══════════════════════════════════════
--           TWEEN HELPERS
-- ══════════════════════════════════════
local function Tween(obj, props, duration, style, dir)
    style = Enum.EasingStyle[style or "Quad"]
    dir   = Enum.EasingDirection[dir or "Out"]
    local info = TweenInfo.new(duration or 0.4, style, dir)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

-- ══════════════════════════════════════
--           COLOR PALETTE
-- ══════════════════════════════════════
local C = {
    BG          = Color3.fromRGB(5,  10,  22),
    Panel       = Color3.fromRGB(8,  18,  40),
    Card        = Color3.fromRGB(10, 22,  52),
    Border      = Color3.fromRGB(20, 80,  200),
    BorderGlow  = Color3.fromRGB(50, 130, 255),
    Accent      = Color3.fromRGB(30, 100, 255),
    AccentLight = Color3.fromRGB(80, 160, 255),
    Cyan        = Color3.fromRGB(0,  210, 255),
    Text        = Color3.fromRGB(220, 235, 255),
    TextDim     = Color3.fromRGB(120, 160, 220),
    TextMuted   = Color3.fromRGB(70,  100, 160),
    White       = Color3.fromRGB(255, 255, 255),
    Success     = Color3.fromRGB(0,   210, 130),
    Error       = Color3.fromRGB(255, 60,  80),
    Warning     = Color3.fromRGB(255, 180, 0),
    InputBG     = Color3.fromRGB(6,   14,  34),
}

-- ══════════════════════════════════════
--           GUI BUILDER
-- ══════════════════════════════════════
local function New(class, props, children)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then obj[k] = v end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = obj
    end
    if props and props.Parent then
        obj.Parent = props.Parent
    end
    return obj
end

local function MakeGradient(parent, rotation, colors)
    return New("UIGradient", { Rotation = rotation or 90, Color = ColorSequence.new(colors), Parent = parent })
end

local function MakeCorner(parent, radius)
    return New("UICorner", { CornerRadius = UDim.new(0, radius or 8), Parent = parent })
end

local function MakeStroke(parent, color, thickness)
    return New("UIStroke", {
        Color = color or C.Border,
        Thickness = thickness or 1.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent,
    })
end

-- ══════════════════════════════════════
--           DETECT MOBILE
-- ══════════════════════════════════════
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Card dimensions — smaller to fit mobile
local CARD_W = isMobile and 300 or 340
local CARD_H = isMobile and 380 or 420

-- ══════════════════════════════════════
--           MAIN GUI
-- ══════════════════════════════════════
for _, v in ipairs(PlayerGui:GetChildren()) do
    if v.Name == "AzureKeySystem" then v:Destroy() end
end

local ScreenGui = New("ScreenGui", {
    Name           = "AzureKeySystem",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    ResetOnSpawn   = false,
    IgnoreGuiInset = true,
    Parent         = PlayerGui,
})

-- ── OVERLAY ──
local BlurOverlay = New("Frame", {
    Size                   = UDim2.new(1, 0, 1, 0),
    BackgroundColor3       = Color3.fromRGB(0, 5, 15),
    BackgroundTransparency = 0.3,
    ZIndex                 = 1,
    Parent                 = ScreenGui,
})

-- ── BACKGROUND PARTICLES ──
local ParticleFrame = New("Frame", {
    Size                   = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    ZIndex                 = 2,
    Parent                 = ScreenGui,
})

local function CreateParticle(index)
    local size = math.random(2, 7)
    local x    = math.random(5, 95) / 100
    local y    = math.random(5, 95) / 100
    local alpha = math.random(70, 90) / 100
    local orb = New("Frame", {
        Size                   = UDim2.new(0, size, 0, size),
        Position               = UDim2.new(x, 0, y, 0),
        BackgroundColor3       = (index % 3 == 0) and C.Cyan or C.AccentLight,
        BackgroundTransparency = alpha,
        ZIndex                 = 2,
        Parent                 = ParticleFrame,
    })
    MakeCorner(orb, size / 2)
    local duration = math.random(3, 8)
    local offsetY  = math.random(-60, 60)
    local offsetX  = math.random(-40, 40)
    task.spawn(function()
        while orb.Parent do
            Tween(orb, {
                Position               = UDim2.new(x + offsetX / 1000, 0, y + offsetY / 1000, 0),
                BackgroundTransparency = math.random(60, 92) / 100,
            }, duration, "Sine", "InOut")
            task.wait(duration)
            Tween(orb, {
                Position               = UDim2.new(x, 0, y, 0),
                BackgroundTransparency = alpha,
            }, duration, "Sine", "InOut")
            task.wait(duration)
        end
    end)
end

for i = 1, 20 do CreateParticle(i) end

-- ── MAIN CARD ──
local Card = New("Frame", {
    Size                   = UDim2.new(0, CARD_W, 0, CARD_H),
    Position               = UDim2.new(0.5, -CARD_W / 2, 0.5, -CARD_H / 2),
    BackgroundColor3       = C.Panel,
    BackgroundTransparency = 0,
    ZIndex                 = 10,
    Parent                 = ScreenGui,
})
MakeCorner(Card, 12)
MakeStroke(Card, C.Border, 1.5)

-- Card background gradient
local CardBG = New("Frame", {
    Size             = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = C.BG,
    ZIndex           = 10,
    Parent           = Card,
})
MakeCorner(CardBG, 12)
MakeGradient(CardBG, 135, {
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(4, 10, 28)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(6, 16, 42)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(3, 8,  20)),
})

-- ── TOP GLOW BAR ──
local GlowBar = New("Frame", {
    Size             = UDim2.new(1, 0, 0, 3),
    Position         = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = C.Accent,
    ZIndex           = 12,
    Parent           = Card,
})
MakeCorner(GlowBar, 12)
MakeGradient(GlowBar, 0, {
    ColorSequenceKeypoint.new(0,   C.Accent),
    ColorSequenceKeypoint.new(0.5, C.Cyan),
    ColorSequenceKeypoint.new(1,   C.Accent),
})

task.spawn(function()
    while GlowBar.Parent do
        Tween(GlowBar, {BackgroundColor3 = C.Cyan},   1.5, "Sine", "InOut") task.wait(1.5)
        Tween(GlowBar, {BackgroundColor3 = C.Accent}, 1.5, "Sine", "InOut") task.wait(1.5)
    end
end)

-- ── HEADER ──
local Header = New("Frame", {
    Size                   = UDim2.new(1, 0, 0, 90),
    BackgroundTransparency = 1,
    ZIndex                 = 11,
    Parent                 = Card,
})

-- Pulsing ring + key icon
local Ring = New("Frame", {
    Size             = UDim2.new(0, 52, 0, 52),
    Position         = UDim2.new(0.5, -26, 0, 12),
    BackgroundColor3 = C.Accent,
    BackgroundTransparency = 0.7,
    ZIndex           = 11,
    Parent           = Header,
})
MakeCorner(Ring, 26)

task.spawn(function()
    while Ring.Parent do
        Tween(Ring, { Size = UDim2.new(0, 62, 0, 62), Position = UDim2.new(0.5, -31, 0, 7),  BackgroundTransparency = 0.9 }, 1.2, "Sine", "Out")
        task.wait(1.2)
        Tween(Ring, { Size = UDim2.new(0, 52, 0, 52), Position = UDim2.new(0.5, -26, 0, 12), BackgroundTransparency = 0.7 }, 1.2, "Sine", "Out")
        task.wait(1.2)
    end
end)

local KeyIcon = New("TextLabel", {
    Size                   = UDim2.new(0, 50, 0, 50),
    Position               = UDim2.new(0.5, -25, 0, 13),
    BackgroundTransparency = 1,
    Text                   = "🔑",
    TextSize               = 26,
    Font                   = Enum.Font.GothamBold,
    ZIndex                 = 12,
    Parent                 = Header,
})

task.spawn(function()
    local angle = 0
    while KeyIcon.Parent do
        angle = (angle + 1) % 360
        KeyIcon.TextSize = 26 + math.sin(math.rad(angle * 2)) * 2
        task.wait(0.05)
    end
end)

local TitleLabel = New("TextLabel", {
    Size                   = UDim2.new(1, 0, 0, 20),
    Position               = UDim2.new(0, 0, 0, 66),
    BackgroundTransparency = 1,
    Text                   = CONFIG.Title,
    TextColor3             = C.Text,
    TextSize               = 17,
    Font                   = Enum.Font.GothamBold,
    ZIndex                 = 12,
    Parent                 = Header,
})

local SubLabel = New("TextLabel", {
    Size                   = UDim2.new(1, 0, 0, 14),
    Position               = UDim2.new(0, 0, 0, 78),
    BackgroundTransparency = 1,
    Text                   = CONFIG.Subtitle .. " · " .. CONFIG.Version,
    TextColor3             = C.TextMuted,
    TextSize               = 10,
    Font                   = Enum.Font.Gotham,
    ZIndex                 = 12,
    Parent                 = Header,
})

-- ── DIVIDER ──
local Divider = New("Frame", {
    Size             = UDim2.new(1, -40, 0, 1),
    Position         = UDim2.new(0, 20, 0, 96),
    BackgroundColor3 = C.Border,
    ZIndex           = 11,
    Parent           = Card,
})
MakeGradient(Divider, 0, {
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.3, C.Border),
    ColorSequenceKeypoint.new(0.7, C.BorderGlow),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(0, 0, 0)),
})

-- ── STATUS BOX (full width, no HWID shown) ──
local StatusBox = New("Frame", {
    Size             = UDim2.new(1, -40, 0, 40),
    Position         = UDim2.new(0, 20, 0, 106),
    BackgroundColor3 = C.InputBG,
    ZIndex           = 11,
    Parent           = Card,
})
MakeCorner(StatusBox, 8)
MakeStroke(StatusBox, C.Border, 1)

New("TextLabel", {
    Size                   = UDim2.new(1, -10, 0, 12),
    Position               = UDim2.new(0, 8, 0, 4),
    BackgroundTransparency = 1,
    Text                   = "STATUS",
    TextColor3             = C.TextMuted,
    TextSize               = 8,
    Font                   = Enum.Font.GothamBold,
    TextXAlignment         = Enum.TextXAlignment.Left,
    ZIndex                 = 12,
    Parent                 = StatusBox,
})

local StatusDot = New("Frame", {
    Size             = UDim2.new(0, 7, 0, 7),
    Position         = UDim2.new(0, 8, 0, 20),
    BackgroundColor3 = C.Warning,
    ZIndex           = 12,
    Parent           = StatusBox,
})
MakeCorner(StatusDot, 4)

local StatusLabel = New("TextLabel", {
    Size                   = UDim2.new(1, -30, 0, 14),
    Position               = UDim2.new(0, 20, 0, 17),
    BackgroundTransparency = 1,
    Text                   = "Awaiting Key",
    TextColor3             = C.Warning,
    TextSize               = 10,
    Font                   = Enum.Font.GothamBold,
    TextXAlignment         = Enum.TextXAlignment.Left,
    ZIndex                 = 12,
    Parent                 = StatusBox,
})

-- ── KEY INPUT ──
local InputFrame = New("Frame", {
    Size             = UDim2.new(1, -40, 0, 44),
    Position         = UDim2.new(0, 20, 0, 156),
    BackgroundColor3 = C.InputBG,
    ZIndex           = 11,
    Parent           = Card,
})
MakeCorner(InputFrame, 10)
local InputStroke = MakeStroke(InputFrame, C.Border, 1.5)

New("TextLabel", {
    Size                   = UDim2.new(0, 28, 1, 0),
    Position               = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Text                   = "🔐",
    TextSize               = 14,
    Font                   = Enum.Font.Gotham,
    ZIndex                 = 12,
    Parent                 = InputFrame,
})

local KeyInput = New("TextBox", {
    Size                = UDim2.new(1, -46, 1, -10),
    Position            = UDim2.new(0, 40, 0, 5),
    BackgroundTransparency = 1,
    PlaceholderText     = "Enter your key here...",
    PlaceholderColor3   = C.TextMuted,
    Text                = "",
    TextColor3          = C.Text,
    TextSize            = isMobile and 11 or 12,
    Font                = Enum.Font.Code,
    TextXAlignment      = Enum.TextXAlignment.Left,
    ClearTextOnFocus    = false,
    ZIndex              = 12,
    Parent              = InputFrame,
})

KeyInput.Focused:Connect(function()
    Tween(InputStroke, {Color = C.Cyan, Thickness = 2}, 0.3)
    Tween(InputFrame,  {BackgroundColor3 = Color3.fromRGB(8, 18, 45)}, 0.3)
end)
KeyInput.FocusLost:Connect(function()
    Tween(InputStroke, {Color = C.Border, Thickness = 1.5}, 0.3)
    Tween(InputFrame,  {BackgroundColor3 = C.InputBG}, 0.3)
end)

-- ── VALIDATE BUTTON ──
local ValidateBtn = New("TextButton", {
    Size             = UDim2.new(1, -40, 0, 40),
    Position         = UDim2.new(0, 20, 0, 210),
    BackgroundColor3 = C.Accent,
    Text             = "",
    ZIndex           = 11,
    Parent           = Card,
})
MakeCorner(ValidateBtn, 10)
MakeGradient(ValidateBtn, 90, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 70, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5,  40, 150)),
})
local ValidateBtnStroke = MakeStroke(ValidateBtn, C.BorderGlow, 1)

local ValidateBtnText = New("TextLabel", {
    Size                   = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Text                   = "✦  VALIDATE KEY  ✦",
    TextColor3             = C.White,
    TextSize               = 12,
    Font                   = Enum.Font.GothamBold,
    ZIndex                 = 12,
    Parent                 = ValidateBtn,
})

-- Shimmer
local Shimmer = New("Frame", {
    Size                   = UDim2.new(0, 50, 1, 0),
    Position               = UDim2.new(-0.2, 0, 0, 0),
    BackgroundColor3       = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 0.85,
    ZIndex                 = 12,
    Parent                 = ValidateBtn,
})
MakeCorner(Shimmer, 0)
New("UIClipsDescendants", {Parent = ValidateBtn})

task.spawn(function()
    while ValidateBtn.Parent do
        TweenService:Create(Shimmer, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
            Position = UDim2.new(1.2, 0, 0, 0)
        }):Play()
        task.wait(3)
        Shimmer.Position = UDim2.new(-0.2, 0, 0, 0)
        task.wait(0.1)
    end
end)

-- Hover (desktop only)
ValidateBtn.MouseEnter:Connect(function()
    Tween(ValidateBtn,     {BackgroundColor3 = C.BorderGlow}, 0.2)
    Tween(ValidateBtnStroke, {Color = C.Cyan}, 0.2)
end)
ValidateBtn.MouseLeave:Connect(function()
    Tween(ValidateBtn,     {BackgroundColor3 = C.Accent}, 0.2)
    Tween(ValidateBtnStroke, {Color = C.BorderGlow}, 0.2)
end)

-- ── BOTTOM BUTTONS ROW ──
local BottomRow = New("Frame", {
    Size                   = UDim2.new(1, -40, 0, 34),
    Position               = UDim2.new(0, 20, 0, 260),
    BackgroundTransparency = 1,
    ZIndex                 = 11,
    Parent                 = Card,
})

local GetKeyBtn = New("TextButton", {
    Size             = UDim2.new(0.485, 0, 1, 0),
    BackgroundColor3 = C.Card,
    Text             = "",
    ZIndex           = 11,
    Parent           = BottomRow,
})
MakeCorner(GetKeyBtn, 8)
MakeStroke(GetKeyBtn, C.Border, 1)
New("TextLabel", {
    Size                   = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Text                   = "🌐  Get Key",
    TextColor3             = C.AccentLight,
    TextSize               = 11,
    Font                   = Enum.Font.GothamBold,
    ZIndex                 = 12,
    Parent                 = GetKeyBtn,
})

local CopyBtn = New("TextButton", {
    Size             = UDim2.new(0.485, 0, 1, 0),
    Position         = UDim2.new(0.515, 0, 0, 0),
    BackgroundColor3 = C.Card,
    Text             = "",
    ZIndex           = 11,
    Parent           = BottomRow,
})
MakeCorner(CopyBtn, 8)
MakeStroke(CopyBtn, C.Border, 1)
local CopyBtnText = New("TextLabel", {
    Size                   = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Text                   = "📋  Copy Link",
    TextColor3             = C.AccentLight,
    TextSize               = 11,
    Font                   = Enum.Font.GothamBold,
    ZIndex                 = 12,
    Parent                 = CopyBtn,
})

-- ── NOTIFICATION BAR ──
local NotifBar = New("Frame", {
    Size                   = UDim2.new(1, -40, 0, 34),
    Position               = UDim2.new(0, 20, 0, 304),
    BackgroundColor3       = C.Card,
    BackgroundTransparency = 0.2,
    ZIndex                 = 11,
    Parent                 = Card,
})
MakeCorner(NotifBar, 8)
MakeStroke(NotifBar, C.Border, 1)

local NotifIcon = New("TextLabel", {
    Size                   = UDim2.new(0, 28, 1, 0),
    Position               = UDim2.new(0, 4, 0, 0),
    BackgroundTransparency = 1,
    Text                   = "ℹ️",
    TextSize               = 12,
    Font                   = Enum.Font.Gotham,
    ZIndex                 = 12,
    Parent                 = NotifBar,
})

local NotifText = New("TextLabel", {
    Size                   = UDim2.new(1, -36, 1, 0),
    Position               = UDim2.new(0, 32, 0, 0),
    BackgroundTransparency = 1,
    Text                   = "Enter your key and press Validate.",
    TextColor3             = C.TextDim,
    TextSize               = 9,
    Font                   = Enum.Font.Gotham,
    TextXAlignment         = Enum.TextXAlignment.Left,
    TextTruncate           = Enum.TextTruncate.AtEnd,
    ZIndex                 = 12,
    Parent                 = NotifBar,
})

-- ── LOADING BAR ──
local LoadingBG = New("Frame", {
    Size             = UDim2.new(1, -40, 0, 3),
    Position         = UDim2.new(0, 20, 0, 346),
    BackgroundColor3 = Color3.fromRGB(10, 20, 45),
    ZIndex           = 11,
    Parent           = Card,
})
MakeCorner(LoadingBG, 2)

local LoadingBar = New("Frame", {
    Size             = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = C.Accent,
    ZIndex           = 12,
    Parent           = LoadingBG,
})
MakeCorner(LoadingBar, 2)
MakeGradient(LoadingBar, 0, {
    ColorSequenceKeypoint.new(0, C.Accent),
    ColorSequenceKeypoint.new(1, C.Cyan),
})

-- ── FOOTER ──
New("TextLabel", {
    Size                   = UDim2.new(1, 0, 0, 26),
    Position               = UDim2.new(0, 0, 0, 357),
    BackgroundTransparency = 1,
    Text                   = "🐼 Panda Development · " .. CONFIG.Discord,
    TextColor3             = C.TextMuted,
    TextSize               = 9,
    Font                   = Enum.Font.Gotham,
    ZIndex                 = 11,
    Parent                 = Card,
})

-- ══════════════════════════════════════
--    DRAG SYSTEM (Mouse + Touch)
-- ══════════════════════════════════════
do
    local dragging   = false
    local dragStart  = nil
    local startPos   = nil

    -- Invisible drag handle over the header area
    local DragHandle = New("Frame", {
        Size                   = UDim2.new(1, 0, 0, 96),
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        Parent                 = Card,
    })

    local function onInputBegan(input)
        local t = input.UserInputType
        if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = Card.Position
        end
    end

    local function onInputChanged(input)
        local t = input.UserInputType
        if dragging and (t == Enum.UserInputType.MouseMovement or t == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Card.Position = UDim2.new(
                startPos.X.Scale,  startPos.X.Offset + delta.X,
                startPos.Y.Scale,  startPos.Y.Offset + delta.Y
            )
        end
    end

    local function onInputEnded(input)
        local t = input.UserInputType
        if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
            dragging = false
        end
    end

    DragHandle.InputBegan:Connect(onInputBegan)
    UserInputService.InputChanged:Connect(onInputChanged)
    UserInputService.InputEnded:Connect(onInputEnded)
end

-- ══════════════════════════════════════
--           UI HELPERS
-- ══════════════════════════════════════
local function SetStatus(text, color, icon)
    StatusLabel.Text      = text
    StatusLabel.TextColor3 = color
    StatusDot.BackgroundColor3 = color
    NotifIcon.Text        = icon or "ℹ️"
    NotifText.Text        = text
    NotifText.TextColor3  = color
    -- Pulse dot
    Tween(StatusDot, {Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0, 6, 0, 17)}, 0.15)
    task.delay(0.15, function()
        Tween(StatusDot, {Size = UDim2.new(0, 7, 0, 7), Position = UDim2.new(0, 8, 0, 20)}, 0.15)
    end)
end

local function AnimateLoading(show)
    if show then
        LoadingBar.Size = UDim2.new(0, 0, 1, 0)
        Tween(LoadingBar, {Size = UDim2.new(0.7, 0, 1, 0)}, 1.5, "Sine", "Out")
    else
        Tween(LoadingBar, {Size = UDim2.new(1, 0, 1, 0)}, 0.3)
        task.delay(0.3, function()
            Tween(LoadingBar, {Size = UDim2.new(0, 0, 1, 0)}, 0.2)
        end)
    end
end

local function ShowSuccess()
    SetStatus("Authenticated ✓", C.Success, "✅")
    ValidateBtnText.Text = "✅  KEY ACCEPTED  ✅"
    Tween(ValidateBtn, {BackgroundColor3 = Color3.fromRGB(0, 100, 60)}, 0.4)
    Tween(Card,        {BackgroundColor3 = Color3.fromRGB(5, 25, 15)}, 0.5)
    Tween(GlowBar,     {BackgroundColor3 = C.Success}, 0.5)
    AnimateLoading(false)
end

local function ShowError(msg)
    SetStatus(msg or "Invalid Key", C.Error, "❌")
    AnimateLoading(false)
    task.spawn(function()
        local orig = Card.Position
        for i = 1, 6 do
            local dir = (i % 2 == 0) and 6 or -6
            Tween(Card, {Position = UDim2.new(orig.X.Scale, orig.X.Offset + dir, orig.Y.Scale, orig.Y.Offset)}, 0.05)
            task.wait(0.05)
        end
        Tween(Card, {Position = orig}, 0.1)
    end)
end

-- ══════════════════════════════════════
--           VALIDATE BUTTON
-- ══════════════════════════════════════
local isValidating = false

ValidateBtn.MouseButton1Click:Connect(function()
    if isValidating then return end
    local key = KeyInput.Text
    if not key or key == "" or key == KeyInput.PlaceholderText then
        ShowError("Please enter a key!")
        return
    end

    isValidating         = true
    ValidateBtnText.Text = "⏳  Validating..."
    SetStatus("Validating...", C.Warning, "⏳")
    AnimateLoading(true)
    Tween(ValidateBtn, {BackgroundColor3 = C.TextMuted}, 0.2)

    task.spawn(function()
        task.wait(0.5)
        local success, message = ValidateKey(key)

        if success then
            ShowSuccess()
            SaveKey(key)
            task.wait(2)
            local halfW = CARD_W / 2
            Tween(Card, {
                Position = UDim2.new(0.5, -halfW, -0.7, 0),
                BackgroundTransparency = 1,
            }, 0.8, "Back", "In")
            Tween(BlurOverlay, {BackgroundTransparency = 1}, 0.6)
            task.wait(1)
            ScreenGui:Destroy()

            -- ════════════════════════════════
            --   ✅ YOUR SCRIPT STARTS HERE
            -- ════════════════════════════════
            print("Key validated! Script running...")
            -- loadstring(game:HttpGet("YOUR_SCRIPT_URL"))()

        else
            ShowError(message or "Invalid Key")
            isValidating = false
            task.delay(1.5, function()
                if ValidateBtnText and ValidateBtnText.Parent then
                    ValidateBtnText.Text = "✦  VALIDATE KEY  ✦"
                    Tween(ValidateBtn, {BackgroundColor3 = C.Accent}, 0.3)
                    SetStatus("Awaiting Key", C.Warning, "⚠️")
                end
            end)
        end
    end)
end)

-- ══════════════════════════════════════
--           GET KEY BUTTON
-- ══════════════════════════════════════
GetKeyBtn.MouseButton1Click:Connect(function()
    local hwid = GetHWID()
    local link = CONFIG.KeyLink .. "?hwid=" .. HttpService:UrlEncode(hwid)
    pcall(function() setclipboard(link) end)
    SetStatus("Link copied! Open in browser.", C.Cyan, "🔗")
    NotifText.Text = link
end)

-- ══════════════════════════════════════
--           COPY LINK BUTTON
-- ══════════════════════════════════════
CopyBtn.MouseButton1Click:Connect(function()
    local hwid = GetHWID()
    local link = CONFIG.KeyLink .. "?hwid=" .. HttpService:UrlEncode(hwid)
    local ok = pcall(function() setclipboard(link) end)
    if ok then
        CopyBtnText.Text = "✅  Copied!"
        Tween(CopyBtn, {BackgroundColor3 = Color3.fromRGB(0, 60, 40)}, 0.2)
        task.delay(2, function()
            if CopyBtnText and CopyBtnText.Parent then
                CopyBtnText.Text = "📋  Copy Link"
                Tween(CopyBtn, {BackgroundColor3 = C.Card}, 0.2)
            end
        end)
    else
        SetStatus("Clipboard not supported here", C.Warning, "⚠️")
    end
end)

-- ══════════════════════════════════════
--           AUTO-LOAD SAVED KEY
-- ══════════════════════════════════════
task.spawn(function()
    task.wait(0.5)
    local savedKey = LoadKey()
    if savedKey and savedKey ~= "" then
        KeyInput.Text = savedKey
        SetStatus("Saved key loaded! Press Validate.", C.Cyan, "💾")
    end
end)

-- ══════════════════════════════════════
--           INTRO ANIMATION
-- ══════════════════════════════════════
local halfW = CARD_W / 2
Card.Position               = UDim2.new(0.5, -halfW, 1.3, 0)
Card.BackgroundTransparency = 1
BlurOverlay.BackgroundTransparency = 1

task.spawn(function()
    Tween(BlurOverlay, {BackgroundTransparency = 0.3}, 0.6)
    task.wait(0.2)
    Tween(Card, {
        Position               = UDim2.new(0.5, -halfW, 0.5, -(CARD_H / 2)),
        BackgroundTransparency = 0,
    }, 0.7, "Back", "Out")
    task.wait(0.7)
    SetStatus("Ready — Enter your key below.", C.Warning, "ℹ️")
end)

-- ══════════════════════════════════════
--           AMBIENT GLOW PULSE
-- ══════════════════════════════════════
task.spawn(function()
    local stroke = Card:FindFirstChildOfClass("UIStroke")
    while Card.Parent do
        if stroke then
            Tween(stroke, {Color = C.BorderGlow, Thickness = 2},   2, "Sine", "InOut") task.wait(2)
            Tween(stroke, {Color = C.Border,     Thickness = 1.5}, 2, "Sine", "InOut") task.wait(2)
        else
            task.wait(1)
        end
    end
end)

--[[
╔══════════════════════════════════════════╗
║   AZURE KEY SYSTEM — SETUP GUIDE         ║
╠══════════════════════════════════════════╣
║  1. Your Panda Service ID:               ║
║     externalliltyserviceidentifier       ║
║                                          ║
║  2. Get Key Link (share this):           ║
║     https://new.pandadevelopment.net/    ║
║     getkey/externalliltyserviceidentifier║
║                                          ║
║  3. Validation via Panda v2_validation   ║
║                                          ║
║  4. Replace print() at the bottom with   ║
║     your actual script loadstring.       ║
╚══════════════════════════════════════════╝
]]
