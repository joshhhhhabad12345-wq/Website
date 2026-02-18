--[[
  ███████╗██╗  ██╗████████╗███████╗██████╗ ███╗   ██╗ █████╗ ██╗      
  ██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██║      
  █████╗   ╚███╔╝    ██║   █████╗  ██████╔╝██╔██╗ ██║███████║██║      
  ██╔══╝   ██╔██╗    ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║      
  ███████╗██╔╝ ██╗   ██║   ███████╗██║  ██║██║ ╚████║██║  ██║███████╗ 
  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
  External Admin  |  BETA  |  v2.0
  Fixed: SCREENGUI nil bug, added 12 commands, ESP options, CmdBar,
         Settings (prefix changer, search), upgraded modern UI.
--]]

-- ============================================================
-- GUARD
-- ============================================================
if _G.EA_LOADED and not _G.EA_DEBUG then return end
_G.EA_LOADED = true
if not game:IsLoaded() then game.Loaded:Wait() end

-- ============================================================
-- COMPAT SHIMS
-- ============================================================
local function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

cloneref   = missing("function", cloneref,   function(...) return ... end)
httprequest= missing("function", request or http_request or (syn and syn.request) or (fluxus and fluxus.request))
everyClipboard = missing("function", setclipboard or toclipboard or set_clipboard)

-- ============================================================
-- SERVICES
-- ============================================================
local Services = setmetatable({}, {
    __index = function(self, name)
        local ok, svc = pcall(function() return cloneref(game:GetService(name)) end)
        if ok then rawset(self, name, svc) return svc
        else error("Invalid Service: "..tostring(name)) end
    end
})

local Players          = Services.Players
local UserInputService = Services.UserInputService
local TweenService     = Services.TweenService
local RunService       = Services.RunService
local TextChatService  = Services.TextChatService
local ReplicatedStorage= Services.ReplicatedStorage
local CoreGui          = Services.CoreGui
local Lighting         = Services.Lighting

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = cloneref(LocalPlayer:FindFirstChildWhichIsA("PlayerGui"))
local Mouse       = cloneref(LocalPlayer:GetMouse())

-- ============================================================
-- THEME
-- ============================================================
local T = {
    BG         = Color3.fromRGB(8,   8,  14),
    Panel      = Color3.fromRGB(14,  14,  22),
    Card       = Color3.fromRGB(20,  20,  32),
    Bar        = Color3.fromRGB(18,  18,  30),
    Accent     = Color3.fromRGB(88,  101, 242),
    AccentHov  = Color3.fromRGB(120, 133, 255),
    AccentGlow = Color3.fromRGB(66,  76,  190),
    Danger     = Color3.fromRGB(235,  64,  52),
    DangerHov  = Color3.fromRGB(255,  90,  80),
    Success    = Color3.fromRGB(35,  195,  90),
    Warn       = Color3.fromRGB(250, 173,  20),
    Text       = Color3.fromRGB(235, 235, 255),
    SubText    = Color3.fromRGB(130, 130, 165),
    Muted      = Color3.fromRGB(70,   70,  95),
    Border     = Color3.fromRGB(35,  35,  55),
    Toggle_ON  = Color3.fromRGB(88,  101, 242),
    Toggle_OFF = Color3.fromRGB(45,  45,  65),
    BETA       = Color3.fromRGB(250, 173,  20),
    CmdBar     = Color3.fromRGB(24,  24,  40),
}

-- ============================================================
-- SCREENGUI  (MUST be declared BEFORE notify / any UI code)
-- ============================================================
local SCREENGUI = Instance.new("ScreenGui")
SCREENGUI.Name           = "ExternalAdmin_v2"
SCREENGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SCREENGUI.ResetOnSpawn   = false
SCREENGUI.IgnoreGuiInset = true
pcall(function() SCREENGUI.Parent = CoreGui end)
if not SCREENGUI.Parent then SCREENGUI.Parent = PlayerGui end

-- ============================================================
-- UTILITIES
-- ============================================================
local function tw(obj, props, t, style, dir)
    style = style or Enum.EasingStyle.Quart
    dir   = dir   or Enum.EasingDirection.Out
    TweenService:Create(obj, TweenInfo.new(t or 0.25, style, dir), props):Play()
end

local function corner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 6)
    c.Parent = obj
    return c
end

local function stroke(obj, col, thick)
    local s = Instance.new("UIStroke")
    s.Color     = col   or T.Border
    s.Thickness = thick or 1
    s.Parent    = obj
    return s
end

local function pad(obj, t, b, l, r)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, t or 0)
    p.PaddingBottom = UDim.new(0, b or 0)
    p.PaddingLeft   = UDim.new(0, l or 0)
    p.PaddingRight  = UDim.new(0, r or 0)
    p.Parent = obj
    return p
end

local function lbl(parent, text, size, color, bold, wrap)
    local l = Instance.new("TextLabel")
    l.Parent              = parent
    l.BackgroundTransparency = 1
    l.Size                = size or UDim2.new(1,0,0,20)
    l.Font                = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize            = 14
    l.TextColor3          = color or T.Text
    l.Text                = text or ""
    l.TextXAlignment      = Enum.TextXAlignment.Left
    l.TextWrapped         = wrap or false
    return l
end

-- Notification (SCREENGUI must be defined above before this is ever called)
local _notifyStack = {}
local function notify(title, msg, dur)
    dur = dur or 3.5
    -- shift existing notifications up
    for _, nf in ipairs(_notifyStack) do
        pcall(function()
            tw(nf, {Position = UDim2.new(1, -310, nf.Position.Y.Scale, nf.Position.Y.Offset - 72)}, 0.25)
        end)
    end

    local nf = Instance.new("Frame")
    nf.Name             = "Notif"
    nf.Size             = UDim2.new(0, 290, 0, 62)
    nf.Position         = UDim2.new(1, -310, 1, 70)
    nf.BackgroundColor3 = T.Card
    nf.BorderSizePixel  = 0
    nf.ZIndex           = 200
    nf.Parent           = SCREENGUI
    corner(nf, 10)
    stroke(nf, T.Accent, 1)

    local accentBar = Instance.new("Frame")
    accentBar.Size            = UDim2.new(0, 4, 1, -12)
    accentBar.Position        = UDim2.new(0, 0, 0, 6)
    accentBar.BackgroundColor3= T.Accent
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex          = 201
    accentBar.Parent          = nf
    corner(accentBar, 2)

    local t1 = lbl(nf, title, UDim2.new(1,-16,0,20), T.Text, true)
    t1.Position = UDim2.new(0, 12, 0, 7)
    t1.ZIndex   = 201
    local t2 = lbl(nf, msg, UDim2.new(1,-16,0,28), T.SubText, false, true)
    t2.Position = UDim2.new(0, 12, 0, 27)
    t2.TextSize = 12
    t2.ZIndex   = 201

    table.insert(_notifyStack, nf)
    tw(nf, {Position = UDim2.new(1, -310, 1, -72)}, 0.4, Enum.EasingStyle.Back)

    task.delay(dur, function()
        tw(nf, {Position = UDim2.new(1, -310, 1, 80)}, 0.3)
        task.wait(0.35)
        -- remove from stack
        for i, v in ipairs(_notifyStack) do
            if v == nf then table.remove(_notifyStack, i) break end
        end
        nf:Destroy()
    end)
end

-- Character helpers
local function getChar()  return LocalPlayer.Character end
local function getRoot()  local c=getChar() return c and c:FindFirstChild("HumanoidRootPart") end
local function getHuman() local c=getChar() return c and c:FindFirstChildWhichIsA("Humanoid") end

local function findPlayer(name)
    if not name or name == "" then return nil end
    name = name:lower()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(name, 1, true) then return p end
    end
    return nil
end

local function sendChat(msg)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        else
            local ch = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if ch then ch:SendAsync(msg) end
        end
    end)
end

