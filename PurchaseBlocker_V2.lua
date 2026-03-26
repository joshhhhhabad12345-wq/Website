--// ═══════════════════════════════════════════════════════════════
--//            PURCHASE BLOCKER V2 - PREMIUM EDITION
--//              Inspired by rscripts.net Design
--//                    19 Block Methods
--// ═══════════════════════════════════════════════════════════════

--// Services
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local playerGui = (gethui and gethui()) or CoreGui

--// ═══════════════════════════════════════════════════════════════
--//                    ENHANCED COLOR PALETTE
--// ═══════════════════════════════════════════════════════════════

local Colors = {
    -- Backgrounds with depth
    Background = Color3.fromRGB(10, 10, 15),
    BackgroundAlt = Color3.fromRGB(15, 15, 22),
    Card = Color3.fromRGB(20, 20, 30),
    CardHover = Color3.fromRGB(28, 28, 40),
    Glass = Color3.fromRGB(25, 25, 35),
    
    -- Vibrant accents
    Primary = Color3.fromRGB(124, 58, 237),       -- Purple
    PrimaryGlow = Color3.fromRGB(167, 139, 250),
    Secondary = Color3.fromRGB(59, 130, 246),     -- Blue
    SecondaryGlow = Color3.fromRGB(96, 165, 250),
    
    -- Status colors
    Success = Color3.fromRGB(34, 197, 94),
    SuccessGlow = Color3.fromRGB(74, 222, 128),
    Warning = Color3.fromRGB(251, 191, 36),
    WarningGlow = Color3.fromRGB(252, 211, 77),
    Danger = Color3.fromRGB(239, 68, 68),
    DangerGlow = Color3.fromRGB(248, 113, 113),
    Info = Color3.fromRGB(14, 165, 233),
    InfoGlow = Color3.fromRGB(56, 189, 248),
    
    -- Text hierarchy
    TextPrimary = Color3.fromRGB(248, 250, 252),
    TextSecondary = Color3.fromRGB(203, 213, 225),
    TextMuted = Color3.fromRGB(148, 163, 184),
    TextDim = Color3.fromRGB(100, 116, 139),
    
    -- Special effects
    Border = Color3.fromRGB(51, 65, 85),
    BorderGlow = Color3.fromRGB(71, 85, 105),
    Shadow = Color3.fromRGB(0, 0, 0),
    Highlight = Color3.fromRGB(255, 255, 255),
    
    -- Gradient colors
    GradientPurple = Color3.fromRGB(147, 51, 234),
    GradientPink = Color3.fromRGB(236, 72, 153),
    GradientBlue = Color3.fromRGB(59, 130, 246),
    GradientCyan = Color3.fromRGB(6, 182, 212),
    GradientGreen = Color3.fromRGB(16, 185, 129),
    
    -- Shield/Protection
    Shield = Color3.fromRGB(52, 211, 153),
    ShieldGlow = Color3.fromRGB(110, 231, 183),
}

--// ═══════════════════════════════════════════════════════════════
--//                    DATA STORAGE & STATISTICS
--// ═══════════════════════════════════════════════════════════════

local Stats = {
    TotalBlocked = 0,
    SessionStart = tick(),
    BlocksByMethod = {},
    BlockHistory = {},
    WhitelistedItems = {}
}

local Logs = {}
local LogUpdateCallbacks = {}

