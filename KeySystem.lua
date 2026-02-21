--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║           ✦ AZURE KEY SYSTEM ✦                               ║
    ║           Powered by Panda Development                       ║
    ║           Beautiful Animated Blue UI                         ║
    ╚══════════════════════════════════════════════════════════════╝
    
    HOW TO USE:
    1. Paste this at the TOP of your script
    2. Replace "YOUR_SCRIPT_HERE" at the bottom with your actual script
    3. The key link is: https://new.pandadevelopment.net/getkey/externalliltyserviceidentifier?hwid=HWID
]]

-- ══════════════════════════════════════
--           CONFIGURATION
-- ══════════════════════════════════════
local CONFIG = {
    Title        = "Azure Hub",
    Subtitle     = "Key System",
    Version      = "v2.0",
    Discord      = "discord.gg/yourdiscord",
    ServiceID    = "externalliltyserviceidentifier",  -- Your Panda service identifier
    APIToken     = "3f739883-8408-403e-bcfe-fbe8c8241b8d",
    KeyLink      = "https://new.pandadevelopment.net/getkey/externalliltyserviceidentifier",
    SaveFileName = "AzureHub_Key.txt",
    -- Validation endpoint
    ValidateURL  = "https://new.pandadevelopment.net/v2_validation",
}

-- ══════════════════════════════════════
--           SERVICES
-- ══════════════════════════════════════
local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local HttpService   = game:GetService("HttpService")
local RunService    = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer   = Players.LocalPlayer
local PlayerGui     = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════
--           HWID & KEY UTILS
-- ══════════════════════════════════════
local function GetHWID()
    -- Use UserID as hardware fingerprint for Roblox
    local uid = tostring(LocalPlayer.UserId)
    -- Try to get machine ID if running in executor
    local ok, machineID = pcall(function()
        return tostring(game:GetService("RbxAnalyticsService"):GetClientId())
    end)
    if ok and machineID and machineID ~= "" then
        return machineID
    end
    return uid
end

local function SaveKey(key)
    local ok = pcall(function() writefile(CONFIG.SaveFileName, key) end)
    return ok
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

    local parsed = pcall(function()
        local data = HttpService:JSONDecode(response)
        return data
    end)

    -- Panda returns V2_Authentication: "success" on valid key
    if response and (response:lower():find("success") or response:lower():find('"true"') or response:lower():find('"valid"')) then
        return true, "Authenticated"
    elseif response and response:lower():find("expired") then
        return false, "Key Expired"
    elseif response and response:lower():find("invalid") then
        return false, "Invalid Key"
    else
        -- Try JSON parse for V2_Authentication field
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

local function TweenQuick(obj, props, t)
    return Tween(obj, props, t or 0.25)
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
    Gradient1   = Color3.fromRGB(0,   60,  200),
    Gradient2   = Color3.fromRGB(0,   150, 255),
}

-- ══════════════════════════════════════
--           GUI BUILDER
-- ══════════════════════════════════════
local function New(class, props, children)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then
            obj[k] = v
        end
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
    local grad = New("UIGradient", {
        Rotation = rotation or 90,
        Color = ColorSequence.new(colors),
        Parent = parent
    })
    return grad
end

local function MakeCorner(parent, radius)
    return New("UICorner", { CornerRadius = UDim.new(0, radius or 8), Parent = parent })
end

local function MakeStroke(parent, color, thickness)
    return New("UIStroke", {
        Color = color or C.Border,
        Thickness = thickness or 1.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent
    })
end

-- ══════════════════════════════════════
--           MAIN GUI
-- ══════════════════════════════════════
-- Remove old instances
for _, v in ipairs(PlayerGui:GetChildren()) do
    if v.Name == "AzureKeySystem" then v:Destroy() end
end

local ScreenGui = New("ScreenGui", {
    Name             = "AzureKeySystem",
    ZIndexBehavior   = Enum.ZIndexBehavior.Sibling,
    ResetOnSpawn     = false,
    IgnoreGuiInset   = true,
    Parent           = PlayerGui,
})