-- ============================================================
-- SETTINGS STATE (prefix symbol)
-- ============================================================
local Settings = {
    Prefix = ":",    -- default prefix for CmdBar
}

-- ============================================================
-- MAIN WINDOW
-- ============================================================
local WIN = Instance.new("Frame")
WIN.Name             = "ExternalAdmin"
WIN.Size             = UDim2.new(0, 540, 0, 640)
WIN.Position         = UDim2.new(0.5, -270, 0.5, -320)
WIN.BackgroundColor3 = T.BG
WIN.BorderSizePixel  = 0
WIN.Active           = true
WIN.Parent           = SCREENGUI
corner(WIN, 14)
stroke(WIN, T.Border, 1)

-- Subtle glow backdrop
local glowBg = Instance.new("ImageLabel")
glowBg.Size              = UDim2.new(1, 100, 1, 100)
glowBg.Position          = UDim2.new(0, -50, 0, -50)
glowBg.BackgroundTransparency = 1
glowBg.Image             = "rbxassetid://5028857084"
glowBg.ImageColor3       = T.Accent
glowBg.ImageTransparency = 0.88
glowBg.ScaleType         = Enum.ScaleType.Slice
glowBg.SliceCenter       = Rect.new(24, 24, 276, 276)
glowBg.ZIndex            = 0
glowBg.Parent            = WIN

-- ============================================================
-- TITLE BAR
-- ============================================================
local TITLEBAR = Instance.new("Frame")
TITLEBAR.Name            = "TitleBar"
TITLEBAR.Size            = UDim2.new(1, 0, 0, 48)
TITLEBAR.BackgroundColor3= T.Bar
TITLEBAR.BorderSizePixel = 0
TITLEBAR.ZIndex          = 2
TITLEBAR.Parent          = WIN
corner(TITLEBAR, 14)

-- Fix lower rounded corners of title bar
local tbarFix = Instance.new("Frame")
tbarFix.Size            = UDim2.new(1, 0, 0, 14)
tbarFix.Position        = UDim2.new(0, 0, 1, -14)
tbarFix.BackgroundColor3= T.Bar
tbarFix.BorderSizePixel = 0
tbarFix.ZIndex          = 2
tbarFix.Parent          = TITLEBAR

-- Logo dot
local logoDot = Instance.new("Frame")
logoDot.Size            = UDim2.new(0, 8, 0, 8)
logoDot.Position        = UDim2.new(0, 16, 0.5, -4)
logoDot.BackgroundColor3= T.Accent
logoDot.BorderSizePixel = 0
logoDot.ZIndex          = 3
logoDot.Parent          = TITLEBAR
corner(logoDot, 4)

-- Title text
local TITLETEXT = Instance.new("TextLabel")
TITLETEXT.Size               = UDim2.new(0, 200, 1, 0)
TITLETEXT.Position           = UDim2.new(0, 30, 0, 0)
TITLETEXT.BackgroundTransparency = 1
TITLETEXT.Font               = Enum.Font.GothamBold
TITLETEXT.TextSize           = 15
TITLETEXT.TextColor3         = T.Text
TITLETEXT.Text               = "External Admin"
TITLETEXT.TextXAlignment     = Enum.TextXAlignment.Left
TITLETEXT.ZIndex             = 3
TITLETEXT.Parent             = TITLEBAR

-- BETA badge
local betaBadge = Instance.new("Frame")
betaBadge.Size            = UDim2.new(0, 44, 0, 18)
betaBadge.Position        = UDim2.new(0, 185, 0.5, -9)
betaBadge.BackgroundColor3= Color3.fromRGB(60, 45, 10)
betaBadge.BorderSizePixel = 0
betaBadge.ZIndex          = 4
betaBadge.Parent          = TITLEBAR
corner(betaBadge, 4)
stroke(betaBadge, T.BETA, 1)

local betaLbl = Instance.new("TextLabel")
betaLbl.Size               = UDim2.new(1, 0, 1, 0)
betaLbl.BackgroundTransparency = 1
betaLbl.Font               = Enum.Font.GothamBold
betaLbl.TextSize           = 10
betaLbl.TextColor3         = T.BETA
betaLbl.Text               = "BETA"
betaLbl.ZIndex             = 5
betaLbl.Parent             = betaBadge

-- ─── Title bar buttons ───────────────────────────────────────
local function makeTitleBtn(pos, bg, txt, txtColor)
    local b = Instance.new("TextButton")
    b.Size             = UDim2.new(0, 30, 0, 30)
    b.Position         = pos
    b.BackgroundColor3 = bg
    b.Font             = Enum.Font.GothamBold
    b.TextSize         = 14
    b.TextColor3       = txtColor or Color3.new(1,1,1)
    b.Text             = txt
    b.BorderSizePixel  = 0
    b.ZIndex           = 4
    b.Parent           = TITLEBAR
    corner(b, 8)
    return b
end

-- Delete (🗑) — permanently destroys the GUI
local DELETEBTN = makeTitleBtn(UDim2.new(1,-114,0.5,-15), T.Muted, "🗑", T.SubText)
-- Minimize (−)
local MINBTN    = makeTitleBtn(UDim2.new(1,-78, 0.5,-15), T.Muted, "−", T.SubText)
-- Close (✕)
local CLOSEBTN  = makeTitleBtn(UDim2.new(1,-42, 0.5,-15), T.Danger, "✕")

-- Hover effects for header buttons
local function hoverBtn(btn, hoverCol, baseCol)
    btn.MouseEnter:Connect(function() tw(btn, {BackgroundColor3=hoverCol}, 0.15) end)
    btn.MouseLeave:Connect(function() tw(btn, {BackgroundColor3=baseCol},  0.15) end)
end
hoverBtn(DELETEBTN, T.Danger, T.Muted)
hoverBtn(MINBTN,    T.Accent, T.Muted)
hoverBtn(CLOSEBTN,  T.DangerHov, T.Danger)

-- ============================================================
-- BODY
-- ============================================================
local BODY = Instance.new("Frame")
BODY.Name             = "Body"
BODY.Size             = UDim2.new(1, -16, 1, -58)
BODY.Position         = UDim2.new(0, 8, 0, 54)
BODY.BackgroundTransparency = 1
BODY.ClipsDescendants = true
BODY.Parent           = WIN

-- ============================================================
-- CMD BAR (bottom of window, above tabs)
-- ============================================================
local CMDBAR_FRAME = Instance.new("Frame")
CMDBAR_FRAME.Name            = "CmdBarFrame"
CMDBAR_FRAME.Size            = UDim2.new(1, 0, 0, 38)
CMDBAR_FRAME.Position        = UDim2.new(0, 0, 1, -38)
CMDBAR_FRAME.BackgroundColor3= T.CmdBar
CMDBAR_FRAME.BorderSizePixel = 0
CMDBAR_FRAME.ZIndex          = 10
CMDBAR_FRAME.Parent          = BODY
corner(CMDBAR_FRAME, 8)
stroke(CMDBAR_FRAME, T.Accent, 1)

local CMDBAR_ICON = Instance.new("TextLabel")
CMDBAR_ICON.Size               = UDim2.new(0, 28, 1, 0)
CMDBAR_ICON.BackgroundTransparency = 1
CMDBAR_ICON.Font               = Enum.Font.GothamBold
CMDBAR_ICON.TextSize           = 14
CMDBAR_ICON.TextColor3         = T.Accent
CMDBAR_ICON.Text               = ">"
CMDBAR_ICON.ZIndex             = 11
CMDBAR_ICON.Parent             = CMDBAR_FRAME