local function addLog(title, message, logType)
    local logEntry = {
        Title = title,
        Message = message,
        Type = logType or "info",
        Time = os.date("%H:%M:%S"),
        Timestamp = tick()
    }
    table.insert(Logs, 1, logEntry)
    if #Logs > 100 then
        table.remove(Logs, #Logs)
    end
    for _, callback in pairs(LogUpdateCallbacks) do
        pcall(callback, logEntry)
    end
end

--// ═══════════════════════════════════════════════════════════════
--//                    NOTIFICATION SYSTEM V2
--// ═══════════════════════════════════════════════════════════════

local NotificationHolder = Instance.new("ScreenGui")
NotificationHolder.Name = "PurchaseBlockerNotificationsV2"
NotificationHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NotificationHolder.ResetOnSpawn = false
NotificationHolder.Parent = playerGui

local NotifContainer = Instance.new("Frame")
NotifContainer.Name = "NotifContainer"
NotifContainer.BackgroundTransparency = 1
NotifContainer.Position = UDim2.new(1, -360, 0, 20)
NotifContainer.Size = UDim2.new(0, 340, 1, -40)
NotifContainer.Parent = NotificationHolder

local NotifLayout = Instance.new("UIListLayout")
NotifLayout.Padding = UDim.new(0, 10)
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Top
NotifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
NotifLayout.Parent = NotifContainer

--// Enhanced Notification Function with Glassmorphism
local notifOrder = 0
local function PushNotification(config)
    config = config or {}
    local title = config.Title or "Notification"
    local message = config.Text or ""
    local duration = config.Duration or 5
    local notifType = config.Type or "info"
    
    addLog(title, message, notifType)
    notifOrder += 1
    local order = notifOrder

    -- Main card with glassmorphism
    local NotifCard = Instance.new("Frame")
    NotifCard.Name = "Notif_" .. order
    NotifCard.BackgroundColor3 = Colors.Glass
    NotifCard.BackgroundTransparency = 0.3
    NotifCard.BorderSizePixel = 0
    NotifCard.Size = UDim2.new(1, 0, 0, 0)
    NotifCard.AutomaticSize = Enum.AutomaticSize.Y
    NotifCard.LayoutOrder = order
    NotifCard.ClipsDescendants = true
    NotifCard.Parent = NotifContainer

    -- Blur effect for glassmorphism
    local Blur = Instance.new("ImageLabel")
    Blur.Name = "GlassBlur"
    Blur.BackgroundTransparency = 1
    Blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Blur.ImageTransparency = 0.95
    Blur.Size = UDim2.new(1, 0, 1, 0)
    Blur.ZIndex = 0
    Blur.Parent = NotifCard

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 16)
    CardCorner.Parent = NotifCard

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = Colors.BorderGlow
    CardStroke.Thickness = 1.5
    CardStroke.Transparency = 0.7
    CardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    CardStroke.Parent = NotifCard

    -- Gradient stroke effect
    local StrokeGradient = Instance.new("UIGradient")
    StrokeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Colors.Primary),
        ColorSequenceKeypoint.new(0.5, Colors.Secondary),
        ColorSequenceKeypoint.new(1, Colors.Primary),
    })
    StrokeGradient.Parent = CardStroke

    local CardPadding = Instance.new("UIPadding")
    CardPadding.PaddingTop = UDim.new(0, 16)
    CardPadding.PaddingBottom = UDim.new(0, 16)
    CardPadding.PaddingLeft = UDim.new(0, 18)
    CardPadding.PaddingRight = UDim.new(0, 18)
    CardPadding.Parent = NotifCard

    -- Dynamic accent color
    local typeColor = Colors.Primary
    local glowColor = Colors.PrimaryGlow
    if notifType == "success" then 
        typeColor = Colors.Success
        glowColor = Colors.SuccessGlow
    elseif notifType == "warning" then 
        typeColor = Colors.Warning
        glowColor = Colors.WarningGlow
    elseif notifType == "danger" or notifType == "blocked" then 
        typeColor = Colors.Danger
        glowColor = Colors.DangerGlow
    elseif notifType == "info" then
        typeColor = Colors.Info
        glowColor = Colors.InfoGlow
    end

    -- Animated accent bar
    local AccentBar = Instance.new("Frame")
    AccentBar.Name = "AccentBar"
    AccentBar.BackgroundColor3 = typeColor
    AccentBar.BorderSizePixel = 0
    AccentBar.Position = UDim2.new(0, -18, 0, -16)
    AccentBar.Size = UDim2.new(0, 4, 1, 32)
    AccentBar.ZIndex = 3
    AccentBar.Parent = NotifCard

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(0, 3)
    AccentCorner.Parent = AccentBar

    -- Glow effect
    local AccentGlow = Instance.new("Frame")
    AccentGlow.Name = "Glow"
    AccentGlow.BackgroundColor3 = glowColor
    AccentGlow.BackgroundTransparency = 0.7
    AccentGlow.BorderSizePixel = 0
    AccentGlow.Position = UDim2.new(0, -18, 0, -16)
    AccentGlow.Size = UDim2.new(0, 60, 1, 32)
    AccentGlow.ZIndex = 1
    AccentGlow.Parent = NotifCard

    local GlowGradient = Instance.new("UIGradient")
    GlowGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 1),
    })
    GlowGradient.Parent = AccentGlow

    -- Icon container
    local IconContainer = Instance.new("Frame")
    IconContainer.Name = "IconBg"
    IconContainer.BackgroundColor3 = typeColor
    IconContainer.BackgroundTransparency = 0.9
    IconContainer.Position = UDim2.new(0, 0, 0, 0)
    IconContainer.Size = UDim2.new(0, 36, 0, 36)
    IconContainer.Parent = NotifCard

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = IconContainer

    -- Icon
    local iconText = "🛡️"
    if notifType == "blocked" then iconText = "🚫"
    elseif notifType == "danger" then iconText = "⚠️"
    elseif notifType == "warning" then iconText = "⚡"
    elseif notifType == "success" then iconText = "✅"
    elseif notifType == "info" then iconText = "ℹ️"
    end

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Name = "Icon"
    IconLabel.BackgroundTransparency = 1
    IconLabel.Position = UDim2.new(0, 0, 0, 0)
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = iconText
    IconLabel.TextSize = 18
    IconLabel.TextColor3 = typeColor
    IconLabel.Parent = IconContainer

    -- Title
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 44, 0, 0)
    TitleLabel.Size = UDim2.new(1, -76, 0, 22)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextSize = 14
    TitleLabel.TextColor3 = Colors.TextPrimary
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    TitleLabel.Parent = NotifCard

    -- Close button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "Close"
    CloseBtn.BackgroundColor3 = Colors.Card
    CloseBtn.BackgroundTransparency = 0.5
    CloseBtn.Position = UDim2.new(1, -26, 0, 0)
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextSize = 14
    CloseBtn.TextColor3 = Colors.TextMuted
    CloseBtn.Parent = NotifCard

    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 8)
    CloseBtnCorner.Parent = CloseBtn

    -- Message
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Name = "Message"
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Position = UDim2.new(0, 44, 0, 24)
    MessageLabel.Size = UDim2.new(1, -52, 0, 0)
    MessageLabel.AutomaticSize = Enum.AutomaticSize.Y
    MessageLabel.Font = Enum.Font.Gotham
    MessageLabel.Text = message
    MessageLabel.TextSize = 12
    MessageLabel.TextColor3 = Colors.TextSecondary
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextWrapped = true
    MessageLabel.Parent = NotifCard

    -- Progress bar
    local ProgressBg = Instance.new("Frame")
    ProgressBg.Name = "ProgressBg"
    ProgressBg.BackgroundColor3 = Colors.Border
    ProgressBg.BackgroundTransparency = 0.5
    ProgressBg.BorderSizePixel = 0
    ProgressBg.Position = UDim2.new(0, -18, 1, -2)
    ProgressBg.Size = UDim2.new(1, 36, 0, 2)
    ProgressBg.Parent = NotifCard

    local Progress = Instance.new("Frame")
    Progress.Name = "Progress"
    Progress.BackgroundColor3 = typeColor
    Progress.BorderSizePixel = 0
    Progress.Size = UDim2.new(1, 0, 1, 0)
    Progress.Parent = ProgressBg

    -- Animations
    NotifCard.Position = UDim2.new(1, 50, 0, 0)
    NotifCard.Size = UDim2.new(1, 0, 0, 0)
    
    TweenService:Create(NotifCard, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0.3
    }):Play()

    -- Pulse animation on accent bar
    local pulseAnim = TweenService:Create(AccentBar, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.3
    })
    pulseAnim:Play()

    -- Progress bar animation
    TweenService:Create(Progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 1, 0)
    }):Play()

    -- Close button hover
    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Colors.Danger,
            BackgroundTransparency = 0,
            TextColor3 = Colors.TextPrimary
        }):Play()
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Colors.Card,
            BackgroundTransparency = 0.5,
            TextColor3 = Colors.TextMuted
        }):Play()
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        pulseAnim:Cancel()
        TweenService:Create(NotifCard, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 50, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.35)
        NotifCard:Destroy()
    end)

    -- Auto dismiss
    task.delay(duration, function()
        if NotifCard and NotifCard.Parent then
            pulseAnim:Cancel()
            TweenService:Create(NotifCard, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 50, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.45)
            NotifCard:Destroy()
        end
    end)
