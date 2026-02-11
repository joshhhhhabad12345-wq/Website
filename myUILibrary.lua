--[[
    myUI Library - A comprehensive Roblox UI Library
    Based on the design sketch
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local myUI = {}
myUI.__index = myUI

-- Constants
local THEME = {
    Background = Color3.fromRGB(25, 25, 35),
    Secondary = Color3.fromRGB(35, 35, 45),
    Accent = Color3.fromRGB(88, 101, 242),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(180, 180, 190),
    Success = Color3.fromRGB(67, 181, 129),
    Warning = Color3.fromRGB(250, 166, 26),
    Error = Color3.fromRGB(237, 66, 69),
}

local DEFAULTS = {
    WindowSize = UDim2.new(0, 550, 0, 400),
    AnimationSpeed = 0.3,
    CornerRadius = UDim.new(0, 8),
}

-- Utility Functions
local function CreateTween(instance, properties, duration)
    duration = duration or DEFAULTS.AnimationSpeed
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

local function CreateCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or DEFAULTS.CornerRadius
    return corner
end

local function CreatePadding(left, right, top, bottom)
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, left or 10)
    padding.PaddingRight = UDim.new(0, right or 10)
    padding.PaddingTop = UDim.new(0, top or 10)
    padding.PaddingBottom = UDim.new(0, bottom or 10)
    return padding
end

-- Main Library Constructor
function myUI:New(config)
    local library = setmetatable({}, myUI)
    
    library.Name = config.Name or "myUI Library"
    library.Theme = config.Theme or THEME
    library.Size = config.Size or DEFAULTS.WindowSize
    library.Pages = {}
    library.CurrentPage = nil
    library.Notifications = {}
    library.Keybinds = {}
    library.Values = {}
    
    -- Create ScreenGui
    library.ScreenGui = Instance.new("ScreenGui")
    library.ScreenGui.Name = "myUILibrary"
    library.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    library.ScreenGui.ResetOnSpawn = false
    library.ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Create Main Window
    library:CreateMainWindow()
    
    -- Setup Keybind System
    library:SetupKeybindSystem()
    
    return library
end

-- Main Window Creation
function myUI:CreateMainWindow()
    local window = Instance.new("Frame")
    window.Name = "MainWindow"
    window.Size = self.Size
    window.Position = UDim2.new(0.5, 0, 0.5, 0)
    window.AnchorPoint = Vector2.new(0.5, 0.5)
    window.BackgroundColor3 = self.Theme.Background
    window.BorderSizePixel = 0
    window.Parent = self.ScreenGui
    
    CreateCorner().Parent = window
    
    -- Make Draggable
    self:MakeDraggable(window)
    
    -- Create Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = self.Theme.Secondary
    titleBar.BorderSizePixel = 0
    titleBar.Parent = window
    
    CreateCorner().Parent = titleBar
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -50, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = self.Name
    title.TextColor3 = self.Theme.Text
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0.5, 0)
    closeBtn.AnchorPoint = Vector2.new(0, 0.5)
    closeBtn.BackgroundColor3 = self.Theme.Error
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 24
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = titleBar
    
    CreateCorner(UDim.new(0, 6)).Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        window.Visible = false
    end)
    
    -- Sidebar for Pages
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 150, 1, -50)
    sidebar.Position = UDim2.new(0, 10, 0, 45)
    sidebar.BackgroundColor3 = self.Theme.Secondary
    sidebar.BorderSizePixel = 0
    sidebar.Parent = window
    
    CreateCorner().Parent = sidebar
    
    local sidebarList = Instance.new("UIListLayout")
    sidebarList.SortOrder = Enum.SortOrder.LayoutOrder
    sidebarList.Padding = UDim.new(0, 5)
    sidebarList.Parent = sidebar
    
    CreatePadding(5, 5, 5, 5).Parent = sidebar
    
    -- Content Area
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -175, 1, -50)
    content.Position = UDim2.new(0, 165, 0, 45)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.Parent = window
    
    self.Window = window
    self.Sidebar = sidebar
    self.Content = content
