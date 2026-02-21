--[[
    ViolentUI Library - Blue/Violet Theme
    A Luau UI Library inspired by classic cheat-style menus
    Compatible with Roblox (ScreenGui approach)
    
    Usage:
        local UI = loadstring(game:HttpGet("..."))() -- or require/load directly
        local Window = UI:CreateWindow("MY MENU")
        local Tab = Window:CreateTab("VISUALS / HUD")
        Tab:Toggle("Enable ESP", false, function(val) print(val) end)
        Tab:Slider("Max Distance", 0, 1000, 500, function(val) print(val) end)
]]

local ViolentUI = {}
ViolentUI.__index = ViolentUI

-- ─────────────────────────────────────────────
-- THEME
-- ─────────────────────────────────────────────
local THEME = {
    -- Backgrounds
    BG_DARK      = Color3.fromRGB(12,  10,  30),   -- deepest bg
    BG_MID       = Color3.fromRGB(22,  18,  50),   -- panel bg
    BG_ITEM      = Color3.fromRGB(30,  25,  65),   -- row bg
    BG_ITEM_ALT  = Color3.fromRGB(26,  21,  58),   -- alternating row

    -- Accents
    ACCENT       = Color3.fromRGB(90,  50, 255),   -- violet
    ACCENT2      = Color3.fromRGB(50, 120, 255),   -- blue
    HIGHLIGHT    = Color3.fromRGB(110, 70, 255),   -- hover / selected
    NEON         = Color3.fromRGB(140, 90, 255),   -- glow

    -- Text
    TEXT_PRIMARY = Color3.fromRGB(230, 225, 255),
    TEXT_DIM     = Color3.fromRGB(150, 140, 200),
    TEXT_TITLE   = Color3.fromRGB(255, 255, 255),

    -- Misc
    DIVIDER      = Color3.fromRGB(70,  55, 140),
    TOGGLE_ON    = Color3.fromRGB(90,  50, 255),
    TOGGLE_OFF   = Color3.fromRGB(45,  35, 100),
    CHECK_TICK   = Color3.fromRGB(255, 255, 255),
}

local FONT_TITLE  = Enum.Font.GothamBold
local FONT_BODY   = Enum.Font.Gotham
local FONT_LABEL  = Enum.Font.GothamSemibold

-- ─────────────────────────────────────────────
-- HELPERS
-- ─────────────────────────────────────────────
local function Make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    if parent then obj.Parent = parent end
    return obj
end