end

--// ═══════════════════════════════════════════════════════════════
--//                    MAIN GUI V2
--// ═══════════════════════════════════════════════════════════════

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "PurchaseBlockerV2"
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MainGui.ResetOnSpawn = false
MainGui.Parent = playerGui

-- Main container with glassmorphism
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -220, 0.5, -280)
MainFrame.Size = UDim2.new(0, 440, 0, 560)
MainFrame.Parent = MainGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

-- Animated gradient border
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Colors.Primary
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainFrame

local StrokeGradient = Instance.new("UIGradient")
StrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Colors.GradientPurple),
    ColorSequenceKeypoint.new(0.5, Colors.GradientBlue),
    ColorSequenceKeypoint.new(1, Colors.GradientCyan),
})
StrokeGradient.Rotation = 0
StrokeGradient.Parent = MainStroke

-- Animate gradient rotation
task.spawn(function()
    while MainStroke and MainStroke.Parent do
        for i = 0, 360, 2 do
            if not MainStroke or not MainStroke.Parent then break end
            StrokeGradient.Rotation = i
            task.wait(0.03)
        end
    end
end)

-- Drop shadow effect
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Colors.Shadow
Shadow.ImageTransparency = 0.5
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

--// Header Section
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, 0, 0, 70)
Header.Parent = MainFrame

-- Gradient background for header
local HeaderBg = Instance.new("Frame")
HeaderBg.Name = "HeaderBg"
HeaderBg.BackgroundColor3 = Colors.Card
HeaderBg.BackgroundTransparency = 0.3
HeaderBg.BorderSizePixel = 0
HeaderBg.Size = UDim2.new(1, 0, 1, 0)
HeaderBg.ZIndex = 0
HeaderBg.Parent = Header

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 20)
HeaderCorner.Parent = HeaderBg

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Colors.GradientPurple),
    ColorSequenceKeypoint.new(1, Colors.GradientBlue),
})
HeaderGradient.Rotation = 45
HeaderGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.7),
    NumberSequenceKeypoint.new(1, 0.9),
})
HeaderGradient.Parent = HeaderBg

