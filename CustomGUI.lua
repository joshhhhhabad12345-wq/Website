-- ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗    ██╗  ██╗██╗   ██╗██████╗ 
-- ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║    ██║  ██║██║   ██║██╔══██╗
-- ██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║    ███████║██║   ██║██████╔╝
-- ██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║    ██╔══██║██║   ██║██╔══██╗
-- ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║    ██║  ██║╚██████╔╝██████╔╝
--  ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝
-- Custom Admin GUI v1.0 | Built on Infinite Yield Source

-- ============================================================
-- BOILERPLATE / COMPATIBILITY LAYER (from source)
-- ============================================================
if IY_LOADED and not _G.IY_DEBUG then return end
pcall(function() getgenv().IY_LOADED = true end)
if not game:IsLoaded() then game.Loaded:Wait() end

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

cloneref = missing("function", cloneref, function(...) return ... end)
httprequest = missing("function", request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))

Services = setmetatable({}, {
    __index = function(self, name)
        local success, cache = pcall(function() return cloneref(game:GetService(name)) end)
        if success then rawset(self, name, cache) return cache
        else error("Invalid Service: " .. tostring(name)) end
    end
})

local Players          = Services.Players
local UserInputService = Services.UserInputService
local TweenService     = Services.TweenService
local RunService       = Services.RunService
local StarterGui       = Services.StarterGui
local TextChatService  = Services.TextChatService

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = cloneref(LocalPlayer:FindFirstChildWhichIsA("PlayerGui"))
local Mouse       = cloneref(LocalPlayer:GetMouse())

-- ============================================================
-- THEME
-- ============================================================
local T = {
    BG        = Color3.fromRGB(12,  12,  18),
    Panel     = Color3.fromRGB(18,  18,  28),
    Bar       = Color3.fromRGB(24,  24,  38),
    Accent    = Color3.fromRGB(99,  102, 241),
    AccentHov = Color3.fromRGB(129, 132, 255),
    Danger    = Color3.fromRGB(239,  68,  68),
    Success   = Color3.fromRGB(34,  197,  94),
    Text      = Color3.fromRGB(240, 240, 255),
    SubText   = Color3.fromRGB(148, 148, 180),
    Border    = Color3.fromRGB(40,  40,  60),
    Toggle_ON = Color3.fromRGB(99,  102, 241),
    Toggle_OFF= Color3.fromRGB(55,  55,  75),
}

-- ============================================================
-- UTILITY
-- ============================================================
local function tween(obj, props, t, style, dir)
    style = style or Enum.EasingStyle.Quart
    dir   = dir   or Enum.EasingDirection.Out
    TweenService:Create(obj, TweenInfo.new(t or 0.25, style, dir), props):Play()
end

local function corner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius  = UDim.new(0, r or 6)
    c.Parent = obj
end