-- ── OVERLAY BLUR ──
local BlurOverlay = New("Frame", {
    Size            = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(0, 5, 15),
    BackgroundTransparency = 0.3,
    ZIndex          = 1,
    Parent          = ScreenGui,
})

-- Animated background particles
local ParticleFrame = New("Frame", {
    Size            = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    ZIndex          = 2,
    Parent          = ScreenGui,
})

-- Create floating orb particles
local function CreateParticle(index)
    local size = math.random(3, 10)
    local x = math.random(5, 95) / 100
    local y = math.random(5, 95) / 100
    local alpha = math.random(70, 90) / 100

    local orb = New("Frame", {
        Size            = UDim2.new(0, size, 0, size),
        Position        = UDim2.new(x, 0, y, 0),
        BackgroundColor3 = (index % 3 == 0) and C.Cyan or C.AccentLight,
        BackgroundTransparency = alpha,
        ZIndex          = 2,
        Parent          = ParticleFrame,
    })
    MakeCorner(orb, size / 2)

    -- Animate orb floating
    local duration = math.random(3, 8)
    local offsetY  = math.random(-80, 80)
    local offsetX  = math.random(-60, 60)

    local function animateOrb()
        local baseX = x
        local baseY = y
        while orb.Parent do
            Tween(orb, {
                Position = UDim2.new(baseX + offsetX/1000, 0, baseY + offsetY/1000, 0),
                BackgroundTransparency = math.random(60, 92) / 100,
            }, duration, "Sine", "InOut")
            task.wait(duration)
            Tween(orb, {
                Position = UDim2.new(baseX, 0, baseY, 0),
                BackgroundTransparency = alpha,
            }, duration, "Sine", "InOut")
            task.wait(duration)
        end
    end
    task.spawn(animateOrb)
    return orb
end

for i = 1, 30 do
    CreateParticle(i)
end

-- ── MAIN CARD ──
local Card = New("Frame", {
    Size                    = UDim2.new(0, 480, 0, 520),
    Position                = UDim2.new(0.5, -240, 0.5, -260),
    BackgroundColor3        = C.Panel,
    BackgroundTransparency  = 0,
    ZIndex                  = 10,
    Parent                  = ScreenGui,
})
MakeCorner(Card, 14)
MakeStroke(Card, C.Border, 1.5)

-- Card gradient overlay
local CardBG = New("Frame", {
    Size                    = UDim2.new(1, 0, 1, 0),
    BackgroundColor3        = C.BG,
    BackgroundTransparency  = 0,
    ZIndex                  = 10,
    Parent                  = Card,
})
MakeCorner(CardBG, 14)
MakeGradient(CardBG, 135, {
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(4, 10, 28)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(6, 16, 42)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(3, 8,  20)),
})

-- ── ANIMATED TOP GLOW BAR ──
local GlowBar = New("Frame", {
    Size                    = UDim2.new(1, 0, 0, 3),
    Position                = UDim2.new(0, 0, 0, 0),
    BackgroundColor3        = C.Accent,
    ZIndex                  = 12,
    Parent                  = Card,
})
MakeCorner(GlowBar, 14)
MakeGradient(GlowBar, 0, {
    ColorSequenceKeypoint.new(0,   C.Accent),
    ColorSequenceKeypoint.new(0.5, C.Cyan),
    ColorSequenceKeypoint.new(1,   C.Accent),
})

-- Animate glow bar sweep
task.spawn(function()
    while GlowBar.Parent do
        Tween(GlowBar, {BackgroundColor3 = C.Cyan}, 1.5, "Sine", "InOut")
        task.wait(1.5)
        Tween(GlowBar, {BackgroundColor3 = C.Accent}, 1.5, "Sine", "InOut")
        task.wait(1.5)
    end
end)

-- ── HEADER SECTION ──
local Header = New("Frame", {
    Size                    = UDim2.new(1, 0, 0, 120),
    Position                = UDim2.new(0, 0, 0, 0),
    BackgroundTransparency  = 1,
    ZIndex                  = 11,
    Parent                  = Card,
})