-- Title with icon
local TitleIcon = Instance.new("TextLabel")
TitleIcon.Name = "Icon"
TitleIcon.BackgroundTransparency = 1
TitleIcon.Position = UDim2.new(0, 20, 0, 18)
TitleIcon.Size = UDim2.new(0, 35, 0, 35)
TitleIcon.Font = Enum.Font.GothamBold
TitleIcon.Text = "🛡️"
TitleIcon.TextSize = 24
TitleIcon.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 60, 0, 15)
TitleLabel.Size = UDim2.new(0, 250, 0, 22)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "PURCHASE BLOCKER"
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Colors.TextPrimary
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "Version"
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 60, 0, 38)
VersionLabel.Size = UDim2.new(0, 200, 0, 16)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "V2.0 Premium • 19 Methods"
VersionLabel.TextSize = 11
VersionLabel.TextColor3 = Colors.Primary
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.Parent = Header

-- Window controls
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "Minimize"
MinimizeBtn.BackgroundColor3 = Colors.Card
MinimizeBtn.BackgroundTransparency = 0.3
MinimizeBtn.Position = UDim2.new(1, -70, 0, 20)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextSize = 14
MinimizeBtn.TextColor3 = Colors.TextSecondary
MinimizeBtn.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinimizeBtn

local CloseMainBtn = Instance.new("TextButton")
CloseMainBtn.Name = "Close"
CloseMainBtn.BackgroundColor3 = Colors.Card
CloseMainBtn.BackgroundTransparency = 0.3
CloseMainBtn.Position = UDim2.new(1, -35, 0, 20)
CloseMainBtn.Size = UDim2.new(0, 30, 0, 30)
CloseMainBtn.Font = Enum.Font.GothamBold
CloseMainBtn.Text = "✕"
CloseMainBtn.TextSize = 14
CloseMainBtn.TextColor3 = Colors.TextSecondary
CloseMainBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseMainBtn

-- Title bar for dragging
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.BackgroundTransparency = 1
TitleBar.Size = UDim2.new(1, -110, 1, 0)
TitleBar.Parent = Header

--// Stats Dashboard
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "Stats"
StatsContainer.BackgroundTransparency = 1
StatsContainer.Position = UDim2.new(0, 0, 0, 80)
StatsContainer.Size = UDim2.new(1, 0, 0, 100)
StatsContainer.Parent = MainFrame

local StatsLayout = Instance.new("UIListLayout")
StatsLayout.FillDirection = Enum.FillDirection.Horizontal
StatsLayout.Padding = UDim.new(0, 12)
StatsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
StatsLayout.Parent = StatsContainer

-- Stat card function
local function createStatCard(icon, label, value, color)
    local Card = Instance.new("Frame")
    Card.Name = label
    Card.BackgroundColor3 = Colors.Card
    Card.BackgroundTransparency = 0.4
    Card.BorderSizePixel = 0
    Card.Size = UDim2.new(0, 130, 0, 85)
    Card.Parent = StatsContainer

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 14)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = color
    CardStroke.Thickness = 1.5
    CardStroke.Transparency = 0.7
    CardStroke.Parent = Card

    local Icon = Instance.new("TextLabel")
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 12, 0, 10)
    Icon.Size = UDim2.new(0, 28, 0, 28)
    Icon.Font = Enum.Font.GothamBold
    Icon.Text = icon
    Icon.TextSize = 20
    Icon.TextColor3 = color
    Icon.Parent = Card

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Name = "Value"
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(0, 12, 0, 35)
    ValueLabel.Size = UDim2.new(1, -20, 0, 24)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.Text = value
    ValueLabel.TextSize = 22
    ValueLabel.TextColor3 = Colors.TextPrimary
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.Parent = Card

    local Label = Instance.new("TextLabel")
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 12, 0, 60)
    Label.Size = UDim2.new(1, -20, 0, 14)
    Label.Font = Enum.Font.Gotham
    Label.Text = label
    Label.TextSize = 10
    Label.TextColor3 = Colors.TextMuted
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Card

    return Card, ValueLabel
end

local blockedCard, blockedValue = createStatCard("🚫", "BLOCKED", "0", Colors.Danger)
local protectedCard, protectedValue = createStatCard("🛡️", "PROTECTED", "19", Colors.Success)
local sessionCard, sessionValue = createStatCard("⏱️", "SESSION", "0:00", Colors.Info)

-- Tab System
local TabContainer = Instance.new("Frame")
TabContainer.Name = "Tabs"
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 15, 0, 195)
TabContainer.Size = UDim2.new(1, -30, 0, 35)
TabContainer.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 8)
TabLayout.Parent = TabContainer

local currentTab = "logs"
local tabs = {}

local function createTab(name, icon, id)
    local Tab = Instance.new("TextButton")
    Tab.Name = id
    Tab.BackgroundColor3 = id == currentTab and Colors.Primary or Colors.Card
    Tab.BackgroundTransparency = id == currentTab and 0.2 or 0.5
    Tab.BorderSizePixel = 0
    Tab.Size = UDim2.new(0, 130, 0, 35)
    Tab.Font = Enum.Font.GothamBold
    Tab.Text = icon .. " " .. name
    Tab.TextSize = 12
    Tab.TextColor3 = id == currentTab and Colors.TextPrimary or Colors.TextMuted
    Tab.Parent = TabContainer

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = Tab

    tabs[id] = Tab
    return Tab