local CMDBOX = Instance.new("TextBox")
CMDBOX.Size              = UDim2.new(1, -36, 1, -8)
CMDBOX.Position          = UDim2.new(0, 28, 0, 4)
CMDBOX.BackgroundTransparency = 1
CMDBOX.Font              = Enum.Font.Gotham
CMDBOX.TextSize          = 13
CMDBOX.TextColor3        = T.Text
CMDBOX.PlaceholderColor3 = T.Muted
CMDBOX.PlaceholderText   = "Type a command e.g.  :fly  :goto PlayerName"
CMDBOX.Text              = ""
CMDBOX.ClearTextOnFocus  = false
CMDBOX.BorderSizePixel   = 0
CMDBOX.ZIndex            = 11
CMDBOX.Parent            = CMDBAR_FRAME

-- ============================================================
-- TAB BAR
-- ============================================================
local TABBAR = Instance.new("Frame")
TABBAR.Size            = UDim2.new(1, 0, 0, 38)
TABBAR.BackgroundColor3= T.Panel
TABBAR.BorderSizePixel = 0
TABBAR.Parent          = BODY
corner(TABBAR, 10)
stroke(TABBAR, T.Border, 1)
pad(TABBAR, 5, 5, 6, 6)

local TABLAYOUT = Instance.new("UIListLayout")
TABLAYOUT.FillDirection     = Enum.FillDirection.Horizontal
TABLAYOUT.Padding           = UDim.new(0, 3)
TABLAYOUT.VerticalAlignment = Enum.VerticalAlignment.Center
TABLAYOUT.Parent            = TABBAR

-- ============================================================
-- CONTENT AREA
-- ============================================================
local CONTENT = Instance.new("Frame")
CONTENT.Size            = UDim2.new(1, 0, 1, -84)
CONTENT.Position        = UDim2.new(0, 0, 0, 42)
CONTENT.BackgroundTransparency = 1
CONTENT.ClipsDescendants = true
CONTENT.Parent          = BODY

-- ============================================================
-- TAB SYSTEM
-- ============================================================
local tabs      = {}
local tabFrames = {}
local activeTab = nil

local tabDefs = {
    {name="Movement", icon="🏃"},
    {name="Player",   icon="👤"},
    {name="World",    icon="🌍"},
    {name="Chat",     icon="💬"},
    {name="ESP",      icon="👁"},
    {name="Toggles",  icon="🔘"},
    {name="Settings", icon="⚙"},
}

local function switchTab(name)
    if activeTab == name then return end
    activeTab = name
    for n, btn in pairs(tabs) do
        if n == name then
            tw(btn, {BackgroundColor3=T.Accent, TextColor3=Color3.new(1,1,1)}, 0.18)
        else
            tw(btn, {BackgroundColor3=Color3.fromRGB(0,0,0), TextColor3=T.SubText}, 0.18)
            btn.BackgroundTransparency = 1
        end
    end
    for n, frame in pairs(tabFrames) do
        frame.Visible = (n == name)
    end
end

for _, td in ipairs(tabDefs) do
    local btn = Instance.new("TextButton")
    btn.Size              = UDim2.new(0, 68, 0, 28)
    btn.BackgroundColor3  = Color3.fromRGB(0,0,0)
    btn.BackgroundTransparency = 1
    btn.Font              = Enum.Font.GothamSemibold
    btn.TextSize          = 11
    btn.TextColor3        = T.SubText
    btn.Text              = td.icon.." "..td.name
    btn.BorderSizePixel   = 0
    btn.Parent            = TABBAR
    corner(btn, 6)

    local frame = Instance.new("ScrollingFrame")
    frame.Size                = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel     = 0
    frame.ScrollBarThickness  = 3
    frame.ScrollBarImageColor3 = T.Accent
    frame.Visible             = false
    frame.Parent              = CONTENT

    local fl = Instance.new("UIListLayout")
    fl.Padding   = UDim.new(0, 6)
    fl.SortOrder = Enum.SortOrder.LayoutOrder
    fl.Parent    = frame

    local fp = Instance.new("UIPadding")
    fp.PaddingTop    = UDim.new(0, 6)
    fp.PaddingLeft   = UDim.new(0, 2)
    fp.PaddingRight  = UDim.new(0, 2)
    fp.PaddingBottom = UDim.new(0, 6)
    fp.Parent        = frame

    fl.Changed:Connect(function()
        frame.CanvasSize = UDim2.new(0, 0, 0, fl.AbsoluteContentSize.Y + 12)
    end)

    tabs[td.name]      = btn
    tabFrames[td.name] = frame

    btn.MouseButton1Click:Connect(function() switchTab(td.name) end)
    btn.MouseEnter:Connect(function()
        if activeTab ~= td.name then tw(btn, {BackgroundTransparency=0.7}, 0.12) end
    end)
    btn.MouseLeave:Connect(function()
        if activeTab ~= td.name then tw(btn, {BackgroundTransparency=1}, 0.12) end
    end)
end

switchTab("Movement")

-- ============================================================
-- WIDGET BUILDERS
-- ============================================================

local function section(tabName, text)
    local sl = Instance.new("TextLabel")
    sl.Size                = UDim2.new(1, -4, 0, 22)
    sl.BackgroundTransparency = 1
    sl.Font                = Enum.Font.GothamBold
    sl.TextSize            = 10
    sl.TextColor3          = T.Accent
    sl.Text                = "   ▸  "..text:upper()
    sl.TextXAlignment      = Enum.TextXAlignment.Left
    sl.BorderSizePixel     = 0
    sl.Parent              = tabFrames[tabName]
    return sl
end

local function addButton(tabName, labelTxt, desc, callback, btnTxt, btnColor)
    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1, -4, 0, 54)
    frame.BackgroundColor3= T.Card
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 10)
    stroke(frame, T.Border)

    local lb = lbl(frame, labelTxt, UDim2.new(1,-110,0,20), T.Text, true)
    lb.Position = UDim2.new(0, 12, 0, 8)

    local sb = lbl(frame, desc, UDim2.new(1,-110,0,20), T.SubText)
    sb.Position = UDim2.new(0, 12, 0, 28)
    sb.TextSize = 11

    local col = btnColor or T.Accent
    local btn = Instance.new("TextButton")
    btn.Size            = UDim2.new(0, 90, 0, 30)
    btn.Position        = UDim2.new(1, -100, 0.5, -15)
    btn.BackgroundColor3= col
    btn.Font            = Enum.Font.GothamBold
    btn.TextSize        = 12
    btn.TextColor3      = Color3.new(1,1,1)
    btn.Text            = btnTxt or "RUN"
    btn.BorderSizePixel = 0
    btn.Parent          = frame
    corner(btn, 7)

    btn.MouseEnter:Connect(function()
        tw(btn, {BackgroundColor3 = Color3.fromRGB(
            math.min(col.R*255+30,255)/255,
            math.min(col.G*255+30,255)/255,
            math.min(col.B*255+30,255)/255
        )}, 0.15)
    end)
    btn.MouseLeave:Connect(function() tw(btn, {BackgroundColor3=col}, 0.15) end)
    btn.MouseButton1Click:Connect(function()
        pcall(callback)
        tw(btn, {BackgroundColor3=T.Success}, 0.1)
        task.delay(0.5, function() tw(btn, {BackgroundColor3=col}, 0.2) end)
    end)
    return frame
end