local function Stroke(parent, color, thickness)
    return Make("UIStroke", {
        Color     = color or THEME.ACCENT,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end

local function Corner(parent, radius)
    return Make("UICorner", { CornerRadius = UDim.new(0, radius or 4) }, parent)
end

local function Gradient(parent, c0, c1, rotation)
    return Make("UIGradient", {
        Color    = ColorSequence.new(c0 or THEME.ACCENT, c1 or THEME.ACCENT2),
        Rotation = rotation or 90,
    }, parent)
end

local function AddPadding(parent, px)
    return Make("UIPadding", {
        PaddingLeft   = UDim.new(0, px),
        PaddingRight  = UDim.new(0, px),
        PaddingTop    = UDim.new(0, px),
        PaddingBottom = UDim.new(0, px),
    }, parent)
end

local function AddListLayout(parent, spacing, dir)
    return Make("UIListLayout", {
        SortOrder       = Enum.SortOrder.LayoutOrder,
        FillDirection   = dir or Enum.FillDirection.Vertical,
        Padding         = UDim.new(0, spacing or 0),
    }, parent)
end

-- Tween helper (simple lerp via Heartbeat for Roblox compat)
local TweenService = game:GetService("TweenService")
local function Tween(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t or 0.15, Enum.EasingStyle.Quad), props):Play()
end

-- ─────────────────────────────────────────────
-- DRAGGING
-- ─────────────────────────────────────────────
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function MakeDraggable(frame, handle)
    -- handle must be a TextButton so InputBegan fires even when children exist
    local dragging  = false
    local dragStart = nil
    local startPos  = nil

    handle.MouseButton1Down:Connect(function(x, y)
        dragging  = true
        dragStart = Vector2.new(x, y)
        startPos  = frame.Position
    end)

    handle.MouseButton1Up:Connect(function()
        dragging = false
    end)

    -- Also release drag if button released anywhere (mouse leaves handle)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - Vector3.new(dragStart.X, dragStart.Y, 0)
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ─────────────────────────────────────────────
-- WINDOW
-- ─────────────────────────────────────────────
function ViolentUI:CreateWindow(title)
    local Window = {}
    Window._tabs   = {}
    Window._active = nil

    -- ScreenGui
    local ScreenGui = Make("ScreenGui", {
        Name            = "ViolentUI",
        ResetOnSpawn    = false,
        ZIndexBehavior  = Enum.ZIndexBehavior.Sibling,
    }, game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui"))

    -- Main Frame
    local Main = Make("Frame", {
        Name            = "Main",
        Size            = UDim2.new(0, 320, 0, 480),
        Position        = UDim2.new(0.5, -160, 0.5, -240),
        BackgroundColor3 = THEME.BG_DARK,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    }, ScreenGui)
    Corner(Main, 6)
    Stroke(Main, THEME.ACCENT, 1.5)

    -- Subtle outer glow effect using shadow frame
    local Shadow = Make("ImageLabel", {
        Name  = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position    = UDim2.new(0.5, 0, 0.5, 0),
        Size        = UDim2.new(1, 30, 1, 30),
        BackgroundTransparency = 1,
        Image       = "rbxassetid://6015897843",
        ImageColor3 = THEME.ACCENT,
        ImageTransparency = 0.65,
        ScaleType   = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex      = 0,
    }, Main)

    -- ─── TITLE BAR ───
    local TitleBar = Make("Frame", {
        Name             = "TitleBar",
        Size             = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = THEME.BG_MID,
        BorderSizePixel  = 0,
    }, Main)
    -- Gradient on title bar
    Gradient(TitleBar, THEME.ACCENT, THEME.ACCENT2, 0)
    Corner(TitleBar, 6)

    -- Cover bottom corners of title bar
    Make("Frame", {
        Size             = UDim2.new(1, 0, 0, 8),
        Position         = UDim2.new(0, 0, 1, -8),
        BackgroundColor3 = THEME.ACCENT,
        BorderSizePixel  = 0,
    }, TitleBar)

    -- Title Text
    local TitleLabel = Make("TextLabel", {
        Text             = string.upper(title or "MENU"),
        Font             = FONT_TITLE,
        TextSize         = 20,
        TextColor3       = THEME.TEXT_TITLE,
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, -60, 1, 0),
        Position         = UDim2.new(0, 12, 0, 0),
        TextXAlignment   = Enum.TextXAlignment.Left,
    }, TitleBar)

    -- Version badge
    local VerBadge = Make("TextLabel", {
        Text             = "v1.0",
        Font             = FONT_BODY,
        TextSize         = 10,
        TextColor3       = Color3.fromRGB(200, 190, 255),
        BackgroundTransparency = 1,
        Size             = UDim2.new(0, 40, 1, 0),
        Position         = UDim2.new(1, -50, 0, 0),
        TextXAlignment   = Enum.TextXAlignment.Right,
    }, TitleBar)

    -- Close Button
    local CloseBtn = Make("TextButton", {
        Text                   = "✕",
        Font                   = FONT_TITLE,
        TextSize               = 14,
        TextColor3             = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Size                   = UDim2.new(0, 30, 1, 0),
        Position               = UDim2.new(1, -32, 0, 0),
        ZIndex                 = 6,
        AutoButtonColor        = false,
    }, TitleBar)
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Transparent drag handle TextButton overlaid on the title bar
    -- (TextButton so MouseButton1Down fires reliably even with child elements)
    local DragHandle = Make("TextButton", {
        Text                   = "",
        BackgroundTransparency = 1,
        Size                   = UDim2.new(1, -36, 1, 0),
        Position               = UDim2.new(0, 0, 0, 0),
        ZIndex                 = 5,
        AutoButtonColor        = false,
    }, TitleBar)

    MakeDraggable(Main, DragHandle)

    -- ─── TAB BAR ───
    local TabBar = Make("Frame", {
        Name             = "TabBar",
        Size             = UDim2.new(1, 0, 0, 30),
        Position         = UDim2.new(0, 0, 0, 44),
        BackgroundColor3 = THEME.BG_MID,
        BorderSizePixel  = 0,
        ClipsDescendants = true,
    }, Main)
    AddListLayout(TabBar, 0, Enum.FillDirection.Horizontal)

    -- Divider under tab bar
    local TabDivider = Make("Frame", {
        Size             = UDim2.new(1, 0, 0, 2),
        Position         = UDim2.new(0, 0, 0, 74),
        BackgroundColor3 = THEME.ACCENT,
        BorderSizePixel  = 0,
    }, Main)
    Gradient(TabDivider, THEME.ACCENT, THEME.ACCENT2, 0)

    -- ─── CONTENT AREA ───
    local Content = Make("ScrollingFrame", {
        Name             = "Content",
        Size             = UDim2.new(1, 0, 1, -78),
        Position         = UDim2.new(0, 0, 0, 76),
        BackgroundColor3 = THEME.BG_DARK,
        BorderSizePixel  = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = THEME.ACCENT,
        CanvasSize       = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    }, Main)

    local ContentList = AddListLayout(Content, 1)
    ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Content.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y)
    end)

    -- ─── TAB METHOD ───
    function Window:CreateTab(tabName)
        local Tab = {}
        Tab._items   = {}
        Tab._frame   = nil
        Tab._visible = false

        -- Tab button
        local tabCount = #Window._tabs + 1
        local TabBtn = Make("TextButton", {
            Text                   = string.upper(tabName),
            Font                   = FONT_LABEL,
            TextSize               = 11,
            TextColor3             = THEME.TEXT_DIM,
            BackgroundTransparency = 1,
            BorderSizePixel        = 0,
            AutoButtonColor        = false,
            Size                   = UDim2.new(0, 100, 1, 0),
        }, TabBar)

        local TabUnderline = Make("Frame", {
            Size             = UDim2.new(1, 0, 0, 2),
            Position         = UDim2.new(0, 0, 1, -2),
            BackgroundColor3 = THEME.ACCENT,
            BorderSizePixel  = 0,
            Visible          = false,
        }, TabBtn)
        Gradient(TabUnderline, THEME.ACCENT, THEME.ACCENT2, 0)

        -- Tab Content Frame (hidden by default)
        local TabFrame = Make("Frame", {
            Name             = "Tab_"..tabName,
            Size             = UDim2.new(1, 0, 0, 0),
            AutomaticSize    = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Visible          = false,
        }, Content)
        AddListLayout(TabFrame, 1)

        Tab._frame = TabFrame
        Tab._btn   = TabBtn
        Tab._line  = TabUnderline

        -- Tab header (VISUALS / HUD style)
        local pageLabel = Make("TextLabel", {
            Text             = string.upper(tabName) .. "   " .. tabCount .. "/10",
            Font             = FONT_LABEL,
            TextSize         = 11,
            TextColor3       = THEME.TEXT_DIM,
            BackgroundColor3 = THEME.BG_MID,
            BorderSizePixel  = 0,
            Size             = UDim2.new(1, 0, 0, 24),
            TextXAlignment   = Enum.TextXAlignment.Left,
        }, TabFrame)
        AddPadding(pageLabel, 8)

        -- Switch tab logic
        TabBtn.MouseButton1Click:Connect(function()
            for _, t in pairs(Window._tabs) do
                t._frame.Visible  = false
                t._btn.TextColor3 = THEME.TEXT_DIM
                t._line.Visible   = false
            end
            TabFrame.Visible     = true
            TabBtn.TextColor3    = THEME.TEXT_TITLE
            TabUnderline.Visible = true
        end)

        -- Auto-select first tab
        if #Window._tabs == 0 then
            TabFrame.Visible     = true
            TabBtn.TextColor3    = THEME.TEXT_TITLE
            TabUnderline.Visible = true
        end

        table.insert(Window._tabs, Tab)

        -- ─── ELEMENT HELPERS ─────────────────────────

        -- Row base
        local rowIndex = 0
        local function NewRow(h)
            rowIndex = rowIndex + 1
            local bg = (rowIndex % 2 == 0) and THEME.BG_ITEM or THEME.BG_ITEM_ALT
            local row = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, h or 28),
                BackgroundColor3 = bg,
                BorderSizePixel  = 0,
            }, TabFrame)
            return row
        end

        -- Section Divider
        function Tab:Section(name)
            local sec = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 26),
                BackgroundColor3 = THEME.BG_MID,
                BorderSizePixel  = 0,
            }, TabFrame)
            -- gradient strip
            local strip = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 2),
                Position         = UDim2.new(0, 0, 1, -2),
                BackgroundColor3 = THEME.ACCENT,
                BorderSizePixel  = 0,
            }, sec)
            Gradient(strip, THEME.ACCENT2, THEME.ACCENT, 0)

            Make("TextLabel", {
                Text             = string.upper(name),
                Font             = FONT_TITLE,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_TITLE,
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, 0, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Center,
            }, sec)
            return sec
        end

        -- Toggle (checkbox style)
        function Tab:Toggle(label, default, callback)
            local state = default or false
            local row   = NewRow(28)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text             = label,
                Font             = FONT_BODY,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, -34, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)

            -- Checkbox
            local Box = Make("Frame", {
                Size             = UDim2.new(0, 18, 0, 18),
                Position         = UDim2.new(1, -26, 0.5, -9),
                BackgroundColor3 = state and THEME.TOGGLE_ON or THEME.TOGGLE_OFF,
            }, row)
            Corner(Box, 3)
            Stroke(Box, THEME.ACCENT, 1)

            local Tick = Make("TextLabel", {
                Text             = "✓",
                Font             = FONT_TITLE,
                TextSize         = 13,
                TextColor3       = THEME.CHECK_TICK,
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, 0, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Center,
                Visible          = state,
            }, Box)

            -- Hover effect
            row.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseMovement then
                    Tween(row, { BackgroundColor3 = THEME.HIGHLIGHT })
                end
            end)
            row.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseMovement then
                    local base = (rowIndex % 2 == 0) and THEME.BG_ITEM or THEME.BG_ITEM_ALT
                    Tween(row, { BackgroundColor3 = base })
                end
            end)

            -- Click
            local btn = Make("TextButton", {
                Text             = "",
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, 0, 1, 0),
            }, row)
            btn.MouseButton1Click:Connect(function()
                state = not state
                Tween(Box, { BackgroundColor3 = state and THEME.TOGGLE_ON or THEME.TOGGLE_OFF })
                Tick.Visible = state
                if callback then callback(state) end
            end)

            return { GetValue = function() return state end }
        end

        -- Slider
        function Tab:Slider(label, min, max, default, callback)
            local val = default or min
            local row = NewRow(36)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text             = label,
                Font             = FONT_BODY,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size             = UDim2.new(0.6, 0, 0, 16),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)

            local ValLabel = Make("TextLabel", {
                Text             = tostring(val),
                Font             = FONT_LABEL,
                TextSize         = 12,
                TextColor3       = Color3.fromRGB(200, 180, 255),
                BackgroundTransparency = 1,
                Size             = UDim2.new(0.4, -8, 0, 16),
                Position         = UDim2.new(0.6, 0, 0, 0),
                TextXAlignment   = Enum.TextXAlignment.Right,
            }, row)

            -- Track
            local Track = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 6),
                Position         = UDim2.new(0, 0, 0, 22),
                BackgroundColor3 = THEME.BG_DARK,
            }, row)
            Corner(Track, 3)
            Stroke(Track, THEME.DIVIDER, 1)

            -- Fill
            local pct = (val - min) / (max - min)
            local Fill = Make("Frame", {
                Size             = UDim2.new(pct, 0, 1, 0),
                BackgroundColor3 = THEME.ACCENT2,
            }, Track)
            Corner(Fill, 3)
            Gradient(Fill, THEME.ACCENT2, THEME.ACCENT, 0)

            -- Thumb
            local Thumb = Make("Frame", {
                Size             = UDim2.new(0, 12, 0, 12),
                Position         = UDim2.new(pct, -6, 0.5, -6),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, Track)
            Corner(Thumb, 6)
            Stroke(Thumb, THEME.ACCENT, 1.5)

            -- Invisible button overlay so clicks register even on thumb/fill children
            local SliderBtn = Make("TextButton", {
                Text                   = "",
                BackgroundTransparency = 1,
                Size                   = UDim2.new(1, 0, 1, 0),
                ZIndex                 = 5,
                AutoButtonColor        = false,
            }, Track)

            -- Drag logic
            local sliderDragging = false

            local function updateSlider(inputX)
                local rel = math.clamp(
                    (inputX - Track.AbsolutePosition.X) / Track.AbsoluteSize.X,
                    0, 1
                )
                val              = math.floor(min + (max - min) * rel)
                ValLabel.Text    = tostring(val)
                Fill.Size        = UDim2.new(rel, 0, 1, 0)
                Thumb.Position   = UDim2.new(rel, -6, 0.5, -6)
                if callback then callback(val) end
            end

            SliderBtn.MouseButton1Down:Connect(function(x, y)
                sliderDragging = true
                updateSlider(x)
            end)

            -- Release anywhere on screen
            UIS.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                    sliderDragging = false
                end
            end)

            UIS.InputChanged:Connect(function(inp)
                if sliderDragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(inp.Position.X)
                end
            end)

            return { GetValue = function() return val end }
        end

        -- TextBox input row
        function Tab:TextBox(label, placeholder, callback)
            local row = NewRow(36)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text                   = label,
                Font                   = FONT_BODY,
                TextSize               = 12,
                TextColor3             = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size                   = UDim2.new(1, 0, 0, 14),
                TextXAlignment         = Enum.TextXAlignment.Left,
            }, row)

            local Box = Make("TextBox", {
                Text                   = "",
                PlaceholderText        = placeholder or "Type here...",
                Font                   = FONT_BODY,
                TextSize               = 11,
                TextColor3             = THEME.TEXT_PRIMARY,
                PlaceholderColor3      = THEME.TEXT_DIM,
                BackgroundTransparency = 1,
                BorderSizePixel        = 0,
                Size                   = UDim2.new(1, 0, 0, 16),
                Position               = UDim2.new(0, 0, 0, 17),
                ClearTextOnFocus       = false,
                TextXAlignment         = Enum.TextXAlignment.Left,
            }, row)

            -- Underline to show it's interactive
            local Underline = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 1),
                Position         = UDim2.new(0, 0, 1, -1),
                BackgroundColor3 = THEME.DIVIDER,
                BorderSizePixel  = 0,
            }, Box)

            Box.Focused:Connect(function()
                Tween(Underline, { BackgroundColor3 = THEME.ACCENT })
            end)
            Box.FocusLost:Connect(function(enterPressed)
                Tween(Underline, { BackgroundColor3 = THEME.DIVIDER })
                if callback then callback(Box.Text, enterPressed) end
            end)

            return { GetText = function() return Box.Text end,
                     SetText = function(_, t) Box.Text = t end }
        end

        -- Color Picker (simple swatch + popup placeholder)
        function Tab:ColorPicker(label, defaultColor, callback)
            defaultColor = defaultColor or Color3.fromRGB(90, 50, 255)
            local row    = NewRow(28)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text             = label,
                Font             = FONT_BODY,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, -36, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)

            local Swatch = Make("TextButton", {
                Text             = "",
                AutoButtonColor  = false,
                BackgroundColor3 = defaultColor,
                Size             = UDim2.new(0, 24, 0, 18),
                Position         = UDim2.new(1, -28, 0.5, -9),
            }, row)
            Corner(Swatch, 3)
            Stroke(Swatch, THEME.ACCENT, 1)

            -- Simple hue cycle on click (as placeholder for full picker)
            local hue = 0
            Swatch.MouseButton1Click:Connect(function()
                hue = (hue + 0.1) % 1
                local c = Color3.fromHSV(hue, 0.9, 1)
                Swatch.BackgroundColor3 = c
                if callback then callback(c) end
            end)

            return { GetColor = function() return Swatch.BackgroundColor3 end }
        end

        -- Label / Info row
        function Tab:Label(text)
            local row = NewRow(22)
            AddPadding(row, 8)
            Make("TextLabel", {
                Text             = text,
                Font             = FONT_BODY,
                TextSize         = 11,
                TextColor3       = THEME.TEXT_DIM,
                BackgroundTransparency = 1,
                Size             = UDim2.new(1, 0, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)
        end

        -- Keybind display row
        function Tab:Keybind(label, default, callback)
            local key   = default or Enum.KeyCode.F
            local row   = NewRow(28)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text             = label,
                Font             = FONT_BODY,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size             = UDim2.new(0.65, 0, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)

            local binding = false
            local KeyBtn  = Make("TextButton", {
                Text                   = "["..key.Name.."]",
                Font                   = FONT_LABEL,
                TextSize               = 11,
                TextColor3             = Color3.fromRGB(200, 180, 255),
                BackgroundTransparency = 1,
                BorderSizePixel        = 0,
                Size                   = UDim2.new(0.35, 0, 0, 18),
                Position               = UDim2.new(0.65, 0, 0.5, -9),
                AutoButtonColor        = false,
            }, row)
            Corner(KeyBtn, 3)
            Stroke(KeyBtn, THEME.ACCENT, 1)

            KeyBtn.MouseButton1Click:Connect(function()
                binding           = true
                KeyBtn.Text       = "[...]"
                KeyBtn.TextColor3 = Color3.fromRGB(255, 220, 100)
            end)

            UIS.InputBegan:Connect(function(inp, gp)
                if binding and not gp and inp.UserInputType == Enum.UserInputType.Keyboard then
                    key               = inp.KeyCode
                    binding           = false
                    KeyBtn.Text       = "["..key.Name.."]"
                    KeyBtn.TextColor3 = Color3.fromRGB(200, 180, 255)
                    if callback then callback(key) end
                end
            end)

            return { GetKey = function() return key end }
        end

        -- Dropdown
        function Tab:Dropdown(label, options, callback)
            local selected = options[1] or "None"
            local open     = false

            local row = NewRow(28)
            AddPadding(row, 8)

            Make("TextLabel", {
                Text             = label,
                Font             = FONT_BODY,
                TextSize         = 12,
                TextColor3       = THEME.TEXT_PRIMARY,
                BackgroundTransparency = 1,
                Size             = UDim2.new(0.55, 0, 1, 0),
                TextXAlignment   = Enum.TextXAlignment.Left,
            }, row)

            local DDBtn = Make("TextButton", {
                Text                   = selected .. " ▾",
                Font                   = FONT_LABEL,
                TextSize               = 11,
                TextColor3             = Color3.fromRGB(200, 180, 255),
                BackgroundTransparency = 1,
                BorderSizePixel        = 0,
                Size                   = UDim2.new(0.45, 0, 0, 20),
                Position               = UDim2.new(0.55, 0, 0.5, -10),
                AutoButtonColor        = false,
                ClipsDescendants       = false,
            }, row)
            Corner(DDBtn, 3)
            Stroke(DDBtn, THEME.ACCENT, 1)

            -- Options panel
            local Panel = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, #options * 22),
                Position         = UDim2.new(0, 0, 1, 2),
                BackgroundColor3 = THEME.BG_MID,
                BorderSizePixel  = 0,
                Visible          = false,
                ZIndex           = 10,
            }, DDBtn)
            Corner(Panel, 3)
            Stroke(Panel, THEME.ACCENT, 1)
            AddListLayout(Panel, 1)

            for _, opt in ipairs(options) do
                local optBtn = Make("TextButton", {
                    Text             = opt,
                    Font             = FONT_BODY,
                    TextSize         = 11,
                    TextColor3       = THEME.TEXT_PRIMARY,
                    BackgroundColor3 = THEME.BG_MID,
                    BorderSizePixel  = 0,
                    Size             = UDim2.new(1, 0, 0, 22),
                    AutoButtonColor  = false,
                    ZIndex           = 11,
                }, Panel)
                optBtn.MouseButton1Click:Connect(function()
                    selected     = opt
                    DDBtn.Text   = opt .. " ▾"
                    Panel.Visible = false
                    open         = false
                    if callback then callback(opt) end
                end)
                optBtn.MouseEnter:Connect(function()
                    Tween(optBtn, { BackgroundColor3 = THEME.HIGHLIGHT })
                end)
                optBtn.MouseLeave:Connect(function()
                    Tween(optBtn, { BackgroundColor3 = THEME.BG_MID })
                end)
            end

            DDBtn.MouseButton1Click:Connect(function()
                open          = not open
                Panel.Visible = open
            end)

            return { GetValue = function() return selected end }
        end

        return Tab
    end

    -- ─── STATUS BAR ───
    local StatusBar = Make("Frame", {
        Name             = "StatusBar",
        Size             = UDim2.new(1, 0, 0, 0),   -- auto grows
        AutomaticSize    = Enum.AutomaticSize.Y,
        BackgroundColor3 = THEME.BG_MID,
        BorderSizePixel  = 0,
    }, Main)

    Window._statusLabel = Make("TextLabel", {
        Text             = "Enables: Nothing",
        Font             = FONT_BODY,
        TextSize         = 10,
        TextColor3       = THEME.TEXT_DIM,
        BackgroundTransparency = 1,
        Size             = UDim2.new(1, 0, 0, 0),
        AutomaticSize    = Enum.AutomaticSize.Y,
    }, StatusBar)
    AddPadding(StatusBar, 5)

    function Window:SetStatus(msg)
        self._statusLabel.Text = msg or ""
    end

    return Window