local function stroke(obj, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color     = color or T.Border
    s.Thickness = thickness or 1
    s.Parent    = obj
end

local function makeLabel(parent, text, size, color, bold, wraps)
    local l = Instance.new("TextLabel")
    l.Parent              = parent
    l.BackgroundTransparency = 1
    l.Size                = size or UDim2.new(1, 0, 0, 20)
    l.Font                = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize            = 14
    l.TextColor3          = color or T.Text
    l.Text                = text or ""
    l.TextXAlignment      = Enum.TextXAlignment.Left
    l.TextWrapped         = wraps or false
    return l
end

local function notify(title, msg, dur)
    dur = dur or 3
    local nf = Instance.new("Frame")
    nf.Size              = UDim2.new(0, 280, 0, 60)
    nf.Position          = UDim2.new(1, -300, 1, 60)
    nf.BackgroundColor3  = T.Panel
    nf.BorderSizePixel   = 0
    nf.ZIndex            = 99
    nf.Parent            = SCREENGUI
    corner(nf, 8) stroke(nf, T.Accent)

    local accent = Instance.new("Frame")
    accent.Size             = UDim2.new(0, 3, 1, 0)
    accent.BackgroundColor3 = T.Accent
    accent.BorderSizePixel  = 0
    accent.Parent           = nf
    corner(accent, 3)

    local t1 = makeLabel(nf, title, UDim2.new(1,-14,0,20), T.Text, true)
    t1.Position = UDim2.new(0,10,0,6) t1.ZIndex = 100
    local t2 = makeLabel(nf, msg, UDim2.new(1,-14,0,30), T.SubText)
    t2.Position = UDim2.new(0,10,0,26) t2.ZIndex = 100 t2.TextWrapped = true

    tween(nf, {Position = UDim2.new(1,-300,1,-70)}, 0.4)
    task.delay(dur, function()
        tween(nf, {Position = UDim2.new(1,-300,1,60)}, 0.3)
        task.wait(0.35) nf:Destroy()
    end)
end

local function getChar()  return LocalPlayer.Character end
local function getRoot()  local c=getChar() return c and c:FindFirstChild("HumanoidRootPart") end
local function getHuman() local c=getChar() return c and c:FindFirstChildWhichIsA("Humanoid") end

local function findPlayer(name)
    name = name:lower()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(name, 1, true) then return p end
    end
end

-- ============================================================
-- GUI SKELETON
-- ============================================================
local SCREENGUI = Instance.new("ScreenGui")
SCREENGUI.Name              = "CustomHubGUI"
SCREENGUI.ZIndexBehavior    = Enum.ZIndexBehavior.Sibling
SCREENGUI.ResetOnSpawn      = false
SCREENGUI.IgnoreGuiInset    = true
pcall(function() SCREENGUI.Parent = cloneref(game:GetService("CoreGui")) end)
if not SCREENGUI.Parent then SCREENGUI.Parent = PlayerGui end

-- Main window
local WIN = Instance.new("Frame")
WIN.Name             = "Window"
WIN.Size             = UDim2.new(0, 520, 0, 560)
WIN.Position         = UDim2.new(0.5,-260, 0.5,-280)
WIN.BackgroundColor3 = T.BG
WIN.BorderSizePixel  = 0
WIN.Active           = true
WIN.Parent           = SCREENGUI
corner(WIN, 12)
stroke(WIN, T.Border, 1)

-- Glow
local glow = Instance.new("ImageLabel")
glow.Size               = UDim2.new(1,80,1,80)
glow.Position           = UDim2.new(0,-40,0,-40)
glow.BackgroundTransparency = 1
glow.Image              = "rbxassetid://5028857084"
glow.ImageColor3        = T.Accent
glow.ImageTransparency  = 0.85
glow.ScaleType          = Enum.ScaleType.Slice
glow.SliceCenter        = Rect.new(24,24,276,276)
glow.ZIndex             = -1
glow.Parent             = WIN

-- Title bar
local TITLEBAR = Instance.new("Frame")
TITLEBAR.Size            = UDim2.new(1,0,0,44)
TITLEBAR.BackgroundColor3= T.Bar
TITLEBAR.BorderSizePixel = 0
TITLEBAR.Parent          = WIN
corner(TITLEBAR, 12)

-- Fix bottom corners of title bar
local TITLEFIX = Instance.new("Frame")
TITLEFIX.Size            = UDim2.new(1,0,0,12)
TITLEFIX.Position        = UDim2.new(0,0,1,-12)
TITLEFIX.BackgroundColor3= T.Bar
TITLEFIX.BorderSizePixel = 0
TITLEFIX.Parent          = TITLEBAR

local TITLETEXT = Instance.new("TextLabel")
TITLETEXT.Size               = UDim2.new(1,-100,1,0)
TITLETEXT.Position           = UDim2.new(0,16,0,0)
TITLETEXT.BackgroundTransparency = 1
TITLETEXT.Font               = Enum.Font.GothamBold
TITLETEXT.TextSize           = 16
TITLETEXT.TextColor3         = T.Text
TITLETEXT.Text               = "⬡  CUSTOM HUB"
TITLETEXT.TextXAlignment     = Enum.TextXAlignment.Left
TITLETEXT.Parent             = TITLEBAR

-- Minimize button
local MINBTN = Instance.new("TextButton")
MINBTN.Size                = UDim2.new(0,28,0,28)
MINBTN.Position            = UDim2.new(1,-72,0.5,-14)
MINBTN.BackgroundColor3    = T.Border
MINBTN.Font                = Enum.Font.GothamBold
MINBTN.TextSize            = 16
MINBTN.TextColor3          = T.SubText
MINBTN.Text                = "−"
MINBTN.BorderSizePixel     = 0
MINBTN.Parent              = TITLEBAR
corner(MINBTN, 6)

-- Close button
local CLOSEBTN = Instance.new("TextButton")
CLOSEBTN.Size              = UDim2.new(0,28,0,28)
CLOSEBTN.Position          = UDim2.new(1,-36,0.5,-14)
CLOSEBTN.BackgroundColor3  = T.Danger
CLOSEBTN.Font              = Enum.Font.GothamBold
CLOSEBTN.TextSize          = 14
CLOSEBTN.TextColor3        = Color3.new(1,1,1)
CLOSEBTN.Text              = "✕"
CLOSEBTN.BorderSizePixel   = 0
CLOSEBTN.Parent            = TITLEBAR
corner(CLOSEBTN, 6)

-- Body
local BODY = Instance.new("Frame")
BODY.Size            = UDim2.new(1,-16,1,-60)
BODY.Position        = UDim2.new(0,8,0,52)
BODY.BackgroundTransparency = 1
BODY.Parent          = WIN

-- Tab bar
local TABBAR = Instance.new("Frame")
TABBAR.Size            = UDim2.new(1,0,0,36)
TABBAR.BackgroundColor3= T.Panel
TABBAR.BorderSizePixel = 0
TABBAR.Parent          = BODY
corner(TABBAR, 8)

local TABLAYOUT = Instance.new("UIListLayout")
TABLAYOUT.FillDirection = Enum.FillDirection.Horizontal
TABLAYOUT.Padding       = UDim.new(0,4)
TABLAYOUT.VerticalAlignment = Enum.VerticalAlignment.Center
TABLAYOUT.Parent        = TABBAR

local TABPADDING = Instance.new("UIPadding")
TABPADDING.PaddingLeft  = UDim.new(0,4)
TABPADDING.PaddingRight = UDim.new(0,4)
TABPADDING.Parent       = TABBAR

-- Content area
local CONTENT = Instance.new("Frame")
CONTENT.Size            = UDim2.new(1,0,1,-44)
CONTENT.Position        = UDim2.new(0,0,0,40)
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
    {name="Movement",  icon="🏃"},
    {name="Player",    icon="👤"},
    {name="World",     icon="🌍"},
    {name="Chat",      icon="💬"},
    {name="Toggles",   icon="🔘"},
}