local function addInputButton(tabName, labelTxt, desc, placeholder, btnTxt, callback)
    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1, -4, 0, 70)
    frame.BackgroundColor3= T.Card
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 10)
    stroke(frame, T.Border)

    local lb = lbl(frame, labelTxt, UDim2.new(1,-14,0,18), T.Text, true)
    lb.Position = UDim2.new(0, 12, 0, 8)

    local sb = lbl(frame, desc, UDim2.new(0, 230, 0, 14), T.SubText)
    sb.Position = UDim2.new(0, 12, 0, 26)
    sb.TextSize = 11

    local box = Instance.new("TextBox")
    box.Size             = UDim2.new(1, -108, 0, 26)
    box.Position         = UDim2.new(0, 12, 0, 40)
    box.BackgroundColor3 = T.Bar
    box.Font             = Enum.Font.Gotham
    box.TextSize         = 13
    box.TextColor3       = T.Text
    box.PlaceholderColor3= T.SubText
    box.PlaceholderText  = placeholder or "..."
    box.Text             = ""
    box.BorderSizePixel  = 0
    box.ClearTextOnFocus = false
    box.Parent           = frame
    corner(box, 6)
    stroke(box, T.Border)

    local btn = Instance.new("TextButton")
    btn.Size            = UDim2.new(0, 84, 0, 26)
    btn.Position        = UDim2.new(1, -96, 0, 40)
    btn.BackgroundColor3= T.Accent
    btn.Font            = Enum.Font.GothamBold
    btn.TextSize        = 12
    btn.TextColor3      = Color3.new(1,1,1)
    btn.Text            = btnTxt or "GO"
    btn.BorderSizePixel = 0
    btn.Parent          = frame
    corner(btn, 6)

    btn.MouseEnter:Connect(function() tw(btn,{BackgroundColor3=T.AccentHov},0.15) end)
    btn.MouseLeave:Connect(function() tw(btn,{BackgroundColor3=T.Accent},0.15) end)
    btn.MouseButton1Click:Connect(function() pcall(callback, box.Text) end)
    box.FocusLost:Connect(function(enter) if enter then pcall(callback, box.Text) end end)
    return frame, box
end

local toggleStates = {}
local function addToggle(tabName, labelTxt, desc, id, default, callback)
    toggleStates[id] = default or false

    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1, -4, 0, 54)
    frame.BackgroundColor3= T.Card
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 10)
    stroke(frame, T.Border)

    local lb = lbl(frame, labelTxt, UDim2.new(1,-80,0,20), T.Text, true)
    lb.Position = UDim2.new(0, 12, 0, 8)

    local sb = lbl(frame, desc, UDim2.new(1,-80,0,18), T.SubText)
    sb.Position = UDim2.new(0, 12, 0, 28)
    sb.TextSize = 11

    local pill = Instance.new("TextButton")
    pill.Size            = UDim2.new(0, 48, 0, 26)
    pill.Position        = UDim2.new(1,-60, 0.5,-13)
    pill.BackgroundColor3= toggleStates[id] and T.Toggle_ON or T.Toggle_OFF
    pill.Text            = ""
    pill.BorderSizePixel = 0
    pill.Parent          = frame
    corner(pill, 13)

    local knob = Instance.new("Frame")
    knob.Size            = UDim2.new(0, 20, 0, 20)
    knob.Position        = toggleStates[id] and UDim2.new(0,25,0.5,-10) or UDim2.new(0,3,0.5,-10)
    knob.BackgroundColor3= Color3.new(1,1,1)
    knob.BorderSizePixel = 0
    knob.Parent          = pill
    corner(knob, 10)

    local function refresh()
        local on = toggleStates[id]
        tw(pill, {BackgroundColor3 = on and T.Toggle_ON or T.Toggle_OFF}, 0.2)
        tw(knob, {Position = on and UDim2.new(0,25,0.5,-10) or UDim2.new(0,3,0.5,-10)}, 0.2)
    end

    pill.MouseButton1Click:Connect(function()
        toggleStates[id] = not toggleStates[id]
        refresh()
        pcall(callback, toggleStates[id])
    end)
    if default then pcall(callback, true) end
    return frame, function() return toggleStates[id] end
end