end

local logsTab = createTab("Logs", "📋", "logs")
local settingsTab = createTab("Settings", "⚙️", "settings")
local aboutTab = createTab("About", "ℹ️", "about")

-- Content container
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.BackgroundColor3 = Colors.BackgroundAlt
ContentFrame.BackgroundTransparency = 0.5
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 15, 0, 240)
ContentFrame.Size = UDim2.new(1, -30, 1, -255)
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 14)
ContentCorner.Parent = ContentFrame

local ContentStroke = Instance.new("UIStroke")
ContentStroke.Color = Colors.Border
ContentStroke.Thickness = 1
ContentStroke.Transparency = 0.7
ContentStroke.Parent = ContentFrame

--// Logs Panel
local LogsPanel = Instance.new("Frame")
LogsPanel.Name = "LogsPanel"
LogsPanel.BackgroundTransparency = 1
LogsPanel.Size = UDim2.new(1, 0, 1, 0)
LogsPanel.Visible = true
LogsPanel.Parent = ContentFrame

local LogsHeader = Instance.new("Frame")
LogsHeader.Name = "Header"
LogsHeader.BackgroundTransparency = 1
LogsHeader.Size = UDim2.new(1, 0, 0, 40)
LogsHeader.Parent = LogsPanel

local LogsTitle = Instance.new("TextLabel")
LogsTitle.BackgroundTransparency = 1
LogsTitle.Position = UDim2.new(0, 15, 0, 10)
LogsTitle.Size = UDim2.new(0, 150, 0, 20)
LogsTitle.Font = Enum.Font.GothamBold
LogsTitle.Text = "Activity Logs"
LogsTitle.TextSize = 13
LogsTitle.TextColor3 = Colors.TextPrimary
LogsTitle.TextXAlignment = Enum.TextXAlignment.Left
LogsTitle.Parent = LogsHeader

local LogCountLabel = Instance.new("TextLabel")
LogCountLabel.Name = "Count"
LogCountLabel.BackgroundTransparency = 1
LogCountLabel.Position = UDim2.new(1, -100, 0, 10)
LogCountLabel.Size = UDim2.new(0, 85, 0, 20)
LogCountLabel.Font = Enum.Font.Code
LogCountLabel.Text = "0 entries"
LogCountLabel.TextSize = 10
LogCountLabel.TextColor3 = Colors.TextMuted
LogCountLabel.TextXAlignment = Enum.TextXAlignment.Right
LogCountLabel.Parent = LogsHeader

local LogsScroll = Instance.new("ScrollingFrame")
LogsScroll.Name = "ScrollFrame"
LogsScroll.BackgroundTransparency = 1
LogsScroll.BorderSizePixel = 0
LogsScroll.Position = UDim2.new(0, 10, 0, 45)
LogsScroll.Size = UDim2.new(1, -20, 1, -50)
LogsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
LogsScroll.ScrollBarThickness = 4
LogsScroll.ScrollBarImageColor3 = Colors.Primary
LogsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
LogsScroll.Parent = LogsPanel

local LogsLayout = Instance.new("UIListLayout")
LogsLayout.Padding = UDim.new(0, 6)
LogsLayout.SortOrder = Enum.SortOrder.LayoutOrder
LogsLayout.Parent = LogsScroll