local function switchTab(name)
    if activeTab == name then return end
    activeTab = name
    for n, btn in pairs(tabs) do
        if n == name then
            tween(btn, {BackgroundColor3=T.Accent, TextColor3=Color3.new(1,1,1)}, 0.2)
        else
            tween(btn, {BackgroundColor3=Color3.fromRGB(0,0,0,0), TextColor3=T.SubText}, 0.2)
        end
    end
    for n, frame in pairs(tabFrames) do
        frame.Visible = (n == name)
    end
end

for _, td in ipairs(tabDefs) do
    local btn = Instance.new("TextButton")
    btn.Size              = UDim2.new(0,88,0,28)
    btn.BackgroundColor3  = Color3.fromRGB(0,0,0)
    btn.BackgroundTransparency = 1
    btn.Font              = Enum.Font.GothamSemibold
    btn.TextSize          = 12
    btn.TextColor3        = T.SubText
    btn.Text              = td.icon.." "..td.name
    btn.BorderSizePixel   = 0
    btn.Parent            = TABBAR
    corner(btn, 6)

    local frame = Instance.new("ScrollingFrame")
    frame.Size            = UDim2.new(1,0,1,0)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 3
    frame.ScrollBarImageColor3 = T.Accent
    frame.Visible         = false
    frame.Parent          = CONTENT

    local fl = Instance.new("UIListLayout")
    fl.Padding            = UDim.new(0,6)
    fl.SortOrder          = Enum.SortOrder.LayoutOrder
    fl.Parent             = frame

    local fp = Instance.new("UIPadding")
    fp.PaddingTop         = UDim.new(0,6)
    fp.PaddingLeft        = UDim.new(0,2)
    fp.PaddingRight        = UDim.new(0,2)
    fp.PaddingBottom      = UDim.new(0,6)
    fp.Parent             = frame

    fl.Changed:Connect(function()
        frame.CanvasSize = UDim2.new(0,0,0,fl.AbsoluteContentSize.Y+12)
    end)

    tabs[td.name]      = btn
    tabFrames[td.name] = frame

    btn.MouseButton1Click:Connect(function() switchTab(td.name) end)
    btn.MouseEnter:Connect(function()
        if activeTab ~= td.name then tween(btn,{BackgroundTransparency=0.6},0.15) end
    end)
    btn.MouseLeave:Connect(function()
        if activeTab ~= td.name then tween(btn,{BackgroundTransparency=1},0.15) end
    end)