end

return ViolentUI

-- ──────────────────────────────────────────────────────
-- EXAMPLE USAGE (uncomment to test in Roblox executor):
-- ──────────────────────────────────────────────────────
--[[
local UI      = require(script)  -- or loadstring(...)()
local Win     = UI:CreateWindow("VIOLENT")
local VisTab  = Win:CreateTab("VISUALS / HUD")

VisTab:Toggle("Enable ESP",          false, function(v) print("ESP:", v) end)
VisTab:Slider("Max Distance",        0, 1000, 1000, function(v) print("Dist:", v) end)
VisTab:Toggle("Use Menu Theme Color",true,  function(v) print("Theme:", v) end)

VisTab:Section("BOX")
VisTab:Toggle("Box ESP",             true,  function(v) print("BoxESP:", v) end)
VisTab:Slider("Box Thickness",       1, 10, 1,    function(v) print("Thickness:", v) end)
VisTab:Toggle("Show Box Borders",    true,  function(v) end)
VisTab:Slider("Box Neon",            1, 10, 1,    function(v) end)
VisTab:ColorPicker("Neon Glow Color",Color3.fromRGB(90,50,255), function(c) end)

VisTab:Section("BOX FILL")
VisTab:Toggle("Box Fill",            false, function(v) end)
VisTab:ColorPicker("Box Fill Color", Color3.fromRGB(90,50,255), function(c) end)
VisTab:Slider("Box Gradient Start Transparency", 0, 1, 0.3, function(v) end)

VisTab:Keybind("Open Menu",          Enum.KeyCode.RightShift, function(k) print("Key:", k) end)
VisTab:Dropdown("Target Team",       {"Everyone","Enemy","Ally"}, function(v) print("Team:", v) end)

Win:SetStatus("Enables: Box ESP")
]]