-- Animated key icon
local KeyIcon = New("TextLabel", {
    Size                    = UDim2.new(0, 60, 0, 60),
    Position                = UDim2.new(0.5, -30, 0, 18),
    BackgroundTransparency  = 1,
    Text                    = "🔑",
    TextSize                = 36,
    Font                    = Enum.Font.GothamBold,
    ZIndex                  = 12,
    Parent                  = Header,
})

-- Pulsing ring behind key icon
local Ring = New("Frame", {
    Size                    = UDim2.new(0, 68, 0, 68),
    Position                = UDim2.new(0.5, -34, 0, 14),
    BackgroundColor3        = C.Accent,
    BackgroundTransparency  = 0.7,
    ZIndex                  = 11,
    Parent                  = Header,
})
MakeCorner(Ring, 34)

-- Pulse animation on ring
task.spawn(function()
    while Ring.Parent do
        Tween(Ring, {
            Size = UDim2.new(0, 80, 0, 80),
            Position = UDim2.new(0.5, -40, 0, 8),
            BackgroundTransparency = 0.9,
        }, 1.2, "Sine", "Out")
        task.wait(1.2)
        Tween(Ring, {
            Size = UDim2.new(0, 68, 0, 68),
            Position = UDim2.new(0.5, -34, 0, 14),
            BackgroundTransparency = 0.7,
        }, 1.2, "Sine", "Out")
        task.wait(1.2)
    end
end)

-- Rotate key icon slowly
task.spawn(function()
    local angle = 0
    while KeyIcon.Parent do
        angle = (angle + 1) % 360
        -- Roblox doesn't support direct rotation on TextLabel in ScreenGui without Frame wrapper
        -- So we'll animate the scale instead using TextSize
        local pulse = 36 + math.sin(math.rad(angle * 2)) * 3
        KeyIcon.TextSize = pulse
        task.wait(0.05)
    end
end)

-- Title
local TitleLabel = New("TextLabel", {
    Size                    = UDim2.new(1, 0, 0, 28),
    Position                = UDim2.new(0, 0, 0, 84),
    BackgroundTransparency  = 1,
    Text                    = CONFIG.Title,
    TextColor3              = C.Text,
    TextSize                = 22,
    Font                    = Enum.Font.GothamBold,
    ZIndex                  = 12,
    Parent                  = Header,
})

-- Subtitle
local SubLabel = New("TextLabel", {
    Size                    = UDim2.new(1, 0, 0, 16),
    Position                = UDim2.new(0, 0, 0, 104),
    BackgroundTransparency  = 1,
    Text                    = CONFIG.Subtitle .. " · " .. CONFIG.Version,
    TextColor3              = C.TextMuted,
    TextSize                = 12,
    Font                    = Enum.Font.Gotham,
    ZIndex                  = 12,
    Parent                  = Header,
})

-- ── DIVIDER ──
local Divider = New("Frame", {
    Size                    = UDim2.new(1, -60, 0, 1),
    Position                = UDim2.new(0, 30, 0, 128),
    BackgroundColor3        = C.Border,
    ZIndex                  = 11,
    Parent                  = Card,
})
MakeGradient(Divider, 0, {
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.3, C.Border),
    ColorSequenceKeypoint.new(0.7, C.BorderGlow),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(0, 0, 0)),
})

-- ── INFO BOXES (HWID + Status) ──
local InfoFrame = New("Frame", {
    Size                    = UDim2.new(1, -40, 0, 50),
    Position                = UDim2.new(0, 20, 0, 140),
    BackgroundTransparency  = 1,
    ZIndex                  = 11,
    Parent                  = Card,
})

-- HWID Box
local HWIDBox = New("Frame", {
    Size                    = UDim2.new(0.52, -5, 1, 0),
    Position                = UDim2.new(0, 0, 0, 0),
    BackgroundColor3        = C.InputBG,
    ZIndex                  = 11,
    Parent                  = InfoFrame,
})
MakeCorner(HWIDBox, 8)
MakeStroke(HWIDBox, C.Border, 1)