end

switchTab("Movement")

-- ============================================================
-- WIDGET BUILDERS
-- ============================================================

-- Button widget
local function addButton(tabName, label, desc, callback)
    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1,-4,0,52)
    frame.BackgroundColor3= T.Panel
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 8) stroke(frame, T.Border)

    local lbl = makeLabel(frame, label, UDim2.new(1,-110,0,20), T.Text, true)
    lbl.Position          = UDim2.new(0,12,0,8)

    local sub = makeLabel(frame, desc, UDim2.new(1,-110,0,20), T.SubText)
    sub.Position          = UDim2.new(0,12,0,28)
    sub.TextSize          = 12

    local btn = Instance.new("TextButton")
    btn.Size              = UDim2.new(0,88,0,30)
    btn.Position          = UDim2.new(1,-98,0.5,-15)
    btn.BackgroundColor3  = T.Accent
    btn.Font              = Enum.Font.GothamBold
    btn.TextSize          = 13
    btn.TextColor3        = Color3.new(1,1,1)
    btn.Text              = "RUN"
    btn.BorderSizePixel   = 0
    btn.Parent            = frame
    corner(btn, 6)

    btn.MouseEnter:Connect(function() tween(btn,{BackgroundColor3=T.AccentHov},0.15) end)
    btn.MouseLeave:Connect(function() tween(btn,{BackgroundColor3=T.Accent},0.15) end)
    btn.MouseButton1Click:Connect(function()
        pcall(callback)
        tween(btn,{BackgroundColor3=T.Success},0.1)
        task.delay(0.4,function() tween(btn,{BackgroundColor3=T.Accent},0.2) end)
    end)
    return frame
end

-- Input+Button widget
local function addInputButton(tabName, label, desc, placeholder, btnLabel, callback)
    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1,-4,0,68)
    frame.BackgroundColor3= T.Panel
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 8) stroke(frame, T.Border)

    local lbl = makeLabel(frame, label, UDim2.new(1,-14,0,18), T.Text, true)
    lbl.Position          = UDim2.new(0,12,0,8)

    local sub = makeLabel(frame, desc, UDim2.new(0,200,0,14), T.SubText)
    sub.Position          = UDim2.new(0,12,0,26)
    sub.TextSize          = 11

    local box = Instance.new("TextBox")
    box.Size              = UDim2.new(1,-108,0,24)
    box.Position          = UDim2.new(0,12,0,40)
    box.BackgroundColor3  = T.Bar
    box.Font              = Enum.Font.Gotham
    box.TextSize          = 13
    box.TextColor3        = T.Text
    box.PlaceholderColor3 = T.SubText
    box.PlaceholderText   = placeholder or "..."
    box.Text              = ""
    box.BorderSizePixel   = 0
    box.ClearTextOnFocus  = false
    box.Parent            = frame
    corner(box, 5) stroke(box, T.Border)

    local btn = Instance.new("TextButton")
    btn.Size              = UDim2.new(0,84,0,24)
    btn.Position          = UDim2.new(1,-96,0,40)
    btn.BackgroundColor3  = T.Accent
    btn.Font              = Enum.Font.GothamBold
    btn.TextSize          = 12
    btn.TextColor3        = Color3.new(1,1,1)
    btn.Text              = btnLabel or "GO"
    btn.BorderSizePixel   = 0
    btn.Parent            = frame
    corner(btn, 5)

    btn.MouseEnter:Connect(function() tween(btn,{BackgroundColor3=T.AccentHov},0.15) end)
    btn.MouseLeave:Connect(function() tween(btn,{BackgroundColor3=T.Accent},0.15) end)
    btn.MouseButton1Click:Connect(function()
        pcall(callback, box.Text)
    end)
    box.FocusLost:Connect(function(enter)
        if enter then pcall(callback, box.Text) end
    end)
    return frame, box
end