end

-- Make Window Draggable
function myUI:MakeDraggable(frame)
    local dragging = false
    local dragInput, mousePos, framePos
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Create Page
function myUI:CreatePage(config)
    local pageName = config.Name or "Page"
    local pageIcon = config.Icon or "📄"
    
    local page = {
        Name = pageName,
        Sections = {},
        Container = nil,
        Button = nil,
    }
    
    -- Create Page Button
    local pageBtn = Instance.new("TextButton")
    pageBtn.Name = pageName
    pageBtn.Size = UDim2.new(1, 0, 0, 35)
    pageBtn.BackgroundColor3 = self.Theme.Background
    pageBtn.Text = pageIcon .. " " .. pageName
    pageBtn.TextColor3 = self.Theme.SubText
    pageBtn.TextSize = 14
    pageBtn.Font = Enum.Font.Gotham
    pageBtn.BorderSizePixel = 0
    pageBtn.AutoButtonColor = false
    pageBtn.Parent = self.Sidebar
    
    CreateCorner(UDim.new(0, 6)).Parent = pageBtn
    
    -- Create Page Container
    local pageContainer = Instance.new("ScrollingFrame")
    pageContainer.Name = pageName .. "Container"
    pageContainer.Size = UDim2.new(1, 0, 1, 0)
    pageContainer.BackgroundTransparency = 1
    pageContainer.BorderSizePixel = 0
    pageContainer.ScrollBarThickness = 4
    pageContainer.ScrollBarImageColor3 = self.Theme.Accent
    pageContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    pageContainer.Visible = false
    pageContainer.Parent = self.Content
    
    local containerList = Instance.new("UIListLayout")
    containerList.SortOrder = Enum.SortOrder.LayoutOrder
    containerList.Padding = UDim.new(0, 10)
    containerList.Parent = pageContainer
    
    CreatePadding(10, 10, 10, 10).Parent = pageContainer
    
    containerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pageContainer.CanvasSize = UDim2.new(0, 0, 0, containerList.AbsoluteContentSize.Y + 20)
    end)
    
    page.Container = pageContainer
    page.Button = pageBtn
    
    -- Page Selection Logic
    pageBtn.MouseButton1Click:Connect(function()
        self:SelectPage(pageName)
    end)
    
    self.Pages[pageName] = page
    
    -- Select first page by default
    if not self.CurrentPage then
        self:SelectPage(pageName)
    end
    
    return setmetatable(page, {__index = self:GetPageMethods()})
end

-- Select Page
function myUI:SelectPage(pageName)
    for name, page in pairs(self.Pages) do
        if name == pageName then
            page.Container.Visible = true
            CreateTween(page.Button, {BackgroundColor3 = self.Theme.Accent, TextColor3 = self.Theme.Text})
            self.CurrentPage = name
        else
            page.Container.Visible = false
            CreateTween(page.Button, {BackgroundColor3 = self.Theme.Background, TextColor3 = self.Theme.SubText})
        end
    end
end

