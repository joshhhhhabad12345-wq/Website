--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║           SCRIPTBLOX SEARCHER - PREMIUM UI                ║
    ║     The Most Beautiful Script Hub Interface Ever          ║
    ╚═══════════════════════════════════════════════════════════╝
]]

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════
-- CONFIGURATION & CONSTANTS
-- ═══════════════════════════════════════════════════════════

local CONFIG = {
    API_BASE = "https://scriptblox.com/api/script/search",
    ITEMS_PER_PAGE = 12,
    CARD_WIDTH = 280,
    CARD_HEIGHT = 200,
    GRID_PADDING = 15,
    ANIMATION_SPEED = 0.4,
}

local THEME = {
    -- Base Colors
    Background = Color3.fromRGB(15, 23, 42),      -- Deep slate
    Surface = Color3.fromRGB(30, 41, 59),         -- Slate surface
    SurfaceLight = Color3.fromRGB(51, 65, 85),    -- Lighter slate
    
    -- Accent Colors
    Primary = Color3.fromRGB(251, 146, 60),       -- Vibrant orange
    PrimaryDark = Color3.fromRGB(234, 88, 12),    -- Deeper orange
    Secondary = Color3.fromRGB(56, 189, 248),     -- Bright cyan
    SecondaryDark = Color3.fromRGB(14, 165, 233), -- Deep cyan
    
    -- UI Colors
    Text = Color3.fromRGB(241, 245, 249),         -- Almost white
    TextMuted = Color3.fromRGB(148, 163, 184),    -- Muted slate
    Success = Color3.fromRGB(34, 197, 94),        -- Green
    Error = Color3.fromRGB(239, 68, 68),          -- Red
    Warning = Color3.fromRGB(251, 146, 60),       -- Orange
    
    -- Special
    Glow = Color3.fromRGB(251, 146, 60),          -- Orange glow
    Shadow = Color3.fromRGB(0, 0, 0),             -- Pure black
}

-- ═══════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════

local function createGradient(colorSequence)
    local gradient = Instance.new("UIGradient")
    gradient.Color = colorSequence
    return gradient
end