-- Toggle widget
local toggleStates = {}
local function addToggle(tabName, label, desc, id, default, callback)
    toggleStates[id] = default or false

    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1,-4,0,52)
    frame.BackgroundColor3= T.Panel
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 8) stroke(frame, T.Border)

    local lbl = makeLabel(frame, label, UDim2.new(1,-80,0,20), T.Text, true)
    lbl.Position          = UDim2.new(0,12,0,8)

    local sub = makeLabel(frame, desc, UDim2.new(1,-80,0,18), T.SubText)
    sub.Position          = UDim2.new(0,12,0,28)
    sub.TextSize          = 12

    -- Toggle pill
    local pill = Instance.new("TextButton")
    pill.Size             = UDim2.new(0,48,0,26)
    pill.Position         = UDim2.new(1,-60,0.5,-13)
    pill.BackgroundColor3 = toggleStates[id] and T.Toggle_ON or T.Toggle_OFF
    pill.Text             = ""
    pill.BorderSizePixel  = 0
    pill.Parent           = frame
    corner(pill, 13)

    local knob = Instance.new("Frame")
    knob.Size             = UDim2.new(0,20,0,20)
    knob.Position         = toggleStates[id] and UDim2.new(0,25,0.5,-10) or UDim2.new(0,3,0.5,-10)
    knob.BackgroundColor3 = Color3.new(1,1,1)
    knob.BorderSizePixel  = 0
    knob.Parent           = pill
    corner(knob, 10)

    local function refresh()
        local on = toggleStates[id]
        tween(pill, {BackgroundColor3 = on and T.Toggle_ON or T.Toggle_OFF}, 0.2)
        tween(knob, {Position = on and UDim2.new(0,25,0.5,-10) or UDim2.new(0,3,0.5,-10)}, 0.2)
    end

    pill.MouseButton1Click:Connect(function()
        toggleStates[id] = not toggleStates[id]
        refresh()
        pcall(callback, toggleStates[id])
    end)

    if default then pcall(callback, true) end
    return frame
end

-- Slider widget
local function addSlider(tabName, label, desc, id, min, max, default, callback)
    local val = default or min

    local frame = Instance.new("Frame")
    frame.Size            = UDim2.new(1,-4,0,64)
    frame.BackgroundColor3= T.Panel
    frame.BorderSizePixel = 0
    frame.Parent          = tabFrames[tabName]
    corner(frame, 8) stroke(frame, T.Border)

    local lbl = makeLabel(frame, label, UDim2.new(1,-80,0,18), T.Text, true)
    lbl.Position          = UDim2.new(0,12,0,8)

    local valLbl = makeLabel(frame, tostring(val), UDim2.new(0,60,0,18), T.Accent, true)
    valLbl.Position       = UDim2.new(1,-70,0,8)
    valLbl.TextXAlignment = Enum.TextXAlignment.Right

    local sub = makeLabel(frame, desc, UDim2.new(1,-14,0,14), T.SubText)
    sub.Position          = UDim2.new(0,12,0,26)
    sub.TextSize          = 11

    local track = Instance.new("Frame")
    track.Size            = UDim2.new(1,-24,0,6)
    track.Position        = UDim2.new(0,12,0,46)
    track.BackgroundColor3= T.Border
    track.BorderSizePixel = 0
    track.Parent          = frame
    corner(track, 3)

    local fill = Instance.new("Frame")
    local pct  = (val-min)/(max-min)
    fill.Size             = UDim2.new(pct,0,1,0)
    fill.BackgroundColor3 = T.Accent
    fill.BorderSizePixel  = 0
    fill.Parent           = track
    corner(fill, 3)

    local drag = false
    track.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if drag and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = (inp.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
            rel = math.clamp(rel, 0, 1)
            val = math.floor(min + (max-min)*rel)
            valLbl.Text = tostring(val)
            fill.Size   = UDim2.new(rel,0,1,0)
            pcall(callback, val)
        end
    end)
    return frame
end

-- ============================================================
-- SECTION HEADER HELPER
-- ============================================================
local function addSection(tabName, text)
    local lbl = Instance.new("TextLabel")
    lbl.Size               = UDim2.new(1,-4,0,20)
    lbl.BackgroundTransparency = 1
    lbl.Font               = Enum.Font.GothamBold
    lbl.TextSize           = 11
    lbl.TextColor3         = T.Accent
    lbl.Text               = "  ⬡  "..text:upper()
    lbl.TextXAlignment     = Enum.TextXAlignment.Left
    lbl.BorderSizePixel    = 0
    lbl.Parent             = tabFrames[tabName]
    return lbl