-- Page Methods
function myUI:GetPageMethods()
    local methods = {}
    
    -- Create Section
    function methods:CreateSection(sectionName)
        local section = {
            Name = sectionName,
            Elements = {},
            Container = nil,
        }
        
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Name = sectionName
        sectionFrame.Size = UDim2.new(1, 0, 0, 0)
        sectionFrame.BackgroundColor3 = myUI.Theme.Secondary
        sectionFrame.BorderSizePixel = 0
        sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
        sectionFrame.Parent = self.Container
        
        CreateCorner().Parent = sectionFrame
        
        local sectionTitle = Instance.new("TextLabel")
        sectionTitle.Name = "SectionTitle"
        sectionTitle.Size = UDim2.new(1, 0, 0, 30)
        sectionTitle.BackgroundTransparency = 1
        sectionTitle.Text = sectionName
        sectionTitle.TextColor3 = myUI.Theme.Text
        sectionTitle.TextSize = 16
        sectionTitle.Font = Enum.Font.GothamBold
        sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        sectionTitle.Parent = sectionFrame
        
        CreatePadding(10, 10, 5, 0).Parent = sectionTitle
        
        local elementsContainer = Instance.new("Frame")
        elementsContainer.Name = "Elements"
        elementsContainer.Size = UDim2.new(1, 0, 0, 0)
        elementsContainer.Position = UDim2.new(0, 0, 0, 35)
        elementsContainer.BackgroundTransparency = 1
        elementsContainer.AutomaticSize = Enum.AutomaticSize.Y
        elementsContainer.Parent = sectionFrame
        
        local elementsList = Instance.new("UIListLayout")
        elementsList.SortOrder = Enum.SortOrder.LayoutOrder
        elementsList.Padding = UDim.new(0, 5)
        elementsList.Parent = elementsContainer
        
        CreatePadding(10, 10, 5, 10).Parent = elementsContainer
        
        section.Container = elementsContainer
        table.insert(self.Sections, section)
        
        return setmetatable(section, {__index = myUI:GetSectionMethods()})
    end
    
    return methods
end

