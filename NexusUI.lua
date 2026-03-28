--[[
    ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗    ██╗   ██╗██╗
    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝    ██║   ██║██║
    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗    ██║   ██║██║
    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║    ██║   ██║██║
    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║    ╚██████╔╝██║
    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝

    NexusUI  |  v1.0.0  |  Roblox UI Library
    Author: YourName
    Style inspired by WindUI
    License: MIT
]]

-- ════════════════════════════════════════════════════
--  SERVICES
-- ════════════════════════════════════════════════════
local cloneref = cloneref or clonereference or function(s) return s end

local RunService    = cloneref(game:GetService("RunService"))
local UserInput     = cloneref(game:GetService("UserInputService"))
local TweenService  = cloneref(game:GetService("TweenService"))
local Players       = cloneref(game:GetService("Players"))
local CoreGui       = cloneref(game:GetService("CoreGui"))

local LocalPlayer   = Players.LocalPlayer
local PlayerGui     = LocalPlayer and LocalPlayer:WaitForChild("PlayerGui")

-- ════════════════════════════════════════════════════
--  THEMES
-- ════════════════════════════════════════════════════
local Themes = {
    Dark = {
        -- Backgrounds
        Background      = Color3.fromHex("#141414"),
        Surface         = Color3.fromHex("#1E1E1E"),
        Elevated        = Color3.fromHex("#252525"),
        -- Sidebar
        Sidebar         = Color3.fromHex("#111111"),
        SidebarItem     = Color3.fromHex("#1A1A1A"),
        SidebarItemHover= Color3.fromHex("#222222"),
        SidebarActive   = Color3.fromHex("#0091FF"),
        -- Topbar
        Topbar          = Color3.fromHex("#161616"),
        TopbarBorder    = Color3.fromHex("#2A2A2A"),
        -- Text
        TextPrimary     = Color3.fromHex("#FFFFFF"),
        TextSecondary   = Color3.fromHex("#A0A0A0"),
        TextMuted       = Color3.fromHex("#606060"),
        -- Accent
        Accent          = Color3.fromHex("#0091FF"),
        AccentHover     = Color3.fromHex("#007ACC"),
        AccentDim       = Color3.fromHex("#0091FF"),
        -- Elements
        ElementBg       = Color3.fromHex("#1E1E1E"),
        ElementBorder   = Color3.fromHex("#2C2C2C"),
        ElementHover    = Color3.fromHex("#242424"),
        -- Toggle
        ToggleOff       = Color3.fromHex("#3A3A3A"),
        ToggleOn        = Color3.fromHex("#0091FF"),
        ToggleThumb     = Color3.fromHex("#FFFFFF"),
        -- Slider
        SliderTrack     = Color3.fromHex("#2E2E2E"),
        SliderFill      = Color3.fromHex("#0091FF"),
        SliderThumb     = Color3.fromHex("#FFFFFF"),
        -- Input
        InputBg         = Color3.fromHex("#161616"),
        InputBorder     = Color3.fromHex("#2C2C2C"),
        InputText       = Color3.fromHex("#FFFFFF"),
        -- Dropdown
        DropdownBg      = Color3.fromHex("#1A1A1A"),
        DropdownBorder  = Color3.fromHex("#2C2C2C"),
        DropdownItem    = Color3.fromHex("#1E1E1E"),
        DropdownHover   = Color3.fromHex("#252525"),
        -- Notification
        NotifBg         = Color3.fromHex("#1C1C1C"),
        NotifBorder     = Color3.fromHex("#2A2A2A"),
        -- Section
        SectionBg       = Color3.fromHex("#181818"),
        SectionBorder   = Color3.fromHex("#282828"),
        -- Scrollbar
        ScrollBar       = Color3.fromHex("#3A3A3A"),
        -- Shadow
        Shadow          = Color3.fromHex("#000000"),
    },
    Light = {
        Background      = Color3.fromHex("#F5F5F5"),
        Surface         = Color3.fromHex("#FFFFFF"),
        Elevated        = Color3.fromHex("#FAFAFA"),
        Sidebar         = Color3.fromHex("#ECECEC"),
        SidebarItem     = Color3.fromHex("#E5E5E5"),
        SidebarItemHover= Color3.fromHex("#D8D8D8"),
        SidebarActive   = Color3.fromHex("#0091FF"),
        Topbar          = Color3.fromHex("#F0F0F0"),
        TopbarBorder    = Color3.fromHex("#DDDDDD"),
        TextPrimary     = Color3.fromHex("#111111"),
        TextSecondary   = Color3.fromHex("#555555"),
        TextMuted       = Color3.fromHex("#999999"),
        Accent          = Color3.fromHex("#0091FF"),
        AccentHover     = Color3.fromHex("#007ACC"),
        AccentDim       = Color3.fromHex("#0091FF"),
        ElementBg       = Color3.fromHex("#FFFFFF"),
        ElementBorder   = Color3.fromHex("#E0E0E0"),
        ElementHover    = Color3.fromHex("#F0F0F0"),
        ToggleOff       = Color3.fromHex("#CCCCCC"),
        ToggleOn        = Color3.fromHex("#0091FF"),
        ToggleThumb     = Color3.fromHex("#FFFFFF"),
        SliderTrack     = Color3.fromHex("#DDDDDD"),
        SliderFill      = Color3.fromHex("#0091FF"),
        SliderThumb     = Color3.fromHex("#FFFFFF"),
        InputBg         = Color3.fromHex("#FFFFFF"),
        InputBorder     = Color3.fromHex("#E0E0E0"),
        InputText       = Color3.fromHex("#111111"),
        DropdownBg      = Color3.fromHex("#FFFFFF"),
        DropdownBorder  = Color3.fromHex("#E0E0E0"),
        DropdownItem    = Color3.fromHex("#F5F5F5"),
        DropdownHover   = Color3.fromHex("#EBEBEB"),
        NotifBg         = Color3.fromHex("#FFFFFF"),
        NotifBorder     = Color3.fromHex("#E0E0E0"),
        SectionBg       = Color3.fromHex("#F8F8F8"),
        SectionBorder   = Color3.fromHex("#E4E4E4"),
        ScrollBar       = Color3.fromHex("#CCCCCC"),
        Shadow          = Color3.fromHex("#AAAAAA"),
    },
}