-- Log entry creator
local logEntryCount = 0
local function createLogEntry(logData)
    logEntryCount += 1
    LogCountLabel.Text = logEntryCount .. " entries"

    local LogEntry = Instance.new("Frame")
    LogEntry.Name = "Log_" .. logEntryCount
    LogEntry.BackgroundColor3 = Colors.Card
    LogEntry.BackgroundTransparency = 0.6
    LogEntry.BorderSizePixel = 0
    LogEntry.Size = UDim2.new(1, 0, 0, 48)
    LogEntry.LayoutOrder = -logEntryCount
    LogEntry.Parent = LogsScroll

    local LogCorner = Instance.new("UICorner")
    LogCorner.CornerRadius = UDim.new(0, 10)
    LogCorner.Parent = LogEntry

    -- Type color indicator
    local logTypeColor = Colors.Primary
    if logData.Type == "blocked" then logTypeColor = Colors.Danger
    elseif logData.Type == "warning" then logTypeColor = Colors.Warning
    elseif logData.Type == "success" then logTypeColor = Colors.Success
    elseif logData.Type == "info" then logTypeColor = Colors.Info
    end

    local LogBar = Instance.new("Frame")
    LogBar.BackgroundColor3 = logTypeColor
    LogBar.BorderSizePixel = 0
    LogBar.Position = UDim2.new(0, 0, 0, 6)
    LogBar.Size = UDim2.new(0, 3, 1, -12)
    LogBar.Parent = LogEntry

    local LogBarCorner = Instance.new("UICorner")
    LogBarCorner.CornerRadius = UDim.new(0, 2)
    LogBarCorner.Parent = LogBar

    local LogTitle = Instance.new("TextLabel")
    LogTitle.BackgroundTransparency = 1
    LogTitle.Position = UDim2.new(0, 12, 0, 6)
    LogTitle.Size = UDim2.new(0.6, -12, 0, 18)
    LogTitle.Font = Enum.Font.GothamBold
    LogTitle.Text = logData.Title
    LogTitle.TextSize = 12
    LogTitle.TextColor3 = Colors.TextPrimary
    LogTitle.TextXAlignment = Enum.TextXAlignment.Left
    LogTitle.TextTruncate = Enum.TextTruncate.AtEnd
    LogTitle.Parent = LogEntry

    local LogTime = Instance.new("TextLabel")
    LogTime.BackgroundTransparency = 1
    LogTime.Position = UDim2.new(0.6, 0, 0, 6)
    LogTime.Size = UDim2.new(0.4, -8, 0, 18)
    LogTime.Font = Enum.Font.Code
    LogTime.Text = logData.Time
    LogTime.TextSize = 10
    LogTime.TextColor3 = Colors.TextMuted
    LogTime.TextXAlignment = Enum.TextXAlignment.Right
    LogTime.Parent = LogEntry

    local LogMsg = Instance.new("TextLabel")
    LogMsg.BackgroundTransparency = 1
    LogMsg.Position = UDim2.new(0, 12, 0, 26)
    LogMsg.Size = UDim2.new(1, -20, 0, 16)
    LogMsg.Font = Enum.Font.Gotham
    LogMsg.Text = logData.Message
    LogMsg.TextSize = 10
    LogMsg.TextColor3 = Colors.TextSecondary
    LogMsg.TextXAlignment = Enum.TextXAlignment.Left
    LogMsg.TextTruncate = Enum.TextTruncate.AtEnd
    LogMsg.Parent = LogEntry
    
    -- Fade in animation
    LogEntry.BackgroundTransparency = 1
    TweenService:Create(LogEntry, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 0.6
    }):Play()
end

table.insert(LogUpdateCallbacks, createLogEntry)

--// Settings Panel
local SettingsPanel = Instance.new("Frame")
SettingsPanel.Name = "SettingsPanel"
SettingsPanel.BackgroundTransparency = 1
SettingsPanel.Size = UDim2.new(1, 0, 1, 0)
SettingsPanel.Visible = false
SettingsPanel.Parent = ContentFrame

local SettingsScroll = Instance.new("ScrollingFrame")
SettingsScroll.BackgroundTransparency = 1
SettingsScroll.BorderSizePixel = 0
SettingsScroll.Position = UDim2.new(0, 10, 0, 10)
SettingsScroll.Size = UDim2.new(1, -20, 1, -20)
SettingsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SettingsScroll.ScrollBarThickness = 4
SettingsScroll.ScrollBarImageColor3 = Colors.Primary
SettingsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SettingsScroll.Parent = SettingsPanel

local SettingsLayout = Instance.new("UIListLayout")
SettingsLayout.Padding = UDim.new(0, 12)
SettingsLayout.Parent = SettingsScroll

-- Settings toggle function
local function createSetting(title, description, defaultValue)
    local Container = Instance.new("Frame")
    Container.Name = title
    Container.BackgroundColor3 = Colors.Card
    Container.BackgroundTransparency = 0.7
    Container.BorderSizePixel = 0
    Container.Size = UDim2.new(1, 0, 0, 65)
    Container.Parent = SettingsScroll

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Container

    local Title = Instance.new("TextLabel")
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 10)
    Title.Size = UDim2.new(1, -80, 0, 18)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextSize = 12
    Title.TextColor3 = Colors.TextPrimary
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Container

    local Desc = Instance.new("TextLabel")
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0, 15, 0, 30)
    Desc.Size = UDim2.new(1, -80, 0, 25)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = description
    Desc.TextSize = 10
    Desc.TextColor3 = Colors.TextSecondary
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextWrapped = true
    Desc.Parent = Container

    local Toggle = Instance.new("Frame")
    Toggle.Name = "Toggle"
    Toggle.BackgroundColor3 = defaultValue and Colors.Success or Colors.Border
    Toggle.BorderSizePixel = 0
    Toggle.Position = UDim2.new(1, -55, 0.5, -12)
    Toggle.Size = UDim2.new(0, 45, 0, 24)
    Toggle.Parent = Container

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = Toggle

    local ToggleButton = Instance.new("Frame")
    ToggleButton.Name = "Button"
    ToggleButton.BackgroundColor3 = Colors.TextPrimary
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Position = defaultValue and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
    ToggleButton.Size = UDim2.new(0, 20, 0, 20)
    ToggleButton.Parent = Toggle

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = ToggleButton

    local isEnabled = defaultValue
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.BackgroundTransparency = 1
    ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = Toggle

    ToggleBtn.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            BackgroundColor3 = isEnabled and Colors.Success or Colors.Border
        }):Play()
        TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Position = isEnabled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
        }):Play()
    end)

    return Container, isEnabled
end

createSetting("Auto-Block Enabled", "Automatically block all purchase prompts", true)
createSetting("Show Notifications", "Display notifications when purchases are blocked", true)
createSetting("Sound Effects", "Play sound when blocking purchases", false)
createSetting("Detailed Logging", "Record detailed information in activity logs", true)