local function createCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function createStroke(color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

local function createShadow(element, size, intensity)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    shadow.ImageColor3 = THEME.Shadow
    shadow.ImageTransparency = 1 - intensity
    shadow.Size = UDim2.new(1, size * 2, 1, size * 2)
    shadow.Position = UDim2.new(0, -size, 0, -size)
    shadow.ZIndex = element.ZIndex - 1
    shadow.Parent = element
    
    local blur = Instance.new("BlurEffect")
    blur.Size = size
    blur.Parent = shadow
    
    return shadow
end

local function animateIn(element, delay)
    delay = delay or 0
    
    element.GroupTransparency = 1
    element.Position = element.Position + UDim2.new(0, 0, 0, 30)
    
    task.wait(delay)
    
    local tweenInfo = TweenInfo.new(
        CONFIG.ANIMATION_SPEED,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )
    
    local tween1 = TweenService:Create(element, tweenInfo, {
        GroupTransparency = 0
    })
    
    local tween2 = TweenService:Create(element, tweenInfo, {
        Position = element.Position - UDim2.new(0, 0, 0, 30)
    })
    
    tween1:Play()
    tween2:Play()
end

local function createRipple(button, clickPosition)
    local ripple = Instance.new("Frame")
    ripple.Name = "Ripple"
    ripple.BackgroundColor3 = THEME.Text
    ripple.BackgroundTransparency = 0.8
    ripple.BorderSizePixel = 0
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, clickPosition.X, 0, clickPosition.Y)
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.ZIndex = button.ZIndex + 10
    ripple.Parent = button
    
    createCorner(9999).Parent = ripple
    
    local maxSize = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2
    
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(ripple, tweenInfo, {
        Size = UDim2.new(0, maxSize, 0, maxSize),
        BackgroundTransparency = 1
    })
    
    tween:Play()
    tween.Completed:Connect(function()
        ripple:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════
-- API FUNCTIONS
-- ═══════════════════════════════════════════════════════════

local function searchScripts(query, page)
    page = page or 1
    local success, result = pcall(function()
        local url = string.format("%s?q=%s&page=%d&max=%d", 
            CONFIG.API_BASE, 
            HttpService:UrlEncode(query),
            page,
            CONFIG.ITEMS_PER_PAGE
        )
        
        local response = HttpService:GetAsync(url)
        return HttpService:JSONDecode(response)
    end)
    
    if success and result then
        return result.result and result.result.scripts or {}
    else
        warn("Failed to fetch scripts:", result)
        return {}
    end
end

-- ═══════════════════════════════════════════════════════════
-- UI COMPONENTS
-- ═══════════════════════════════════════════════════════════

local function createButton(config)
    local button = Instance.new("TextButton")
    button.Name = config.name or "Button"
    button.Size = config.size or UDim2.new(0, 120, 0, 40)
    button.Position = config.position or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = config.backgroundColor or THEME.Primary
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Font = Enum.Font.GothamBold
    button.Text = config.text or "Button"
    button.TextColor3 = THEME.Text
    button.TextSize = config.textSize or 14
    button.ZIndex = config.zIndex or 1
    
    createCorner(8).Parent = button
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = config.hoverColor or THEME.PrimaryDark
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = config.backgroundColor or THEME.Primary
        }):Play()
    end)
    
    -- Ripple effect
    button.MouseButton1Click:Connect(function()
        local mousePos = UserInputService:GetMouseLocation()
        local buttonPos = button.AbsolutePosition
        local relativePos = Vector2.new(
            mousePos.X - buttonPos.X,
            mousePos.Y - buttonPos.Y
        )
        createRipple(button, relativePos)
    end)
    
    if config.onClick then
        button.MouseButton1Click:Connect(config.onClick)
    end
    
    return button
end