end

-- ============================================================
-- STATE VARIABLES
-- ============================================================
local flyActive      = false
local flyConn        = nil
local noclipActive   = false
local noclipConn     = nil
local espActive      = false
local espObjects     = {}
local infJumpActive  = false
local bhopping       = false
local spamActive     = false
local spamThread     = nil
local aimbotActive   = false
local speedValue     = 16
local flySpeed       = 50

-- ============================================================
-- ░░░  MOVEMENT TAB  ░░░
-- ============================================================
addSection("Movement","Speed")
addSlider("Movement","Walk Speed","Adjust walk speed","speed",16,500,16,function(v)
    speedValue = v
    local h = getHuman()
    if h then h.WalkSpeed = v end
end)

addSection("Movement","Fly")
addToggle("Movement","Fly","Toggle fly mode","fly",false,function(on)
    flyActive = on
    if flyConn then flyConn:Disconnect() flyConn=nil end
    local root = getRoot()
    if not root then return end
    if on then
        local bp = Instance.new("BodyVelocity")
        bp.Velocity     = Vector3.zero
        bp.MaxForce     = Vector3.new(1e5,1e5,1e5)
        bp.Name         = "_FlyBV"
        bp.Parent       = root

        local bg = Instance.new("BodyGyro")
        bg.MaxTorque    = Vector3.new(1e5,1e5,1e5)
        bg.CFrame       = root.CFrame
        bg.Name         = "_FlyBG"
        bg.Parent       = root

        flyConn = RunService.Heartbeat:Connect(function()
            local r = getRoot()
            if not r or not flyActive then
                pcall(function() r and r:FindFirstChild("_FlyBV") and r._FlyBV:Destroy() end)
                pcall(function() r and r:FindFirstChild("_FlyBG") and r._FlyBG:Destroy() end)
                if flyConn then flyConn:Disconnect() flyConn=nil end
                return
            end
            local cam = workspace.CurrentCamera
            local vel = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.yAxis * flySpeed end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel = vel - Vector3.yAxis * flySpeed end
            r._FlyBV.Velocity = vel
            r._FlyBG.CFrame   = cam.CFrame
        end)
    else
        pcall(function() root:FindFirstChild("_FlyBV"):Destroy() end)
        pcall(function() root:FindFirstChild("_FlyBG"):Destroy() end)
    end
    notify("Fly", on and "Fly enabled" or "Fly disabled")
end)

addSlider("Movement","Fly Speed","Speed while flying","flyspeed",10,500,50,function(v)
    flySpeed = v
end)

addSection("Movement","Jump")
addToggle("Movement","Infinite Jump","Jump while in the air","infjump",false,function(on)
    infJumpActive = on
    UserInputService.JumpRequest:Connect(function()
        if infJumpActive then
            local h = getHuman()
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)
end)

addSection("Movement","Noclip")
addToggle("Movement","Noclip","Walk through walls","noclip",false,function(on)
    noclipActive = on
    if noclipConn then noclipConn:Disconnect() noclipConn=nil end
    if on then
        noclipConn = RunService.Stepped:Connect(function()
            local char = getChar()
            if char then
                for _,p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.CanCollide = false
                    end
                end
            end
        end)
    end
    notify("Noclip", on and "Noclip ON" or "Noclip OFF")
end)

-- ============================================================
-- ░░░  PLAYER TAB  ░░░
-- ============================================================
addSection("Player","Teleport")
addInputButton("Player","Goto Player","Teleport to a player","Player name","GOTO",function(input)
    local target = findPlayer(input)
    if not target then notify("Goto","Player not found",3) return end
    local root  = getRoot()
    local char2 = target.Character
    local root2 = char2 and char2:FindFirstChild("HumanoidRootPart")
    if root and root2 then
        root.CFrame = root2.CFrame + Vector3.new(3,0,0)
        notify("Goto","Teleported to "..target.Name)
    end
end)

addSection("Player","Character")
addButton("Player","Respawn","Force respawn your character",function()
    LocalPlayer:LoadCharacter()
    notify("Respawn","Character respawned")
end)

addButton("Player","Reset Camera","Reset camera to default",function()
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    notify("Camera","Camera reset")
end)

addSlider("Player","Jump Power","Adjust jump height","jump",50,500,50,function(v)
    local h = getHuman()
    if h then h.JumpPower = v end
end)