New("TextLabel", {
    Size                    = UDim2.new(1, -10, 0, 14),
    Position                = UDim2.new(0, 8, 0, 5),
    BackgroundTransparency  = 1,
    Text                    = "HARDWARE ID",
    TextColor3              = C.TextMuted,
    TextSize                = 9,
    Font                    = Enum.Font.GothamBold,
    TextXAlignment          = Enum.TextXAlignment.Left,
    ZIndex                  = 12,
    Parent                  = HWIDBox,
})

local HWIDValue = New("TextLabel", {
    Size                    = UDim2.new(1, -10, 0, 18),
    Position                = UDim2.new(0, 8, 0, 22),
    BackgroundTransparency  = 1,
    Text                    = string.sub(tostring(GetHWID()), 1, 22) .. "...",
    TextColor3              = C.AccentLight,
    TextSize                = 10,
    Font                    = Enum.Font.Code,
    TextXAlignment          = Enum.TextXAlignment.Left,
    TextTruncate            = Enum.TextTruncate.AtEnd,
    ZIndex                  = 12,
    Parent                  = HWIDBox,
})

-- Status Box
local StatusBox = New("Frame", {
    Size                    = UDim2.new(0.48, -5, 1, 0),
    Position                = UDim2.new(0.52, 5, 0, 0),
    BackgroundColor3        = C.InputBG,
    ZIndex                  = 11,
    Parent                  = InfoFrame,
})
MakeCorner(StatusBox, 8)
MakeStroke(StatusBox, C.Border, 1)

New("TextLabel", {
    Size                    = UDim2.new(1, -10, 0, 14),
    Position                = UDim2.new(0, 8, 0, 5),
    BackgroundTransparency  = 1,
    Text                    = "STATUS",
    TextColor3              = C.TextMuted,
    TextSize                = 9,
    Font                    = Enum.Font.GothamBold,
    TextXAlignment          = Enum.TextXAlignment.Left,
    ZIndex                  = 12,
    Parent                  = StatusBox,
})

local StatusDot = New("Frame", {
    Size                    = UDim2.new(0, 7, 0, 7),
    Position                = UDim2.new(0, 8, 0, 26),
    BackgroundColor3        = C.Warning,
    ZIndex                  = 12,
    Parent                  = StatusBox,
})
MakeCorner(StatusDot, 4)

local StatusLabel = New("TextLabel", {
    Size                    = UDim2.new(1, -24, 0, 16),
    Position                = UDim2.new(0, 20, 0, 22),
    BackgroundTransparency  = 1,
    Text                    = "Awaiting Key",
    TextColor3              = C.Warning,
    TextSize                = 11,
    Font                    = Enum.Font.GothamBold,
    TextXAlignment          = Enum.TextXAlignment.Left,
    ZIndex                  = 12,
    Parent                  = StatusBox,
})

-- ── KEY INPUT ──
local InputFrame = New("Frame", {
    Size                    = UDim2.new(1, -40, 0, 50),
    Position                = UDim2.new(0, 20, 0, 205),
    BackgroundColor3        = C.InputBG,
    ZIndex                  = 11,
    Parent                  = Card,
})
MakeCorner(InputFrame, 10)
local InputStroke = MakeStroke(InputFrame, C.Border, 1.5)

New("TextLabel", {
    Size                    = UDim2.new(0, 30, 1, 0),
    Position                = UDim2.new(0, 12, 0, 0),
    BackgroundTransparency  = 1,
    Text                    = "🔐",
    TextSize                = 16,
    Font                    = Enum.Font.Gotham,
    ZIndex                  = 12,
    Parent                  = InputFrame,
})

local KeyInput = New("TextBox", {
    Size                    = UDim2.new(1, -50, 1, -10),
    Position                = UDim2.new(0, 44, 0, 5),
    BackgroundTransparency  = 1,
    PlaceholderText         = "Enter your key here...",
    PlaceholderColor3       = C.TextMuted,
    Text                    = "",
    TextColor3              = C.Text,
    TextSize                = 13,
    Font                    = Enum.Font.Code,
    TextXAlignment          = Enum.TextXAlignment.Left,
    ClearTextOnFocus        = false,
    ZIndex                  = 12,
    Parent                  = InputFrame,
})