--// About Panel
local AboutPanel = Instance.new("Frame")
AboutPanel.Name = "AboutPanel"
AboutPanel.BackgroundTransparency = 1
AboutPanel.Size = UDim2.new(1, 0, 1, 0)
AboutPanel.Visible = false
AboutPanel.Parent = ContentFrame

local AboutScroll = Instance.new("ScrollingFrame")
AboutScroll.BackgroundTransparency = 1
AboutScroll.BorderSizePixel = 0
AboutScroll.Position = UDim2.new(0, 15, 0, 15)
AboutScroll.Size = UDim2.new(1, -30, 1, -30)
AboutScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
AboutScroll.ScrollBarThickness = 4
AboutScroll.ScrollBarImageColor3 = Colors.Primary
AboutScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
AboutScroll.Parent = AboutPanel

local AboutLayout = Instance.new("UIListLayout")
AboutLayout.Padding = UDim.new(0, 15)
AboutLayout.Parent = AboutScroll

-- Info cards
local function createInfoCard(icon, title, content)
    local Card = Instance.new("Frame")
    Card.BackgroundColor3 = Colors.Card
    Card.BackgroundTransparency = 0.6
    Card.BorderSizePixel = 0
    Card.Size = UDim2.new(1, 0, 0, 0)
    Card.AutomaticSize = Enum.AutomaticSize.Y
    Card.Parent = AboutScroll

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 12)
    CardCorner.Parent = Card

    local CardPadding = Instance.new("UIPadding")
    CardPadding.PaddingTop = UDim.new(0, 15)
    CardPadding.PaddingBottom = UDim.new(0, 15)
    CardPadding.PaddingLeft = UDim.new(0, 15)
    CardPadding.PaddingRight = UDim.new(0, 15)
    CardPadding.Parent = Card

    local Icon = Instance.new("TextLabel")
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 0, 0, 0)
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Font = Enum.Font.GothamBold
    Icon.Text = icon
    Icon.TextSize = 20
    Icon.TextColor3 = Colors.Primary
    Icon.Parent = Card

    local Title = Instance.new("TextLabel")
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 40, 0, 5)
    Title.Size = UDim2.new(1, -40, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextSize = 13
    Title.TextColor3 = Colors.TextPrimary
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Card

    local Content = Instance.new("TextLabel")
    Content.BackgroundTransparency = 1
    Content.Position = UDim2.new(0, 0, 0, 35)
    Content.Size = UDim2.new(1, 0, 0, 0)
    Content.AutomaticSize = Enum.AutomaticSize.Y
    Content.Font = Enum.Font.Gotham
    Content.Text = content
    Content.TextSize = 11
    Content.TextColor3 = Colors.TextSecondary
    Content.TextXAlignment = Enum.TextXAlignment.Left
    Content.TextWrapped = true
    Content.TextYAlignment = Enum.TextYAlignment.Top
    Content.Parent = Card
end

createInfoCard("🛡️", "Protection System", "This advanced purchase blocker protects you from unwanted Robux transactions by intercepting 19 different purchase methods used by games.")
createInfoCard("🚀", "Enhanced Features", "• Real-time statistics tracking\n• Comprehensive activity logging\n• Modern glassmorphism UI\n• Smooth animations & effects\n• Customizable settings")
createInfoCard("⚡", "19 Block Methods", "PromptPurchase, PromptProductPurchase, PromptGamePassPurchase, PromptBundlePurchase, PromptNativePurchase, PromptThirdPartyPurchase, PromptSubscriptionPurchase, PromptPremiumPurchase, PerformPurchase, SignalPurchaseSuccess, ProcessPurchase, UserOwnsGamePassAsync, PlayerOwnsAsset, GetProductInfo, PromptRobloxPurchase, PromptBundlePurchaseFinished, PromptGamePassPurchaseFinished, PromptProductPurchaseFinished, PromptPurchaseFinished")
createInfoCard("ℹ️", "How to Use", "The blocker is now active and will automatically intercept all purchase prompts. You can view blocked attempts in the Logs tab, customize settings, and monitor statistics in real-time.")

-- Tab switching logic
local function switchTab(tabId)
    currentTab = tabId
    
    -- Update tab buttons
    for id, tab in pairs(tabs) do
        local isActive = id == tabId
        TweenService:Create(tab, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            BackgroundColor3 = isActive and Colors.Primary or Colors.Card,
            BackgroundTransparency = isActive and 0.2 or 0.5,
            TextColor3 = isActive and Colors.TextPrimary or Colors.TextMuted
        }):Play()
    end
    
    -- Show/hide panels
    LogsPanel.Visible = tabId == "logs"
    SettingsPanel.Visible = tabId == "settings"
    AboutPanel.Visible = tabId == "about"
end

logsTab.MouseButton1Click:Connect(function() switchTab("logs") end)
settingsTab.MouseButton1Click:Connect(function() switchTab("settings") end)
aboutTab.MouseButton1Click:Connect(function() switchTab("about") end)