-- Section Methods
function myUI:GetSectionMethods()
    local methods = {}
    
    -- Create Button
    function methods:CreateButton(config)
        local buttonName = config.Name or "Button"
        local callback = config.Callback or function() end
        
        local button = Instance.new("TextButton")
        button.Name = buttonName
        button.Size = UDim2.new(1, 0, 0, 35)
        button.BackgroundColor3 = myUI.Theme.Accent
        button.Text = buttonName
        button.TextColor3 = myUI.Theme.Text
        button.TextSize = 14
        button.Font = Enum.Font.GothamSemibold
        button.BorderSizePixel = 0
        button.AutoButtonColor = false
        button.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = button
        
        button.MouseEnter:Connect(function()
            CreateTween(button, {BackgroundColor3 = Color3.fromRGB(
                myUI.Theme.Accent.R * 255 * 1.1,
                myUI.Theme.Accent.G * 255 * 1.1,
                myUI.Theme.Accent.B * 255 * 1.1
            )})
        end)
        
        button.MouseLeave:Connect(function()
            CreateTween(button, {BackgroundColor3 = myUI.Theme.Accent})
        end)
        
        button.MouseButton1Click:Connect(function()
            CreateTween(button, {Size = UDim2.new(1, 0, 0, 32)})
            wait(0.1)
            CreateTween(button, {Size = UDim2.new(1, 0, 0, 35)})
            callback()
        end)
        
        return button
    end
    
    -- Create Toggle
    function methods:CreateToggle(config)
        local toggleName = config.Name or "Toggle"
        local default = config.Default or false
        local callback = config.Callback or function() end
        
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Name = toggleName
        toggleFrame.Size = UDim2.new(1, 0, 0, 35)
        toggleFrame.BackgroundColor3 = myUI.Theme.Background
        toggleFrame.BorderSizePixel = 0
        toggleFrame.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = toggleFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -50, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = toggleName
        label.TextColor3 = myUI.Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = toggleFrame
        
        local toggleButton = Instance.new("TextButton")
        toggleButton.Size = UDim2.new(0, 40, 0, 20)
        toggleButton.Position = UDim2.new(1, -45, 0.5, 0)
        toggleButton.AnchorPoint = Vector2.new(0, 0.5)
        toggleButton.BackgroundColor3 = default and myUI.Theme.Success or myUI.Theme.SubText
        toggleButton.Text = ""
        toggleButton.BorderSizePixel = 0
        toggleButton.Parent = toggleFrame
        
        CreateCorner(UDim.new(1, 0)).Parent = toggleButton
        
        local toggleCircle = Instance.new("Frame")
        toggleCircle.Size = UDim2.new(0, 16, 0, 16)
        toggleCircle.Position = default and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
        toggleCircle.AnchorPoint = Vector2.new(0, 0.5)
        toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleCircle.BorderSizePixel = 0
        toggleCircle.Parent = toggleButton
        
        CreateCorner(UDim.new(1, 0)).Parent = toggleCircle
        
        local toggled = default
        
        toggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            
            if toggled then
                CreateTween(toggleButton, {BackgroundColor3 = myUI.Theme.Success})
                CreateTween(toggleCircle, {Position = UDim2.new(1, -18, 0.5, 0)})
            else
                CreateTween(toggleButton, {BackgroundColor3 = myUI.Theme.SubText})
                CreateTween(toggleCircle, {Position = UDim2.new(0, 2, 0.5, 0)})
            end
            
            callback(toggled)
        end)
        
        return {
            SetValue = function(value)
                toggled = value
                if toggled then
                    CreateTween(toggleButton, {BackgroundColor3 = myUI.Theme.Success})
                    CreateTween(toggleCircle, {Position = UDim2.new(1, -18, 0.5, 0)})
                else
                    CreateTween(toggleButton, {BackgroundColor3 = myUI.Theme.SubText})
                    CreateTween(toggleCircle, {Position = UDim2.new(0, 2, 0.5, 0)})
                end
                callback(toggled)
            end,
            GetValue = function()
                return toggled
            end
        }
    end
    
    -- Create Slider
    function methods:CreateSlider(config)
        local sliderName = config.Name or "Slider"
        local min = config.Min or 0
        local max = config.Max or 100
        local default = config.Default or min
        local increment = config.Increment or 1
        local callback = config.Callback or function() end
        
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Name = sliderName
        sliderFrame.Size = UDim2.new(1, 0, 0, 50)
        sliderFrame.BackgroundColor3 = myUI.Theme.Background
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = sliderFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -60, 0, 20)
        label.Position = UDim2.new(0, 10, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = sliderName
        label.TextColor3 = myUI.Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sliderFrame
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0, 50, 0, 20)
        valueLabel.Position = UDim2.new(1, -55, 0, 5)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = myUI.Theme.Accent
        valueLabel.TextSize = 14
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Parent = sliderFrame
        
        local sliderBar = Instance.new("Frame")
        sliderBar.Size = UDim2.new(1, -20, 0, 6)
        sliderBar.Position = UDim2.new(0, 10, 1, -15)
        sliderBar.BackgroundColor3 = myUI.Theme.Secondary
        sliderBar.BorderSizePixel = 0
        sliderBar.Parent = sliderFrame
        
        CreateCorner(UDim.new(1, 0)).Parent = sliderBar
        
        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        sliderFill.BackgroundColor3 = myUI.Theme.Accent
        sliderFill.BorderSizePixel = 0
        sliderFill.Parent = sliderBar
        
        CreateCorner(UDim.new(1, 0)).Parent = sliderFill
        
        local sliderButton = Instance.new("TextButton")
        sliderButton.Size = UDim2.new(0, 14, 0, 14)
        sliderButton.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
        sliderButton.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderButton.BackgroundColor3 = myUI.Theme.Text
        sliderButton.Text = ""
        sliderButton.BorderSizePixel = 0
        sliderButton.Parent = sliderBar
        
        CreateCorner(UDim.new(1, 0)).Parent = sliderButton
        
        local currentValue = default
        local dragging = false
        
        local function updateSlider(input)
            local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            local value = math.floor((min + (max - min) * relativeX) / increment + 0.5) * increment
            value = math.clamp(value, min, max)
            
            currentValue = value
            valueLabel.Text = tostring(value)
            
            local percentage = (value - min) / (max - min)
            CreateTween(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.1)
            CreateTween(sliderButton, {Position = UDim2.new(percentage, 0, 0.5, 0)}, 0.1)
            
            callback(value)
        end
        
        sliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                updateSlider(input)
            end
        end)
        
        sliderBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                updateSlider(input)
            end
        end)
        
        return {
            SetValue = function(value)
                currentValue = math.clamp(value, min, max)
                valueLabel.Text = tostring(currentValue)
                local percentage = (currentValue - min) / (max - min)
                CreateTween(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)})
                CreateTween(sliderButton, {Position = UDim2.new(percentage, 0, 0.5, 0)})
                callback(currentValue)
            end,
            GetValue = function()
                return currentValue
            end
        }
    end
    
    -- Create Dropdown
    function methods:CreateDropdown(config)
        local dropdownName = config.Name or "Dropdown"
        local options = config.Options or {"Option 1", "Option 2"}
        local default = config.Default or options[1]
        local callback = config.Callback or function() end
        
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Name = dropdownName
        dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
        dropdownFrame.BackgroundColor3 = myUI.Theme.Background
        dropdownFrame.BorderSizePixel = 0
        dropdownFrame.ClipsDescendants = false
        dropdownFrame.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = dropdownFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -30, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = dropdownName .. ": " .. default
        label.TextColor3 = myUI.Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = dropdownFrame
        
        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.new(0, 20, 1, 0)
        arrow.Position = UDim2.new(1, -25, 0, 0)
        arrow.BackgroundTransparency = 1
        arrow.Text = "▼"
        arrow.TextColor3 = myUI.Theme.Text
        arrow.TextSize = 12
        arrow.Font = Enum.Font.Gotham
        arrow.Parent = dropdownFrame
        
        local optionsFrame = Instance.new("Frame")
        optionsFrame.Name = "Options"
        optionsFrame.Size = UDim2.new(1, 0, 0, 0)
        optionsFrame.Position = UDim2.new(0, 0, 1, 5)
        optionsFrame.BackgroundColor3 = myUI.Theme.Secondary
        optionsFrame.BorderSizePixel = 0
        optionsFrame.Visible = false
        optionsFrame.ClipsDescendants = true
        optionsFrame.ZIndex = 10
        optionsFrame.Parent = dropdownFrame
        
        CreateCorner(UDim.new(0, 6)).Parent = optionsFrame
        
        local optionsList = Instance.new("UIListLayout")
        optionsList.SortOrder = Enum.SortOrder.LayoutOrder
        optionsList.Padding = UDim.new(0, 2)
        optionsList.Parent = optionsFrame
        
        CreatePadding(5, 5, 5, 5).Parent = optionsFrame
        
        local currentValue = default
        local isOpen = false
        
        for _, option in ipairs(options) do
            local optionBtn = Instance.new("TextButton")
            optionBtn.Size = UDim2.new(1, 0, 0, 25)
            optionBtn.BackgroundColor3 = option == currentValue and myUI.Theme.Accent or myUI.Theme.Background
            optionBtn.Text = option
            optionBtn.TextColor3 = myUI.Theme.Text
            optionBtn.TextSize = 12
            optionBtn.Font = Enum.Font.Gotham
            optionBtn.BorderSizePixel = 0
            optionBtn.AutoButtonColor = false
            optionBtn.Parent = optionsFrame
            
            CreateCorner(UDim.new(0, 4)).Parent = optionBtn
            
            optionBtn.MouseEnter:Connect(function()
                if option ~= currentValue then
                    CreateTween(optionBtn, {BackgroundColor3 = myUI.Theme.Secondary})
                end
            end)
            
            optionBtn.MouseLeave:Connect(function()
                if option ~= currentValue then
                    CreateTween(optionBtn, {BackgroundColor3 = myUI.Theme.Background})
                end
            end)
            
            optionBtn.MouseButton1Click:Connect(function()
                currentValue = option
                label.Text = dropdownName .. ": " .. option
                
                for _, btn in ipairs(optionsFrame:GetChildren()) do
                    if btn:IsA("TextButton") then
                        CreateTween(btn, {BackgroundColor3 = myUI.Theme.Background})
                    end
                end
                
                CreateTween(optionBtn, {BackgroundColor3 = myUI.Theme.Accent})
                
                isOpen = false
                CreateTween(optionsFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                CreateTween(arrow, {Rotation = 0}, 0.2)
                wait(0.2)
                optionsFrame.Visible = false
                
                callback(option)
            end)
        end
        
        local dropdownButton = Instance.new("TextButton")
        dropdownButton.Size = UDim2.new(1, 0, 1, 0)
        dropdownButton.BackgroundTransparency = 1
        dropdownButton.Text = ""
        dropdownButton.ZIndex = 5
        dropdownButton.Parent = dropdownFrame
        
        dropdownButton.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            
            if isOpen then
                optionsFrame.Visible = true
                local targetHeight = (#options * 27) + 10
                CreateTween(optionsFrame, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.2)
                CreateTween(arrow, {Rotation = 180}, 0.2)
            else
                CreateTween(optionsFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                CreateTween(arrow, {Rotation = 0}, 0.2)
                wait(0.2)
                optionsFrame.Visible = false
            end
        end)
        
        return {
            SetValue = function(value)
                if table.find(options, value) then
                    currentValue = value
                    label.Text = dropdownName .. ": " .. value
                    callback(value)
                end
            end,
            GetValue = function()
                return currentValue
            end
        }
    end
    
    -- Create Textbox
    function methods:CreateTextbox(config)
        local textboxName = config.Name or "Textbox"
        local placeholder = config.Placeholder or "Enter text..."
        local default = config.Default or ""
        local callback = config.Callback or function() end
        
        local textboxFrame = Instance.new("Frame")
        textboxFrame.Name = textboxName
        textboxFrame.Size = UDim2.new(1, 0, 0, 55)
        textboxFrame.BackgroundColor3 = myUI.Theme.Background
        textboxFrame.BorderSizePixel = 0
        textboxFrame.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = textboxFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 20)
        label.Position = UDim2.new(0, 10, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = textboxName
        label.TextColor3 = myUI.Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = textboxFrame
        
        local textbox = Instance.new("TextBox")
        textbox.Size = UDim2.new(1, -20, 0, 25)
        textbox.Position = UDim2.new(0, 10, 0, 25)
        textbox.BackgroundColor3 = myUI.Theme.Secondary
        textbox.Text = default
        textbox.PlaceholderText = placeholder
        textbox.TextColor3 = myUI.Theme.Text
        textbox.PlaceholderColor3 = myUI.Theme.SubText
        textbox.TextSize = 12
        textbox.Font = Enum.Font.Gotham
        textbox.BorderSizePixel = 0
        textbox.ClearTextOnFocus = false
        textbox.Parent = textboxFrame
        
        CreateCorner(UDim.new(0, 4)).Parent = textbox
        CreatePadding(8, 8, 5, 5).Parent = textbox
        
        textbox.FocusLost:Connect(function()
            callback(textbox.Text)
        end)
        
        return {
            SetValue = function(value)
                textbox.Text = value
                callback(value)
            end,
            GetValue = function()
                return textbox.Text
            end
        }
    end
    
    -- Create Keybind
    function methods:CreateKeybind(config)
        local keybindName = config.Name or "Keybind"
        local default = config.Default or Enum.KeyCode.E
        local callback = config.Callback or function() end
        
        local keybindFrame = Instance.new("Frame")
        keybindFrame.Name = keybindName
        keybindFrame.Size = UDim2.new(1, 0, 0, 35)
        keybindFrame.BackgroundColor3 = myUI.Theme.Background
        keybindFrame.BorderSizePixel = 0
        keybindFrame.Parent = self.Container
        
        CreateCorner(UDim.new(0, 6)).Parent = keybindFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -80, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = keybindName
        label.TextColor3 = myUI.Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = keybindFrame
        
        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0, 70, 0, 25)
        keybindButton.Position = UDim2.new(1, -75, 0.5, 0)
        keybindButton.AnchorPoint = Vector2.new(0, 0.5)
        keybindButton.BackgroundColor3 = myUI.Theme.Secondary
        keybindButton.Text = default.Name
        keybindButton.TextColor3 = myUI.Theme.Text
        keybindButton.TextSize = 12
        keybindButton.Font = Enum.Font.GothamBold
        keybindButton.BorderSizePixel = 0
        keybindButton.AutoButtonColor = false
        keybindButton.Parent = keybindFrame
        
        CreateCorner(UDim.new(0, 4)).Parent = keybindButton
        
        local currentKey = default
        local listening = false
        
        keybindButton.MouseButton1Click:Connect(function()
            listening = true
            keybindButton.Text = "..."
            keybindButton.TextColor3 = myUI.Theme.Accent
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if listening and not gameProcessed then
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    keybindButton.Text = currentKey.Name
                    keybindButton.TextColor3 = myUI.Theme.Text
                    listening = false
                end
            elseif not gameProcessed and input.KeyCode == currentKey then
                callback()
            end
        end)
        
        return {
            SetValue = function(keycode)
                currentKey = keycode
                keybindButton.Text = keycode.Name
            end,
            GetValue = function()
                return currentKey
            end
        }
    end
    
    -- Create Label
    function methods:CreateLabel(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 25)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = myUI.Theme.SubText
        label.TextSize = 13
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = self.Container
        
        CreatePadding(10, 10, 0, 0).Parent = label
        
        return {
            SetText = function(newText)
                label.Text = newText
            end
        }
    end
    
    return methods
end

-- Notification System
function myUI:Notify(config)
    local title = config.Title or "Notification"
    local message = config.Message or ""
    local duration = config.Duration or 3
    local notifType = config.Type or "Info" -- Info, Success, Warning, Error
    
    local notifColors = {
        Info = self.Theme.Accent,
        Success = self.Theme.Success,
        Warning = self.Theme.Warning,
        Error = self.Theme.Error,
    }
    
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 0)
    notification.Position = UDim2.new(1, -310, 1, 10)
    notification.BackgroundColor3 = self.Theme.Secondary
    notification.BorderSizePixel = 0
    notification.ClipsDescendants = true
    notification.Parent = self.ScreenGui
    
    CreateCorner().Parent = notification
    
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.BackgroundColor3 = notifColors[notifType] or notifColors.Info
    accent.BorderSizePixel = 0
    accent.Parent = notification
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -15, 0, 20)
    titleLabel.Position = UDim2.new(0, 15, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = self.Theme.Text
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -15, 1, -40)
    messageLabel.Position = UDim2.new(0, 15, 0, 30)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = self.Theme.SubText
    messageLabel.TextSize = 12
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextWrapped = true
    messageLabel.Parent = notification
    
    -- Calculate height based on message length
    local textHeight = messageLabel.TextBounds.Y
    local totalHeight = math.max(70, textHeight + 50)
    
    -- Animate in
    CreateTween(notification, {
        Size = UDim2.new(0, 300, 0, totalHeight),
        Position = UDim2.new(1, -310, 1, -totalHeight - 10)
    })
    
    -- Auto dismiss
    task.delay(duration, function()
        CreateTween(notification, {
            Position = UDim2.new(1, -310, 1, 10)
        })
        task.wait(0.3)
        notification:Destroy()
    end)
end

-- Keybind System Setup
function myUI:SetupKeybindSystem()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            for name, keybind in pairs(self.Keybinds) do
                if input.KeyCode == keybind.Key then
                    keybind.Callback()
                end
            end
        end
    end)
end

-- Toggle UI Visibility
function myUI:Toggle()
    self.Window.Visible = not self.Window.Visible
end

-- Set Theme
function myUI:SetTheme(newTheme)
    for key, value in pairs(newTheme) do
        self.Theme[key] = value
    end
    -- Apply theme to existing elements (would need to track all elements)
end

return myUI