-- Input focus glow effect
KeyInput.Focused:Connect(function()
    Tween(InputStroke, {Color = C.Cyan, Thickness = 2}, 0.3)
    Tween(InputFrame, {BackgroundColor3 = Color3.fromRGB(8, 18, 45)}, 0.3)
end)
KeyInput.FocusLost:Connect(function()
    Tween(InputStroke, {Color = C.Border, Thickness = 1.5}, 0.3)
    Tween(InputFrame, {BackgroundColor3 = C.InputBG}, 0.3)
end)

-- ── VALIDATE BUTTON ──
local ValidateBtn = New("TextButton", {
    Size                    = UDim2.new(1, -40, 0, 44),
    Position                = UDim2.new(0, 20, 0, 267),
    BackgroundColor3        = C.Accent,
    Text                    = "",
    ZIndex                  = 11,
    Parent                  = Card,
})
MakeCorner(ValidateBtn, 10)
MakeGradient(ValidateBtn, 90, {
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(15, 70, 220)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(5,  40, 150)),
})

local ValidateBtnStroke = MakeStroke(ValidateBtn, C.BorderGlow, 1)

local ValidateBtnText = New("TextLabel", {
    Size                    = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency  = 1,
    Text                    = "✦  VALIDATE KEY  ✦",
    TextColor3              = C.White,
    TextSize                = 14,
    Font                    = Enum.Font.GothamBold,
    ZIndex                  = 12,
    Parent                  = ValidateBtn,
})