local function addSlider(tabName, labelTxt, desc, id, smin, smax, default, callback)
    local val = default or smin
    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1,-4,0,66)
    frame.BackgroundColor3= T.Card
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 10)
    stroke(frame, T.Border)

    local lb = lbl(frame, labelTxt, UDim2.new(1,-80,0,18), T.Text, true)
    lb.Position = UDim2.new(0,12,0,8)

    local valLbl = lbl(frame, tostring(val), UDim2.new(0,60,0,18), T.Accent, true)
    valLbl.Position       = UDim2.new(1,-70,0,8)
    valLbl.TextXAlignment = Enum.TextXAlignment.Right

    local sb = lbl(frame, desc, UDim2.new(1,-14,0,14), T.SubText)
    sb.Position = UDim2.new(0,12,0,26)
    sb.TextSize = 11

    local track = Instance.new("Frame")
    track.Size            = UDim2.new(1,-24,0,6)
    track.Position        = UDim2.new(0,12,0,48)
    track.BackgroundColor3= T.Border
    track.BorderSizePixel = 0
    track.Parent          = frame
    corner(track, 3)

    local fill = Instance.new("Frame")
    local pct  = (val-smin)/(smax-smin)
    fill.Size             = UDim2.new(pct,0,1,0)
    fill.BackgroundColor3 = T.Accent
    fill.BorderSizePixel  = 0
    fill.Parent           = track
    corner(fill, 3)

    local dragging = false
    track.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging=true end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging=false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = math.clamp((inp.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            val = math.floor(smin + (smax-smin)*rel)
            valLbl.Text = tostring(val)
            fill.Size   = UDim2.new(rel,0,1,0)
            pcall(callback, val)
        end
    end)
    return frame
end

-- ============================================================
-- STATE
-- ============================================================
local flyActive      = false
local flyConn        = nil
local noclipActive   = false
local noclipConn     = nil
local espActive      = false
local espObjects     = {}   -- [playerName] = {bb, healthBar, boxFrame}
local espOpts        = {name=true, health=false, box=false, distance=false}
local infJumpConn    = nil
local bhopping       = false
local bhopConn       = nil
local spamActive     = false
local followActive   = false
local followConn     = nil
local loopTPActive   = false
local loopTPConn     = nil
local freezeActive   = false
local freezeConn     = nil
local flySpeed       = 50
local speedValue     = 16

-- ============================================================
-- ESP ENGINE
-- ============================================================
local function removeESP(playerName)
    if espObjects[playerName] then
        pcall(function() espObjects[playerName].bb:Destroy() end)
        espObjects[playerName] = nil
    end
end

local function buildESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    removeESP(player.Name)

    local bb = Instance.new("BillboardGui")
    bb.Size        = UDim2.new(0, 150, 0, 50)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.Adornee     = head
    bb.AlwaysOnTop = true
    bb.Parent      = head

    -- Name
    local nameLbl = Instance.new("TextLabel")
    nameLbl.Name               = "NameLbl"
    nameLbl.Size               = UDim2.new(1, 0, 0, 20)
    nameLbl.Position           = UDim2.new(0, 0, 0, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Font               = Enum.Font.GothamBold
    nameLbl.TextSize           = 14
    nameLbl.TextColor3         = T.Accent
    nameLbl.TextStrokeTransparency = 0.5
    nameLbl.Text               = player.Name
    nameLbl.Visible            = espOpts.name
    nameLbl.Parent             = bb

    -- Distance
    local distLbl = Instance.new("TextLabel")
    distLbl.Name               = "DistLbl"
    distLbl.Size               = UDim2.new(1, 0, 0, 16)
    distLbl.Position           = UDim2.new(0, 0, 0, 20)
    distLbl.BackgroundTransparency = 1
    distLbl.Font               = Enum.Font.Gotham
    distLbl.TextSize           = 11
    distLbl.TextColor3         = T.Warn
    distLbl.TextStrokeTransparency = 0.5
    distLbl.Text               = ""
    distLbl.Visible            = espOpts.distance
    distLbl.Parent             = bb

    -- Health bar (inside BillboardGui)
    local hbBg = Instance.new("Frame")
    hbBg.Name             = "HBBg"
    hbBg.Size             = UDim2.new(0, 80, 0, 6)
    hbBg.Position         = UDim2.new(0.5,-40,0,38)
    hbBg.BackgroundColor3 = T.Danger
    hbBg.BorderSizePixel  = 0
    hbBg.Visible          = espOpts.health
    hbBg.Parent           = bb
    corner(hbBg, 2)

    local hbFill = Instance.new("Frame")
    hbFill.Name             = "HBFill"
    hbFill.Size             = UDim2.new(1, 0, 1, 0)
    hbFill.BackgroundColor3 = T.Success
    hbFill.BorderSizePixel  = 0
    hbFill.Parent           = hbBg
    corner(hbFill, 2)

    espObjects[player.Name] = {bb=bb, name=nameLbl, dist=distLbl, hbBg=hbBg, hbFill=hbFill}
end

local espUpdateConn
local function startESPUpdater()
    if espUpdateConn then espUpdateConn:Disconnect() end
    espUpdateConn = RunService.Heartbeat:Connect(function()
        if not espActive then return end
        local myRoot = getRoot()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and espObjects[player.Name] then
                local obj = espObjects[player.Name]
                -- distance
                if espOpts.distance and myRoot and player.Character then
                    local pRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if pRoot then
                        local dist = math.floor((myRoot.Position - pRoot.Position).Magnitude)
                        obj.dist.Text = dist.."m"
                    end
                end
                -- health bar
                if espOpts.health then
                    local hum = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
                    if hum then
                        local pct = hum.Health / math.max(hum.MaxHealth, 1)
                        obj.hbFill.Size = UDim2.new(pct, 0, 1, 0)
                        obj.hbFill.BackgroundColor3 = Color3.fromRGB(
                            math.floor(255*(1-pct)), math.floor(200*pct), 50
                        )
                    end
                end
            end
        end
    end)
end

local function refreshESPVisibility()
    for _, obj in pairs(espObjects) do
        pcall(function()
            obj.name.Visible  = espOpts.name
            obj.dist.Visible  = espOpts.distance
            obj.hbBg.Visible  = espOpts.health
        end)
    end
end

local function enableESP()
    espActive = true
    for _, p in ipairs(Players:GetPlayers()) do buildESP(p) end
    Players.PlayerAdded:Connect(function(p)
        if espActive then task.wait(2) buildESP(p) end
    end)
    Players.PlayerRemoving:Connect(function(p)
        removeESP(p.Name)
    end)
    startESPUpdater()
    notify("ESP", "ESP enabled")
end

local function disableESP()
    espActive = false
    if espUpdateConn then espUpdateConn:Disconnect() espUpdateConn=nil end
    for name, _ in pairs(espObjects) do removeESP(name) end
    notify("ESP", "ESP disabled")
end

-- ============================================================
-- COMMAND EXECUTOR (for CmdBar)
-- ============================================================
local function execCmd(raw)
    raw = raw:gsub("^%s+",""):gsub("%s+$","")
    if raw == "" then return end
    local prefix = Settings.Prefix
    if raw:sub(1, #prefix) == prefix then
        raw = raw:sub(#prefix+1)
    end
    local parts = {}
    for w in raw:gmatch("%S+") do table.insert(parts, w) end
    if #parts == 0 then return end
    local cmd = parts[1]:lower()
    local args = {table.unpack(parts, 2)}

    -- Command dispatch
    if cmd == "fly" then
        toggleStates["fly"] = not toggleStates["fly"]
        notify("CmdBar","Fly "..(toggleStates["fly"] and "ON" or "OFF"))

    elseif cmd == "noclip" then
        toggleStates["noclip"] = not toggleStates["noclip"]
        notify("CmdBar","Noclip "..(toggleStates["noclip"] and "ON" or "OFF"))

    elseif cmd == "speed" or cmd == "ws" then
        local v = tonumber(args[1])
        if v then
            local h = getHuman()
            if h then h.WalkSpeed = v notify("CmdBar","WalkSpeed → "..v) end
        end

    elseif cmd == "jp" or cmd == "jumppower" then
        local v = tonumber(args[1])
        if v then
            local h = getHuman()
            if h then h.JumpPower = v notify("CmdBar","JumpPower → "..v) end
        end

    elseif cmd == "goto" or cmd == "tp" then
        local target = findPlayer(args[1] or "")
        if target then
            local root = getRoot()
            local char2 = target.Character
            local root2 = char2 and char2:FindFirstChild("HumanoidRootPart")
            if root and root2 then
                root.CFrame = root2.CFrame + Vector3.new(3,0,0)
                notify("CmdBar","Teleported to "..target.Name)
            end
        else notify("CmdBar","Player not found") end

    elseif cmd == "bring" then
        local target = findPlayer(args[1] or "")
        if target then
            local root = getRoot()
            local char2 = target.Character
            local root2 = char2 and char2:FindFirstChild("HumanoidRootPart")
            if root and root2 then
                root2.CFrame = root.CFrame + Vector3.new(3,0,0)
                notify("CmdBar","Brought "..target.Name)
            end
        end

    elseif cmd == "god" then
        local h = getHuman()
        if h then h.MaxHealth=math.huge h.Health=math.huge notify("CmdBar","God ON") end

    elseif cmd == "ungod" then
        local h = getHuman()
        if h then h.MaxHealth=100 h.Health=100 notify("CmdBar","God OFF") end

    elseif cmd == "esp" then
        if espActive then disableESP() else enableESP() end

    elseif cmd == "infjump" then
        toggleStates["infjump"] = not toggleStates["infjump"]
        notify("CmdBar","Infinite Jump "..(toggleStates["infjump"] and "ON" or "OFF"))

    elseif cmd == "time" then
        local v = tonumber(args[1])
        if v then Lighting.ClockTime = v notify("CmdBar","Time → "..v) end

    elseif cmd == "gravity" or cmd == "grav" then
        local v = tonumber(args[1])
        if v then workspace.Gravity = v notify("CmdBar","Gravity → "..v) end

    elseif cmd == "freeze" then
        local target = findPlayer(args[1] or "")
        if target then
            local char2 = target.Character
            if char2 then
                for _,p in pairs(char2:GetDescendants()) do
                    if p:IsA("BasePart") then p.Anchored = true end
                end
                notify("CmdBar","Froze "..target.Name)
            end
        end

    elseif cmd == "unfreeze" then
        local target = findPlayer(args[1] or "")
        if target then
            local char2 = target.Character
            if char2 then
                for _,p in pairs(char2:GetDescendants()) do
                    if p:IsA("BasePart") then p.Anchored = false end
                end
                notify("CmdBar","Unfroze "..target.Name)
            end
        end

    elseif cmd == "chat" then
        local msg = table.concat(args," ")
        sendChat(msg)
        notify("CmdBar","Sent: "..msg)

    elseif cmd == "follow" then
        local target = findPlayer(args[1] or "")
        if not target then notify("CmdBar","Player not found") return end
        if followConn then followConn:Disconnect() end
        followActive = true
        followConn = RunService.Heartbeat:Connect(function()
            if not followActive then followConn:Disconnect() return end
            local root = getRoot()
            local char2 = target.Character
            local root2 = char2 and char2:FindFirstChild("HumanoidRootPart")
            if root and root2 then
                root.CFrame = root2.CFrame + Vector3.new(3,0,0)
            end
        end)
        notify("CmdBar","Following "..target.Name)

    elseif cmd == "unfollow" then
        followActive = false
        if followConn then followConn:Disconnect() followConn=nil end
        notify("CmdBar","Follow stopped")

    elseif cmd == "respawn" then
        LocalPlayer:LoadCharacter()
        notify("CmdBar","Respawned")

    elseif cmd == "copypos" then
        local root = getRoot()
        if root then
            local p = root.Position
            local str = string.format("%.2f, %.2f, %.2f", p.X, p.Y, p.Z)
            pcall(function() setclipboard(str) end)
            notify("CmdBar","Pos copied: "..str)
        end

    elseif cmd == "fling" then
        local target = findPlayer(args[1] or "")
        if target then
            local char2 = target.Character
            local root2 = char2 and char2:FindFirstChild("HumanoidRootPart")
            if root2 then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity  = Vector3.new(math.random(-1,1)*999, 999, math.random(-1,1)*999)
                bv.MaxForce  = Vector3.new(1e9,1e9,1e9)
                bv.Parent    = root2
                game:GetService("Debris"):AddItem(bv, 0.1)
                notify("CmdBar","Flung "..target.Name)
            end
        end

    elseif cmd == "fullbright" then
        Lighting.Ambient        = Color3.fromRGB(255,255,255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
        Lighting.Brightness     = 2
        notify("CmdBar","Fullbright ON")

    elseif cmd == "help" then
        notify("CmdBar", "Commands: fly noclip speed ws jp goto tp bring god ungod esp infjump time gravity freeze unfreeze chat follow unfollow respawn copypos fling fullbright", 8)
    else
        notify("CmdBar","Unknown command: "..cmd)
    end
end

CMDBOX.FocusLost:Connect(function(enter)
    if enter then
        execCmd(CMDBOX.Text)
        CMDBOX.Text = ""
    end
end)

-- ============================================================
-- ░░░  MOVEMENT TAB  ░░░
-- ============================================================
section("Movement","Speed")
addSlider("Movement","Walk Speed","Adjust character walk speed","walkspeed",16,500,16,function(v)
    speedValue = v
    local h = getHuman()
    if h then h.WalkSpeed = v end
end)

section("Movement","Fly")
addToggle("Movement","Fly","Toggle fly mode (WASD + Space/Ctrl)","fly",false,function(on)
    flyActive = on
    if flyConn then flyConn:Disconnect() flyConn=nil end
    local root = getRoot()
    if not root then return end
    if on then
        local bp = Instance.new("BodyVelocity")
        bp.Velocity  = Vector3.zero
        bp.MaxForce  = Vector3.new(1e5,1e5,1e5)
        bp.Name      = "_FlyBV"
        bp.Parent    = root

        local bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
        bg.CFrame    = root.CFrame
        bg.Name      = "_FlyBG"
        bg.Parent    = root

        flyConn = RunService.Heartbeat:Connect(function()
            local r = getRoot()
            if not r or not flyActive then
                pcall(function() if r then
                    local bv=r:FindFirstChild("_FlyBV") if bv then bv:Destroy() end
                    local bg2=r:FindFirstChild("_FlyBG") if bg2 then bg2:Destroy() end
                end end)
                if flyConn then flyConn:Disconnect() flyConn=nil end
                return
            end
            local cam = workspace.CurrentCamera
            local vel = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += cam.CFrame.LookVector  * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= cam.CFrame.LookVector  * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel -= cam.CFrame.RightVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel += cam.CFrame.RightVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space)       then vel += Vector3.yAxis * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel -= Vector3.yAxis * flySpeed end
            r._FlyBV.Velocity = vel
            r._FlyBG.CFrame   = cam.CFrame
        end)
    else
        pcall(function() local r=getRoot()
            if r then
                local bv=r:FindFirstChild("_FlyBV") if bv then bv:Destroy() end
                local bg2=r:FindFirstChild("_FlyBG") if bg2 then bg2:Destroy() end
            end
        end)
    end
    notify("Fly", on and "Fly enabled" or "Fly disabled")
end)

addSlider("Movement","Fly Speed","Speed while flying","flyspeed",10,600,50,function(v)
    flySpeed = v
end)

section("Movement","Jump & Noclip")
addToggle("Movement","Infinite Jump","Jump in mid-air","infjump",false,function(on)
    if infJumpConn then infJumpConn:Disconnect() infJumpConn=nil end
    if on then
        infJumpConn = UserInputService.JumpRequest:Connect(function()
            if toggleStates["infjump"] then
                local h = getHuman()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
        end)
        notify("Infinite Jump","ON")
    else notify("Infinite Jump","OFF") end
end)

addSlider("Movement","Jump Power","Character jump height","jumppow",50,500,50,function(v)
    local h = getHuman()
    if h then h.JumpPower = v end
end)

addToggle("Movement","Noclip","Walk through walls","noclip",false,function(on)
    noclipActive = on
    if noclipConn then noclipConn:Disconnect() noclipConn=nil end
    if on then
        noclipConn = RunService.Stepped:Connect(function()
            local char = getChar()
            if char then
                for _,p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    end
    notify("Noclip", on and "ON" or "OFF")
end)

addToggle("Movement","Bhop","Bunny hop (hold Space)","bhop",false,function(on)
    bhopping = on
    if bhopConn then bhopConn:Disconnect() bhopConn=nil end
    if on then
        bhopConn = RunService.Heartbeat:Connect(function()
            if not bhopping then return end
            local h = getHuman()
            if h and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                if h:GetState() == Enum.HumanoidStateType.Freefall then
                    h:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        notify("Bhop","ON — hold Space")
    else notify("Bhop","OFF") end
end)

-- ============================================================
-- ░░░  PLAYER TAB  ░░░
-- ============================================================
section("Player","Teleport")
addInputButton("Player","Goto Player","Teleport to a player","Player name","GOTO",function(input)
    local target = findPlayer(input)
    if not target then notify("Goto","Player not found") return end
    local root  = getRoot()
    local root2 = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if root and root2 then
        root.CFrame = root2.CFrame + Vector3.new(3,0,0)
        notify("Goto","Teleported to "..target.Name)
    end
end)

addInputButton("Player","Bring Player","Teleport a player to you","Player name","BRING",function(input)
    local target = findPlayer(input)
    if not target then notify("Bring","Player not found") return end
    local myRoot = getRoot()
    local root2  = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if myRoot and root2 then
        root2.CFrame = myRoot.CFrame + Vector3.new(3,0,0)
        notify("Bring","Brought "..target.Name)
    end
end)

addInputButton("Player","Teleport to XYZ","Teleport to exact coords","X Y Z","TP XYZ",function(input)
    local x,y,z = input:match("([%-%.%d]+)%s+([%-%.%d]+)%s+([%-%.%d]+)")
    x,y,z = tonumber(x), tonumber(y), tonumber(z)
    if x and y and z then
        local root = getRoot()
        if root then
            root.CFrame = CFrame.new(x,y,z)
            notify("Teleport", string.format("→ %.1f %.1f %.1f", x,y,z))
        end
    else notify("Teleport","Format: X Y Z") end
end)

addInputButton("Player","Follow Player","Continuously follow a player","Player name","FOLLOW",function(input)
    local target = findPlayer(input)
    if not target then notify("Follow","Player not found") return end
    if followConn then followConn:Disconnect() end
    followActive = true
    followConn = RunService.Heartbeat:Connect(function()
        if not followActive then followConn:Disconnect() return end
        local root = getRoot()
        local root2 = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if root and root2 then root.CFrame = root2.CFrame + Vector3.new(3,0,0) end
    end)
    notify("Follow","Following "..target.Name)
end)

addButton("Player","Stop Follow","Stop following any player",function()
    followActive = false
    if followConn then followConn:Disconnect() followConn=nil end
    notify("Follow","Stopped")
end)

section("Player","Character")
addButton("Player","Respawn","Force-respawn your character",function()
    LocalPlayer:LoadCharacter()
    notify("Respawn","Respawned")
end)

addButton("Player","Copy Position","Copy XYZ to clipboard",function()
    local root = getRoot()
    if root then
        local p = root.Position
        local str = string.format("%.2f, %.2f, %.2f", p.X, p.Y, p.Z)
        pcall(function() setclipboard(str) end)
        notify("Copy Pos", str)
    end
end, "COPY")

section("Player","God & Health")
addToggle("Player","God Mode","Max health, can't die","god",false,function(on)
    local h = getHuman()
    if h then
        if on then h.MaxHealth=math.huge h.Health=math.huge notify("God","ON")
        else h.MaxHealth=100 h.Health=100 notify("God","OFF") end
    end
end)

addInputButton("Player","Fling Player","Apply massive launch force","Player name","FLING",function(input)
    local target = findPlayer(input)
    if not target then notify("Fling","Player not found") return end
    local root2 = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if root2 then
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(math.random(-1,1)*1500, 1500, math.random(-1,1)*1500)
        bv.MaxForce = Vector3.new(1e9,1e9,1e9)
        bv.Parent   = root2
        game:GetService("Debris"):AddItem(bv, 0.1)
        notify("Fling","Flung "..target.Name)
    end
end)

section("Player","Anti-AFK")
addToggle("Player","Anti-AFK","Prevent AFK kick","antiafk",false,function(on)
    if on then
        LocalPlayer.Idled:Connect(function()
            if toggleStates["antiafk"] then
                pcall(function()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                end)
            end
        end)
        notify("Anti-AFK","ON")
    else notify("Anti-AFK","OFF") end
end)

-- ============================================================
-- ░░░  WORLD TAB  ░░░
-- ============================================================
section("World","Lighting")
addSlider("World","Time of Day","Set clock time (0–24)","tod",0,24,14,function(v)
    Lighting.ClockTime = v
end)

addSlider("World","Brightness","Ambient brightness","bright",0,10,1,function(v)
    Lighting.Brightness = v
end)

addButton("World","Fullbright","Max ambient, no shadows",function()
    Lighting.Ambient        = Color3.fromRGB(255,255,255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
    Lighting.Brightness     = 2
    notify("Fullbright","ON")
end)

section("World","Physics")
addSlider("World","Gravity","Workspace gravity (default 196)","grav",0,300,196,function(v)
    workspace.Gravity = v
end)

section("World","Fog")
addToggle("World","Remove Fog","Clear all fog","fog",false,function(on)
    if on then
        Lighting.FogEnd = 1e9 Lighting.FogStart = 1e9 notify("Fog","Removed")
    else
        Lighting.FogEnd = 100000 Lighting.FogStart = 0 notify("Fog","Restored")
    end
end)

section("World","Parts")
addButton("World","Delete All Parts","Remove all workspace BaseParts",function()
    for _,v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not (LocalPlayer.Character and v:IsDescendantOf(LocalPlayer.Character)) then
            pcall(function() v:Destroy() end)
        end
    end
    notify("World","All parts deleted")
end)

-- ============================================================
-- ░░░  CHAT TAB  ░░░
-- ============================================================
section("Chat","Spam")
addInputButton("Chat","Spam Chat","Repeatedly send a message","Message...","SPAM",function(input)
    if input == "" then return end
    if spamActive then spamActive=false notify("Spam","Stopped") return end
    spamActive = true
    notify("Spam","Spamming: "..input)
    task.spawn(function()
        while spamActive do
            pcall(sendChat, input)
            task.wait(0.6)
        end
    end)
end)
addButton("Chat","Stop Spam","Stop the spam loop",function()
    spamActive = false notify("Spam","Stopped")
end, "STOP", T.Danger)

section("Chat","Send")
addInputButton("Chat","Send Message","Send a single message","Message...","SEND",function(input)
    if input == "" then return end
    sendChat(input)
    notify("Chat","Sent!")
end)

-- ============================================================
-- ░░░  ESP TAB  ░░░
-- ============================================================
section("ESP","Master")
addToggle("ESP","Enable ESP","Show info above all players","espmaster",false,function(on)
    if on then enableESP() else disableESP() end
end)

section("ESP","Options")
addToggle("ESP","Player Names","Show name tag above head","espname",true,function(on)
    espOpts.name = on
    refreshESPVisibility()
end)

addToggle("ESP","Health Bars","Show health bar under name","esphealth",false,function(on)
    espOpts.health = on
    refreshESPVisibility()
end)

addToggle("ESP","Distance","Show distance from you","espdist",false,function(on)
    espOpts.distance = on
    refreshESPVisibility()
end)

section("ESP","Chams (Highlights)")
addToggle("ESP","Highlight Players","Add highlight to all player models","chams",false,function(on)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local char = p.Character
            local existing = char:FindFirstChild("_EA_Highlight")
            if on and not existing then
                local hl = Instance.new("SelectionBox")
                hl.Name         = "_EA_Highlight"
                hl.Adornee      = char
                hl.Color3       = T.Accent
                hl.SurfaceColor3= T.Accent
                hl.SurfaceTransparency = 0.7
                hl.LineThickness = 0.05
                hl.Parent       = char
            elseif not on and existing then
                existing:Destroy()
            end
        end
    end
    notify("Chams", on and "ON" or "OFF")
end)

-- ============================================================
-- ░░░  TOGGLES TAB  ░░░
-- ============================================================
section("Toggles","Visual")
addToggle("Toggles","Freecam","Detached camera (WASD+Q/E)","freecam",false,function(on)
    local cam = workspace.CurrentCamera
    if on then
        cam.CameraType = Enum.CameraType.Scriptable
        local fcConn
        fcConn = RunService.RenderStepped:Connect(function(dt)
            if not toggleStates["freecam"] then
                fcConn:Disconnect()
                cam.CameraType = Enum.CameraType.Custom
                return
            end
            local speed = 30*dt
            local cf = cam.CFrame
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then cam.CFrame = cf*CFrame.new(0,0,-speed) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then cam.CFrame = cf*CFrame.new(0,0,speed) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then cam.CFrame = cf*CFrame.new(-speed,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then cam.CFrame = cf*CFrame.new(speed,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then cam.CFrame = cf*CFrame.new(0,speed,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) then cam.CFrame = cf*CFrame.new(0,-speed,0) end
        end)
        notify("Freecam","ON — WASD Q/E to move")
    else
        cam.CameraType = Enum.CameraType.Custom
        notify("Freecam","OFF")
    end
end)

addToggle("Toggles","Hide GUI","Hide this window (F2 to show)","hidegui",false,function(on)
    BODY.Visible     = not on
    TITLEBAR.Visible = not on
    if on then notify("GUI","Hidden — press F2 to show") end
end)

section("Toggles","Freeze")
addToggle("Toggles","Freeze Self","Lock your character in place","freezeself",false,function(on)
    freezeActive = on
    if freezeConn then freezeConn:Disconnect() freezeConn=nil end
    if on then
        local savedCF
        local root = getRoot()
        if root then savedCF = root.CFrame end
        freezeConn = RunService.Heartbeat:Connect(function()
            if not freezeActive then return end
            local r = getRoot()
            if r and savedCF then r.CFrame = savedCF end
        end)
        notify("Freeze Self","ON")
    else notify("Freeze Self","OFF") end
end)

section("Toggles","Danger Zone")
addButton("Toggles","Delete GUI","Permanently destroy this GUI",function()
    notify("GUI","Goodbye! Deleting…")
    task.wait(1)
    SCREENGUI:Destroy()
end, "DELETE", T.Danger)

-- ============================================================
-- ░░░  SETTINGS TAB  ░░░
-- ============================================================
section("Settings","Command Bar Prefix")

-- Prefix symbol selector card
local prefixCard = Instance.new("Frame")
prefixCard.Size            = UDim2.new(1,-4,0,80)
prefixCard.BackgroundColor3= T.Card
prefixCard.BorderSizePixel = 0
prefixCard.Parent          = tabFrames["Settings"]
corner(prefixCard, 10)
stroke(prefixCard, T.Border)

local prefixTitle = lbl(prefixCard,"Prefix Symbol",UDim2.new(1,-14,0,18),T.Text,true)
prefixTitle.Position = UDim2.new(0,12,0,8)

local prefixDesc = lbl(prefixCard,"Choose the symbol used before commands in CmdBar",UDim2.new(1,-14,0,14),T.SubText)
prefixDesc.Position = UDim2.new(0,12,0,26)
prefixDesc.TextSize = 11

local prefixBtnRow = Instance.new("Frame")
prefixBtnRow.Size            = UDim2.new(1,-24,0,28)
prefixBtnRow.Position        = UDim2.new(0,12,0,46)
prefixBtnRow.BackgroundTransparency = 1
prefixBtnRow.Parent          = prefixCard

local pfxLayout = Instance.new("UIListLayout")
pfxLayout.FillDirection = Enum.FillDirection.Horizontal
pfxLayout.Padding       = UDim.new(0,6)
pfxLayout.Parent        = prefixBtnRow

local prefixSymbols = {":", ";", "!", "."}
local prefixBtns = {}

local function updatePrefixBtns()
    for sym, btn in pairs(prefixBtns) do
        if sym == Settings.Prefix then
            tw(btn, {BackgroundColor3=T.Accent, TextColor3=Color3.new(1,1,1)}, 0.15)
        else
            tw(btn, {BackgroundColor3=T.Bar, TextColor3=T.SubText}, 0.15)
        end
    end
    CMDBOX.PlaceholderText = "Type a command e.g.  "..Settings.Prefix.."fly  "..Settings.Prefix.."goto PlayerName"
end

for _, sym in ipairs(prefixSymbols) do
    local pb = Instance.new("TextButton")
    pb.Size            = UDim2.new(0, 48, 1, 0)
    pb.BackgroundColor3= sym == Settings.Prefix and T.Accent or T.Bar
    pb.Font            = Enum.Font.GothamBold
    pb.TextSize        = 18
    pb.TextColor3      = sym == Settings.Prefix and Color3.new(1,1,1) or T.SubText
    pb.Text            = sym
    pb.BorderSizePixel = 0
    pb.Parent          = prefixBtnRow
    corner(pb, 6)
    prefixBtns[sym] = pb
    pb.MouseButton1Click:Connect(function()
        Settings.Prefix = sym
        updatePrefixBtns()
        notify("Settings","Prefix changed to  "..sym)
    end)
end

section("Settings","Search Commands")
-- Search bar
local searchCard = Instance.new("Frame")
searchCard.Size            = UDim2.new(1,-4,0,42)
searchCard.BackgroundColor3= T.Card
searchCard.BorderSizePixel = 0
searchCard.Parent          = tabFrames["Settings"]
corner(searchCard, 10)
stroke(searchCard, T.Border)

local searchBox = Instance.new("TextBox")
searchBox.Size             = UDim2.new(1,-24,1,-10)
searchBox.Position         = UDim2.new(0,12,0,5)
searchBox.BackgroundTransparency = 1
searchBox.Font             = Enum.Font.Gotham
searchBox.TextSize         = 13
searchBox.TextColor3       = T.Text
searchBox.PlaceholderColor3= T.Muted
searchBox.PlaceholderText  = "🔍  Search commands e.g. fly, goto, esp…"
searchBox.Text             = ""
searchBox.ClearTextOnFocus = false
searchBox.BorderSizePixel  = 0
searchBox.Parent           = searchCard

-- Search results list
local searchResults = Instance.new("Frame")
searchResults.Size            = UDim2.new(1,-4,0,0)
searchResults.BackgroundColor3= T.Card
searchResults.BorderSizePixel = 0
searchResults.ClipsDescendants= true
searchResults.Parent          = tabFrames["Settings"]
corner(searchResults, 10)

local srLayout = Instance.new("UIListLayout")
srLayout.Padding   = UDim.new(0,2)
srLayout.SortOrder = Enum.SortOrder.LayoutOrder
srLayout.Parent    = searchResults
pad(searchResults,4,4,8,8)

local allCmds = {
    "fly","noclip","speed","jp","jumppower","goto","tp","bring","god","ungod","esp","infjump",
    "time","gravity","grav","freeze","unfreeze","chat","follow","unfollow","respawn",
    "copypos","fling","fullbright","bhop","freecam","help"
}

searchBox.Changed:Connect(function(prop)
    if prop ~= "Text" then return end
    local q = searchBox.Text:lower():gsub("^%s+",""):gsub("%s+$","")
    for _, child in ipairs(searchResults:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
    if q == "" then
        searchResults.Size = UDim2.new(1,-4,0,0)
        return
    end
    local found = {}
    for _, cmd in ipairs(allCmds) do
        if cmd:find(q,1,true) then table.insert(found, cmd) end
    end
    for i, cmd in ipairs(found) do
        local row = Instance.new("TextButton")
        row.Size            = UDim2.new(1,0,0,30)
        row.BackgroundColor3= T.Bar
        row.Font            = Enum.Font.GothamSemibold
        row.TextSize        = 13
        row.TextColor3      = T.Text
        row.Text            = "  "..Settings.Prefix..cmd
        row.TextXAlignment  = Enum.TextXAlignment.Left
        row.BorderSizePixel = 0
        row.LayoutOrder     = i
        row.Parent          = searchResults
        corner(row, 6)
        row.MouseButton1Click:Connect(function()
            CMDBOX.Text = Settings.Prefix..cmd.." "
            searchBox.Text = ""
            searchResults.Size = UDim2.new(1,-4,0,0)
            CMDBOX:CaptureFocus()
        end)
    end
    local h = math.min(#found * 32 + 8, 200)
    searchResults.Size = UDim2.new(1,-4,0,h)
end)

section("Settings","About")
local aboutCard = Instance.new("Frame")
aboutCard.Size            = UDim2.new(1,-4,0,66)
aboutCard.BackgroundColor3= T.Card
aboutCard.BorderSizePixel = 0
aboutCard.Parent          = tabFrames["Settings"]
corner(aboutCard, 10)
stroke(aboutCard, T.Border)

local aTitle = lbl(aboutCard,"External Admin  —  BETA v2.0",UDim2.new(1,-14,0,20),T.Text,true)
aTitle.Position = UDim2.new(0,12,0,8)
local aDesc = lbl(aboutCard,"Fixed SCREENGUI bug · 12 new commands · ESP options\nCmdBar · Settings · Prefix selector · Upgraded UI",UDim2.new(1,-14,0,36),T.SubText,false,true)
aDesc.Position  = UDim2.new(0,12,0,28)
aDesc.TextSize  = 11

-- ============================================================
-- DRAG (title bar)
-- ============================================================
do
    local drag, dStart, dPos
    TITLEBAR.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            drag   = true
            dStart = inp.Position
            dPos   = WIN.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then drag=false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if drag and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = inp.Position - dStart
            WIN.Position = UDim2.new(
                dPos.X.Scale, dPos.X.Offset + delta.X,
                dPos.Y.Scale, dPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ============================================================
-- MINIMIZE / CLOSE / DELETE
-- ============================================================
local minimized = false
MINBTN.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        tw(WIN, {Size=UDim2.new(0,540,0,48)}, 0.3)
        MINBTN.Text = "+"
    else
        tw(WIN, {Size=UDim2.new(0,540,0,640)}, 0.3)
        MINBTN.Text = "−"
    end
end)

CLOSEBTN.MouseButton1Click:Connect(function()
    tw(WIN, {Size=UDim2.new(0,540,0,0), Position=UDim2.new(0.5,-270,0.5,0)}, 0.25)
    task.wait(0.3)
    WIN.Visible = false
end)

DELETEBTN.MouseButton1Click:Connect(function()
    notify("External Admin","GUI permanently deleted.")
    task.wait(1.2)
    SCREENGUI:Destroy()
end)

-- F2 re-open
UserInputService.InputBegan:Connect(function(inp, gpe)
    if not gpe and inp.KeyCode == Enum.KeyCode.F2 then
        WIN.Visible = true
        minimized   = false
        MINBTN.Text = "−"
        tw(WIN, {Size=UDim2.new(0,540,0,640)}, 0.3, Enum.EasingStyle.Back)
        BODY.Visible     = true
        TITLEBAR.Visible = true
    end
end)

-- ============================================================
-- OPEN ANIMATION
-- ============================================================
WIN.Size = UDim2.new(0,540,0,0)
tw(WIN, {Size=UDim2.new(0,540,0,640)}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

task.delay(0.6, function()
    notify("External Admin", "Loaded! F2 to reopen.  CmdBar: type "..Settings.Prefix.."command", 5)
end)