--// ═══════════════════════════════════════════════════════════════
--//                    DRAGGING SYSTEM
--// ═══════════════════════════════════════════════════════════════

local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        TweenService:Create(MainFrame, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newPos}):Play()
    end
end)

--// Minimize/Maximize
local minimized = false
local originalSize = MainFrame.Size

MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 440, 0, 70)
        }):Play()
        MinimizeBtn.Text = "+"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
            Size = originalSize
        }):Play()
        MinimizeBtn.Text = "—"
    end
end)

-- Button hover effects
for _, btn in ipairs({MinimizeBtn, CloseMainBtn}) do
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = btn == CloseMainBtn and Colors.Danger or Colors.Primary,
            BackgroundTransparency = 0,
            TextColor3 = Colors.TextPrimary
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Colors.Card,
            BackgroundTransparency = 0.3,
            TextColor3 = Colors.TextSecondary
        }):Play()
    end)
end

-- Close button
CloseMainBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 440, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.4)
    MainGui:Destroy()
    NotificationHolder:Destroy()
end)

--// ═══════════════════════════════════════════════════════════════
--//                    INTRO ANIMATION
--// ═══════════════════════════════════════════════════════════════

MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

task.wait(0.1)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = originalSize,
    Position = UDim2.new(0.5, -220, 0.5, -280),
    BackgroundTransparency = 0.15
}):Play()

task.wait(0.7)

--// ═══════════════════════════════════════════════════════════════
--//          PURCHASE BLOCKER LOGIC - 19 METHODS
--// ═══════════════════════════════════════════════════════════════

local blockedMethods = {
    -- Original 8 methods
    ["PromptPurchase"] = true,
    ["PromptProductPurchase"] = true,
    ["PromptGamePassPurchase"] = true,
    ["PromptBundlePurchase"] = true,
    ["PromptNativePurchase"] = true,
    ["PromptThirdPartyPurchase"] = true,
    ["PromptSubscriptionPurchase"] = true,
    ["PromptPremiumPurchase"] = true,
    
    -- Additional 11 methods (V2)
    ["PerformPurchase"] = true,
    ["SignalPurchaseSuccess"] = true,
    ["ProcessPurchase"] = true,
    ["UserOwnsGamePassAsync"] = true,
    ["PlayerOwnsAsset"] = true,
    ["GetProductInfo"] = true,
    ["PromptRobloxPurchase"] = true,
    ["PromptBundlePurchaseFinished"] = true,
    ["PromptGamePassPurchaseFinished"] = true,
    ["PromptProductPurchaseFinished"] = true,
    ["PromptPurchaseFinished"] = true,
}

local function updateStats(method)
    Stats.TotalBlocked = Stats.TotalBlocked + 1
    Stats.BlocksByMethod[method] = (Stats.BlocksByMethod[method] or 0) + 1
    
    table.insert(Stats.BlockHistory, 1, {
        Method = method,
        Time = tick()
    })
    
    if #Stats.BlockHistory > 50 then
        table.remove(Stats.BlockHistory, #Stats.BlockHistory)
    end
    
    blockedValue.Text = tostring(Stats.TotalBlocked)
end

local function notifyBlocked(method)
    updateStats(method)
    
    PushNotification({
        Title = "🚫 Purchase Blocked!",
        Text = method .. " was intercepted and blocked successfully.",
        Duration = 6,
        Type = "blocked"
    })
end

-- Hook __namecall metamethod
local oldnamecall
oldnamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if rawequal(self, MarketplaceService) and blockedMethods[method] then
        notifyBlocked(method)
        return
    end
    return oldnamecall(self, ...)
end))

-- Hook __index metamethod
local oldindex
oldindex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if rawequal(self, MarketplaceService) and blockedMethods[key] then
        notifyBlocked(key)
        return newcclosure(function() return end)
    end
    return oldindex(self, key)
end))

-- Session timer
task.spawn(function()
    while sessionValue and sessionValue.Parent do
        local elapsed = tick() - Stats.SessionStart
        local minutes = math.floor(elapsed / 60)
        local seconds = math.floor(elapsed % 60)
        sessionValue.Text = string.format("%d:%02d", minutes, seconds)
        task.wait(1)
    end
end)

--// ═══════════════════════════════════════════════════════════════
--//                    INITIAL NOTIFICATIONS
--// ═══════════════════════════════════════════════════════════════

PushNotification({
    Title = "🛡️ Purchase Blocker V2 Active",
    Text = "All 19 Robux purchase methods are now being monitored and blocked.",
    Duration = 10,
    Type = "success"
})

task.wait(0.6)

PushNotification({
    Title = "✨ Premium Features Enabled",
    Text = "Enhanced UI, real-time stats, and comprehensive logging are active.",
    Duration = 8,
    Type = "info"
})

task.wait(0.6)

PushNotification({
    Title = "ℹ️ Quick Tip",
    Text = "Check the Settings tab to customize your experience!",
    Duration = 8,
    Type = "info"
})

print("🛡️ Purchase Blocker V2 loaded successfully!")
print("✅ 19 block methods active")
print("🎨 Modern UI initialized")