-- Shimmer effect on button
local Shimmer = New("Frame", {
    Size                    = UDim2.new(0, 60, 1, 0),
    Position                = UDim2.new(-0.2, 0, 0, 0),
    BackgroundColor3        = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency  = 0.85,
    ZIndex                  = 12,
    Parent                  = ValidateBtn,
    ClipsDescendants        = false,
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

-- Button hover effect
ValidateBtn.MouseEnter:Connect(function()
    Tween(ValidateBtn, {BackgroundColor3 = C.BorderGlow}, 0.2)
    Tween(ValidateBtnStroke, {Color = C.Cyan}, 0.2)
    Tween(ValidateBtnText, {TextSize = 15}, 0.2)
end)
ValidateBtn.MouseLeave:Connect(function()
    Tween(ValidateBtn, {BackgroundColor3 = C.Accent}, 0.2)
    Tween(ValidateBtnStroke, {Color = C.BorderGlow}, 0.2)
    Tween(ValidateBtnText, {TextSize = 14}, 0.2)
end)

-- ── BOTTOM BUTTONS ROW ──
local BottomRow = New("Frame", {
    Size                    = UDim2.new(1, -40, 0, 38),
    Position                = UDim2.new(0, 20, 0, 323),
    BackgroundTransparency  = 1,
    ZIndex                  = 11,
    Parent                  = Card,
})

-- Get Key Button
local GetKeyBtn = New("TextButton", {
    Size                    = UDim2.new(0.485, 0, 1, 0),
    Position                = UDim2.new(0, 0, 0, 0),
    BackgroundColor3        = C.Card,
    Text                    = "",
    ZIndex                  = 11,
    Parent                  = BottomRow,
})
MakeCorner(GetKeyBtn, 8)
MakeStroke(GetKeyBtn, C.Border, 1)

New("TextLabel", {
    Size                    = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency  = 1,
    Text                    = "🌐  Get Key",
    TextColor3              = C.AccentLight,
    TextSize                = 12,
    Font                    = Enum.Font.GothamBold,
    ZIndex                  = 12,
    Parent                  = GetKeyBtn,
})

GetKeyBtn.MouseEnter:Connect(function()
    Tween(GetKeyBtn, {BackgroundColor3 = C.Mid or Color3.fromRGB(12, 28, 65)}, 0.2)
end)
GetKeyBtn.MouseLeave:Connect(function()
    Tween(GetKeyBtn, {BackgroundColor3 = C.Card}, 0.2)
end)

-- Copy Key Link Button
local CopyBtn = New("TextButton", {
    Size                    = UDim2.new(0.485, 0, 1, 0),
    Position                = UDim2.new(0.515, 0, 0, 0),
    BackgroundColor3        = C.Card,
    Text                    = "",
    ZIndex                  = 11,
    Parent                  = BottomRow,
})
MakeCorner(CopyBtn, 8)
MakeStroke(CopyBtn, C.Border, 1)

local CopyBtnText = New("TextLabel", {
    Size                    = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency  = 1,
    Text                    = "📋  Copy Link",
    TextColor3              = C.AccentLight,
    TextSize                = 12,
    Font                    = Enum.Font.GothamBold,
    ZIndex                  = 12,
    Parent                  = CopyBtn,
})

CopyBtn.MouseEnter:Connect(function()
    Tween(CopyBtn, {BackgroundColor3 = Color3.fromRGB(12, 28, 65)}, 0.2)
end)
CopyBtn.MouseLeave:Connect(function()
    Tween(CopyBtn, {BackgroundColor3 = C.Card}, 0.2)
end)

-- ── NOTIFICATION / MESSAGE BAR ──
local NotifBar = New("Frame", {
    Size                    = UDim2.new(1, -40, 0, 38),
    Position                = UDim2.new(0, 20, 0, 373),
    BackgroundColor3        = C.Card,
    BackgroundTransparency  = 0.2,
    ZIndex                  = 11,
    Parent                  = Card,
})
MakeCorner(NotifBar, 8)
MakeStroke(NotifBar, C.Border, 1)

local NotifIcon = New("TextLabel", {
    Size                    = UDim2.new(0, 30, 1, 0),
    Position                = UDim2.new(0, 6, 0, 0),
    BackgroundTransparency  = 1,
    Text                    = "ℹ️",
    TextSize                = 14,
    Font                    = Enum.Font.Gotham,
    ZIndex                  = 12,
    Parent                  = NotifBar,
})

local NotifText = New("TextLabel", {
    Size                    = UDim2.new(1, -44, 1, 0),
    Position                = UDim2.new(0, 36, 0, 0),
    BackgroundTransparency  = 1,
    Text                    = "Enter your key and press Validate.",
    TextColor3              = C.TextDim,
    TextSize                = 11,
    Font                    = Enum.Font.Gotham,
    TextXAlignment          = Enum.TextXAlignment.Left,
    TextTruncate            = Enum.TextTruncate.AtEnd,
    ZIndex                  = 12,
    Parent                  = NotifBar,
})

-- ── LOADING BAR ──
local LoadingBG = New("Frame", {
    Size                    = UDim2.new(1, -40, 0, 4),
    Position                = UDim2.new(0, 20, 0, 422),
    BackgroundColor3        = Color3.fromRGB(10, 20, 45),
    ZIndex                  = 11,
    Parent                  = Card,
})
MakeCorner(LoadingBG, 2)

local LoadingBar = New("Frame", {
    Size                    = UDim2.new(0, 0, 1, 0),
    BackgroundColor3        = C.Accent,
    ZIndex                  = 12,
    Parent                  = LoadingBG,
})
MakeCorner(LoadingBar, 2)
MakeGradient(LoadingBar, 0, {
    ColorSequenceKeypoint.new(0,   C.Accent),
    ColorSequenceKeypoint.new(1,   C.Cyan),
})

-- ── FOOTER ──
local Footer = New("TextLabel", {
    Size                    = UDim2.new(1, 0, 0, 30),
    Position                = UDim2.new(0, 0, 0, 436),
    BackgroundTransparency  = 1,
    Text                    = "Powered by  🐼  Panda Development  ·  " .. CONFIG.Discord,
    TextColor3              = C.TextMuted,
    TextSize                = 10,
    Font                    = Enum.Font.Gotham,
    ZIndex                  = 11,
    Parent                  = Card,
})

-- ══════════════════════════════════════
--           DRAG SYSTEM
-- ══════════════════════════════════════
do
    local dragging, dragStart, startPos = false, nil, nil
    local DragHandle = New("Frame", {
        Size                = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        ZIndex              = 20,
        Parent              = Card,
    })

    DragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Card.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Card.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- ══════════════════════════════════════
--           UI HELPERS
-- ══════════════════════════════════════
local function SetStatus(text, color, icon)
    StatusLabel.Text = text
    StatusLabel.TextColor3 = color
    StatusDot.BackgroundColor3 = color
    NotifIcon.Text = icon or "ℹ️"
    NotifText.Text = text
    NotifText.TextColor3 = color

    -- Pulse status dot
    Tween(StatusDot, {Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0, 7, 0, 24)}, 0.15)
    task.delay(0.15, function()
        Tween(StatusDot, {Size = UDim2.new(0, 7, 0, 7), Position = UDim2.new(0, 8, 0, 26)}, 0.15)
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
    Tween(ValidateBtn, {BackgroundColor3 = Color3.fromRGB(0, 100, 60)}, 0.4)
    MakeGradient(ValidateBtn, 90, {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 160, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 50)),
    })
    ValidateBtnText.Text = "✅  KEY ACCEPTED  ✅"
    Tween(Card, {BackgroundColor3 = Color3.fromRGB(5, 25, 15)}, 0.5)
    AnimateLoading(false)
    Tween(GlowBar, {BackgroundColor3 = C.Success}, 0.5)

    -- Flash green border
    Tween(MakeStroke(Card, C.Success, 2), {Color = C.Success}, 0.3)