-- ════════════════════════════════════════════════════
--  LIBRARY CORE
-- ════════════════════════════════════════════════════
local NexusUI = {}
NexusUI.__index = NexusUI

NexusUI.Version   = "1.0.0"
NexusUI.Theme     = Themes.Dark
NexusUI.ThemeName = "Dark"
NexusUI.Themes    = Themes
NexusUI.Font      = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium)
NexusUI.Objects   = {} -- registered theme objects
NexusUI.Signals   = {} -- registered connections
NexusUI.Windows   = {}

-- ─── Utility ───────────────────────────────────────
local function Tween(obj, t, props, style, dir)
    local info = TweenInfo.new(t, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
    local tw   = TweenService:Create(obj, info, props)
    return tw
end

local function SafeCallback(fn, ...)
    if not fn then return end
    local ok, err = pcall(fn, ...)
    if not ok then warn("[NexusUI] Callback error: " .. tostring(err)) end
end

local function New(class, props, children)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then obj[k] = v end
    end
    for _, child in ipairs(children or {}) do
        if child then child.Parent = obj end
    end
    if props and props.Parent then obj.Parent = props.Parent end
    return obj
end

local function AddCorner(parent, radius)
    return New("UICorner", { CornerRadius = UDim.new(0, radius or 6), Parent = parent })
end

local function AddStroke(parent, color, thickness, transparency)
    return New("UIStroke", {
        Color        = color or Color3.fromHex("#2C2C2C"),
        Thickness    = thickness or 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent       = parent,
    })
end

local function AddPadding(parent, top, right, bottom, left)
    return New("UIPadding", {
        PaddingTop    = UDim.new(0, top    or 0),
        PaddingRight  = UDim.new(0, right  or 0),
        PaddingBottom = UDim.new(0, bottom or 0),
        PaddingLeft   = UDim.new(0, left   or 0),
        Parent        = parent,
    })
end

local function AddList(parent, spacing, direction, align)
    return New("UIListLayout", {
        Padding          = UDim.new(0, spacing or 4),
        FillDirection    = direction or Enum.FillDirection.Vertical,
        HorizontalAlignment = align or Enum.HorizontalAlignment.Left,
        SortOrder        = Enum.SortOrder.LayoutOrder,
        Parent           = parent,
    })
end

-- ─── Theme ─────────────────────────────────────────
function NexusUI:RegisterObject(obj, propMap)
    -- propMap = { BackgroundColor3 = "Surface", TextColor3 = "TextPrimary", ... }
    table.insert(NexusUI.Objects, { Object = obj, Props = propMap })
    NexusUI:_ApplyTheme(obj, propMap)
    return obj
end

function NexusUI:_ApplyTheme(obj, propMap)
    for prop, colorKey in pairs(propMap) do
        local val = NexusUI.Theme[colorKey]
        if val then obj[prop] = val end
    end
end

function NexusUI:SetTheme(name)
    local t = Themes[name]
    if not t then return warn("[NexusUI] Unknown theme: " .. tostring(name)) end
    NexusUI.Theme     = t
    NexusUI.ThemeName = name
    for _, entry in ipairs(NexusUI.Objects) do
        NexusUI:_ApplyTheme(entry.Object, entry.Props)
    end
end

-- ─── Signals ───────────────────────────────────────
function NexusUI:AddSignal(signal, fn)
    local conn = signal:Connect(fn)
    table.insert(NexusUI.Signals, conn)
    return conn
end

function NexusUI:Destroy()
    for _, conn in ipairs(NexusUI.Signals) do pcall(function() conn:Disconnect() end) end
    for _, win in ipairs(NexusUI.Windows) do pcall(function() win.ScreenGui:Destroy() end) end
    NexusUI.Signals = {}
    NexusUI.Windows = {}
    NexusUI.Objects = {}
end

-- ════════════════════════════════════════════════════
--  NOTIFICATION SYSTEM
-- ════════════════════════════════════════════════════
local NotifGui = New("ScreenGui", {
    Name          = "NexusUI_Notifications",
    ResetOnSpawn  = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Parent        = (pcall(function() return CoreGui end) and CoreGui) or PlayerGui,
})

local NotifHolder = New("Frame", {
    Name              = "Holder",
    BackgroundTransparency = 1,
    Size              = UDim2.new(0, 300, 1, 0),
    Position          = UDim2.new(1, -316, 0, 0),
    Parent            = NotifGui,
})
AddList(NotifHolder, 8)
AddPadding(NotifHolder, 16, 0, 16, 0)

local function Notify(options)
    options = options or {}
    local title    = options.Title   or "Notification"
    local content  = options.Content or ""
    local duration = options.Duration or 5
    local colorKey = options.Type == "Success" and "Accent"
                  or options.Type == "Error"   and "#e53935"
                  or "Accent"

    local accentColor = typeof(colorKey) == "string" and colorKey:sub(1,1) == "#"
        and Color3.fromHex(colorKey)
        or NexusUI.Theme.Accent

    local notif = New("Frame", {
        Name              = "Notification",
        BackgroundColor3  = NexusUI.Theme.NotifBg,
        Size              = UDim2.new(1, 0, 0, 0),
        AutomaticSize     = Enum.AutomaticSize.Y,
        ClipsDescendants  = true,
        Parent            = NotifHolder,
    })
    AddCorner(notif, 8)
    AddStroke(notif, NexusUI.Theme.NotifBorder, 1, 0)

    -- Accent left bar
    New("Frame", {
        Name             = "Bar",
        BackgroundColor3 = accentColor,
        Size             = UDim2.new(0, 3, 1, 0),
        Position         = UDim2.new(0, 0, 0, 0),
        Parent           = notif,
    })
    AddCorner(New("Frame",{
        Name="BarInner", BackgroundColor3=accentColor,
        Size=UDim2.new(0,3,1,0), Parent=notif
    }), 2)

    local content_frame = New("Frame", {
        Name             = "Content",
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, -16, 0, 0),
        Position         = UDim2.new(0, 14, 0, 0),
        AutomaticSize    = Enum.AutomaticSize.Y,
        Parent           = notif,
    })
    AddList(content_frame, 2)
    AddPadding(content_frame, 10, 8, 10, 4)

    New("TextLabel", {
        Name             = "Title",
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, 0, 0, 16),
        Font             = Enum.Font.GothamBold,
        Text             = title,
        TextColor3       = NexusUI.Theme.TextPrimary,
        TextSize         = 13,
        TextXAlignment   = Enum.TextXAlignment.Left,
        Parent           = content_frame,
    })

    New("TextLabel", {
        Name             = "Desc",
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, 0, 0, 0),
        AutomaticSize    = Enum.AutomaticSize.Y,
        Font             = Enum.Font.Gotham,
        Text             = content,
        TextColor3       = NexusUI.Theme.TextSecondary,
        TextSize         = 12,
        TextXAlignment   = Enum.TextXAlignment.Left,
        TextWrapped      = true,
        Parent           = content_frame,
    })

    -- Duration bar
    local durBar = New("Frame", {
        Name             = "DurBar",
        BackgroundColor3 = accentColor,
        BackgroundTransparency = 0.7,
        Size             = UDim2.new(1, 0, 0, 2),
        Position         = UDim2.new(0, 0, 1, -2),
        Parent           = notif,
    })

    -- Animate in
    notif.BackgroundTransparency = 1
    Tween(notif, 0.3, { BackgroundTransparency = 0 }):Play()
    Tween(durBar, duration, { Size = UDim2.new(0, 0, 0, 2) }):Play()

    task.delay(duration, function()
        Tween(notif, 0.25, { BackgroundTransparency = 1 }):Play()
        task.wait(0.3)
        notif:Destroy()
    end)

    return notif