addSection("Player","God Mode")
addToggle("Player","God Mode","Set health to max and lock it","god",false,function(on)
    local h = getHuman()
    if h then
        if on then
            h.MaxHealth = math.huge
            h.Health    = math.huge
            notify("God","God Mode ON — invincible!")
        else
            h.MaxHealth = 100
            h.Health    = 100
            notify("God","God Mode OFF")
        end
    end
end)

addSection("Player","Anti-AFK")
addToggle("Player","Anti-AFK","Prevents being kicked for AFK","antiafk",false,function(on)
    if on then
        LocalPlayer.Idled:Connect(function()
            if toggleStates["antiafk"] then
                local vjs = LocalPlayer:FindFirstChildWhichIsA("LocalScript")
                pcall(function()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                end)
            end
        end)
        notify("Anti-AFK","Anti-AFK enabled")
    else
        notify("Anti-AFK","Anti-AFK disabled")
    end
end)

-- ============================================================
-- ░░░  WORLD TAB  ░░░
-- ============================================================
addSection("World","Lighting")
addSlider("World","Ambient Brightness","Set ambient brightness","brightness",0,10,1,function(v)
    game:GetService("Lighting").Brightness = v
end)

addSlider("World","Time of Day","Set time (0-24)","tod",0,24,14,function(v)
    game:GetService("Lighting").ClockTime = v
end)

addSection("World","Gravity")
addSlider("World","Gravity","Workspace gravity","gravity",0,300,196,function(v)
    workspace.Gravity = v
end)

addSection("World","Fog")
addToggle("World","Remove Fog","Clears fog from the world","fog",false,function(on)
    local l = game:GetService("Lighting")
    if on then
        l.FogEnd   = 1e6
        l.FogStart = 1e6
        notify("Fog","Fog removed")
    else
        l.FogEnd   = 100000
        l.FogStart = 0
        notify("Fog","Fog restored")
    end
end)

addSection("World","Parts")
addButton("World","Delete All Parts","Removes all workspace BaseParts",function()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not (LocalPlayer.Character and v:IsDescendantOf(LocalPlayer.Character)) then
            pcall(function() v:Destroy() end)
        end
    end
    notify("World","All parts deleted")
end)

addButton("World","Fullbright","Set max ambient & brightness",function()
    local l = game:GetService("Lighting")
    l.Ambient         = Color3.fromRGB(255,255,255)
    l.OutdoorAmbient  = Color3.fromRGB(255,255,255)
    l.Brightness      = 2
    notify("Lighting","Fullbright enabled")
end)

-- ============================================================
-- ░░░  CHAT TAB  ░░░
-- ============================================================
addSection("Chat","Spam Chat")
addInputButton("Chat","Spam Chat","Repeatedly send a message","Message text","SPAM",function(input)
    if input == "" then return end
    if spamActive then
        spamActive = false
        notify("Spam","Spam stopped")
        return
    end
    spamActive = true
    notify("Spam","Spamming: "..input)
    task.spawn(function()
        while spamActive do
            pcall(function()
                if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(input,"All")
                else
                    local ch = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
                    if ch then ch:SendAsync(input) end
                end
            end)
            task.wait(0.5)
        end
    end)
end)

addButton("Chat","Stop Spam","Stop the spam loop",function()
    spamActive = false
    notify("Spam","Spam stopped")
end)

addSection("Chat","Shout")
addInputButton("Chat","Send Message","Send a single chat message","Type message...","SEND",function(input)
    if input == "" then return end
    pcall(function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(input,"All")
        else
            local ch = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
            if ch then ch:SendAsync(input) end
        end
    end)
    notify("Chat","Message sent!")
end)