end

local function ShowError(msg)
    SetStatus(msg or "Invalid Key", C.Error, "❌")
    AnimateLoading(false)
    -- Shake animation
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

local isValidating = false

-- ══════════════════════════════════════
--           VALIDATE BUTTON LOGIC
-- ══════════════════════════════════════
ValidateBtn.MouseButton1Click:Connect(function()
    if isValidating then return end
    local key = KeyInput.Text
    if not key or key == "" or key == KeyInput.PlaceholderText then
        ShowError("Please enter a key!")
        return
    end

    isValidating = true
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
            -- Dismiss and run script
            Tween(Card, {
                Position = UDim2.new(0.5, -240, -0.7, 0),
                BackgroundTransparency = 1
            }, 0.8, "Back", "In")
            Tween(BlurOverlay, {BackgroundTransparency = 1}, 0.6)
            task.wait(1)
            ScreenGui:Destroy()

            -- ════════════════════════════════
            --     ✅ YOUR SCRIPT STARTS HERE
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
    -- Copy to clipboard if possible
    pcall(function() setclipboard(link) end)
    SetStatus("Link copied! Open in browser.", C.Cyan, "🔗")
    NotifText.Text = link

    -- Try to open in browser
    pcall(function()
        -- Some executors support this
    end)
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
        SetStatus("Clipboard not supported in this executor", C.Warning, "⚠️")
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
Card.Position = UDim2.new(0.5, -240, 1.3, 0)
Card.BackgroundTransparency = 1
BlurOverlay.BackgroundTransparency = 1

task.spawn(function()
    Tween(BlurOverlay, {BackgroundTransparency = 0.3}, 0.6)
    task.wait(0.2)
    Tween(Card, {
        Position = UDim2.new(0.5, -240, 0.5, -260),
        BackgroundTransparency = 0
    }, 0.7, "Back", "Out")
    task.wait(0.7)
    SetStatus("Ready — Enter your key below.", C.Warning, "ℹ️")
end)

-- ══════════════════════════════════════
--           AMBIENT CARD GLOW PULSE
-- ══════════════════════════════════════
task.spawn(function()
    local stroke = Card:FindFirstChildOfClass("UIStroke")
    while Card.Parent do
        if stroke then
            Tween(stroke, {Color = C.BorderGlow, Thickness = 2}, 2, "Sine", "InOut")
            task.wait(2)
            Tween(stroke, {Color = C.Border, Thickness = 1.5}, 2, "Sine", "InOut")
            task.wait(2)
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
║  2. Get Key Link (share this with users):║
║     https://new.pandadevelopment.net/    ║
║     getkey/externalliltyserviceidentifier║
║     ?hwid=HWID                          ║
║                                          ║
║  3. Validation is done automatically     ║
║     via Panda's v2_validation API.       ║
║                                          ║
║  4. Replace the script section at the   ║
║     bottom of ValidateBtn Click with    ║
║     your actual script loadstring.      ║
╚══════════════════════════════════════════╝
]]