end

NexusUI.Notify = Notify

-- ════════════════════════════════════════════════════
--  WINDOW
-- ════════════════════════════════════════════════════
function NexusUI:CreateWindow(options)
    options = options or {}

    local title    = options.Title   or "NexusUI"
    local author   = options.Author  or ""
    local size     = options.Size    or Vector2.new(560, 380)
    local theme    = options.Theme   or "Dark"
    local icon     = options.Icon    or ""
    local canClose = options.CanClose ~= false
    local canMin   = options.CanMinimize ~= false

    NexusUI:SetTheme(theme)

    -- ScreenGui
    local gui = New("ScreenGui", {
        Name          = "NexusUI_" .. title,
        ResetOnSpawn  = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true,
        Parent        = (pcall(function() return CoreGui end) and CoreGui) or PlayerGui,
    })

    -- Shadow
    local shadow = New("ImageLabel", {
        Name              = "Shadow",
        BackgroundTransparency = 1,
        Image             = "rbxassetid://6014260530",
        ImageColor3       = Color3.new(0,0,0),
        ImageTransparency = 0.5,
        ScaleType         = Enum.ScaleType.Slice,
        SliceCenter       = Rect.new(49, 49, 450, 450),
        Size              = UDim2.new(0, size.X + 48, 0, size.Y + 48),
        Position          = UDim2.fromScale(0.5, 0.5),
        AnchorPoint       = Vector2.new(0.5, 0.5),
        Parent            = gui,
    })

    -- Main window frame
    local main = New("Frame", {
        Name             = "Main",
        BackgroundColor3 = NexusUI.Theme.Background,
        Size             = UDim2.new(0, size.X, 0, size.Y),
        Position         = UDim2.fromScale(0.5, 0.5),
        AnchorPoint      = Vector2.new(0.5, 0.5),
        ClipsDescendants = true,
        Parent           = gui,
    })
    AddCorner(main, 10)
    NexusUI:RegisterObject(main, { BackgroundColor3 = "Background" })

    -- ── Topbar ─────────────────────────────────────
    local topbar = New("Frame", {
        Name             = "Topbar",
        BackgroundColor3 = NexusUI.Theme.Topbar,
        Size             = UDim2.new(1, 0, 0, 44),
        Parent           = main,
    })
    NexusUI:RegisterObject(topbar, { BackgroundColor3 = "Topbar" })

    -- Topbar bottom border
    New("Frame", {
        Name             = "Border",
        BackgroundColor3 = NexusUI.Theme.TopbarBorder,
        Size             = UDim2.new(1, 0, 0, 1),
        Position         = UDim2.new(0, 0, 1, -1),
        Parent           = topbar,
    })

    -- Icon
    if icon ~= "" then
        New("ImageLabel", {
            Name             = "Icon",
            BackgroundTransparency = 1,
            Image            = icon,
            Size             = UDim2.new(0, 18, 0, 18),
            Position         = UDim2.new(0, 14, 0.5, -9),
            Parent           = topbar,
        })
    end

    local titleOffset = icon ~= "" and 40 or 14

    -- Title
    New("TextLabel", {
        Name             = "Title",
        BackgroundTransparency = 1,
        Font             = Enum.Font.GothamBold,
        Text             = title,
        TextColor3       = NexusUI.Theme.TextPrimary,
        TextSize         = 14,
        TextXAlignment   = Enum.TextXAlignment.Left,
        Size             = UDim2.new(0.5, 0, 1, 0),
        Position         = UDim2.new(0, titleOffset, 0, 0),
        Parent           = topbar,
    })

    -- Author
    if author ~= "" then
        New("TextLabel", {
            Name             = "Author",
            BackgroundTransparency = 1,
            Font             = Enum.Font.Gotham,
            Text             = "by " .. author,
            TextColor3       = NexusUI.Theme.TextMuted,
            TextSize         = 11,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Size             = UDim2.new(0.4, 0, 1, 0),
            Position         = UDim2.new(0, titleOffset + 70, 0, 0),
            Parent           = topbar,
        })
    end

    -- Topbar buttons (right side)
    local btnHolder = New("Frame", {
        Name             = "Buttons",
        BackgroundTransparency = 1,
        Size             = UDim2.new(0, 80, 1, 0),
        Position         = UDim2.new(1, -88, 0, 0),
        Parent           = topbar,
    })
    AddList(btnHolder, 6, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Right)
    AddPadding(btnHolder, 0, 10, 0, 0)

    local function MakeTopbarButton(icon_text, color, callback)
        local btn = New("TextButton", {
            Name             = icon_text,
            BackgroundColor3 = NexusUI.Theme.Elevated,
            Size             = UDim2.new(0, 26, 0, 26),
            Font             = Enum.Font.GothamBold,
            Text             = icon_text,
            TextColor3       = color,
            TextSize         = 12,
            AutoButtonColor  = false,
            Parent           = btnHolder,
        })
        AddCorner(btn, 6)
        btn.MouseEnter:Connect(function()
            Tween(btn, 0.15, { BackgroundColor3 = NexusUI.Theme.ElementHover }):Play()
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, 0.15, { BackgroundColor3 = NexusUI.Theme.Elevated }):Play()
        end)
        btn.MouseButton1Click:Connect(function()
            SafeCallback(callback)
        end)
        return btn
    end

    local minimized = false
    local contentArea -- defined later

    if canMin then
        MakeTopbarButton("−", NexusUI.Theme.TextSecondary, function()
            minimized = not minimized
            if contentArea then
                Tween(main, 0.25, {
                    Size = minimized
                        and UDim2.new(0, size.X, 0, 44)
                        or  UDim2.new(0, size.X, 0, size.Y)
                }):Play()
                Tween(shadow, 0.25, {
                    Size = minimized
                        and UDim2.new(0, size.X + 48, 0, 44 + 48)
                        or  UDim2.new(0, size.X + 48, 0, size.Y + 48)
                }):Play()
            end
        end)
    end

    if canClose then
        MakeTopbarButton("✕", Color3.fromHex("#e53935"), function()
            Tween(main, 0.25, { Size = UDim2.new(0, size.X, 0, 0) }):Play()
            Tween(shadow, 0.25, { ImageTransparency = 1 }):Play()
            task.wait(0.3)
            gui:Destroy()
        end)
    end

    -- ── Drag ───────────────────────────────────────
    do
        local dragging, dragStart, startPos = false, nil, nil
        topbar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging  = true
                dragStart = input.Position
                startPos  = main.Position
            end
        end)
        topbar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        UserInput.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
                shadow.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end

    -- ── Body (sidebar + content) ────────────────────
    local body = New("Frame", {
        Name             = "Body",
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, 0, 1, -44),
        Position         = UDim2.new(0, 0, 0, 44),
        Parent           = main,
    })

    -- Sidebar
    local sidebar = New("Frame", {
        Name             = "Sidebar",
        BackgroundColor3 = NexusUI.Theme.Sidebar,
        Size             = UDim2.new(0, 140, 1, 0),
        Parent           = body,
    })
    NexusUI:RegisterObject(sidebar, { BackgroundColor3 = "Sidebar" })

    -- Sidebar right border
    New("Frame", {
        Name             = "Border",
        BackgroundColor3 = NexusUI.Theme.TopbarBorder,
        Size             = UDim2.new(0, 1, 1, 0),
        Position         = UDim2.new(1, -1, 0, 0),
        Parent           = sidebar,
    })

    local tabContainer = New("ScrollingFrame", {
        Name                     = "TabContainer",
        BackgroundTransparency   = 1,
        Size                     = UDim2.new(1, 0, 1, -8),
        Position                 = UDim2.new(0, 0, 0, 8),
        ScrollBarThickness       = 2,
        ScrollBarImageColor3     = NexusUI.Theme.ScrollBar,
        CanvasSize               = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize      = Enum.AutomaticSize.Y,
        ScrollingDirection       = Enum.ScrollingDirection.Y,
        Parent                   = sidebar,
    })
    AddList(tabContainer, 2)
    AddPadding(tabContainer, 4, 6, 4, 6)

    -- Content area
    contentArea = New("ScrollingFrame", {
        Name                   = "Content",
        BackgroundColor3       = NexusUI.Theme.Surface,
        Size                   = UDim2.new(1, -140, 1, 0),
        Position               = UDim2.new(0, 140, 0, 0),
        ScrollBarThickness     = 3,
        ScrollBarImageColor3   = NexusUI.Theme.ScrollBar,
        CanvasSize             = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize    = Enum.AutomaticSize.Y,
        ScrollingDirection     = Enum.ScrollingDirection.Y,
        BorderSizePixel        = 0,
        Parent                 = body,
    })
    NexusUI:RegisterObject(contentArea, { BackgroundColor3 = "Surface" })
    AddPadding(contentArea, 10, 10, 10, 10)
    AddList(contentArea, 8)

    -- ── Window Object ───────────────────────────────
    local Window = {}
    Window.ScreenGui    = gui
    Window.Main         = main
    Window.Topbar       = topbar
    Window.TabContainer = tabContainer
    Window.ContentArea  = contentArea
    Window.ActiveTab    = nil
    Window.Tabs         = {}

    -- Entrance animation
    main.Size = UDim2.new(0, size.X, 0, 0)
    shadow.ImageTransparency = 1
    task.wait(0.05)
    Tween(main, 0.4, { Size = UDim2.new(0, size.X, 0, size.Y) }):Play()
    Tween(shadow, 0.4, { ImageTransparency = 0.5 }):Play()

    -- ════════════════════════════════════
    --  TAB
    -- ════════════════════════════════════
    function Window:CreateTab(tabOptions)
        tabOptions = tabOptions or {}
        local tabTitle = tabOptions.Title or "Tab"

        -- Sidebar button
        local tabBtn = New("TextButton", {
            Name             = tabTitle,
            BackgroundColor3 = NexusUI.Theme.SidebarItem,
            BackgroundTransparency = 1,
            Size             = UDim2.new(1, 0, 0, 34),
            Font             = Enum.Font.Gotham,
            Text             = "",
            AutoButtonColor  = false,
            Parent           = tabContainer,
        })
        AddCorner(tabBtn, 6)
        AddPadding(tabBtn, 0, 6, 0, 8)

        local tabLabel = New("TextLabel", {
            Name             = "Label",
            BackgroundTransparency = 1,
            Font             = Enum.Font.Gotham,
            Text             = tabTitle,
            TextColor3       = NexusUI.Theme.TextSecondary,
            TextSize         = 13,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Size             = UDim2.new(1, 0, 1, 0),
            Parent           = tabBtn,
        })

        -- Active indicator
        local indicator = New("Frame", {
            Name             = "Indicator",
            BackgroundColor3 = NexusUI.Theme.Accent,
            BackgroundTransparency = 1,
            Size             = UDim2.new(0, 3, 0.6, 0),
            Position         = UDim2.new(0, -8, 0.2, 0),
            Parent           = tabBtn,
        })
        AddCorner(indicator, 3)

        -- Page (invisible frame holding elements)
        local page = New("Frame", {
            Name             = tabTitle .. "_Page",
            BackgroundTransparency = 1,
            Size             = UDim2.new(1, 0, 0, 0),
            AutomaticSize    = Enum.AutomaticSize.Y,
            Visible          = false,
            Parent           = contentArea,
        })
        AddList(page, 8)

        local Tab = {}
        Tab.Button    = tabBtn
        Tab.Label     = tabLabel
        Tab.Indicator = indicator
        Tab.Page      = page
        Tab.Window    = Window

        -- Activate
        function Tab:Activate()
            -- Deactivate all
            for _, t in ipairs(Window.Tabs) do
                t.Page.Visible = false
                Tween(t.Button, 0.15, { BackgroundTransparency = 1 }):Play()
                Tween(t.Label, 0.15, { TextColor3 = NexusUI.Theme.TextSecondary }):Play()
                Tween(t.Indicator, 0.15, { BackgroundTransparency = 1 }):Play()
            end
            -- Activate this
            page.Visible = true
            Tween(tabBtn, 0.15, { BackgroundTransparency = 0 }):Play()
            Tween(tabLabel, 0.15, { TextColor3 = NexusUI.Theme.TextPrimary }):Play()
            Tween(indicator, 0.15, { BackgroundTransparency = 0 }):Play()
            Window.ActiveTab = Tab
        end

        tabBtn.MouseEnter:Connect(function()
            if Window.ActiveTab ~= Tab then
                Tween(tabBtn, 0.15, { BackgroundTransparency = 0.7 }):Play()
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if Window.ActiveTab ~= Tab then
                Tween(tabBtn, 0.15, { BackgroundTransparency = 1 }):Play()
            end
        end)
        tabBtn.MouseButton1Click:Connect(function()
            Tab:Activate()
        end)

        table.insert(Window.Tabs, Tab)

        -- Auto-select first tab
        if #Window.Tabs == 1 then
            Tab:Activate()
        end

        -- ════════════════════════════════
        --  SECTION
        -- ════════════════════════════════
        function Tab:CreateSection(secOptions)
            secOptions = secOptions or {}
            local secTitle = secOptions.Title or ""

            local section = New("Frame", {
                Name             = secTitle,
                BackgroundColor3 = NexusUI.Theme.SectionBg,
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                Parent           = page,
            })
            AddCorner(section, 8)
            AddStroke(section, NexusUI.Theme.SectionBorder, 1, 0)
            NexusUI:RegisterObject(section, { BackgroundColor3 = "SectionBg" })

            local inner = New("Frame", {
                Name             = "Inner",
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                Parent           = section,
            })
            AddList(inner, 4)
            AddPadding(inner, 8, 10, 10, 10)

            if secTitle ~= "" then
                local header = New("Frame", {
                    Name             = "Header",
                    BackgroundTransparency = 1,
                    Size             = UDim2.new(1, 0, 0, 22),
                    Parent           = inner,
                })

                New("TextLabel", {
                    Name             = "Title",
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.GothamBold,
                    Text             = secTitle:upper(),
                    TextColor3       = NexusUI.Theme.TextMuted,
                    TextSize         = 10,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(1, 0, 1, 0),
                    LetterSpacing    = 2,
                    Parent           = header,
                })

                -- Divider
                New("Frame", {
                    Name             = "Divider",
                    BackgroundColor3 = NexusUI.Theme.ElementBorder,
                    Size             = UDim2.new(1, 0, 0, 1),
                    Position         = UDim2.new(0, 0, 1, -1),
                    Parent           = header,
                })
            end

            local Section = {}

            -- ──────────────────────────────────
            --  BUTTON
            -- ──────────────────────────────────
            function Section:AddButton(opts)
                opts = opts or {}
                local el = New("TextButton", {
                    Name             = opts.Title or "Button",
                    BackgroundColor3 = NexusUI.Theme.ElementBg,
                    Size             = UDim2.new(1, 0, 0, 38),
                    Font             = Enum.Font.Gotham,
                    Text             = "",
                    AutoButtonColor  = false,
                    Parent           = inner,
                })
                AddCorner(el, 6)
                AddStroke(el, NexusUI.Theme.ElementBorder, 1, 0)
                NexusUI:RegisterObject(el, { BackgroundColor3 = "ElementBg" })

                New("TextLabel", {
                    Name             = "Title",
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Title or "Button",
                    TextColor3       = NexusUI.Theme.TextPrimary,
                    TextSize         = 13,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(1, -16, 1, 0),
                    Position         = UDim2.new(0, 12, 0, 0),
                    Parent           = el,
                })

                -- Chevron
                New("TextLabel", {
                    Name             = "Arrow",
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.GothamBold,
                    Text             = "›",
                    TextColor3       = NexusUI.Theme.TextMuted,
                    TextSize         = 16,
                    Size             = UDim2.new(0, 20, 1, 0),
                    Position         = UDim2.new(1, -26, 0, 0),
                    Parent           = el,
                })

                el.MouseEnter:Connect(function()
                    Tween(el, 0.15, { BackgroundColor3 = NexusUI.Theme.ElementHover }):Play()
                end)
                el.MouseLeave:Connect(function()
                    Tween(el, 0.15, { BackgroundColor3 = NexusUI.Theme.ElementBg }):Play()
                end)
                el.MouseButton1Click:Connect(function()
                    SafeCallback(opts.Callback)
                    Tween(el, 0.06, { BackgroundColor3 = NexusUI.Theme.Accent }):Play()
                    task.wait(0.1)
                    Tween(el, 0.15, { BackgroundColor3 = NexusUI.Theme.ElementBg }):Play()
                end)
            end

            -- ──────────────────────────────────
            --  TOGGLE
            -- ──────────────────────────────────
            function Section:AddToggle(opts)
                opts = opts or {}
                local state = opts.Default or false

                local el = New("Frame", {
                    Name             = opts.Title or "Toggle",
                    BackgroundColor3 = NexusUI.Theme.ElementBg,
                    Size             = UDim2.new(1, 0, 0, 38),
                    Parent           = inner,
                })
                AddCorner(el, 6)
                AddStroke(el, NexusUI.Theme.ElementBorder, 1, 0)
                NexusUI:RegisterObject(el, { BackgroundColor3 = "ElementBg" })

                New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Title or "Toggle",
                    TextColor3       = NexusUI.Theme.TextPrimary,
                    TextSize         = 13,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(1, -60, 1, 0),
                    Position         = UDim2.new(0, 12, 0, 0),
                    Parent           = el,
                })

                -- Track
                local track = New("Frame", {
                    BackgroundColor3 = state and NexusUI.Theme.ToggleOn or NexusUI.Theme.ToggleOff,
                    Size             = UDim2.new(0, 36, 0, 20),
                    Position         = UDim2.new(1, -48, 0.5, -10),
                    Parent           = el,
                })
                AddCorner(track, 10)

                -- Thumb
                local thumb = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.ToggleThumb,
                    Size             = UDim2.new(0, 14, 0, 14),
                    Position         = state and UDim2.new(0, 19, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
                    Parent           = track,
                })
                AddCorner(thumb, 7)

                -- Hit area
                local hit = New("TextButton", {
                    BackgroundTransparency = 1,
                    Size             = UDim2.new(1, 0, 1, 0),
                    Text             = "",
                    AutoButtonColor  = false,
                    Parent           = el,
                })

                local Toggle = {}
                Toggle.Value = state

                function Toggle:Set(val)
                    Toggle.Value = val
                    Tween(track, 0.2, {
                        BackgroundColor3 = val and NexusUI.Theme.ToggleOn or NexusUI.Theme.ToggleOff
                    }):Play()
                    Tween(thumb, 0.2, {
                        Position = val and UDim2.new(0, 19, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
                    }):Play()
                    SafeCallback(opts.Callback, val)
                end

                hit.MouseButton1Click:Connect(function()
                    Toggle:Set(not Toggle.Value)
                end)

                return Toggle
            end

            -- ──────────────────────────────────
            --  SLIDER
            -- ──────────────────────────────────
            function Section:AddSlider(opts)
                opts = opts or {}
                local min  = opts.Min     or 0
                local max  = opts.Max     or 100
                local def  = opts.Default or min
                local suf  = opts.Suffix  or ""
                local val  = math.clamp(def, min, max)

                local el = New("Frame", {
                    Name             = opts.Title or "Slider",
                    BackgroundColor3 = NexusUI.Theme.ElementBg,
                    Size             = UDim2.new(1, 0, 0, 52),
                    Parent           = inner,
                })
                AddCorner(el, 6)
                AddStroke(el, NexusUI.Theme.ElementBorder, 1, 0)
                NexusUI:RegisterObject(el, { BackgroundColor3 = "ElementBg" })

                New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Title or "Slider",
                    TextColor3       = NexusUI.Theme.TextPrimary,
                    TextSize         = 13,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(0.7, 0, 0, 20),
                    Position         = UDim2.new(0, 12, 0, 8),
                    Parent           = el,
                })

                local valLabel = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.GothamBold,
                    Text             = tostring(val) .. suf,
                    TextColor3       = NexusUI.Theme.Accent,
                    TextSize         = 12,
                    TextXAlignment   = Enum.TextXAlignment.Right,
                    Size             = UDim2.new(0.3, -12, 0, 20),
                    Position         = UDim2.new(0.7, 0, 0, 8),
                    Parent           = el,
                })

                local track = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.SliderTrack,
                    Size             = UDim2.new(1, -24, 0, 4),
                    Position         = UDim2.new(0, 12, 0, 36),
                    Parent           = el,
                })
                AddCorner(track, 2)

                local fill = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.SliderFill,
                    Size             = UDim2.new((val - min) / (max - min), 0, 1, 0),
                    Parent           = track,
                })
                AddCorner(fill, 2)

                local thumb = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.SliderThumb,
                    Size             = UDim2.new(0, 12, 0, 12),
                    Position         = UDim2.new((val - min) / (max - min), -6, 0.5, -6),
                    Parent           = track,
                })
                AddCorner(thumb, 6)
                AddStroke(thumb, NexusUI.Theme.Accent, 2, 0)

                local Slider = {}
                Slider.Value = val

                local function SetSlider(pct)
                    pct = math.clamp(pct, 0, 1)
                    local rounded = math.round(min + (max - min) * pct)
                    Slider.Value = rounded
                    valLabel.Text = tostring(rounded) .. suf
                    Tween(fill, 0.05, { Size = UDim2.new(pct, 0, 1, 0) }):Play()
                    Tween(thumb, 0.05, { Position = UDim2.new(pct, -6, 0.5, -6) }):Play()
                    SafeCallback(opts.Callback, rounded)
                end

                local dragging = false
                local hitbox = New("TextButton", {
                    BackgroundTransparency = 1,
                    Size             = UDim2.new(1, 0, 0, 20),
                    Position         = UDim2.new(0, 0, 0, -8),
                    Text             = "",
                    AutoButtonColor  = false,
                    Parent           = track,
                })
                hitbox.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end)
                hitbox.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                UserInput.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local absPos  = track.AbsolutePosition.X
                        local absSize = track.AbsoluteSize.X
                        local pct = (input.Position.X - absPos) / absSize
                        SetSlider(pct)
                    end
                end)

                function Slider:Set(v)
                    SetSlider((v - min) / (max - min))
                end

                return Slider
            end

            -- ──────────────────────────────────
            --  INPUT (TextBox)
            -- ──────────────────────────────────
            function Section:AddInput(opts)
                opts = opts or {}

                local el = New("Frame", {
                    Name             = opts.Title or "Input",
                    BackgroundColor3 = NexusUI.Theme.ElementBg,
                    Size             = UDim2.new(1, 0, 0, 56),
                    Parent           = inner,
                })
                AddCorner(el, 6)
                AddStroke(el, NexusUI.Theme.ElementBorder, 1, 0)
                NexusUI:RegisterObject(el, { BackgroundColor3 = "ElementBg" })

                New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Title or "Input",
                    TextColor3       = NexusUI.Theme.TextPrimary,
                    TextSize         = 12,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(1, -16, 0, 18),
                    Position         = UDim2.new(0, 12, 0, 6),
                    Parent           = el,
                })

                local inputBg = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.InputBg,
                    Size             = UDim2.new(1, -24, 0, 24),
                    Position         = UDim2.new(0, 12, 0, 26),
                    Parent           = el,
                })
                AddCorner(inputBg, 4)
                AddStroke(inputBg, NexusUI.Theme.InputBorder, 1, 0)

                local textbox = New("TextBox", {
                    BackgroundTransparency = 1,
                    ClearTextOnFocus = false,
                    Font             = Enum.Font.Gotham,
                    PlaceholderText  = opts.Placeholder or "",
                    PlaceholderColor3 = NexusUI.Theme.TextMuted,
                    Text             = opts.Default or "",
                    TextColor3       = NexusUI.Theme.InputText,
                    TextSize         = 12,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(1, -12, 1, 0),
                    Position         = UDim2.new(0, 8, 0, 0),
                    Parent           = inputBg,
                })

                textbox.FocusLost:Connect(function(enter)
                    SafeCallback(opts.Callback, textbox.Text, enter)
                end)

                local Input = {}
                Input.TextBox = textbox

                function Input:Set(v)
                    textbox.Text = tostring(v)
                end

                function Input:Get()
                    return textbox.Text
                end

                return Input
            end

            -- ──────────────────────────────────
            --  DROPDOWN
            -- ──────────────────────────────────
            function Section:AddDropdown(opts)
                opts = opts or {}
                local items    = opts.Items   or {}
                local selected = opts.Default or (items[1] or "")
                local open     = false

                local el = New("Frame", {
                    Name             = opts.Title or "Dropdown",
                    BackgroundColor3 = NexusUI.Theme.ElementBg,
                    Size             = UDim2.new(1, 0, 0, 38),
                    ClipsDescendants = false,
                    ZIndex           = 5,
                    Parent           = inner,
                })
                AddCorner(el, 6)
                AddStroke(el, NexusUI.Theme.ElementBorder, 1, 0)
                NexusUI:RegisterObject(el, { BackgroundColor3 = "ElementBg" })

                New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Title or "Dropdown",
                    TextColor3       = NexusUI.Theme.TextPrimary,
                    TextSize         = 13,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Size             = UDim2.new(0.6, 0, 1, 0),
                    Position         = UDim2.new(0, 12, 0, 0),
                    ZIndex           = 5,
                    Parent           = el,
                })

                local selectedLabel = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = selected,
                    TextColor3       = NexusUI.Theme.Accent,
                    TextSize         = 12,
                    TextXAlignment   = Enum.TextXAlignment.Right,
                    Size             = UDim2.new(0.35, 0, 1, 0),
                    Position         = UDim2.new(0.6, 0, 0, 0),
                    ZIndex           = 5,
                    Parent           = el,
                })

                local arrow = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.GothamBold,
                    Text             = "⌄",
                    TextColor3       = NexusUI.Theme.TextMuted,
                    TextSize         = 14,
                    Size             = UDim2.new(0, 20, 1, 0),
                    Position         = UDim2.new(1, -24, 0, 0),
                    ZIndex           = 5,
                    Parent           = el,
                })

                local list = New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.DropdownBg,
                    Size             = UDim2.new(1, 0, 0, 0),
                    Position         = UDim2.new(0, 0, 1, 4),
                    ClipsDescendants = true,
                    ZIndex           = 10,
                    Visible          = false,
                    Parent           = el,
                })
                AddCorner(list, 6)
                AddStroke(list, NexusUI.Theme.DropdownBorder, 1, 0)

                local listInner = New("Frame", {
                    BackgroundTransparency = 1,
                    Size             = UDim2.new(1, 0, 0, 0),
                    AutomaticSize    = Enum.AutomaticSize.Y,
                    ZIndex           = 10,
                    Parent           = list,
                })
                AddList(listInner, 2)
                AddPadding(listInner, 4, 4, 4, 4)

                local Dropdown = {}
                Dropdown.Value = selected

                local function CloseList()
                    open = false
                    Tween(arrow, 0.15, { Rotation = 0 }):Play()
                    Tween(list, 0.15, { Size = UDim2.new(1, 0, 0, 0) }):Play()
                    task.wait(0.15)
                    if not open then list.Visible = false end
                end

                local function BuildItems()
                    for _, ch in ipairs(listInner:GetChildren()) do
                        if ch:IsA("TextButton") then ch:Destroy() end
                    end
                    for _, item in ipairs(items) do
                        local btn = New("TextButton", {
                            BackgroundColor3 = NexusUI.Theme.DropdownItem,
                            Size             = UDim2.new(1, 0, 0, 28),
                            Font             = Enum.Font.Gotham,
                            Text             = tostring(item),
                            TextColor3       = item == Dropdown.Value and NexusUI.Theme.Accent or NexusUI.Theme.TextPrimary,
                            TextSize         = 12,
                            TextXAlignment   = Enum.TextXAlignment.Left,
                            AutoButtonColor  = false,
                            ZIndex           = 11,
                            Parent           = listInner,
                        })
                        AddCorner(btn, 4)
                        AddPadding(btn, 0, 0, 0, 8)

                        btn.MouseEnter:Connect(function()
                            Tween(btn, 0.1, { BackgroundColor3 = NexusUI.Theme.DropdownHover }):Play()
                        end)
                        btn.MouseLeave:Connect(function()
                            Tween(btn, 0.1, { BackgroundColor3 = NexusUI.Theme.DropdownItem }):Play()
                        end)
                        btn.MouseButton1Click:Connect(function()
                            Dropdown.Value = item
                            selectedLabel.Text = tostring(item)
                            SafeCallback(opts.Callback, item)
                            CloseList()
                            BuildItems()
                        end)
                    end
                end
                BuildItems()

                -- Toggle
                local hit = New("TextButton", {
                    BackgroundTransparency = 1,
                    Size             = UDim2.new(1, 0, 1, 0),
                    Text             = "",
                    ZIndex           = 6,
                    AutoButtonColor  = false,
                    Parent           = el,
                })
                hit.MouseButton1Click:Connect(function()
                    open = not open
                    if open then
                        list.Visible = true
                        Tween(arrow, 0.15, { Rotation = 180 }):Play()
                        local h = math.min(#items * 32 + 8, 160)
                        Tween(list, 0.2, { Size = UDim2.new(1, 0, 0, h) }):Play()
                    else
                        CloseList()
                    end
                end)

                function Dropdown:Set(v)
                    Dropdown.Value = v
                    selectedLabel.Text = tostring(v)
                    BuildItems()
                end

                function Dropdown:SetItems(newItems)
                    items = newItems
                    BuildItems()
                end

                return Dropdown
            end

            -- ──────────────────────────────────
            --  LABEL
            -- ──────────────────────────────────
            function Section:AddLabel(opts)
                opts = opts or {}
                local lbl = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.Gotham,
                    Text             = opts.Text or "",
                    TextColor3       = NexusUI.Theme.TextSecondary,
                    TextSize         = 12,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    TextWrapped      = true,
                    Size             = UDim2.new(1, 0, 0, 0),
                    AutomaticSize    = Enum.AutomaticSize.Y,
                    Parent           = inner,
                })
                AddPadding(lbl, 2, 4, 2, 12)

                local Label = {}
                function Label:Set(text)
                    lbl.Text = text
                end
                return Label
            end

            -- ──────────────────────────────────
            --  SEPARATOR
            -- ──────────────────────────────────
            function Section:AddSeparator()
                New("Frame", {
                    BackgroundColor3 = NexusUI.Theme.ElementBorder,
                    Size             = UDim2.new(1, 0, 0, 1),
                    Parent           = inner,
                })
            end

            return Section
        end

        return Tab
    end

    table.insert(NexusUI.Windows, Window)
    return Window
end

-- ════════════════════════════════════════════════════
--  PUBLIC API
-- ════════════════════════════════════════════════════
return NexusUI