-- ============================================================
-- ░░░  TOGGLES TAB  ░░░
-- ============================================================
addSection("Toggles","Visual")
addToggle("Toggles","ESP","Show player names above heads","esp",false,function(on)
    espActive = on
    if not on then
        for _, obj in pairs(espObjects) do pcall(function() obj:Destroy() end) end
        espObjects = {}
        return
    end
    local function addESP(player)
        if player == LocalPlayer then return end
        local char = player.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        local bb = Instance.new("BillboardGui")
        bb.Size        = UDim2.new(0,120,0,30)
        bb.StudsOffset = Vector3.new(0,2,0)
        bb.Adornee     = head
        bb.AlwaysOnTop = true
        bb.Parent      = head
        local lbl = Instance.new("TextLabel")
        lbl.Size     = UDim2.new(1,0,1,0)
        lbl.BackgroundTransparency = 1
        lbl.Font     = Enum.Font.GothamBold
        lbl.TextSize = 14
        lbl.TextColor3 = T.Accent
        lbl.Text     = player.Name
        lbl.Parent   = bb
        espObjects[player.Name] = bb
    end
    for _, p in ipairs(Players:GetPlayers()) do addESP(p) end
    Players.PlayerAdded:Connect(function(p)
        if espActive then task.wait(3) addESP(p) end
    end)
    notify("ESP","ESP enabled")
end)

addToggle("Toggles","Bhop","Bunny hop when holding space","bhop",false,function(on)
    bhopping = on
    if on then
        RunService.Heartbeat:Connect(function()
            if not bhopping then return end
            local h = getHuman()
            if h and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                if h:GetState() == Enum.HumanoidStateType.Freefall then
                    h:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        notify("Bhop","Bhop enabled — hold Space")
    end
end)

addToggle("Toggles","Freecam","Detached freecam mode","freecam",false,function(on)
    local cam = workspace.CurrentCamera
    if on then
        cam.CameraType = Enum.CameraType.Scriptable
        notify("Freecam","Freecam enabled — WASD to move")
        local fcConn
        fcConn = RunService.RenderStepped:Connect(function(dt)
            if not toggleStates["freecam"] then fcConn:Disconnect() cam.CameraType = Enum.CameraType.Custom return end
            local speed = 30 * dt
            local cf = cam.CFrame
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then cam.CFrame = cf * CFrame.new(0,0,-speed) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then cam.CFrame = cf * CFrame.new(0,0,speed) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then cam.CFrame = cf * CFrame.new(-speed,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then cam.CFrame = cf * CFrame.new(speed,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then cam.CFrame = cf * CFrame.new(0,speed,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) then cam.CFrame = cf * CFrame.new(0,-speed,0) end
        end)
    else
        cam.CameraType = Enum.CameraType.Custom
        notify("Freecam","Freecam disabled")
    end
end)

addSection("Toggles","HUD")
addToggle("Toggles","Hide GUI","Toggle visibility of this GUI","hidegui",false,function(on)
    BODY.Visible     = not on
    TITLEBAR.Visible = not on
    if on then notify("GUI","GUI hidden — press F2 to show") end
end)

-- ============================================================
-- DEL MAIN GUI (close + destroy)
-- ============================================================
addSection("Toggles","Danger Zone")
addButton("Toggles","Delete GUI","Permanently remove this GUI",function()
    notify("GUI","Goodbye! GUI deleted.")
    task.wait(1)
    SCREENGUI:Destroy()
end)

-- ============================================================
-- TITLE BAR DRAG
-- ============================================================
do
    local dragging, dragStart, startPos
    TITLEBAR.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging  = true
            dragStart = inp.Position
            startPos  = WIN.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging=false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = inp.Position - dragStart
            WIN.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ============================================================
-- MINIMIZE / CLOSE
-- ============================================================
local minimized = false
MINBTN.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        tween(WIN, {Size=UDim2.new(0,520,0,44)}, 0.3)
        MINBTN.Text = "+"
    else
        tween(WIN, {Size=UDim2.new(0,520,0,560)}, 0.3)
        MINBTN.Text = "−"
    end
end)

CLOSEBTN.MouseButton1Click:Connect(function()
    tween(WIN, {Size=UDim2.new(0,520,0,0), Position=UDim2.new(0.5,-260,0.5,0)}, 0.25)
    task.wait(0.3)
    WIN.Visible = false
end)

-- F2 to re-show
UserInputService.InputBegan:Connect(function(inp, gpe)
    if not gpe and inp.KeyCode == Enum.KeyCode.F2 then
        WIN.Visible = true
        tween(WIN,{Size=UDim2.new(0,520,0,560)},0.3)
        BODY.Visible     = true
        TITLEBAR.Visible = true
    end
end)

-- ============================================================
-- OPEN ANIMATION
-- ============================================================
WIN.Size = UDim2.new(0,520,0,0)
tween(WIN, {Size=UDim2.new(0,520,0,560)}, 0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

notify("Custom Hub","Loaded! F2 to reopen if closed.", 4)