local function createScriptCard(scriptData, index)
    local card = Instance.new("Frame")
    card.Name = "ScriptCard"
    card.Size = UDim2.new(0, CONFIG.CARD_WIDTH, 0, CONFIG.CARD_HEIGHT)
    card.BackgroundColor3 = THEME.Surface
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    
    createCorner(12).Parent = card
    createStroke(THEME.SurfaceLight, 1).Parent = card
    
    -- Thumbnail container with gradient overlay
    local thumbnailContainer = Instance.new("Frame")
    thumbnailContainer.Name = "ThumbnailContainer"
    thumbnailContainer.Size = UDim2.new(1, 0, 0.6, 0)
    thumbnailContainer.BackgroundColor3 = THEME.SurfaceLight
    thumbnailContainer.BorderSizePixel = 0
    thumbnailContainer.ClipsDescendants = true
    thumbnailContainer.Parent = card
    
    -- Thumbnail image
    local thumbnail = Instance.new("ImageLabel")
    thumbnail.Name = "Thumbnail"
    thumbnail.Size = UDim2.new(1, 0, 1, 0)
    thumbnail.BackgroundTransparency = 1
    thumbnail.BorderSizePixel = 0
    thumbnail.ScaleType = Enum.ScaleType.Crop
    thumbnail.Image = scriptData.game and scriptData.game.imageUrl or ""
    thumbnail.Parent = thumbnailContainer
    
    -- Gradient overlay for readability
    local overlay = Instance.new("Frame")
    overlay.Name = "Overlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundTransparency = 1
    overlay.BorderSizePixel = 0
    overlay.Parent = thumbnailContainer
    
    local gradientOverlay = createGradient(ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    })
    gradientOverlay.Rotation = 90
    gradientOverlay.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.5, 0.5),
        NumberSequenceKeypoint.new(1, 0.2)
    }
    gradientOverlay.Parent = overlay
    
    -- Universal Script Badge
    if scriptData.isUniversal or scriptData.isPatched == false then
        local badge = Instance.new("Frame")
        badge.Name = "Badge"
        badge.Size = UDim2.new(0, 110, 0, 22)
        badge.Position = UDim2.new(0, 10, 0, 10)
        badge.BackgroundColor3 = THEME.Primary
        badge.BorderSizePixel = 0
        badge.ZIndex = 2
        badge.Parent = thumbnailContainer
        
        createCorner(4).Parent = badge
        
        local badgeText = Instance.new("TextLabel")
        badgeText.Size = UDim2.new(1, 0, 1, 0)
        badgeText.BackgroundTransparency = 1
        badgeText.Font = Enum.Font.GothamBold
        badgeText.Text = "UNIVERSAL"
        badgeText.TextColor3 = THEME.Text
        badgeText.TextSize = 10
        badgeText.Parent = badge
    end
    
    -- Action buttons container
    local actionsContainer = Instance.new("Frame")
    actionsContainer.Name = "Actions"
    actionsContainer.Size = UDim2.new(0, 70, 0, 28)
    actionsContainer.Position = UDim2.new(1, -80, 0, 10)
    actionsContainer.BackgroundTransparency = 1
    actionsContainer.ZIndex = 2
    actionsContainer.Parent = thumbnailContainer
    
    -- Copy button
    local copyBtn = Instance.new("ImageButton")
    copyBtn.Name = "CopyButton"
    copyBtn.Size = UDim2.new(0, 28, 0, 28)
    copyBtn.Position = UDim2.new(0, 0, 0, 0)
    copyBtn.BackgroundColor3 = THEME.Primary
    copyBtn.BorderSizePixel = 0
    copyBtn.Image = "rbxassetid://3926305904" -- Copy icon
    copyBtn.ImageColor3 = THEME.Text
    copyBtn.ImageRectOffset = Vector2.new(324, 364)
    copyBtn.ImageRectSize = Vector2.new(36, 36)
    copyBtn.Parent = actionsContainer
    
    createCorner(6).Parent = copyBtn
    
    -- Execute button
    local execBtn = Instance.new("ImageButton")
    execBtn.Name = "ExecButton"
    execBtn.Size = UDim2.new(0, 28, 0, 28)
    execBtn.Position = UDim2.new(0, 35, 0, 0)
    execBtn.BackgroundColor3 = THEME.Secondary
    execBtn.BorderSizePixel = 0
    execBtn.Image = "rbxassetid://3926305904" -- Play icon
    execBtn.ImageColor3 = THEME.Text
    execBtn.ImageRectOffset = Vector2.new(804, 124)
    execBtn.ImageRectSize = Vector2.new(36, 36)
    execBtn.Parent = actionsContainer
    
    createCorner(6).Parent = execBtn
    
    -- Info container
    local infoContainer = Instance.new("Frame")
    infoContainer.Name = "Info"
    infoContainer.Size = UDim2.new(1, -20, 0.4, -10)
    infoContainer.Position = UDim2.new(0, 10, 0.6, 5)
    infoContainer.BackgroundTransparency = 1
    infoContainer.Parent = card
    
    -- Script title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = scriptData.title or "Untitled Script"
    title.TextColor3 = THEME.Text
    title.TextSize = 13
    title.TextWrapped = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Top
    title.TextTruncate = Enum.TextTruncate.AtEnd
    title.Parent = infoContainer
    
    -- Game name
    local gameName = Instance.new("TextLabel")
    gameName.Name = "GameName"
    gameName.Size = UDim2.new(1, 0, 0, 16)
    gameName.Position = UDim2.new(0, 0, 1, -16)
    gameName.BackgroundTransparency = 1
    gameName.Font = Enum.Font.Gotham
    gameName.Text = scriptData.game and scriptData.game.name or "Unknown Game"
    gameName.TextColor3 = THEME.TextMuted
    gameName.TextSize = 10
    gameName.TextXAlignment = Enum.TextXAlignment.Left
    gameName.TextTruncate = Enum.TextTruncate.AtEnd
    gameName.Parent = infoContainer
    
    -- Hover effect
    card.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {
            BackgroundColor3 = THEME.SurfaceLight,
            Size = UDim2.new(0, CONFIG.CARD_WIDTH + 4, 0, CONFIG.CARD_HEIGHT + 4)
        }):Play()
        
        TweenService:Create(thumbnail, TweenInfo.new(0.3), {
            Size = UDim2.new(1.1, 0, 1.1, 0),
            Position = UDim2.new(-0.05, 0, -0.05, 0)
        }):Play()
    end)
    
    card.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(0, CONFIG.CARD_WIDTH, 0, CONFIG.CARD_HEIGHT)
        }):Play()
        
        TweenService:Create(thumbnail, TweenInfo.new(0.3), {
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
    end)
    
    -- Copy button functionality
    copyBtn.MouseButton1Click:Connect(function()
        if scriptData.script then
            setclipboard(scriptData.script)
            
            -- Visual feedback
            local originalColor = copyBtn.BackgroundColor3
            copyBtn.BackgroundColor3 = THEME.Success
            task.wait(0.3)
            TweenService:Create(copyBtn, TweenInfo.new(0.3), {
                BackgroundColor3 = originalColor
            }):Play()
        end
    end)
    
    -- Execute button functionality
    execBtn.MouseButton1Click:Connect(function()
        if scriptData.script then
            local success, err = pcall(function()
                loadstring(scriptData.script)()
            end)
            
            -- Visual feedback
            local originalColor = execBtn.BackgroundColor3
            execBtn.BackgroundColor3 = success and THEME.Success or THEME.Error
            task.wait(0.3)
            TweenService:Create(execBtn, TweenInfo.new(0.3), {
                BackgroundColor3 = originalColor
            }):Play()
        end
    end)
    
    -- Animate in with delay
    animateIn(card, index * 0.05)
    
    return card
end

-- ═══════════════════════════════════════════════════════════
-- MAIN UI CREATION
-- ═══════════════════════════════════════════════════════════

local function createUI()
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ScriptBloxHub"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui
    
    -- Main container
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 900, 0, 650)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = THEME.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    
    createCorner(16).Parent = mainFrame
    createStroke(THEME.SurfaceLight, 2).Parent = mainFrame
    
    -- Animated background gradient
    local bgGradient = Instance.new("Frame")
    bgGradient.Name = "BGGradient"
    bgGradient.Size = UDim2.new(1.5, 0, 1.5, 0)
    bgGradient.Position = UDim2.new(-0.25, 0, -0.25, 0)
    bgGradient.BackgroundTransparency = 1
    bgGradient.BorderSizePixel = 0
    bgGradient.ZIndex = 0
    bgGradient.Parent = mainFrame
    
    local gradient = createGradient(ColorSequence.new{
        ColorSequenceKeypoint.new(0, THEME.Primary),
        ColorSequenceKeypoint.new(0.5, THEME.Secondary),
        ColorSequenceKeypoint.new(1, THEME.Primary)
    })
    gradient.Transparency = NumberSequence.new(0.95)
    gradient.Rotation = 45
    gradient.Parent = bgGradient
    
    -- Rotate gradient animation
    task.spawn(function()
        while true do
            TweenService:Create(gradient, TweenInfo.new(10, Enum.EasingStyle.Linear), {
                Rotation = gradient.Rotation + 360
            }):Play()
            task.wait(10)
        end
    end)
    
    -- Header
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 80)
    header.BackgroundColor3 = THEME.Surface
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    createCorner(16).Parent = header
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0, 300, 0, 35)
    title.Position = UDim2.new(0, 25, 0, 15)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "Script Hub"
    title.TextColor3 = THEME.Text
    title.TextSize = 28
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    -- Powered by text
    local poweredBy = Instance.new("TextLabel")
    poweredBy.Name = "PoweredBy"
    poweredBy.Size = UDim2.new(0, 200, 0, 15)
    poweredBy.Position = UDim2.new(0, 25, 0, 52)
    poweredBy.BackgroundTransparency = 1
    poweredBy.Font = Enum.Font.Gotham
    poweredBy.Text = "Powered by scriptblox.com"
    poweredBy.TextColor3 = THEME.TextMuted
    poweredBy.TextSize = 11
    poweredBy.TextXAlignment = Enum.TextXAlignment.Left
    poweredBy.Parent = header
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.Position = UDim2.new(1, -55, 0, 20)
    closeBtn.BackgroundColor3 = THEME.Error
    closeBtn.BorderSizePixel = 0
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = THEME.Text
    closeBtn.TextSize = 20
    closeBtn.Parent = header
    
    createCorner(8).Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    -- Search container
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(1, -50, 0, 50)
    searchContainer.Position = UDim2.new(0, 25, 0, 95)
    searchContainer.BackgroundColor3 = THEME.Surface
    searchContainer.BorderSizePixel = 0
    searchContainer.Parent = mainFrame
    
    createCorner(10).Parent = searchContainer
    createStroke(THEME.SurfaceLight, 1).Parent = searchContainer
    
    -- Search icon
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0, 15, 0.5, -10)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://3926305904"
    searchIcon.ImageRectOffset = Vector2.new(964, 324)
    searchIcon.ImageRectSize = Vector2.new(36, 36)
    searchIcon.ImageColor3 = THEME.TextMuted
    searchIcon.Parent = searchContainer
    
    -- Search box
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -120, 1, -10)
    searchBox.Position = UDim2.new(0, 45, 0, 5)
    searchBox.BackgroundTransparency = 1
    searchBox.Font = Enum.Font.Gotham
    searchBox.PlaceholderText = "Search scripts..."
    searchBox.PlaceholderColor3 = THEME.TextMuted
    searchBox.Text = ""
    searchBox.TextColor3 = THEME.Text
    searchBox.TextSize = 14
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.ClearTextOnFocus = false
    searchBox.Parent = searchContainer
    
    -- Search button
    local searchBtn = createButton{
        name = "SearchButton",
        size = UDim2.new(0, 60, 0, 35),
        position = UDim2.new(1, -70, 0.5, -17.5),
        backgroundColor = THEME.Primary,
        hoverColor = THEME.PrimaryDark,
        text = "Search",
        textSize = 12,
    }
    searchBtn.Parent = searchContainer
    
    -- Results container with scrolling
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, -50, 1, -170)
    scrollFrame.Position = UDim2.new(0, 25, 0, 160)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = THEME.Primary
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = mainFrame
    
    -- Grid layout
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellSize = UDim2.new(0, CONFIG.CARD_WIDTH, 0, CONFIG.CARD_HEIGHT)
    gridLayout.CellPadding = UDim2.new(0, CONFIG.GRID_PADDING, 0, CONFIG.GRID_PADDING)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = scrollFrame
    
    -- Loading indicator
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Name = "LoadingFrame"
    loadingFrame.Size = UDim2.new(1, 0, 1, -170)
    loadingFrame.Position = UDim2.new(0, 0, 0, 160)
    loadingFrame.BackgroundTransparency = 0.3
    loadingFrame.BackgroundColor3 = THEME.Background
    loadingFrame.BorderSizePixel = 0
    loadingFrame.Visible = false
    loadingFrame.ZIndex = 10
    loadingFrame.Parent = mainFrame
    
    local loadingText = Instance.new("TextLabel")
    loadingText.Size = UDim2.new(1, 0, 0, 30)
    loadingText.Position = UDim2.new(0, 0, 0.5, -15)
    loadingText.BackgroundTransparency = 1
    loadingText.Font = Enum.Font.GothamBold
    loadingText.Text = "Loading scripts..."
    loadingText.TextColor3 = THEME.Text
    loadingText.TextSize = 16
    loadingText.Parent = loadingFrame
    
    -- Spinning loader
    local loader = Instance.new("Frame")
    loader.Size = UDim2.new(0, 40, 0, 40)
    loader.Position = UDim2.new(0.5, -20, 0.5, -50)
    loader.BackgroundTransparency = 1
    loader.Parent = loadingFrame
    
    local loaderCircle = Instance.new("ImageLabel")
    loaderCircle.Size = UDim2.new(1, 0, 1, 0)
    loaderCircle.BackgroundTransparency = 1
    loaderCircle.Image = "rbxassetid://3926305904"
    loaderCircle.ImageRectOffset = Vector2.new(764, 244)
    loaderCircle.ImageRectSize = Vector2.new(36, 36)
    loaderCircle.ImageColor3 = THEME.Primary
    loaderCircle.Parent = loader
    
    task.spawn(function()
        while loadingFrame.Visible do
            TweenService:Create(loaderCircle, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                Rotation = loaderCircle.Rotation + 360
            }):Play()
            task.wait(1)
        end
    end)
    
    -- ═══════════════════════════════════════════════════════
    -- SEARCH FUNCTIONALITY
    -- ═══════════════════════════════════════════════════════
    
    local function performSearch()
        local query = searchBox.Text
        if query == "" then
            query = "universal"
        end
        
        -- Show loading
        loadingFrame.Visible = true
        scrollFrame.Visible = false
        
        -- Clear existing cards
        for _, child in ipairs(scrollFrame:GetChildren()) do
            if child:IsA("Frame") and child.Name == "ScriptCard" then
                child:Destroy()
            end
        end
        
        -- Search scripts
        task.spawn(function()
            local scripts = searchScripts(query, 1)
            
            task.wait(0.5) -- Minimum loading time for smoothness
            
            if scripts and #scripts > 0 then
                for i, scriptData in ipairs(scripts) do
                    local card = createScriptCard(scriptData, i)
                    card.Parent = scrollFrame
                end
                
                -- Update canvas size
                gridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, gridLayout.AbsoluteContentSize.Y + CONFIG.GRID_PADDING)
                end)
                scrollFrame.CanvasSize = UDim2.new(0, 0, 0, gridLayout.AbsoluteContentSize.Y + CONFIG.GRID_PADDING)
            else
                -- No results
                local noResults = Instance.new("TextLabel")
                noResults.Size = UDim2.new(1, 0, 0, 100)
                noResults.Position = UDim2.new(0, 0, 0.5, -50)
                noResults.BackgroundTransparency = 1
                noResults.Font = Enum.Font.GothamBold
                noResults.Text = "No scripts found. Try a different search!"
                noResults.TextColor3 = THEME.TextMuted
                noResults.TextSize = 16
                noResults.Parent = scrollFrame
            end
            
            loadingFrame.Visible = false
            scrollFrame.Visible = true
        end)
    end
    
    searchBtn.MouseButton1Click:Connect(performSearch)
    searchBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            performSearch()
        end
    end)
    
    -- Initial search for "universal" scripts
    task.wait(0.1)
    performSearch()
    
    -- Draggable functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
    
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)
    
    -- Entrance animation
    mainFrame.GroupTransparency = 1
    mainFrame.Size = UDim2.new(0, 800, 0, 550)
    
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(mainFrame, tweenInfo, {
        GroupTransparency = 0,
        Size = UDim2.new(0, 900, 0, 650)
    }):Play()
    
    return screenGui
end

-- ═══════════════════════════════════════════════════════════
-- INITIALIZE
-- ═══════════════════════════════════════════════════════════

local success, gui = pcall(createUI)

if success then
    print("╔═══════════════════════════════════════════════════════════╗")
    print("║     ScriptBlox Hub Loaded Successfully!                   ║")
    print("║     Premium UI v1.0 - The Ultimate Script Searcher        ║")
    print("╚═══════════════════════════════════════════════════════════╝")
else
    warn("Failed to create UI:", gui)
end
