-- ╔══════════════════════════════════════════════════════════╗
-- ║        EXTERNALITY MADE IN HEAVEN — ps-files Edition     ║
-- ║        Premium UI · Violet Abyss Theme · v6.0            ║
-- ╚══════════════════════════════════════════════════════════╝

local _EXT_PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════════════════
-- ✦  EXTERNALITY MADE IN HEAVEN — LOADING SCREEN  ✦
-- ══════════════════════════════════════════════════════════════
local _extSplash = Instance.new("ScreenGui")
_extSplash.Name = "EXT_Splash"
_extSplash.ResetOnSpawn = false
_extSplash.IgnoreGuiInset = true
_extSplash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_extSplash.Parent = _EXT_PlayerGui

-- Deep dark overlay
local _extOverlay = Instance.new("Frame")
_extOverlay.Size = UDim2.new(1, 0, 1, 0)
_extOverlay.BackgroundColor3 = Color3.fromRGB(4, 4, 8)
_extOverlay.BackgroundTransparency = 0
_extOverlay.BorderSizePixel = 0
_extOverlay.Parent = _extSplash
local _extBgGrad = Instance.new("UIGradient")
_extBgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 0, 18)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(12, 4, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 0, 14)),
})
_extBgGrad.Rotation = 135
_extBgGrad.Parent = _extOverlay

-- Glowing orb
local _extOrb = Instance.new("Frame")
_extOrb.AnchorPoint = Vector2.new(0.5, 0.5)
_extOrb.Size = UDim2.new(0, 320, 0, 320)
_extOrb.Position = UDim2.new(0.5, 0, 0.5, 0)
_extOrb.BackgroundColor3 = Color3.fromRGB(110, 30, 220)
_extOrb.BackgroundTransparency = 0.85
_extOrb.BorderSizePixel = 0
_extOrb.Parent = _extSplash
Instance.new("UICorner", _extOrb).CornerRadius = UDim.new(1, 0)

-- Main card
local _extCard = Instance.new("Frame")
_extCard.AnchorPoint = Vector2.new(0.5, 0.5)
_extCard.Size = UDim2.new(0, 280, 0, 300)
_extCard.Position = UDim2.new(0.5, 0, 2.0, 0)
_extCard.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
_extCard.BorderSizePixel = 0
_extCard.Parent = _extSplash
Instance.new("UICorner", _extCard).CornerRadius = UDim.new(0, 20)
local _extCardGrad = Instance.new("UIGradient")
_extCardGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 10, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 5, 18)),
})
_extCardGrad.Rotation = 120
_extCardGrad.Parent = _extCard

-- Animated border stroke
local _extStroke = Instance.new("UIStroke", _extCard)
_extStroke.Color = Color3.fromRGB(160, 60, 255)
_extStroke.Thickness = 2
_extStroke.Transparency = 0.1

-- Top accent bar
local _extAccent = Instance.new("Frame")
_extAccent.Size = UDim2.new(0.6, 0, 0, 3)
_extAccent.Position = UDim2.new(0.2, 0, 0, 0)
_extAccent.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
_extAccent.BorderSizePixel = 0
_extAccent.Parent = _extCard
local _extAccentGrad = Instance.new("UIGradient")
_extAccentGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 20, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 20, 200)),
})
_extAccentGrad.Parent = _extAccent
Instance.new("UICorner", _extAccent).CornerRadius = UDim.new(1, 0)

-- Logo glow ring
local _extLogoRing = Instance.new("Frame")
_extLogoRing.AnchorPoint = Vector2.new(0.5, 0)
_extLogoRing.Size = UDim2.new(0, 104, 0, 104)
_extLogoRing.Position = UDim2.new(0.5, 0, 0, 22)
_extLogoRing.BackgroundColor3 = Color3.fromRGB(140, 50, 255)
_extLogoRing.BackgroundTransparency = 0.5
_extLogoRing.BorderSizePixel = 0
_extLogoRing.Parent = _extCard
Instance.new("UICorner", _extLogoRing).CornerRadius = UDim.new(1, 0)

local _extLogo = Instance.new("ImageLabel")
_extLogo.AnchorPoint = Vector2.new(0.5, 0.5)
_extLogo.Size = UDim2.new(0, 90, 0, 90)
_extLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
_extLogo.BackgroundTransparency = 1
_extLogo.Image = "rbxassetid://17556117242"
_extLogo.Parent = _extLogoRing
Instance.new("UICorner", _extLogo).CornerRadius = UDim.new(1, 0)

-- Title
local _extTitle = Instance.new("TextLabel")
_extTitle.Size = UDim2.new(1, -20, 0, 32)
_extTitle.Position = UDim2.new(0, 10, 0, 138)
_extTitle.BackgroundTransparency = 1
_extTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
_extTitle.TextSize = 20
_extTitle.Font = Enum.Font.GothamBold
_extTitle.Text = "EXTERNALITY"
_extTitle.TextXAlignment = Enum.TextXAlignment.Center
_extTitle.Parent = _extCard

-- Subtitle
local _extMIH = Instance.new("TextLabel")
_extMIH.Size = UDim2.new(1, -20, 0, 22)
_extMIH.Position = UDim2.new(0, 10, 0, 168)
_extMIH.BackgroundTransparency = 1
_extMIH.TextColor3 = Color3.fromRGB(180, 90, 255)
_extMIH.TextSize = 13
_extMIH.Font = Enum.Font.GothamMedium
_extMIH.Text = "✦  MADE IN HEAVEN  ✦"
_extMIH.TextXAlignment = Enum.TextXAlignment.Center
_extMIH.Parent = _extCard

-- Progress bar bg
local _extBarBg = Instance.new("Frame")
_extBarBg.Size = UDim2.new(0, 220, 0, 6)
_extBarBg.Position = UDim2.new(0.5, -110, 0, 208)
_extBarBg.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
_extBarBg.BorderSizePixel = 0
_extBarBg.Parent = _extCard
Instance.new("UICorner", _extBarBg).CornerRadius = UDim.new(1, 0)

-- Progress bar fill
local _extBar = Instance.new("Frame")
_extBar.Size = UDim2.new(0, 0, 1, 0)
_extBar.BackgroundColor3 = Color3.fromRGB(160, 60, 255)
_extBar.BorderSizePixel = 0
_extBar.Parent = _extBarBg
Instance.new("UICorner", _extBar).CornerRadius = UDim.new(1, 0)
local _extBarGrad = Instance.new("UIGradient")
_extBarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 40, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 130, 255)),
})
_extBarGrad.Parent = _extBar

-- Status label
local _extSub = Instance.new("TextLabel")
_extSub.Size = UDim2.new(1, -20, 0, 22)
_extSub.Position = UDim2.new(0, 10, 0, 222)
_extSub.BackgroundTransparency = 1
_extSub.TextColor3 = Color3.fromRGB(130, 80, 200)
_extSub.TextSize = 11
_extSub.Font = Enum.Font.GothamMedium
_extSub.Text = "Initializing..."
_extSub.TextXAlignment = Enum.TextXAlignment.Center
_extSub.Parent = _extCard

-- Version
local _extVer = Instance.new("TextLabel")
_extVer.Size = UDim2.new(1, -20, 0, 18)
_extVer.Position = UDim2.new(0, 10, 0, 272)
_extVer.BackgroundTransparency = 1
_extVer.TextColor3 = Color3.fromRGB(80, 50, 120)
_extVer.TextSize = 10
_extVer.Font = Enum.Font.Gotham
_extVer.Text = "v6.0 · Premium Edition"
_extVer.TextXAlignment = Enum.TextXAlignment.Center
_extVer.Parent = _extCard

-- Glow ring pulse
spawn(function()
    local ts = game:GetService("TweenService")
    while _extLogoRing and _extLogoRing.Parent do
        ts:Create(_extLogoRing, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.2}):Play()
        wait(1.2)
        ts:Create(_extLogoRing, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7}):Play()
        wait(1.2)
    end
end)

-- Border hue animation
spawn(function()
    local hue = 0
    while _extStroke and _extStroke.Parent do
        hue = (hue + 0.005) % 1
        _extStroke.Color = Color3.fromHSV(0.72 + math.sin(hue * math.pi * 2) * 0.06, 0.8, 1)
        wait(0.03)
    end
end)

-- Splash sequence
coroutine.wrap(function()
    local ts = game:GetService("TweenService")
    _extCard:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1.0, true)
    wait(0.8)
    local _phases = {
        {text = "⬡  Connecting to servers...", pct = 0.15},
        {text = "⬡  Fetching modules...", pct = 0.38},
        {text = "⬡  Compiling assets...", pct = 0.58},
        {text = "⬡  Loading game data...", pct = 0.78},
        {text = "⬡  Finalizing Heaven...", pct = 0.93},
    }
    for _, phase in ipairs(_phases) do
        _extSub.Text = phase.text
        ts:Create(_extBar, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(phase.pct, 0, 1, 0)
        }):Play()
        wait(0.48)
    end
    _extSub.Text = "✓  Loaded Successfully"
    _extSub.TextColor3 = Color3.fromRGB(140, 255, 160)
    ts:Create(_extBar, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 1, 0)
    }):Play()
    wait(0.8)
    _extCard:TweenPosition(UDim2.new(0.5, 0, 2.0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.8, true)
    ts:Create(_extOverlay, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
    wait(1)
    _extSplash:Destroy()
end)()

-- ── Toast Notification ────────────────────────────────────────────────────────
local _extToast = Instance.new("ScreenGui")
_extToast.Name = "EXT_Toast"
_extToast.ResetOnSpawn = false
_extToast.Parent = _EXT_PlayerGui

local _extToastFrame = Instance.new("Frame")
_extToastFrame.Size = UDim2.new(0, 250, 0, 80)
_extToastFrame.Position = UDim2.new(1, 360, 1, -110)
_extToastFrame.BackgroundColor3 = Color3.fromRGB(10, 7, 20)
_extToastFrame.BorderSizePixel = 0
_extToastFrame.Parent = _extToast
Instance.new("UICorner", _extToastFrame).CornerRadius = UDim.new(0, 14)
local _extToastStroke = Instance.new("UIStroke", _extToastFrame)
_extToastStroke.Color = Color3.fromRGB(160, 60, 255)
_extToastStroke.Thickness = 1.5
-- Toast gradient
local _tGrad = Instance.new("UIGradient")
_tGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 10, 36)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 5, 16)),
})
_tGrad.Rotation = 100
_tGrad.Parent = _extToastFrame
-- Left accent strip
local _tStrip = Instance.new("Frame")
_tStrip.Size = UDim2.new(0, 3, 1, -16)
_tStrip.Position = UDim2.new(0, 8, 0, 8)
_tStrip.BackgroundColor3 = Color3.fromRGB(170, 70, 255)
_tStrip.BorderSizePixel = 0
_tStrip.Parent = _extToastFrame
Instance.new("UICorner", _tStrip).CornerRadius = UDim.new(1, 0)

local _extToastIcon = Instance.new("ImageLabel")
_extToastIcon.Size = UDim2.new(0, 44, 0, 44)
_extToastIcon.Position = UDim2.new(0, 18, 0.5, -22)
_extToastIcon.BackgroundTransparency = 1
_extToastIcon.Image = "rbxassetid://17556117242"
_extToastIcon.Parent = _extToastFrame
Instance.new("UICorner", _extToastIcon).CornerRadius = UDim.new(1, 0)

local _extToastTitle = Instance.new("TextLabel")
_extToastTitle.Size = UDim2.new(1, -76, 0, 28)
_extToastTitle.Position = UDim2.new(0, 70, 0, 12)
_extToastTitle.BackgroundTransparency = 1
_extToastTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
_extToastTitle.TextSize = 14
_extToastTitle.Font = Enum.Font.GothamBold
_extToastTitle.TextXAlignment = Enum.TextXAlignment.Left
_extToastTitle.Text = "EXTERNALITY"
_extToastTitle.Parent = _extToastFrame

local _extToastDesc = Instance.new("TextLabel")
_extToastDesc.Size = UDim2.new(1, -76, 0, 28)
_extToastDesc.Position = UDim2.new(0, 70, 0, 38)
_extToastDesc.BackgroundTransparency = 1
_extToastDesc.TextColor3 = Color3.fromRGB(160, 80, 255)
_extToastDesc.TextSize = 11
_extToastDesc.Font = Enum.Font.Gotham
_extToastDesc.TextWrapped = true
_extToastDesc.TextXAlignment = Enum.TextXAlignment.Left
_extToastDesc.Text = "✦ Made In Heaven · Loaded"
_extToastDesc.Parent = _extToastFrame

task.spawn(function()
    _extToastFrame:TweenPosition(UDim2.new(1, -265, 1, -110), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1)
    local _snd = Instance.new("Sound")
    _snd.SoundId = "rbxassetid://5153734608"
    _snd.Parent = _extToast
    _snd:Play()
    wait(3)
    _extToastFrame:TweenPosition(UDim2.new(1, 360, 1, -110), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1)
    wait(1.2)
    _extToast:Destroy()
end)
local r6_0 = Instance.new("ScreenGui")
r6_0.Name = "frame"
r6_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
r6_0.IgnoreGuiInset = true
r6_0.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
r6_0.ResetOnSpawn = false
local r7_0 = Instance.new("Frame")
r7_0.Size = UDim2.new(1, 0, 1, 0)
r7_0.BackgroundTransparency = 1
r7_0.ZIndex = 0
r7_0.BorderSizePixel = 0
r7_0.Parent = r6_0
local r8_0 = Instance.new("ImageLabel")
r8_0.AnchorPoint = Vector2.new(0.5, 0.5)
r8_0.Size = UDim2.new(1, 50, 1, 50)
r8_0.Position = UDim2.new(0.5, 0, 0.5, 0)
r8_0.BackgroundTransparency = 1
r8_0.BorderSizePixel = 0
r8_0.SliceCenter = Rect.new(49, 49, 450, 450)
r8_0.ScaleType = Enum.ScaleType.Slice
r8_0.Image = "rbxassetid://6014261993"
r8_0.ImageTransparency = 0.299999988079071
r8_0.ImageColor3 = Color3.fromRGB(0, 0, 0)
r8_0.Parent = r7_0
local r9_0 = Instance.new("Frame")
r9_0.AnchorPoint = Vector2.new(0.5, 0.5)
r9_0.Size = UDim2.new(0, 260, 0, 280)
r9_0.Position = UDim2.new(0.5, 0, 1.5, 0)
r9_0.BackgroundColor3 = Color3.fromRGB(10, 7, 20)
r9_0.BorderSizePixel = 0
r9_0.Parent = r6_0
local _r9Corner = Instance.new("UICorner")
_r9Corner.CornerRadius = UDim.new(0, 20)
_r9Corner.Parent = r9_0
local _r9Grad = Instance.new("UIGradient")
_r9Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 10, 36)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 4, 16)),
})
_r9Grad.Rotation = 130
_r9Grad.Parent = r9_0
local _r9Stroke = Instance.new("UIStroke", r9_0)
_r9Stroke.Color = Color3.fromRGB(160, 60, 255)
_r9Stroke.Thickness = 2
local _r9TopBar = Instance.new("Frame")
_r9TopBar.Size = UDim2.new(0.55, 0, 0, 3)
_r9TopBar.Position = UDim2.new(0.225, 0, 0, 0)
_r9TopBar.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
_r9TopBar.BorderSizePixel = 0
_r9TopBar.Parent = r9_0
Instance.new("UICorner", _r9TopBar).CornerRadius = UDim.new(1, 0)
local _r9BarGrad = Instance.new("UIGradient")
_r9BarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 20, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 20, 200)),
})
_r9BarGrad.Parent = _r9TopBar
-- Logo ring
local _r9Ring = Instance.new("Frame")
_r9Ring.AnchorPoint = Vector2.new(0.5, 0)
_r9Ring.Size = UDim2.new(0, 96, 0, 96)
_r9Ring.Position = UDim2.new(0.5, 0, 0, 18)
_r9Ring.BackgroundColor3 = Color3.fromRGB(140, 50, 255)
_r9Ring.BackgroundTransparency = 0.55
_r9Ring.BorderSizePixel = 0
_r9Ring.Parent = r9_0
Instance.new("UICorner", _r9Ring).CornerRadius = UDim.new(1, 0)
local r11_0 = Instance.new("ImageLabel")
r11_0.AnchorPoint = Vector2.new(0.5, 0.5)
r11_0.Size = UDim2.new(0, 82, 0, 82)
r11_0.Position = UDim2.new(0.5, 0, 0.5, 0)
r11_0.BackgroundTransparency = 1
r11_0.Image = "rbxassetid://17556117242"
r11_0.Parent = _r9Ring
local r12_0 = Instance.new("UICorner")
r12_0.CornerRadius = UDim.new(1, 0)
r12_0.Parent = r11_0
local r13_0 = Instance.new("TextLabel")
r13_0.Size = UDim2.new(1, -16, 0, 30)
r13_0.Position = UDim2.new(0, 8, 0, 128)
r13_0.BackgroundTransparency = 1
r13_0.TextColor3 = Color3.fromRGB(255, 255, 255)
r13_0.TextSize = 18
r13_0.Font = Enum.Font.GothamBold
r13_0.Text = "EXTERNALITY"
r13_0.TextXAlignment = Enum.TextXAlignment.Center
r13_0.Parent = r9_0
local _r9Sub = Instance.new("TextLabel")
_r9Sub.Size = UDim2.new(1, -16, 0, 18)
_r9Sub.Position = UDim2.new(0, 8, 0, 158)
_r9Sub.BackgroundTransparency = 1
_r9Sub.TextColor3 = Color3.fromRGB(170, 80, 255)
_r9Sub.TextSize = 12
_r9Sub.Font = Enum.Font.GothamMedium
_r9Sub.Text = "✦ MADE IN HEAVEN ✦"
_r9Sub.TextXAlignment = Enum.TextXAlignment.Center
_r9Sub.Parent = r9_0
-- Progress bar bg
local _r9ProgBg = Instance.new("Frame")
_r9ProgBg.Size = UDim2.new(0, 200, 0, 5)
_r9ProgBg.Position = UDim2.new(0.5, -100, 0, 194)
_r9ProgBg.BackgroundColor3 = Color3.fromRGB(30, 18, 50)
_r9ProgBg.BorderSizePixel = 0
_r9ProgBg.Parent = r9_0
Instance.new("UICorner", _r9ProgBg).CornerRadius = UDim.new(1, 0)
local r14_0 = Instance.new("Frame")
r14_0.Size = UDim2.new(0, 0, 1, 0)
r14_0.BackgroundColor3 = Color3.fromRGB(160, 60, 255)
r14_0.BorderSizePixel = 0
r14_0.Parent = _r9ProgBg
Instance.new("UICorner", r14_0).CornerRadius = UDim.new(1, 0)
local _r14Grad = Instance.new("UIGradient")
_r14Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 30, 210)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 130, 255)),
})
_r14Grad.Parent = r14_0
local _r9Status = Instance.new("TextLabel")
_r9Status.Size = UDim2.new(1, -16, 0, 20)
_r9Status.Position = UDim2.new(0, 8, 0, 207)
_r9Status.BackgroundTransparency = 1
_r9Status.TextColor3 = Color3.fromRGB(120, 70, 180)
_r9Status.TextSize = 10
_r9Status.Font = Enum.Font.GothamMedium
_r9Status.Text = "Loading..."
_r9Status.TextXAlignment = Enum.TextXAlignment.Center
_r9Status.Parent = r9_0
local _r9Ver = Instance.new("TextLabel")
_r9Ver.Size = UDim2.new(1, -16, 0, 18)
_r9Ver.Position = UDim2.new(0, 8, 0, 255)
_r9Ver.BackgroundTransparency = 1
_r9Ver.TextColor3 = Color3.fromRGB(70, 40, 110)
_r9Ver.TextSize = 9
_r9Ver.Font = Enum.Font.Gotham
_r9Ver.Text = "v6.0 · Premium"
_r9Ver.TextXAlignment = Enum.TextXAlignment.Center
_r9Ver.Parent = r9_0
function pulseBrightness()
  local ts = game:GetService("TweenService")
  while _r9Ring and _r9Ring.Parent do
    ts:Create(_r9Ring, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.2}):Play()
    wait(1.1)
    ts:Create(_r9Ring, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.75}):Play()
    wait(1.1)
  end
end
-- Animate border hue
spawn(function()
    local h = 0
    while _r9Stroke and _r9Stroke.Parent do
        h = (h + 0.005) % 1
        _r9Stroke.Color = Color3.fromHSV(0.72 + math.sin(h * math.pi * 2) * 0.06, 0.85, 1)
        wait(0.03)
    end
end)
spawn(pulseBrightness)
coroutine.wrap(function()
  local r0_2 = Instance.new("LocalScript", r9_0)
  local _ts = game:GetService("TweenService")
  r9_0:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1, true)
  wait(0.8)
  local _loadPhases = {
    {text = "⬡ Connecting...", pct = 0.12},
    {text = "⬡ Loading modules...", pct = 0.34},
    {text = "⬡ Compiling scripts...", pct = 0.58},
    {text = "⬡ Injecting Heaven...", pct = 0.82},
    {text = "⬡ Almost there...", pct = 0.95},
  }
  for _, p in ipairs(_loadPhases) do
    _r9Status.Text = p.text
    _ts:Create(r14_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(p.pct, 0, 1, 0)
    }):Play()
    wait(0.42)
  end
  _r9Status.Text = "✓ Success!"
  _r9Status.TextColor3 = Color3.fromRGB(140, 255, 160)
  _ts:Create(r14_0, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
      Size = UDim2.new(1, 0, 1, 0)
  }):Play()
  wait(0.6)
  r9_0:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1, true)
  wait(1)
  r9_0.Visible = false
  wait()
  local r1_2 = Instance.new("ScreenGui")
  r1_2.Name = "EXT_Frame"
  r1_2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  r1_2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  r1_2.ResetOnSpawn = false
  local r2_2 = Instance.new("Frame")
  r2_2.AnchorPoint = Vector2.new(0.5, 0.5)
  r2_2.Size = UDim2.new(0, 420, 0, 300)
  r2_2.Position = UDim2.new(0.5, 0, 1.5, 0)
  r2_2.BackgroundColor3 = Color3.fromRGB(10, 7, 20)
  r2_2.ClipsDescendants = false
  r2_2.BorderSizePixel = 0
  r2_2.Parent = r1_2
  local r3_2 = Instance.new("UICorner")
  r3_2.CornerRadius = UDim.new(0, 18)
  r3_2.Parent = r2_2
  local _ch_grad = Instance.new("UIGradient")
  _ch_grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 10, 38)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 4, 16)),
  })
  _ch_grad.Rotation = 130
  _ch_grad.Parent = r2_2
  local _ch_stroke = Instance.new("UIStroke", r2_2)
  _ch_stroke.Color = Color3.fromRGB(160, 60, 255)
  _ch_stroke.Thickness = 2
  spawn(function()
    local h = 0
    while _ch_stroke and _ch_stroke.Parent do
      h = (h + 0.005) % 1
      _ch_stroke.Color = Color3.fromHSV(0.72 + math.sin(h * math.pi * 2) * 0.06, 0.85, 1)
      wait(0.03)
    end
  end)
  local _ch_accent = Instance.new("Frame")
  _ch_accent.Size = UDim2.new(0.5, 0, 0, 3)
  _ch_accent.Position = UDim2.new(0.25, 0, 0, 0)
  _ch_accent.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
  _ch_accent.BorderSizePixel = 0
  _ch_accent.Parent = r2_2
  Instance.new("UICorner", _ch_accent).CornerRadius = UDim.new(1, 0)
  local _chaGrad = Instance.new("UIGradient")
  _chaGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 20, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 20, 200)),
  })
  _chaGrad.Parent = _ch_accent
  local r4_2 = Instance.new("TextLabel")
  r4_2.AnchorPoint = Vector2.new(0.5, 0.5)
  r4_2.Size = UDim2.new(1, 0, 0, 40)
  r4_2.Position = UDim2.new(0.5, 0, 0.11, 0)
  r4_2.BackgroundTransparency = 1
  r4_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  r4_2.TextSize = 18
  r4_2.Font = Enum.Font.GothamBold
  r4_2.Text = "EXTERNALITY ✦ Choose Your Style"
  r4_2.Parent = r2_2
  local r5_2 = Instance.new("Frame")
  r5_2.Size = UDim2.new(0.85, 0, 0, 1)
  r5_2.Position = UDim2.new(0.075, 0, 0, 52)
  r5_2.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
  r5_2.BorderSizePixel = 0
  r5_2.Parent = r2_2
  Instance.new("UIGradient").Parent = r5_2
  local r7_2 = Instance.new("TextLabel")
  r7_2.AnchorPoint = Vector2.new(0.5, 0.5)
  r7_2.Size = UDim2.new(1, 0, 0, 30)
  r7_2.Position = UDim2.new(0.3, 0, 0, 85)
  r7_2.BackgroundTransparency = 1
  r7_2.TextColor3 = Color3.fromRGB(170, 100, 255)
  r7_2.TextSize = 14
  r7_2.Font = Enum.Font.GothamBold
  r7_2.Text = "— Classic UI —"
  r7_2.Parent = r2_2
  local r8_2 = Instance.new("TextLabel")
  r8_2.AnchorPoint = Vector2.new(0.5, 0.5)
  r8_2.Size = UDim2.new(1, 0, 0, 30)
  r8_2.Position = UDim2.new(0.7, 0, 0, 85)
  r8_2.BackgroundTransparency = 1
  r8_2.TextColor3 = Color3.fromRGB(170, 100, 255)
  r8_2.TextSize = 14
  r8_2.Font = Enum.Font.GothamBold
  r8_2.Text = "— Heaven UI —"
  r8_2.Parent = r2_2
  local r9_2 = Instance.new("TextButton")
  r9_2.AnchorPoint = Vector2.new(0.5, 0)
  r9_2.Size = UDim2.new(0, 130, 0, 46)
  r9_2.Position = UDim2.new(0.3, 0, 0, 115)
  r9_2.BackgroundColor3 = Color3.fromRGB(22, 12, 42)
  r9_2.BorderSizePixel = 0
  r9_2.TextColor3 = Color3.fromRGB(200, 150, 255)
  r9_2.TextSize = 15
  r9_2.Font = Enum.Font.GothamBold
  r9_2.Text = "Default"
  r9_2.Parent = r2_2
  local r10_2 = Instance.new("UICorner")
  r10_2.CornerRadius = UDim.new(0, 10)
  r10_2.Parent = r9_2
  Instance.new("UIStroke", r9_2).Color = Color3.fromRGB(110, 40, 200)
  local r11_2 = Instance.new("TextButton")
  r11_2.AnchorPoint = Vector2.new(0.5, 0)
  r11_2.Size = UDim2.new(0, 130, 0, 46)
  r11_2.Position = UDim2.new(0.7, 0, 0, 115)
  r11_2.BackgroundColor3 = Color3.fromRGB(22, 12, 42)
  r11_2.BorderSizePixel = 0
  r11_2.TextColor3 = Color3.fromRGB(200, 150, 255)
  r11_2.TextSize = 15
  r11_2.Font = Enum.Font.GothamBold
  r11_2.Text = "Default"
  r11_2.Parent = r2_2
  local r12_2 = Instance.new("UICorner")
  r12_2.CornerRadius = UDim.new(0, 10)
  r12_2.Parent = r11_2
  Instance.new("UIStroke", r11_2).Color = Color3.fromRGB(110, 40, 200)
  local r13_2 = Instance.new("TextButton")
  r13_2.AnchorPoint = Vector2.new(0.5, 0)
  r13_2.Size = UDim2.new(0, 130, 0, 46)
  r13_2.Position = UDim2.new(0.3, 0, 0, 178)
  r13_2.BackgroundColor3 = Color3.fromRGB(22, 12, 42)
  r13_2.BorderSizePixel = 0
  r13_2.TextColor3 = Color3.fromRGB(200, 150, 255)
  r13_2.TextSize = 15
  r13_2.Font = Enum.Font.GothamBold
  r13_2.Text = "Dark"
  r13_2.Parent = r2_2
  local r14_2 = Instance.new("UICorner")
  r14_2.CornerRadius = UDim.new(0, 10)
  r14_2.Parent = r13_2
  Instance.new("UIStroke", r13_2).Color = Color3.fromRGB(110, 40, 200)
  local r15_2 = Instance.new("TextButton")
  r15_2.AnchorPoint = Vector2.new(0.5, 0)
  r15_2.Size = UDim2.new(0, 130, 0, 46)
  r15_2.Position = UDim2.new(0.7, 0, 0, 178)
  r15_2.BackgroundColor3 = Color3.fromRGB(22, 12, 42)
  r15_2.BorderSizePixel = 0
  r15_2.TextColor3 = Color3.fromRGB(200, 150, 255)
  r15_2.TextSize = 15
  r15_2.Font = Enum.Font.GothamBold
  r15_2.Text = "Dark"
  r15_2.Parent = r2_2
  local r16_2 = Instance.new("UICorner")
  r16_2.CornerRadius = UDim.new(0, 10)
  r16_2.Parent = r15_2
  Instance.new("UIStroke", r15_2).Color = Color3.fromRGB(110, 40, 200)
  local r17_2 = Instance.new("TextLabel")
  r17_2.AnchorPoint = Vector2.new(0.5, 0.5)
  r17_2.Size = UDim2.new(1, 0, 0, 30)
  r17_2.Position = UDim2.new(0.5, 0, 0.92, 0)
  r17_2.BackgroundTransparency = 1
  r17_2.TextColor3 = Color3.fromRGB(120, 60, 180)
  r17_2.TextSize = 11
  r17_2.Font = Enum.Font.GothamMedium
  r17_2.Text = "✦ Externality Made In Heaven · Premium Edition"
  r17_2.Parent = r2_2
  local r18_2 = game:GetService("TweenService")
  local r19_2 = Enum.EasingStyle.Back
  local r20_2 = Enum.EasingDirection.Out
  local r21_2 = Enum.EasingDirection.In
  local r22_2 = {
    Position = UDim2.new(0.5, 0, 0.5, 0),
  }
  local r23_2 = {
    Position = UDim2.new(0.5, 0, 2.5, 0),
  }
  function animateIn()
    r18_2:Create(r2_2, TweenInfo.new(1, r19_2, r20_2), r22_2):Play()
    -- Make chooser draggable
    local _dragT = false
    local _dragS, _dragP
    r4_2.InputBegan:Connect(function(inp)
      if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        _dragT = true
        _dragS = inp.Position
        _dragP = r2_2.Position
        inp.Changed:Connect(function()
          if inp.UserInputState == Enum.UserInputState.End then _dragT = false end
        end)
      end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(inp)
      if _dragT and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
        local d = inp.Position - _dragS
        r18_2:Create(r2_2, TweenInfo.new(0.1), {Position = UDim2.new(_dragP.X.Scale, _dragP.X.Offset + d.X, _dragP.Y.Scale, _dragP.Y.Offset + d.Y)}):Play()
      end
    end)
  end
  function animateOut()
    -- line: [0, 0] id: 2038
    local r0_2038 = r18_2:Create(r2_2, TweenInfo.new(1, r19_2, r21_2), r23_2)
    r0_2038:Play()
    r0_2038.Completed:Connect(function()
      -- line: [0, 0] id: 2039
      r6_0:Destroy()
      r1_2:Destroy()
    end)
  end
  r9_2.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 454
    animateOut()
    wait()
    local r0_454 = Instance.new("Sound", workspace)
    r0_454.PlaybackSpeed = 1.5
    r0_454.Volume = 0.88
    r0_454.SoundId = "rbxassetid://170765130"
    r0_454.PlayOnRemove = true
    r0_454:Destroy()
    local r1_454 = Instance.new("ScreenGui")
    local r2_454 = Instance.new("Frame")
    local r3_454 = Instance.new("UICorner")
    local r4_454 = Instance.new("TextLabel")
    local r5_454 = Instance.new("TextLabel")
    r1_454.Name = "Notification"
    r1_454.Parent = game.CoreGui
    r1_454.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r2_454.Name = "Frame"
    r2_454.Parent = r1_454
    r2_454.BackgroundColor3 = Color3.fromRGB(10, 7, 20)
    r2_454.BackgroundTransparency = 0
    r2_454.BorderSizePixel = 0
    r2_454.Position = UDim2.new(1, 0, 0.9, -45)
    r2_454.Size = UDim2.new(0, 200, 0, 80)
    Instance.new("UICorner", r2_454).CornerRadius = UDim.new(0, 12)
    local _notifStroke = Instance.new("UIStroke", r2_454)
    _notifStroke.Color = Color3.fromRGB(160, 60, 255)
    _notifStroke.Thickness = 1.5
    local _notifStrip = Instance.new("Frame")
    _notifStrip.Size = UDim2.new(0, 3, 1, -14)
    _notifStrip.Position = UDim2.new(0, 7, 0, 7)
    _notifStrip.BackgroundColor3 = Color3.fromRGB(170, 70, 255)
    _notifStrip.BorderSizePixel = 0
    _notifStrip.Parent = r2_454
    Instance.new("UICorner", _notifStrip).CornerRadius = UDim.new(1, 0)
    r3_454.Parent = r2_454
    r4_454.Name = "Title"
    r4_454.Parent = r2_454
    r4_454.BackgroundTransparency = 1
    r4_454.Position = UDim2.new(0, 18, 0, 6)
    r4_454.Size = UDim2.new(1, -26, 0, 28)
    r4_454.Font = Enum.Font.GothamBold
    r4_454.Text = "EXTERNALITY"
    r4_454.TextColor3 = Color3.fromRGB(255, 255, 255)
    r4_454.TextSize = 14
    r4_454.TextXAlignment = Enum.TextXAlignment.Left
    r5_454.Name = "Description"
    r5_454.Parent = r2_454
    r5_454.BackgroundTransparency = 1
    r5_454.Position = UDim2.new(0, 18, 0, 34)
    r5_454.Size = UDim2.new(1, -26, 0, 38)
    r5_454.Font = Enum.Font.Gotham
    r5_454.Text = "✦ Made In Heaven · Loaded"
    r5_454.TextColor3 = Color3.fromRGB(160, 80, 255)
    r5_454.TextSize = 11
    r5_454.TextWrapped = true
    r5_454.TextXAlignment = Enum.TextXAlignment.Left
    coroutine.wrap(function()
      -- line: [0, 0] id: 472
      local r0_472 = Instance.new("LocalScript", r2_454)
      wait()
      r0_472.Parent:TweenPosition(UDim2.new(1, -210, 0.9, -45), "Out", "Quad", 0.5, true)
    end)()
    wait(3)
    coroutine.wrap(function()
      -- line: [0, 0] id: 533
      local r0_533 = Instance.new("LocalScript", r2_454)
      wait()
      r0_533.Parent:TweenPosition(UDim2.new(1, -0, 0.9, -45), "Out", "Quad", 0.5, true)
      wait(0.5)
      r1_454:Destroy()
    end)()
    wait()
    local r8_454 = {
      SchemeColor = Color3.fromRGB(150, 50, 255),
      Background = Color3.fromRGB(10, 7, 20),
      Header = Color3.fromRGB(14, 9, 28),
      TextColor = Color3.fromRGB(255, 255, 255),
      ElementColor = Color3.fromRGB(20, 13, 38),
    }
    local r9_454 = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ui-Lib/Old-Ui"))()
    local r10_454 = r9_454.CreateLib("Externality Made In Heaven", r8_454)
    local r11_454 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local r12_454 = game.PlaceId
    local r14_454 = game:GetService("Players").LocalPlayer
    local r15_454 = r14_454.Name
    local r16_454 = r14_454.DisplayName
    local r17_454 = r14_454.UserId
    local r18_454 = r14_454.Character
    local r19_454 = r14_454.AccountAge
    local r20_454 = #game.Players:GetPlayers()
    local r21_454 = identifyexecutor() or "unknown"
    local r22_454 = ""
    if game:GetService("UserInputService").GamepadEnabled then
      r22_454 = "Controller"
    elseif game:GetService("UserInputService").TouchEnabled then
      r22_454 = "Mobile"
    else
      r22_454 = "PC"
    end
    local r23_454 = Instance.new("ScreenGui")
    local r24_454 = Instance.new("TextLabel")
    r23_454.Name = "EXT_Watermark"
    r23_454.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r23_454.ResetOnSpawn = false
    r24_454.Parent = r23_454
    r24_454.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r24_454.BackgroundTransparency = 1
    r24_454.BorderSizePixel = 0
    r24_454.Position = UDim2.new(-0.000662226602, 0, 0.0143558267, 0)
    r24_454.Size = UDim2.new(10, 0, 0, 20)
    r24_454.Font = Enum.Font.GothamBold
    r24_454.Text = "  ✦ Externality Made In Heaven  "
    r24_454.TextColor3 = Color3.fromRGB(255, 255, 255)
    r24_454.TextScaled = true
    r24_454.TextSize = 15
    r24_454.TextXAlignment = Enum.TextXAlignment.Left
    local r25_454 = 0
    local r26_454 = 0.01
    game:GetService("RunService").RenderStepped:Connect(function()
      -- line: [0, 0] id: 613
      r25_454 = (r25_454 + r26_454) % 1
      r24_454.TextColor3 = Color3.fromHSV(r25_454, 1, 1)
    end)
    local r27_454 = Instance.new("ScreenGui")
    local r28_454 = Instance.new("TextButton")
    local r29_454 = Instance.new("UICorner")
    r27_454.Name = "ScreenGui"
    r27_454.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r27_454.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r27_454.ResetOnSpawn = false
    r28_454.Name = "Toggle"
    r28_454.Parent = r27_454
    r28_454.BackgroundColor3 = Color3.fromRGB(12, 7, 24)
    r28_454.Position = UDim2.new(0, 50, 0, 34)
    r28_454.Size = UDim2.new(0, 55, 0, 28)
    r28_454.Font = Enum.Font.GothamBold
    r28_454.Text = "EXT"
    r28_454.TextColor3 = Color3.fromRGB(180, 90, 255)
    r28_454.TextSize = 12
    r28_454.TextWrapped = true
    r28_454.ZIndex = 16
    r28_454.Draggable = true
    Instance.new("UICorner", r28_454).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", r28_454).Color = Color3.fromRGB(130, 50, 220)
    r28_454.MouseButton1Click:connect(function()
      -- line: [0, 0] id: 971
      r9_454:Toggle()
    end)
    r29_454.Parent = r28_454
    local r31_454 = r10_454:Tab("Home"):Section("Welcome " .. r16_454 .. " To Externality Made In Heaven")
    r31_454:Label("Username: " .. r15_454 .. "")
    r31_454:Label("Display Name: " .. r16_454 .. "")
    r31_454:Label("User Id: " .. r17_454 .. "")
    r31_454:Label("Account Age: " .. r19_454 .. "")
    r31_454:Label("Executor: " .. r21_454 .. "")
    r31_454:Label("Device: " .. r22_454 .. "")
    r31_454:Label("──────────────────────────────")
    r31_454:Label("Externality Made In Heaven — Premium Edition")
    local r32_454 = r10_454:Tab("Games")
    local r33_454 = r32_454:Section("Current Game")
    r33_454:Button("Game: " .. r11_454 .. " | " .. r12_454 .. "", "", function()
      -- line: [0, 0] id: 846
    end)
    r33_454:Label("Games")
    local r34_454 = nil
    function AdoptMe()
      -- line: [0, 0] id: 650
      return r34_454
    end
    function AdoptMeOption()
      -- line: [0, 0] id: 478
      if AdoptMe() == "Eazvy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/Eazvy-Hub/main/GameLoader.lua"))()
      elseif AdoptMe() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_478 = loadstring
        local r1_478 = request
        if not r1_478 then
          r1_478 = http_request
          if not r1_478 then
            r1_478 = http
            if r1_478 then
              r1_478 = http.request or syn and syn.request
            else
              goto label_33	-- block#7 is visited secondly
            end
          end
        end
        local r3_478 = tostring
        local r4_478 = "https://api.eclipsehub.xyz/auth"
        assert(r0_478 and r1_478, "Executor not Supported")
        r0_478(r1_478({
          Url = r4_478 .. "?key=" .. r3_478(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif AdoptMe() == "Ice Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
      elseif AdoptMe() == "Prodigy X" then
        loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
      elseif AdoptMe() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif AdoptMe() == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_454:Dropdown("Adopt Me", "Credits to Owner", {
      "Eazvy Hub",
      "Eclipse Hub",
      "Ice Hub",
      "Prodigy X",
      "Speed Hub X",
      "V.G Hub"
    }, function(r0_465)
      -- line: [0, 0] id: 465
      r34_454 = r0_465
      AdoptMeOption()
    end)
    local r35_454 = nil
    function AllStar()
      -- line: [0, 0] id: 961
      return r35_454
    end
    function AllStarOption()
      -- line: [0, 0] id: 667
      if AllSta() == "KarmaPanda" then
        loadstring(game:HttpGet("https://script.karmapanda.dev/"))()
      elseif AllSta() == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end
    r33_454:Dropdown("All Star Tower Defense", "Credits to Owner", {
      "KarmaPanda",
      "Trap Hub"
    }, function(r0_701)
      -- line: [0, 0] id: 701
      r35_454 = r0_701
      AllStarOption()
    end)
    local r36_454 = nil
    function Adventures()
      -- line: [0, 0] id: 762
      return r36_454
    end
    function AdventuresOption()
      -- line: [0, 0] id: 466
      if AnimeAd() == "Anime Adventures by Craymel02" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures.lua"))()
      elseif AnimeAd() == "Arpon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures_v2__Beta.lua"))()
      elseif AnimeAd() == "Crimson Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/C_Loader"))()
      elseif AnimeAd() == "Keybrew Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borntodiekuv/KeybrewHub/main/AA"))()
      elseif AnimeAd() == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end
    r33_454:Dropdown("Anime Adventures", "Credits to Owner", {
      "Anime Adventures by Craymel02",
      "Arpon Hub",
      "Crimson Hub",
      "Keybrew Hub",
      "Trap Hub"
    }, function(r0_696)
      -- line: [0, 0] id: 696
      r36_454 = r0_696
      AdventuresOption()
    end)
    local r37_454 = nil
    function Champions()
      -- line: [0, 0] id: 770
      return r37_454
    end
    function AnimeOption()
      -- line: [0, 0] id: 646
      if AnimeChampions() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif AnimeChampions() == "Fazium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Fazium-files/main/Loader"))()
      elseif AnimeChampions() == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/HarPy_loader.lua"))()
      elseif AnimeChampions() == "Krzysztof Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrzysztofHub/script/main/loader.lua"))()
      elseif AnimeChampions() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      elseif AnimeChampions() == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/Perfectus-Hub/main/perfectus-hub"))()
      elseif AnimeChampions() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif AnimeChampions() == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/ACS"))()
      end
    end
    r33_454:Dropdown("Anime Champions Simulator", "Credits to Owner", {
      "Banana Hub",
      "Fazium Hub",
      "HarPy",
      "Krzysztof Hub",
      "Muimi Hub",
      "Perfectus Hub",
      "Sky Hub",
      "Yuto Hub"
    }, function(r0_458)
      -- line: [0, 0] id: 458
      r37_454 = r0_458
      AnimeOption()
    end)
    local r38_454 = nil
    function Dimensions()
      -- line: [0, 0] id: 648
      return r38_454
    end
    function DimensionsOption()
      -- line: [0, 0] id: 664
      if AnimeDi() == "Anime Ghost" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ghost-home/public/main/AnimeGhost.lua", true))()
      elseif AnimeDi() == "Bird Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheWitch-BirdHub/BirdHubv0.1/main/load"))()
      elseif AnimeDi() == "Intruders" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lifaiossama/errors/main/Intruders.html"))()
      elseif AnimeDi() == "Itachi" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      end
    end
    r33_454:Dropdown("Anime Dimensions", "Credits to Owner", {
      "Anime Ghost",
      "Bird Hub",
      "Intruders",
      "Itachi"
    }, function(r0_934)
      -- line: [0, 0] id: 934
      r38_454 = r0_934
      DimensionsOption()
    end)
    local r39_454 = nil
    function Fighters()
      -- line: [0, 0] id: 614
      return r39_454
    end
    function FightersOption()
      -- line: [0, 0] id: 632
      if AnimeFi() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif AnimeFi() == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif AnimeFi() == "SSJ3 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Gohan9k/ANFSnew/main/GOHANSSJ3"))()
      elseif AnimeFi() == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/afss"))()
      elseif AnimeFi() == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end
    r33_454:Dropdown("Anime Fighters Simulator", "Credits to Owner", {
      "Banana Hub",
      "Platinium Hub",
      "SSJ3 Hub",
      "Yuto Hub",
      "Zer0 Hub"
    }, function(r0_656)
      -- line: [0, 0] id: 656
      r39_454 = r0_656
      FightersOption()
    end)
    local r40_454 = nil
    function Fightersx()
      -- line: [0, 0] id: 674
      return r40_454
    end
    function FightersxOption()
      -- line: [0, 0] id: 886
      if AnimeFix() == "Blox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/malicious-dev/RobloxScripting/main/AFSX.lua", true))()
      elseif AnimeFix() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/AnimeFightingX"))()
      elseif AnimeFix() == "Project Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IkkyyDF/ProjectNexus/main/Loader.lua"))()
      elseif AnimeFix() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      end
    end
    r33_454:Dropdown("Anime Fighting Simulator X", "Credits to Owner", {
      "Blox Hub",
      "Muimi Hub",
      "Project Nexus",
      "Sky Hub"
    }, function(r0_813)
      -- line: [0, 0] id: 813
      r40_454 = r0_813
      FightersxOption()
    end)
    local r41_454 = nil
    function Warriors()
      -- line: [0, 0] id: 485
      return r41_454
    end
    function WarriorsOption()
      -- line: [0, 0] id: 751
      if AnimeWar() == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/AnimeWarriorsSimulator2.lua"))()
      elseif AnimeWar() == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end
    r33_454:Dropdown("Anime Warriors Simulator 2", "Credits to Owner", {
      "JumbleScripts",
      "Verny Hub V2"
    }, function(r0_462)
      -- line: [0, 0] id: 462
      r41_454 = r0_462
      WarriorsOption()
    end)
    local r42_454 = nil
    function Wrestler()
      -- line: [0, 0] id: 932
      return r42_454
    end
    function WrestlerOption()
      -- line: [0, 0] id: 914
      if WrestlerSim() == "Flame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/flame/main/loader"))()
      elseif WrestlerSim() == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/script.lua"))()
      elseif WrestlerSim() == "Kenniel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Arm-Wrestle-Simulator-Script/main/Arm-Wrestle-Simulator-Script", true))()
      elseif WrestlerSim() == "LDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS"))()
      elseif WrestlerSim() == "Legacy HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/arm7/main/wrestling"))()
      elseif WrestlerSim() == "Linear Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoolovr/Linear-Hub/main/loader.lua"))()
      elseif WrestlerSim() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/main.lua"))()
      elseif WrestlerSim() == "Nebula Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Saitamahaah/SaitaHub/main/NebulaHub"))()
      elseif WrestlerSim() == "Pikachu Hun" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()
      elseif WrestlerSim() == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif WrestlerSim() == "Screech Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/screech/main/AWS"))()
      elseif WrestlerSim() == "Skull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/SkullHub/main/Loader.lua"))()
      elseif WrestlerSim() == "Spirit Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/gay-scripts/main/Loader.lua"), true)()
      end
    end
    r33_454:Dropdown("Arm Wrestler Simulator", "Credits to Owner", {
      "Flame Hub",
      "HarPy",
      "Kenniel",
      "LDS Hub",
      "Legend HandlesYT",
      "Linear Hub",
      "Muimi Hub",
      "Nebula Hub",
      "Pikachu Hub",
      "Project WD",
      "Screech Hub",
      "Skull Hub",
      "Spirit Hub"
    }, function(r0_488)
      -- line: [0, 0] id: 488
      r42_454 = r0_488
      WrestlerOption()
    end)
    local r43_454 = nil
    function Arsenal()
      -- line: [0, 0] id: 741
      return r43_454
    end
    function ArsenOption()
      -- line: [0, 0] id: 947
      if Arsenal() == "AdvanceTechV3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/UltimateCromaSin-Arsenal-Gui/main/AdvanceTechV3.lua"))()
      elseif Arsenal() == "Arsenal" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
      elseif Arsenal() == "DarkHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      elseif Arsenal() == "Faded" then
        _G.Toggles = "V"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
      elseif Arsenal() == "F2b Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif Arsenal() == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif Arsenal() == "Tiger-Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plutoguy/Tiger-Hub/main/loader.lua"))()
      elseif Arsenal() == "V.Ghub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_454:Dropdown("Arsenal", "Credits to Owner", {
      "AdvanceTechV3",
      "Arsenal",
      "DarkHub",
      "Faded",
      "F2b Hub",
      "OwlHub",
      "Tiger-Hub",
      "V.Ghub"
    }, function(r0_673)
      -- line: [0, 0] id: 673
      r43_454 = r0_673
      ArsenOption()
    end)
    local r44_454 = nil
    function BedW()
      -- line: [0, 0] id: 640
      return r44_454
    end
    function BedWarOption()
      -- line: [0, 0] id: 1012
      if BedWars() == "AURORA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XStormDeveloper/AuroraForRoblox/main/lua", true))()
      elseif BedWars() == "IceCat" then
        loadstring(game:HttpGet("https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars", true))()
      elseif BedWars() == "JH NN Gaming Bedwars V3.0" then
        loadstring(game:HttpGet("https://pastebin.com/raw/2HNVwUvm"))()
      elseif BedWars() == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif BedWars() == "SOFT BED" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iWxWxX2M", true))()
      elseif BedWars() == "SNOW X V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SNOW%20X%20V2"))()
      elseif BedWars() == "Future" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua", true))()
      elseif BedWars() == "Nightbed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedX/main/NightbedScriptLol/mostNightbed.lua", true))()
      elseif BedWars() == "Vape V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
      elseif BedWars() == "Vezt(Private)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/Vezt/main/Vezt%20-%20BedWars%20(Private).lua"))()
      elseif BedWars() == "Xrayon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dorukqpx/Xrayon/main/xrayonv2.lua", true))()
      end
    end
    r33_454:Dropdown("Bed Wars", "Credits to Owner", {
      "AURORA",
      "IceCat",
      "JH NN Gaming Bedwars V3.0",
      "Raven B4",
      "SOFT BED",
      "SNOW X V2",
      "Future",
      "Nightbed",
      "Vape V4",
      "Vezt(Private)",
      "Xrayon"
    }, function(r0_817)
      -- line: [0, 0] id: 817
      r44_454 = r0_817
      BedWarOption()
    end)
    local r45_454 = nil
    function BeeSwarm()
      -- line: [0, 0] id: 742
      return r45_454
    end
    function BeeSwarmOption()
      -- line: [0, 0] id: 586
      if BeeSwarmSim() == "Blue Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
      elseif BeeSwarmSim() == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif BeeSwarmSim() == "Histy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
      elseif BeeSwarmSim() == "Kometa Hub" then
        loadstring(game:HttpGet("https://s.kometa.pw/kometa.lua"))()
      elseif BeeSwarmSim() == "Macro Hub" then
        loadstring(game:HttpGet("https://www.macrov2-script.xyz/macrov2.lua"))()
      elseif BeeSwarmSim() == "Pepsi Swarm" then
        loadstring(game:GetObjects("rbxassetid://4384103988")[1].Source)("Pepsi Swarm")
      end
    end
    r33_454:Dropdown("Bee Swarm Simulator", "Credits to Owner", {
      "Blue Hub",
      "Cloud Hub",
      "Histy Hub",
      "Kometa Hub",
      "Macro Hub",
      "Pepsi Swarm"
    }, function(r0_940)
      -- line: [0, 0] id: 940
      r45_454 = r0_940
      BeeSwarmOption()
    end)
    local r46_454 = nil
    function Blade()
      -- line: [0, 0] id: 917
      return r46_454
    end
    function BlaOption()
      -- line: [0, 0] id: 906
      if BladeBall() == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif BladeBall() == "AlSploit" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/BladeBall"))()
      elseif BladeBall() == "Artis Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lightHubDev/ArtisZ/a6dd81c647a4b4a51b0ecee8fb868472d45eacad/Artis Z Main"))()
      elseif BladeBall() == "Auto Parry by FFJ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
      elseif BladeBall() == "Bedol Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/Loaders/main/Blade_Ball.lua"))()
      elseif BladeBall() == "Berserk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samirayt/Whitelist/main/Whitelist%20Pago"))()
      elseif BladeBall() == "Blade Ball" then
        loadstring(game:HttpGet("https://pastebin.com/raw/qxA2ETxy"))()
      elseif BladeBall() == "Darkrai Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-On-YouTube/main/Script%20Collection"))()
      elseif BladeBall() == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/ADjr564T"))()
        setclipboard("Key= 8oidGmQNhbiZdIFTWcIC")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif BladeBall() == "EminX Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
      elseif BladeBall() == "Freya Hub" then
        loadstring(game:HttpGet("https://pastefy.app/qpzOA8ZR/raw"))()
      elseif BladeBall() == "Fuji Hub" then
        loadstring(game:HttpGet("https://shz.al/~main/dread/Fuji-Hub/script"))()
      elseif BladeBall() == "Galaxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/fruEwHqY"))()
      elseif BladeBall() == "Hexa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brothinkimnoob/AUTO-PARRY-HEXA-V3/main/HEXA%20V3"))()
      elseif BladeBall() == "Lightux Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif BladeBall() == "Ln Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/No6No6No7yt/Lumin-Hub/main/BladeV4.lua"))()
      elseif BladeBall() == "Luy Hub" then
        loadstring(game:HttpGet("https://shz.al/~LUYHUB"))()
      elseif BladeBall() == "Mynhub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/MYNHUB/main/BLADEBALL"))()
      elseif BladeBall() == "Neo.x" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DomainXV3/NEO.X/main/Velocity.lua"))()
      elseif BladeBall() == "Neptune Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TopPlayzYT/BladeBall/main/open"))()
      elseif BladeBall() == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif BladeBall() == "Nextix Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/Nextix-Hub/main/Loader"))()
      elseif BladeBall() == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
      elseif BladeBall() == "Noob" then
        loadstring(game:HttpGet("https://pastebin.com/raw/sYWb0Uin"))()
      elseif BladeBall() == "Nova x Fusion Hub" then
        loadstring(game:HttpGet("https://pastefy.app/xOAWDWaA/raw"))()
      elseif BladeBall() == "OMG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BladeBall() == "Oxox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krnow1/Bladeball_g/main/Credits_krnow"))()
      elseif BladeBall() == "Prolex" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/1734a4ee207844b994df2f36157afacd/files/1e79ac12fc8a47ef8263d5e9d43b7137/raw"))()
      elseif BladeBall() == "R4mpage V4" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/c2ba80c243e04cdaba2926ef0b747d9d/files/4471c9e60f444ebb98927dc25c52e8c7/raw"))()
      elseif BladeBall() == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif BladeBall() == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/eng"))()
      elseif BladeBall() == "SaZx HubZ" then
        loadstring(game:HttpGet("https://pastefy.app/0r7T66Gx/raw"))()
      elseif BladeBall() == "ScriptX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/Blade-Ball-Working-Most-Latest/main/Blade%20Ball%20Script%20X%20v1", true))()
      elseif BladeBall() == "Sirius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/Siriusisbetter/main/xyz.bb.lua", true))()
      elseif BladeBall() == "Stellar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/LoaderScripts/main/LoaderScripts"))()
      elseif BladeBall() == "Symphony Hub" then
        local r0_906 = loadstring
        local r1_906 = request
        if not r1_906 then
          r1_906 = http_request
          if not r1_906 then
            r1_906 = http
            if r1_906 then
              r1_906 = http.request or syn and syn.request
            else
              goto label_457	-- block#75 is visited secondly
            end
          end
        end
        local r3_906 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r0_906 and r1_906, "Your Executor does not support.")
        r0_906(r1_906({
          Url = r3_906,
          Method = "GET",
        }).Body)()
      elseif BladeBall() == "THub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tibe0124/tibe0124/main/Thub-blade-ur-balls"))()
      elseif BladeBall() == "Visual" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevTravDYT/VisualProductV10/main/KeySystem/ThankForUsing!/by-d-e-v-t-r-a-v/lua", true))()
        setclipboard("IUseVisualFree")
        game:GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif BladeBall() == "Visualize" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif BladeBall() == "White Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/E07Wyg7L"))()
      elseif BladeBall() == "Wii Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif BladeBall() == "xyz.beta" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/xyz.BB/main/xyz.bb.lua", true))()
      elseif BladeBall() == "Ysacxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/Hqr4NnFU", true))()
      elseif BladeBall() == "Zap Hub" then
        loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
      elseif BladeBall() == "Zen.cc" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/zen.cc/main/zenultramax.lua", true))()
      end
    end
    r33_454:Dropdown("Blade Ball", "Credits to Owner", {
      "Alchemy Hub",
      "AlSploit",
      "Artis Z",
      "Auto Parry by FFJ",
      "Bedol Hub",
      "Berserk Hub",
      "Blade Ball",
      "Darkrai Hub",
      "Del Hub",
      "EminX Hub",
      "Freya Hub",
      "Fuji Hub",
      "Galaxy Hub",
      "Hexa Hub",
      "Lightux Hub",
      "Ln Hub",
      "Luy Hub",
      "Mynhub",
      "Neo.x",
      "Neptune Hub",
      "Neva Hub",
      "Nextix Hub",
      "Nexus",
      "Noob",
      "Nova x Fusion Hub",
      "OMG Hub",
      "Oxox Hub",
      "Prolex",
      "R4mpage V4",
      "Raven B4",
      "REDz HUB",
      "SaZx HubZ",
      "ScriptX",
      "Sirius",
      "Stellar Hub",
      "Symphony Hub",
      "THub",
      "Visual",
      "Visualize",
      "White Hub",
      "Wii Hub",
      "xyz.beta",
      "Ysacxy Hub",
      "Zap Hub",
      "Zen.cc",
      nil,
      nil,
      nil
    }, function(r0_857)
      -- line: [0, 0] id: 857
      r46_454 = r0_857
      BlaOption()
    end)
    local r47_454 = nil
    function Bloxburg()
      -- line: [0, 0] id: 531
      return r47_454
    end
    function BloxburgOption()
      -- line: [0, 0] id: 535
      if Bloxburg() == "BloxBurger" then
        loadstring(game:HttpGet("https://bloxburger.eu/scripts/free/script.lua"))()
      elseif Bloxburg() == "Evo v4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif Bloxburg() == "Vysor" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2f213cf4f330b8eb17423eaa4ae64ff6.lua"))()
      end
    end
    r33_454:Dropdown("Bloxburg", "Credits to Owner", {
      "BloxBurger",
      "Evo v4",
      "Vysor"
    }, function(r0_785)
      -- line: [0, 0] id: 785
      r47_454 = r0_785
      BloxburgOption()
    end)
    local r48_454 = nil
    function BloxFruit()
      -- line: [0, 0] id: 899
      return r48_454
    end
    function BloxFruitOption()
      -- line: [0, 0] id: 661
      if BloxFruit() == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif BloxFruit() == "Apple Hub" then
        getgenv().NgonNguScript = true
        repeat
          task.wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImTienNguyenZ/AppleHub/main/LoaderBF"))()
      elseif BloxFruit() == "Atomic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArceusXHub/atomic-hub/main/atomic-hub.lua"))()
      elseif BloxFruit() == "Beo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bestxemchua/agagagaq/main/BeoHUB/BeoHUB.lua"))()
      elseif BloxFruit() == "Blck Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()
      elseif BloxFruit() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif BloxFruit() == "Bull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/BullMain"))()
      elseif BloxFruit() == "CFrame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
      elseif BloxFruit() == "Cokka Hub" then
        loadstring(game:HttpGet("https://codeberg.org/CokkaHub/Loadstring/raw/branch/main/CokkaHub.lua"))()
      elseif BloxFruit() == "Destiny Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KudoCon/DestinyHub/main/DestinyKey"))()
      elseif BloxFruit() == "Domadic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
      elseif BloxFruit() == "Dynamic Hub" then
        loadstring(game:HttpGetAsync("https://Dynamic.xcodehoster.com/loader.lua"))()
      elseif BloxFruit() == "Ez Beli" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/ChestFarmOp"))()
      elseif BloxFruit() == "Fao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PNguyen0199/Script/main/Fai-Fao.lua"))()
      elseif BloxFruit() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flares"))()
      elseif BloxFruit() == "FTS V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tulam2000/FTS-HUB/main/FTS%20x%20Hub"))()
      elseif BloxFruit() == "Gringo Hub" then
        loadstring(game:HttpGet("https://github.com/LeVanNhatIT/GringoHub/raw/main/Loading_Ui/Loading"))()
      elseif BloxFruit() == "Halo X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HALOxHUB/ScriptLoader/main/Loader.lua"))()
      elseif BloxFruit() == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif BloxFruit() == "Hung Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/Loading"))()
      elseif BloxFruit() == "JJTx Hub" then
        loadstring(r32_454:HttpGet("https://raw.githubusercontent.com/JJTChannel/JJTxHUB/main/Re-come.lua"))()
      elseif BloxFruit() == "Law Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/Law%20hub"))()
      elseif BloxFruit() == "Madox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/MadoxHubKey", true))()
      elseif BloxFruit() == "Makima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Piwwy0909/MakimaRemake/main/Cumback.Makima"))()
      elseif BloxFruit() == "Makori Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt"))()
      elseif BloxFruit() == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onepicesenpai/onepicesenpai/main/onichanokaka"))()
      elseif BloxFruit() == "Mama Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
      elseif BloxFruit() == "MeMayBeo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Z/main/MeMayBeo"))()
      elseif BloxFruit() == "Modz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/modz"))()
      elseif BloxFruit() == "MTriet Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
      elseif BloxFruit() == "Mukuro Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
      elseif BloxFruit() == "Nexuz Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NexuzHub/Main-/main/Script"))()
      elseif BloxFruit() == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif BloxFruit() == "Night Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NIGHTHUBONTOP/Main/main/NIGHT-HUB"))()
      elseif BloxFruit() == "Omg Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BloxFruit() == "Pado Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REWzaKunGz1/premium/main/PadoHub"))()
      elseif BloxFruit() == "Raito Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
      elseif BloxFruit() == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif BloxFruit() == "REDzHUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
      elseif BloxFruit() == "Sagi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/SagiHub"))()
      elseif BloxFruit() == "Saki Hub" then
        loadstring(game:HttpGetAsync("https://sharetext.me/raw/u3if6m3hgr"))()
      elseif BloxFruit() == "Sara Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SaraSenpai/bloxfruist/main/Sarahub"))()
      elseif BloxFruit() == "Secret Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FtsHub/main/main/SecretHub.Lua"))()
      elseif BloxFruit() == "Snow Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Hub/main/SnowHub-BloxFruit"))()
      elseif BloxFruit() == "Sonic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/Protected-25.lua"))()
      elseif BloxFruit() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif BloxFruit() == "Switch Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumX/main/src_.lua.txt"))()
      elseif BloxFruit() == "T7GFY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
      elseif BloxFruit() == "Tawan Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kill55547/TAWAN_HUB/main/TAWANxHUB_V2.lua.txt", true))()
      elseif BloxFruit() == "TNG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tngaming123/TNGHub/main/AutoRaceV4.lua"))()
      elseif BloxFruit() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif BloxFruit() == "Turbo Hub" then
        loadstring(r32_454:HttpGet("https://gitlab.com/turbohubz/loader.xyz/loader/-/raw/main/TurboHub-Loader"))()
      elseif BloxFruit() == "Uranium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
      elseif BloxFruit() == "Vector Hub" then
        _G.Mode = "English"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MBPC"))()
      elseif BloxFruit() == "Void Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/VoidHub/main/Script"))()
      elseif BloxFruit() == "Winnable Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlostpexz/tyuiop/Fps/Loading.lua"))()
      elseif BloxFruit() == "Xenon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Larinax999/leak/main/khemtitgamerHUB-BF.lua"))()
      elseif BloxFruit() == "Zamex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua"))()
      elseif BloxFruit() == "Zaque Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mei2232/ZaqueHub/main/Zaque%20Hub"))()
      elseif BloxFruit() == "Zaque Hub(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/BloxFruitPC/main/Protected.lua"))()
      elseif BloxFruit() == "Zee Hub" then
        loadstring(game:HttpGet("https://zKuzy.link/ZeeHub.lua"))()
      elseif BloxFruit() == "Zekrom Hub X" then
        loadstring(r32_454:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif BloxFruit() == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubTheBest/Main/main/Loader", true))()
      end
    end
    r33_454:Dropdown("Blox Fruit", "Credits to Owner", {
      "Alchemy Hub",
      "Apple Hub",
      "Atomic Hub",
      "Beo Hub",
      "Blck Hub",
      "BlackTrap",
      "Bull Hub",
      "CFrame Hub",
      "Cokka Hub",
      "Destiny Hub",
      "Domadic Hub",
      "Dynamic Hub",
      "Ez Beli",
      "Fao Hub",
      "Flare Hub",
      "FTS V2",
      "Gringo Hub",
      "Halo X Hub",
      "Hoho Hub",
      "Hung Hub",
      "JJTx Hub",
      "Law Hub",
      "Madox Hub",
      "Makima Hub",
      "Makori Hub",
      "Makori Hub",
      "Master Hub",
      "Mama Hub",
      "MeMayBeo",
      "Modz Hub",
      "MTriet Hub",
      "Mukuro Hub",
      "Nexuz Hub",
      "Neva Hub",
      "Night Hub",
      "Omg Hub",
      "Pado Hub",
      "Raito Hub",
      "Rblx Hub",
      "REDzHUB",
      "Sagi Hub",
      "Saki Hub",
      "Sara Hub",
      "Secret Hub",
      "Snow Hub",
      "Sonic Hub",
      "Speed Hub X",
      "Switch Hub",
      "T7GFY",
      "Tawan Hub",
      "TNG Hub",
      "Thunder Z",
      "Turbo Hub",
      "Uranium Hub",
      "Vector Hub",
      "Void Hub",
      "Winnable Hub",
      "Xenon Hub",
      "Zamex Hub",
      "Zaque Hub",
      "Zaque Hub(PC)",
      "Zee Hub",
      "Zekrom Hub X",
      "Zen Hub"
    }, function(r0_800)
      -- line: [0, 0] id: 800
      r48_454 = r0_800
      BloxFruitOption()
    end)
    local r49_454 = nil
    function BreakIn()
      -- line: [0, 0] id: 615
      return r49_454
    end
    function BreakOption()
      -- line: [0, 0] id: 825
      if BreakIn2() == "Breaking Blitz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif BreakIn2() == "Break In 2 Kavo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt", true))()
      elseif BreakIn2() == "Break In 2 Orion" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BreakIn2() == "Camping Trip" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yieviro92creepy/Testfu/main/Breakin2"))()
      elseif BreakIn2() == "D8rk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Games/Break%20In%202.lua", true))()
      elseif BreakIn2() == "F Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/Hide/main/Break%20in%202"))()
      elseif BreakIn2() == "IceWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif BreakIn2() == "Jn Hh Gaming" then
        loadstring(game:HttpGet("https://freenote.biz/raw/ScmsS7SwTW", true))()
      elseif BreakIn2() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Break/main/In"))()
      elseif BreakIn2() == "Playvora + JNHH Hub" then
        loadstring(game:HttpGet("https://freenote.biz/raw/80jXm2Q0a7", true))()
      end
    end
    r33_454:Dropdown("Break In 2", "Credits to Owner", {
      "Breaking Blitz",
      "Break In 2 Kavo",
      "Break In 2 Orion",
      "Camping Trip",
      "D8rk Hub",
      "F Hub",
      "IceWare",
      "Jn Hh Gaming",
      "Legend HandlesYT",
      "Playvora + JNHH Hub"
    }, function(r0_720)
      -- line: [0, 0] id: 720
      r49_454 = r0_720
      BreakOption()
    end)
    local r50_454 = nil
    function BuildA()
      -- line: [0, 0] id: 468
      return r50_454
    end
    function BuildOption()
      -- line: [0, 0] id: 598
      if BuildABoat() == "Astra Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/0YezNNRh", true))()
      elseif BuildABoat() == "Auto Build" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
      elseif BuildABoat() == "Buil a boat for treasure" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua"))()
      elseif BuildABoat() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_598 = loadstring
        local r1_598 = request
        if not r1_598 then
          r1_598 = http_request
          if not r1_598 then
            r1_598 = http
            if r1_598 then
              r1_598 = http.request or syn and syn.request
            else
              goto label_58	-- block#11 is visited secondly
            end
          end
        end
        local r3_598 = tostring
        local r4_598 = "https://api.eclipsehub.xyz/auth"
        assert(r0_598 and r1_598, "Executor not Supported")
        r0_598(r1_598({
          Url = r4_598 .. "?key=" .. r3_598(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif BuildABoat() == "NooVster" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NooVster/v1.1/main/Source"))()
      elseif BuildABoat() == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/BABFT/main/Ruby%20Hub", true))()
      elseif BuildABoat() == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/spacvehubloader"))()
      elseif BuildABoat() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif BuildABoat() == "Vynixius 2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
      elseif BuildABoat() == "Zolars X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua"))()
      end
    end
    r33_454:Dropdown("Build A Boat", "Credits to Owner", {
      "Astra Hub",
      "Auto Build",
      "Buil a boat for treasure",
      "Eclipse Hub",
      "NooVster",
      "Ruby Hub",
      "Space Hub",
      "Thunder Z",
      "Vynixius 2.0",
      "Zolars X"
    }, function(r0_976)
      -- line: [0, 0] id: 976
      r50_454 = r0_976
      BuildOption()
    end)
    local r51_454 = nil
    function Chao()
      -- line: [0, 0] id: 747
      return r51_454
    end
    function ChaosOption()
      -- line: [0, 0] id: 658
      if Chaos() == "AstralHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
      elseif Chaos() == "Bad Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/idkfffff/MainScript/main/BadHub.lua"))()
      elseif Chaos() == "Chaos Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt"))()
      elseif Chaos() == "SlapX Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Slinzo1/Chao-s-/main/Chaos"))()
      elseif Chaos() == "Juanko Hub v4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/VzPbD7GW"))()
      elseif Chaos() == "Ro Flux" then
        pcall(function()
          -- line: [0, 0] id: 659
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif Chaos() == "TSSChaosScript" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Idkwhatudoin/TSS/main/TSSChaosScript", true))()
      elseif Chaos() == "Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aidanlolol/MainScript/main/ChaosScriptVersionTwoPointOne.lua"))()
      end
    end
    r33_454:Dropdown("Chaos", "Credits to Owner", {
      "AstralHub",
      "Bad Hub",
      "Chaos Script",
      "SlapX Chaos Gui",
      "Juanko hub v4",
      "Ro Flux",
      "TSSChaosScript",
      "Chaos Gui"
    }, function(r0_950)
      -- line: [0, 0] id: 950
      r51_454 = r0_950
      ChaosOption()
    end)
    local r52_454 = nil
    function ColorOr()
      -- line: [0, 0] id: 868
      return r52_454
    end
    function ColorOption()
      -- line: [0, 0] id: 911
      if ColorOrDie() == "Color 0r Die | YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0color", true))()
      elseif ColorOrDie() == "Now Mon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoWMoN/Color-0r-DIE/main/NoWMoN.lua"))()
      end
    end
    r33_454:Dropdown("Color Or Die", "Credits to Owner", {
      "Color 0r Die | YT ToraIsMe",
      "Now Mon"
    }, function(r0_830)
      -- line: [0, 0] id: 830
      r52_454 = r0_830
      ColorOption()
    end)
    local r53_454 = nil
    function CombatWar()
      -- line: [0, 0] id: 684
      return r53_454
    end
    function CombatOption()
      -- line: [0, 0] id: 884
      if CombatWarriors() == "Cwhb" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
      elseif CombatWarriors() == "Hydra Ui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CheeseOnGithub/cheese-hook/main/main%20hydra%20ui.lua", true))()
      elseif CombatWarriors() == "Nova Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NOVA_HUB_SOURCE"))()
      elseif CombatWarriors() == "Project-Hook" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/required.lua"))()
      elseif CombatWarriors() == "Zap Hub" then
        loadstring(game:HttpGet("https://www.itots.tk/zaphub/combat-warriors.lua", true))()
      end
    end
    r33_454:Dropdown("Combat Warriors", "Credits to Owner", {
      "Cwhb",
      "Hydra Ui",
      "Nova Hub",
      "Project-Hook",
      "Zap Hub"
    }, function(r0_637)
      -- line: [0, 0] id: 637
      r53_454 = r0_637
      CombatOption()
    end)
    local r54_454 = nil
    function DaHo()
      -- line: [0, 0] id: 925
      return r54_454
    end
    function DaOption()
      -- line: [0, 0] id: 564
      if DaHood() == "DaHub" then
        getgenv().Toggle = "v"
        getgenv().Intro = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoUGotbannedlol/DaHubV3/main/Launch"))()
      elseif DaHood() == "DragonWare" then
        loadstring(game:HttpGet("https://paste-drop.com/raw/ZAE0Or8c3y"))()
      elseif DaHood() == "Enclosed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dylannpro123/enclosed/main/enclosed"))()
      elseif DaHood() == "Focus" then
        loadstring(game:HttpGet("https://pastebin.com/raw/5BkTV67C", true))()
      elseif DaHood() == "Lanxility" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
      elseif DaHood() == "OxHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/patrickhackplus/oxhub/main/kidsinmybasement"))()
      elseif DaHood() == "Pluto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Scrvpter/Pluto/Lua/Loader.Lua", true))()
      elseif DaHood() == "RayX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua"))()
      elseif DaHood() == "Serenity" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cypherdh/Serenity/main/script"))()
      elseif DaHood() == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHubLoader"))()
      elseif DaHood() == "Space X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood"))()
      elseif DaHood() == "SwagMode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
      elseif DaHood() == "Vortex" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
      elseif DaHood() == "Zapped" then
        loadstring(game:HttpGet("https://ekso.gq/raw/relases/zapped.lua"))()
      elseif DaHood() == "Zinc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua"))()
      end
    end
    r33_454:Dropdown("Da Hood", "Credits to Owner", {
      "DaHub",
      "DragonWare",
      "Enclosed",
      "Focus",
      "Lanxility",
      "OxHub",
      "Pluto",
      "RayX",
      "Serenity",
      "Space Hub",
      "Space X",
      "SwagMode",
      "Vortex",
      "Zapped",
      "Zinc Hub"
    }, function(r0_545)
      -- line: [0, 0] id: 545
      r54_454 = r0_545
      DaOption()
    end)
    local r55_454 = nil
    function Door()
      -- line: [0, 0] id: 479
      return r55_454
    end
    function DoorsOption()
      -- line: [0, 0] id: 610
      if Doors() == "Black Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Doors"))()
      elseif Doors() == "DarkCheatClient" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      elseif Doors() == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
      elseif Doors() == "Dxrk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/dxrkhub/main/doors-scripts/hub-source"))()
      elseif Doors() == "ENTITY SPAWNER" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI"))()
      elseif Doors() == "King Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv"))()
      elseif Doors() == "MSDOORS" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua", true))()
      elseif Doors() == "Nerd Hub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/DoorsV3_ByNerd.lua"))()
      elseif Doors() == "Nerd Hub V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/doorsnerdv4.lua"))()
      elseif Doors() == "Nerd Hub V5" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/NeRDV5.lua"))()
      elseif Doors() == "Poop Doors" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua"))()
      end
    end
    r33_454:Dropdown("Doors", "Credits to Owner", {
      "Black Hub",
      "DarkCheatClient",
      "Darkrai X",
      "Dxrk Hub",
      "ENTITY SPAWNER",
      "King Hub",
      "MSDOORS",
      "Nerd Hub V3",
      "Nerd Hub V4",
      "Nerd Hub V5",
      "Poop Doors"
    }, function(r0_819)
      -- line: [0, 0] id: 819
      r55_454 = r0_819
      DoorsOption()
    end)
    local r56_454 = nil
    function Evad()
      -- line: [0, 0] id: 905
      return r56_454
    end
    function EvadeOption()
      -- line: [0, 0] id: 714
      if Evade() == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
      elseif Evade() == "Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua"))()
      elseif Evade() == "Evade Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
      elseif Evade() == "Evade Tuperx" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TUPERX/TUPERX/Main/MenuBF/README.md"))()
      elseif Evade() == "Hydra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Main.lua", true))()
      elseif Evade() == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif Evade() == "Project-WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif Evade() == "Real-King Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua"))()
      elseif Evade() == "Speed Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Speed.txt"))()
      end
    end
    r33_454:Dropdown("Evade", "Credits to Owner", {
      "Darkrai-X",
      "Evade",
      "Evade Gui",
      "Evade Tuperx",
      "Hydra",
      "Nex Hub",
      "Project-WD",
      "Real-King Evade",
      "Speed Evade"
    }, function(r0_795)
      -- line: [0, 0] id: 795
      r56_454 = r0_795
      EvadeOption()
    end)
    local r57_454 = nil
    function GrandPiece()
      -- line: [0, 0] id: 892
      return r57_454
    end
    function GrandOption()
      -- line: [0, 0] id: 850
      if GrandPieceOnline() == "Lazer Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/lazer"))()
      elseif GrandPieceOnline() == "Xno Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/955dd3e8f43767eedf49f84ffac60170.lua"))()
        setclipboard("babyshark")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif GrandPieceOnline() == "Zephyrion Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d2744abe1146d9accd91646050d082db.lua"))()
      end
    end
    r33_454:Dropdown("Grand Piece Online", "Credits to Owner", {
      "Lazer Hub",
      "Xno Hub",
      "Zephyrion Hub"
    }, function(r0_719)
      -- line: [0, 0] id: 719
      r57_454 = r0_719
      GrandOption()
    end)
    local r58_454 = nil
    function HazePi()
      -- line: [0, 0] id: 889
      return r58_454
    end
    function HazeOption()
      -- line: [0, 0] id: 568
      if HazePiece() == "Beli Hunter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Belihunter"))()
      elseif HazePiece() == "Hyper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/All-Script/main/hp.lua"))()
      elseif HazePiece() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Haze/main/Piece"))()
      elseif HazePiece() == "Mystic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mo061/MysticHub/main/README.md"))()
      elseif HazePiece() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/Loader/AllGame.lua"))()
      elseif HazePiece() == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/Haze%20Piece"))()
      end
    end
    r33_454:Dropdown("Haze Piece", "Credits to Owner", {
      "Beli Hunter",
      "Hyper Hub",
      "Legend HandlesYT",
      "Mystic Hub",
      "Thunder Z",
      "Xtrey10x Hub"
    }, function(r0_679)
      -- line: [0, 0] id: 679
      r58_454 = r0_679
      HazeOption()
    end)
    local r59_454 = nil
    function JailBre()
      -- line: [0, 0] id: 552
      return r59_454
    end
    function JailOption()
      -- line: [0, 0] id: 605
      if JailBreak() == "OneMoreHub" then
        loadstring(game:HttpGet("https://gitlab.com/wspcontr/onemorehub/-/raw/main/scriptloader.lua"))()
      elseif JailBreak() == "Project Auto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/free"))()
      elseif JailBreak() == "Sexsation" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
      elseif JailBreak() == "Vestra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VestraTech/Vestra/main/Roblox/loader.lua"))()
      end
    end
    r33_454:Dropdown("Jail Break", "Credits to Owner", {
      "OneMoreHub",
      "Project Auto",
      "Sexsation",
      "Vestra"
    }, function(r0_945)
      -- line: [0, 0] id: 945
      r59_454 = r0_945
      JailOption()
    end)
    local r60_454 = nil
    function Kats()
      -- line: [0, 0] id: 469
      return r60_454
    end
    function KatOption()
      -- line: [0, 0] id: 496
      if Kat() == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/KAT"))()
      elseif Kat() == "Darkyy Ware X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/NOWAY/main/darkyyware.lua"))()
      elseif Kat() == "Kat Killer by JN HH Gaming" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Kat12/main/Kat"))()
      elseif Kat() == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif Kat() == "SilentAim" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/sa"))()
      elseif Kat() == "Unfair Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua", true))()
      end
    end
    r33_454:Dropdown("Kat", "Credits to Owner", {
      "Darkrai X",
      "Darkyy Ware X",
      "Kat Killer by JN HH Gaming",
      "OwlHub",
      "SilentAim",
      "Unfair Hub"
    }, function(r0_1015)
      -- line: [0, 0] id: 1015
      Kat = r0_1015
      KatOption()
    end)
    local r61_454 = nil
    function KingLeg()
      -- line: [0, 0] id: 840
      return r61_454
    end
    function KingOption()
      -- line: [0, 0] id: 561
      if KingLegacy() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif KingLegacy() == "Hyper Hub" then
        pcall(function()
          -- line: [0, 0] id: 562
          repeat
            wait()
          until game:IsLoaded()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
        end)
      elseif KingLegacy() == "Mukuro X Quartyz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
      elseif KingLegacy() == "One X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xOne2/King-Legacy/main/README.md"))()
      elseif KingLegacy() == "Reaper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
      elseif KingLegacy() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif KingLegacy() == "ThunderZ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif KingLegacy() == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
      end
    end
    r33_454:Dropdown("King Legacy", "Credits to Owner", {
      "BlackTrap",
      "Hyper Hub",
      "Mukuro X Quartyz",
      "One X Hub",
      "Reaper Hub",
      "Speed Hub X",
      "ThunderZ",
      "Zen Hub"
    }, function(r0_790)
      -- line: [0, 0] id: 790
      r61_454 = r0_790
      KingOption()
    end)
    local r62_454 = nil
    function LegendsOf()
      -- line: [0, 0] id: 962
      return r62_454
    end
    function LegendsOption()
      -- line: [0, 0] id: 689
      if LegendsOfSpeed() == "Arch" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lux933/Arch/main/Utilities/loader.lua"))()
      elseif LegendsOfSpeed() == "Code Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/coder382/CodeHub/main/Loader.lua"))()
      elseif LegendsOfSpeed() == "Cryo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryoScript/Scripts.lua/main/Legends%20of%20Speed.lua", true))()
      elseif LegendsOfSpeed() == "Legends Of Speed 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhackyCode/SPEEDDEVIL/main/legendsofspeed.lua"))()
      elseif LegendsOfSpeed() == "Legends Of Speed 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YukiTM/Roblox/main/Legends", true))()
      elseif LegendsOfSpeed() == "Legends Of Speed 3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Legenos%20of%20speedos"))()
      elseif LegendsOfSpeed() == "Legends Of Speed Rayfield" then
        loadstring(game:HttpGet("https://pastebin.com/raw/wGjDdXNX"))()
      elseif LegendsOfSpeed() == "Legends Of Speed by Waza80" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/los"))()
      elseif LegendsOfSpeed() == "Pog Hub No Carte" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/Loader/main/Loader.lua"))()
      elseif LegendsOfSpeed() == "Project L" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsThisMe01/Project-L/main/LegendsOfSpeed.lua"))()
      elseif LegendsOfSpeed() == "Project Meow" then
        loadstring(game:HttpGet("https://scriptblox.com/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
      elseif LegendsOfSpeed() == "Project Omega" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptPirate/ProjectOmega/main/ProjectOmegaLoader.lua"))()
      elseif LegendsOfSpeed() == "Proxima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
      elseif LegendsOfSpeed() == "Pss Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/psswaldo/psshub/main/main.lua"))()
      elseif LegendsOfSpeed() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arlists/Sky-Hub/main/Main", true))()
      elseif LegendsOfSpeed() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif LegendsOfSpeed() == "SuPray" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/SuPray/main/Speed-of-Legends.lua"))()
      elseif LegendsOfSpeed() == "Tbao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
      elseif LegendsOfSpeed() == "Uciha Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fareljr1/Hub/main/Loader"))()
      elseif LegendsOfSpeed() == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
      elseif LegendsOfSpeed() == "Weinz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/weiny-ez/w-main/main/loader.lua"))()
      end
    end
    r33_454:Dropdown("Legends Of Speed", "Credits to Owner", {
      "Arch",
      "Code Hub",
      "Cryo Hub",
      "Legends Of Speed 1",
      "Legends Of Speed 2",
      "Legends Of Speed 3",
      "Legends Of Speed Rayfield",
      "Legends Of Speed by Waza80",
      "Pog Hub No Carte",
      "Project L",
      "Project Meow",
      "Project Omega",
      "Proxima Hub",
      "Pss Hub",
      "Sky Hub",
      "Speed Hub X",
      "SuPray",
      "Tbao Hub",
      "Uciha Hub",
      "Vynixius",
      "Weinz",
      nil
    }, function(r0_502)
      -- line: [0, 0] id: 502
      r62_454 = r0_502
      LegendsOption()
    end)
    local r63_454 = nil
    function MadCi()
      -- line: [0, 0] id: 461
      return r63_454
    end
    function MadOption()
      -- line: [0, 0] id: 591
      if MadCity() == "ProBacon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aymarko/ProBaconHub/main/probacon1234/aymarko/MadCity/GUI/Beta"))()
      elseif MadCity() == "Ruby Hub Free" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20Chapter%202", true))()
      elseif MadCity() == "Ruby Hub v2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20v1.1", true))()
      end
    end
    r33_454:Dropdown("Mad City", "Credits to Owner", {
      "ProBacon Hub",
      "Ruby Hub Free",
      "Ruby Hub v2.0"
    }, function(r0_763)
      -- line: [0, 0] id: 763
      r63_454 = r0_763
      MadOption()
    end)
    local r64_454 = nil
    function MurderMys()
      -- line: [0, 0] id: 583
      return r64_454
    end
    function MurderOption()
      -- line: [0, 0] id: 590
      if MurderMystery2() == "Auto Coin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tvgueimer84/tvgueimerr23232/main/mmm2"))()
      elseif MurderMystery2() == "Dreadz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DreadzHub2/DreadzHub-Scripts-FR/main/Loader"))()
      elseif MurderMystery2() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_590 = loadstring
        local r1_590 = request
        if not r1_590 then
          r1_590 = http_request
          if not r1_590 then
            r1_590 = http
            if r1_590 then
              r1_590 = http.request or syn and syn.request
            else
              goto label_45	-- block#9 is visited secondly
            end
          end
        end
        local r3_590 = tostring
        local r4_590 = "https://api.eclipsehub.xyz/auth"
        assert(r0_590 and r1_590, "Executor not Supported")
        r0_590(r1_590({
          Url = r4_590 .. "?key=" .. r3_590(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif MurderMystery2() == "Ghost Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
      elseif MurderMystery2() == "Highlight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Free"))()
      elseif MurderMystery2() == "Jayy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reed192512/jayyhubcloud/main/MainLoadstring", true))()
      elseif MurderMystery2() == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/MM2_V2"))()
      elseif MurderMystery2() == "Lunar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
      elseif MurderMystery2() == "Murder Mystery 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/mm2", true))()
      elseif MurderMystery2() == "Murder Mystery 2 by:ScriptX Version X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/SORIX-Hub/main/Murder%20Mystery%202%20Version%20X"))()
      elseif MurderMystery2() == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring"))()
      elseif MurderMystery2() == "R3th Priv" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3TH-PRIV/main/LOAD.lua"))()
      elseif MurderMystery2() == "Ski Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/203DBjLx", true))()
      elseif MurderMystery2() == "Symphony Hub" then
        local r0_590 = loadstring
        local r1_590 = request
        if not r1_590 then
          r1_590 = http_request
          if not r1_590 then
            r1_590 = http
            if r1_590 then
              r1_590 = http.request or syn and syn.request
            else
              goto label_218	-- block#39 is visited secondly
            end
          end
        end
        local r3_590 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r0_590 and r1_590, "Your Executor does not support.")
        r0_590(r1_590({
          Url = r3_590,
          Method = "GET",
        }).Body)()
      end
    end
    r33_454:Dropdown("Murder Mystery 2", "Credits to Owner", {
      "Auto Coin",
      "Dreadz Hub",
      "Eclipse Hub",
      "Ghost Hub",
      "Highlight Hub",
      "Jayy Hub",
      "Kidachi Hub",
      "Lunar Hub",
      "Murder Mystery 2",
      "Murder Mystery 2 by:ScriptX Version X",
      "Nexus Hub",
      "R3th Priv",
      "Ski Hub",
      "Symphony Hub"
    }, function(r0_828)
      -- line: [0, 0] id: 828
      r64_454 = r0_828
      MurderOption()
    end)
    local r65_454 = nil
    function MurderersVs()
      -- line: [0, 0] id: 634
      return r65_454
    end
    function MurderersOption()
      -- line: [0, 0] id: 772
      if MurderersVsSheriffs() == "Bebo Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
      elseif MurderersVsSheriffs() == "Emptyness Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/EmptynessNoBlur"))()
      elseif MurderersVsSheriffs() == "Kenniel Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Murderers-VS-Sheriffs-Duels-script/main/Murderers%20VS%20Sheriffs%20Duels%20script", true))()
      elseif MurderersVsSheriffs() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Duels7/main/Sheriffs56"))()
      elseif MurderersVsSheriffs() == "Muderer Vs Sheriff" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/mvs"))()
      elseif MurderersVsSheriffs() == "Oasis Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/bruvzz/oasishub/main/script"))()
      elseif MurderersVsSheriffs() == "Ranxware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AsteriskCodes/Ranxware-V2-Restored/main/source.lua"))()
      elseif MurderersVsSheriffs() == "Ro Flux Hub" then
        _G.Key = "FreeKey2023"
        pcall(function()
          -- line: [0, 0] id: 773
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif MurderersVsSheriffs() == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
      end
    end
    r33_454:Dropdown("Murderers Vs Sheriffs", "Credits to Owner", {
      "Bebo Scripts",
      "Emptyness Hub",
      "Kenniel Script",
      "Legend HandlesYT",
      "Muderer Vs Sheriff",
      "Oasis Hub",
      "Ranxware",
      "Ro Flux Hub",
      "Ruby Hub"
    }, function(r0_655)
      -- line: [0, 0] id: 655
      r65_454 = r0_655
      MurderersOption()
    end)
    local r66_454 = nil
    function MyRes()
      -- line: [0, 0] id: 734
      return r66_454
    end
    function MyOption()
      -- line: [0, 0] id: 641
      if MyRestaurant() == "Milk Up" then
        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
      elseif MyRestaurant() == "My Restaurant" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/MyRestaurant"))()
      elseif MyRestaurant() == "Project Lightning" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectLightningDev/Project-Lightning-Loader/main/Loader.Lua"))()
      elseif MyRestaurant() == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif MyRestaurant() == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
      elseif MyRestaurant() == "Wyn\'s Script" then
        loadstring(game:HttpGet("https://system-exodus.com/scripts/MyRestaurant/MyRestaurant.lua", true))()
      end
    end
    r33_454:Dropdown("My Restaurant", "Credits to Owner", {
      "Milk Up",
      "My Restaurant",
      "Project Lightning",
      "Project WD",
      "Rafa Hub",
      "Wyn\'s Script"
    }, function(r0_579)
      -- line: [0, 0] id: 579
      r66_454 = r0_579
      MyOption()
    end)
    local r67_454 = nil
    function NaturalDi()
      -- line: [0, 0] id: 920
      return r67_454
    end
    function NaturalOption()
      -- line: [0, 0] id: 973
      if NaturalDisaster() == "Binary Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BinaryHubOfficial/binaryhub/main/init.lua"))()
      elseif NaturalDisaster() == "CH Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
      elseif NaturalDisaster() == "Dark Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yarik312/DarkWare/main/MainLoader", true))()
      elseif NaturalDisaster() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_973 = loadstring
        local r1_973 = request
        if not r1_973 then
          r1_973 = http_request
          if not r1_973 then
            r1_973 = http
            if r1_973 then
              r1_973 = http.request or syn and syn.request
            else
              goto label_58	-- block#11 is visited secondly
            end
          end
        end
        local r3_973 = tostring
        local r4_973 = "https://api.eclipsehub.xyz/auth"
        assert(r0_973 and r1_973, "Executor not Supported")
        r0_973(r1_973({
          Url = r4_973 .. "?key=" .. r3_973(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif NaturalDisaster() == "Natural Disaster Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hussain1323232234/My-Scripts/main/Natural%20Disaster"))()
      elseif NaturalDisaster() == "Natural Disaster Survival" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()
      elseif NaturalDisaster() == "Natural Disaster Survival By:RIP" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/NaturalDisasterSurvival.lua"))()
      elseif NaturalDisaster() == "NDS_A\'X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/NDS_A%5EX"))()
      elseif NaturalDisaster() == "NDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main"))()
      elseif NaturalDisaster() == "NDS GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
      elseif NaturalDisaster() == "One Protocol" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneProtocol/Project/main/Loader", true))()
      elseif NaturalDisaster() == "Rawnder" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster"))()
      elseif NaturalDisaster() == "Six Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE"))()
      elseif NaturalDisaster() == "Zeerox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
      end
    end
    r33_454:Dropdown("Natural Disaster Survival", "Credits to Owner", {
      "Binary Hub",
      "CH Hub",
      "Dark Ware",
      "Eclipse Hub",
      "Natural Disaster Hub",
      "Natural Disaster Survival",
      "Natural Disaster Survival By:RIP",
      "NDS_A\'X",
      "NDS Hub",
      "NDS GUI",
      "One Protocol",
      "Rawnder",
      "Six Hub",
      "Zeerox Hub"
    }, function(r0_588)
      -- line: [0, 0] id: 588
      r67_454 = r0_588
      NaturalOption()
    end)
    local r68_454 = nil
    function NicoNext()
      -- line: [0, 0] id: 543
      return r68_454
    end
    function NicoOption()
      -- line: [0, 0] id: 749
      if NicoNextBot() == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/NicoNextBots", true))()
      elseif NicoNextBot() == "Hp Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/HPHub/main/HPHub.lua"))()
      elseif NicoNextBot() == "NexHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif NicoNextBot() == "Nico NextBot" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DFfKb4i9"))()
      elseif NicoNextBot() == "WercT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dropouut/Shindai/main/wercT.lua"))()
      end
    end
    r33_454:Dropdown("Nico NextBot", "Credits to Owner", {
      "Darkrai-X",
      "Hp Hub",
      "NexHub",
      "Nico NextBot",
      "WercT"
    }, function(r0_589)
      -- line: [0, 0] id: 589
      r68_454 = r0_589
      NicoOption()
    end)
    local r69_454 = nil
    function PetCat()
      -- line: [0, 0] id: 487
      return r69_454
    end
    function PetCOption()
      -- line: [0, 0] id: 668
      if PetCatchers() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif PetCatchers() == "GatoHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchers"))()
      elseif PetCatchers() == "Huge Games" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f38c17c4a5e9f38a7dac14ce0940688d.lua"))()
      elseif PetCatchers() == "IdiotHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main"))()
      elseif PetCatchers() == "Lenut Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lenutjr/pc/main/petcatchers"))()
      elseif PetCatchers() == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyHub123/NexusHubMain/main/Main.lua"))()
      elseif PetCatchers() == "Pet Catchers" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/PET%20CATCHERS", true))()
      end
    end
    r33_454:Dropdown("Pet Catchers", "Credits to Owner", {
      "Banana Hub",
      "GatoHub",
      "Huge Games",
      "IdiotHub",
      "Lenut Hub",
      "Nexus Hub",
      "Pet Catchers"
    }, function(r0_539)
      -- line: [0, 0] id: 539
      r69_454 = r0_539
      PetCOption()
    end)
    local r70_454 = nil
    function PetSim9()
      -- line: [0, 0] id: 869
      return r70_454
    end
    function Pet9Option()
      -- line: [0, 0] id: 638
      if PetSimulator99() == "Auto Stairway To Heaven" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fissurectomy/woah/main/ps99_stairway.lua"))()
      elseif PetSimulator99() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif PetSimulator99() == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/ps99"))()
      elseif PetSimulator99() == "Idiot Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Somerandomidiot/Lua/main/PS99_Protected.txt"))()
      elseif PetSimulator99() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Sim2/main/Pet99"))()
      elseif PetSimulator99() == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
      elseif PetSimulator99() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif PetSimulator99() == "Syrex Hub" then
        loadstring(game:HttpGet("https://syrexhub.netlify.app/raw/petsimulator99/syrexhub"))()
      elseif PetSimulator99() == "Zekrom Hub X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif PetSimulator99() == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end
    r33_454:Dropdown("Pet Simulator 99", "Credits to Owner", {
      "Auto Stairway To Heaven",
      "Banana Hub",
      "Huge Games",
      "Idiot Hub",
      "Legend HandlesYT",
      "REDz HUB",
      "Sky Hub",
      "Syrex Hub",
      "Zekrom Hub X",
      "Zer0 Hub"
    }, function(r0_577)
      -- line: [0, 0] id: 577
      r70_454 = r0_577
      Pet9Option()
    end)
    local r71_454 = nil
    function PetSim()
      -- line: [0, 0] id: 801
      return r71_454
    end
    function PetOption()
      -- line: [0, 0] id: 897
      if PetSimulatorX() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif PetSimulatorX() == "Catalyst" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/catalyst/itachi/main.lua"))()
      elseif PetSimulatorX() == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif PetSimulatorX() == "Extreme Hub" then
        _G.ExtremeHUBLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/All-Scripts-Obfuscated.lua"))()
      elseif PetSimulatorX() == "EVO V4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif PetSimulatorX() == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/psx"))()
      elseif PetSimulatorX() == "Milk Up" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2a31571481d9db7f3be01903493bfc9a.lua"))()
      elseif PetSimulatorX() == "Project WD" then
        getgenv().boothsnipe = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif PetSimulatorX() == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/psx.lua"))()
      elseif PetSimulatorX() == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif PetSimulatorX() == "ThunderZ(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      end
    end
    r33_454:Dropdown("Pet Simulator X", "Credits to Owner", {
      "BlackTrap",
      "Catalyst",
      "Cloud Hub",
      "Extreme Hub",
      "EVO V4",
      "Huge Games",
      "Milk Up",
      "Project WD",
      "Rafa Hub",
      "Rblx Hub",
      "ThunderZ(PC)"
    }, function(r0_493)
      -- line: [0, 0] id: 493
      r71_454 = r0_493
      PetOption()
    end)
    local r72_454 = nil
    function PrisonLi()
      -- line: [0, 0] id: 708
      return r72_454
    end
    function PrisonOption()
      -- line: [0, 0] id: 757
      if PrisonLife() == "Astral Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Games/PrisonLife/main.lua"))()
      elseif PrisonLife() == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/QY07DaJS"))()
      elseif PrisonLife() == "Fe Btools" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-btools-script-for-prison-life-9706"))()
      elseif PrisonLife() == "Fe Disabled Tool Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
      elseif PrisonLife() == "Juanko" then
        loadstring(game:HttpGet("https://pastebin.com/raw/rfAULQ83"))()
      elseif PrisonLife() == "Moonlight" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Prison-life/main/Moonlight%20Client%20Prison%20Life", true))()
      elseif PrisonLife() == "Tiger Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script"))()
      elseif PrisonLife() == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Prison%20Life"))()
      end
    end
    r33_454:Dropdown("Prison Life", "Credits to Owner", {
      "Astral Hub",
      "Del Hub",
      "Fe Btools",
      "Fe Disabled Tool Gui",
      "Juanko",
      "Moonlight",
      "Tiger Admin",
      "Vynixius"
    }, function(r0_492)
      -- line: [0, 0] id: 492
      r72_454 = r0_492
      PrisonOption()
    end)
    local r73_454 = nil
    function ProjectMu()
      -- line: [0, 0] id: 576
      return r73_454
    end
    function ProjectOption()
      -- line: [0, 0] id: 513
      if ProjectMugetsu() == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/ProjectMugetsu.lua"))()
      elseif ProjectMugetsu() == "Pm" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrickyAH/Scripts/main/loader.lua"))()
      elseif ProjectMugetsu() == "Purple Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheyCallMeVox/scripts/main/PM"))()
      elseif ProjectMugetsu() == "Valynium" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XO-3S-CL-VCK-jf-3HDM/Products/main/Project-Mugetsu.lua"))()
      elseif ProjectMugetsu() == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end
    r33_454:Dropdown("Project Mugetsu", "Credits to Owner", {
      "JumbleScripts",
      "Pm",
      "Purple Hub",
      "Valynium",
      "Verny Hub V2"
    }, function(r0_686)
      -- line: [0, 0] id: 686
      r73_454 = r0_686
      ProjectOption()
    end)
    local r74_454 = nil
    function ProjectSla()
      -- line: [0, 0] id: 915
      return r74_454
    end
    function ProjectSOption()
      -- line: [0, 0] id: 671
      if ProjectSlayer() == "Nuke Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2023/main/projslayerthingy", true))()
      elseif ProjectSlayer() == "Oni Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/01471f12f9adfd4537f4cc0b3b7bba14.lua"))()
      elseif ProjectSlayer() == "Shark Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/TcbS1i6E"))()
      elseif ProjectSlayer() == "Skeered Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skeereddo/name/main/krnl", true))()
      elseif ProjectSlayer() == "Sylveon Hub" then
        local r0_671 = "https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/Mobile.lua"
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet(r0_671))()
      elseif ProjectSlayer() == "Versaware Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware_free/main/VersawareFree.lua", true))()
      elseif ProjectSlayer() == "Zyrc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/mugentr"))()
      end
    end
    r33_454:Dropdown("Project Slayer", "Credits to Owner", {
      "Nuke Hub",
      "Oni Hub",
      "Shark Hub",
      "Skeered Hub",
      "Sylveon Hub",
      "Versaware Hub",
      "Zyrc Hub"
    }, function(r0_856)
      -- line: [0, 0] id: 856
      r74_454 = r0_856
      ProjectSOption()
    end)
    local r75_454 = nil
    function PunchSim()
      -- line: [0, 0] id: 649
      return r75_454
    end
    function PunchOption()
      -- line: [0, 0] id: 841
      if PunchSimulator() == "Angeel Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Angeelvxg/PunchSimulator/main/PunchSimulator.lua", true))()
      elseif PunchSimulator() == "Blue GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
      elseif PunchSimulator() == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/dbevo/main/asfasfasfasf"))()
      elseif PunchSimulator() == "Tora Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0PUNCH"))()
      end
    end
    r33_454:Dropdown("Punch Simulator", "Credits to Owner", {
      "Angeel Hub",
      "Blue GUI",
      "Perfectus Hub",
      "Tora Hub"
    }, function(r0_471)
      -- line: [0, 0] id: 471
      r75_454 = r0_471
      PunchOption()
    end)
    local r76_454 = nil
    function MadCi()
      -- line: [0, 0] id: 844
      return r76_454
    end
    function PunchWaOption()
      -- line: [0, 0] id: 978
      if PunchWall() == "Codexus Trial" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/PunchWallSim.lua"))()
      elseif PunchWall() == "ImperorLegend Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImperorLegend/Orig-PWSim-Script/main/Script"))()
      elseif PunchWall() == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif PunchWall() == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif PunchWall() == "Punch Wall Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/momentBr/game-script/main/Punch%20Wall%20Simulator"))()
      elseif PunchWall() == "Punch Wall Simulator YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0punch"))()
      elseif PunchWall() == "Yoto Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/GUI-SCRIPT/main/Main"))()
      end
    end
    r33_454:Dropdown("Punch Wall Simulator", "Credits to Owner", {
      "Codexus Trial",
      "ImperorLegend Hub",
      "Nexus",
      "Platinium Hub",
      "Punch Wall Simulator",
      "Punch Wall Simulator YT ToraIsMe",
      "Yoto Hub"
    }, function(r0_890)
      -- line: [0, 0] id: 890
      r76_454 = r0_890
      PunchWaOption()
    end)
    local r77_454 = nil
    function Rainbow()
      -- line: [0, 0] id: 761
      return r77_454
    end
    function RainOption()
      -- line: [0, 0] id: 617
      if RainbowFriends() == "BorkWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/" .. game.GameId .. ".lua"))(" Watermelon ? ")
      elseif RainbowFriends() == "Frightened Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/FrightenedHub/main/Loader.lua", true))()
      elseif RainbowFriends() == "Rainbow Friends KEPA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Keparetiolpxe/rbxscript/main/RainbowFriendsKEPA"))()
      elseif RainbowFriends() == "Rainbow Friends" then
        loadstring(game:HttpGet("https://pastebin.com/raw/yVhAwibN"))()
      elseif RainbowFriends() == "ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow"))()
      elseif RainbowFriends() == "Voidz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
      end
    end
    r33_454:Dropdown("Rainbow Friends(Chapter 2)", "Credits to Owner", {
      "BorkWare",
      "Frightened Hub",
      "Rainbow Friends KEPA",
      "Rainbow Friends",
      "ToraIsMe",
      "Voidz"
    }, function(r0_984)
      -- line: [0, 0] id: 984
      r77_454 = r0_984
      RainOption()
    end)
    local r78_454 = nil
    function ShadowBox()
      -- line: [0, 0] id: 941
      return r78_454
    end
    function ShadowOption()
      -- line: [0, 0] id: 746
      if ShadowBoxing() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/ShadowBoxing"))()
      elseif ShadowBoxing() == "Trey\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/shadow"))()
      end
    end
    r33_454:Dropdown("Shadow Boxing", "Credits to Owner", {
      "Flare Hub",
      "Trey\'s Hub"
    }, function(r0_536)
      -- line: [0, 0] id: 536
      r78_454 = r0_536
      ShadowOption()
    end)
    local r79_454 = nil
    function ShadowBox()
      -- line: [0, 0] id: 676
      return r79_454
    end
    function SlapOption()
      -- line: [0, 0] id: 654
      if SlapBattles() == "CherryUI\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
      elseif SlapBattles() == "Dizzy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/dizzy_hub/scripts/slap_battles.lua"))()
      elseif SlapBattles() == "Hub That Exists" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
      elseif SlapBattles() == "Infinite Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackie-coke/InfiniteWare/main/KS.lua", true))()
      elseif SlapBattles() == "Purple R20 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/anakinn"))()
      elseif SlapBattles() == "Slap Battle Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
      elseif SlapBattles() == "R20-Exploiter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua"))()
      elseif SlapBattles() == "Vantra Hub" then
        loadstring(game:HttpGet("https://vantra.cc/api/script/get?placeid=MainLoader"))()
      elseif SlapBattles() == "Whopper" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/whopper.lua"))()
      end
    end
    r33_454:Dropdown("Slap Battles", "Credits to Owner", {
      "CherryUI\'s Hub",
      "Dizzy Hub",
      "Hub That Exists",
      "Infinite Ware",
      "Purple R20 Hub",
      "Slap Battle Gui",
      "R20-Exploiter",
      "Vantra Hub",
      "Whopper"
    }, function(r0_495)
      -- line: [0, 0] id: 495
      r79_454 = r0_495
      SlapOption()
    end)
    local r80_454 = nil
    function SolsR()
      -- line: [0, 0] id: 882
      return Sonic
    end
    function SolsOption()
      -- line: [0, 0] id: 584
      if SolsRNG() == "HoHo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif SolsRNG() == "Legend Handless Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/upd/main/rng"))()
      elseif SolsRNG() == "Sol\'s RNG" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Toilet71/Games-Sol-s/main/Sol\'s%20Script"))()
      elseif SolsRNG() == "Sols RNG Panel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
      end
    end
    r33_454:Dropdown("Sol\'s RNG", "Credits to Owner", {
      "HoHo Hub",
      "Legend Handless Hub",
      "Sol\'s RNG",
      "Sol\'s RNG Panel"
    }, function(r0_928)
      -- line: [0, 0] id: 928
      r80_454 = r0_928
      SolsOption()
    end)
    local r81_454 = nil
    function SonicSpeed()
      -- line: [0, 0] id: 745
      return r81_454
    end
    function SonicOption()
      -- line: [0, 0] id: 575
      if SonicSpeedSimulator() == "Cheater Soul" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luciquad/credit/main/sonicspeedsimulator.lua"))()
      elseif SonicSpeedSimulator() == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      elseif SonicSpeedSimulator() == "Skays" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SkaysGG-2095"))()
      elseif SonicSpeedSimulator() == "Sonic Speed Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kkeyy-hash/roblox/main/SonicSpeedSimulator2.lua"))()
      end
    end
    r33_454:Dropdown("Sonic Speed Simulator", "Credits to Owner", {
      "Cheater Soul",
      "Master Hub",
      "Skays",
      "Sonic Speed Simulator"
    }, function(r0_651)
      -- line: [0, 0] id: 651
      r81_454 = r0_651
      SonicOption()
    end)
    local r82_454 = nil
    function TheStrong()
      -- line: [0, 0] id: 546
      return r82_454
    end
    function TheOption()
      -- line: [0, 0] id: 532
      if TheStrongest() == "Hawk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHanki/Hawk/main/Loader", true))()
      elseif TheStrongest() == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader", true))()
      elseif TheStrongest() == "Nicuse Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
      elseif TheStrongest() == "LOLking123456" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/battleground1/main/Saitama41"))()
      elseif TheStrongest() == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/saitama"))()
      end
    end
    r33_454:Dropdown("The Strongest Battlegrounds", "Credits to Owner", {
      "Hawk Hub",
      "Nex Hub",
      "Nicuse Hub",
      "LOLking123456",
      "Xtrey10x Hub"
    }, function(r0_563)
      -- line: [0, 0] id: 563
      r82_454 = r0_563
      TheOption()
    end)
    local r83_454 = nil
    function TowerOf()
      -- line: [0, 0] id: 985
      return r83_454
    end
    function TowerOption()
      -- line: [0, 0] id: 967
      if TowerOfHell() == "Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TwomadJR/nto/main/admiin"))()
      elseif TowerOfHell() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_967 = loadstring
        local r1_967 = request
        if not r1_967 then
          r1_967 = http_request
          if not r1_967 then
            r1_967 = http
            if r1_967 then
              r1_967 = http.request or syn and syn.request
            else
              goto label_33	-- block#7 is visited secondly
            end
          end
        end
        local r3_967 = tostring
        local r4_967 = "https://api.eclipsehub.xyz/auth"
        assert(r0_967 and r1_967, "Executor not Supported")
        r0_967(r1_967({
          Url = r4_967 .. "?key=" .. r3_967(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif TowerOfHell() == "Floater Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iiProductionz/Floater-Scripts/main/WaifuEdition/Tower%20Of%20Hell"))()
      elseif TowerOfHell() == "Garfield Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
      elseif TowerOfHell() == "LighTux" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif TowerOfHell() == "Tower Of Hell Gui" then
        loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/85f97364b6367baac677e109488c9905/raw/c2972a2b892c4193509ddb2fe1ba3061435e1a8a/gistfile1.txt"))()
      elseif TowerOfHell() == "Tower Of Hell Gui by:The Mystery O_O" then
        loadstring(game:HttpGet("https://pastebin.com/raw/BbVHjH56"))()
      end
    end
    r33_454:Dropdown("Tower Of Hell", "Credits to Owner", {
      "Admin",
      "Eclipse Hub",
      "Floater Scripts",
      "Garfield Hub",
      "LighTux",
      "Tower Of Hell Gui",
      "Tower Of Hell Gui by:The Mystery O_O"
    }, function(r0_639)
      -- line: [0, 0] id: 639
      r83_454 = r0_639
      TowerOption()
    end)
    local r84_454 = nil
    function UnderGround()
      -- line: [0, 0] id: 607
      return r84_454
    end
    function UnderOption()
      -- line: [0, 0] id: 956
      if UnderGroundWar() == "Multi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jj123llol/multi-hub/main/Multi", true))()
      elseif UnderGroundWar() == "Unique Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jynzl/UniqueHub/main/UniqueHubv2Intro", true))()
      elseif UnderGroundWar() == "UnderGround War Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iuqYjEAX"))()
      elseif UnderGroundWar() == "UnderGround War 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War%203"))()
      end
    end
    r33_454:Dropdown("UnderGround War", "Credits to Owner", {
      "Multi Hub",
      "Unique Hub",
      "UnderGround War Gui",
      "UnderGround War 1"
    }, function(r0_784)
      -- line: [0, 0] id: 784
      r84_454 = r0_784
      UnderOption()
    end)
    local r85_454 = nil
    function Wiste()
      -- line: [0, 0] id: 695
      return r85_454
    end
    function WisOption()
      -- line: [0, 0] id: 733
      if Wisteria() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/wisteria2script"))()
      elseif Wisteria() == "Jumble Hub" then
        loadstring(game:HttpGet("https://jumblescripts.com/JumbleHub.lua"))()
      elseif Wisteria() == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/Wisteria", true))()
      end
    end
    r33_454:Dropdown("Wisteria 2", "Credits to Owner", {
      "Flare Hub",
      "Jumble Hub",
      "Kidachi Hub"
    }, function(r0_609)
      -- line: [0, 0] id: 609
      r85_454 = r0_609
      WisOption()
    end)
    local r86_454 = nil
    function YourBi()
      -- line: [0, 0] id: 815
      return r86_454
    end
    function YourOption()
      -- line: [0, 0] id: 861
      if YourBizarre() == "CuHub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ItachiPvPUchiha/CuHub/main/yba.lua"))()
      elseif YourBizarre() == "Green Gui B-Boy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
      elseif YourBizarre() == "Gui by Death" then
        _G.Options = {
          ToggleKey = "Delete",
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGaster/Scripts/main/" .. tostring(game.PlaceId), true))()
      elseif YourBizarre() == "Midnight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheFarowHywolf/YBA-Midnight-script/master/YBA.lua"))()
      end
    end
    r33_454:Dropdown("Your Bizarre Adventure", "Credits to Owner", {
      "CuHub V3",
      "Green Gui B-Boy",
      "Gui by Death",
      "Midnight Hub"
    }, function(r0_831)
      -- line: [0, 0] id: 831
      r86_454 = r0_831
      YourOption()
    end)
    local r87_454 = nil
    function abc()
      -- line: [0, 0] id: 832
      return r87_454
    end
    function abcOption()
      -- line: [0, 0] id: 554
      if abc() == "CheatX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/3008"))()
      elseif abc() == "God Mode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CHnamedata/WhatDaHeck/main/3008GodMode.lua"))()
      elseif abc() == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_454:Dropdown("3008", "Credits to Owner", {
      "CheatX",
      "God Mode",
      "V.G Hub"
    }, function(r0_822)
      -- line: [0, 0] id: 822
      r87_454 = r0_822
      abcOption()
    end)
    r33_454:Dropdown("More Next Update", "", {
      "Next Update"
    }, function()
      -- line: [0, 0] id: 750
    end)
    local r88_454 = r10_454:Tab("Hub | Gui")
    local r89_454 = r88_454:Section("Executor")
    local r92_454 = "Textbox"
    r92_454 = "Script Executer"
    r89_454:[r92_454](r92_454, "Execute Scripts", function(r0_894)
      -- line: [0, 0] id: 894
      loadstring(r0_894)()
    end)
    r89_454:Button("Arceus X v3", "Credits to Owner", function()
      -- line: [0, 0] id: 709
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end)
    r89_454:Button("Fluxus Coral", "Credits to Owner", function()
      -- line: [0, 0] id: 774
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
    end)
    r89_454:Button("Delta Fan Made", "Credits to Owner", function()
      -- line: [0, 0] id: 491
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Delta-Executor-J-O-K-E-7664"))()
    end)
    r89_454:Button("Krnl Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 599
      loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
    end)
    r89_454:Button("Synapse X Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 665
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
    end)
    r89_454:Button("NotePad", "Credits to Owner", function()
      -- line: [0, 0] id: 691
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAScripts/Favorable/main/NotePad.lua"))()
    end)
    r89_454:Button("NoCom Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 748
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/NoCom-Executor/main/NoCom"))()
    end)
    r89_454:Button("Executor Gui By AZY#0348", "Credits to Owner", function()
      -- line: [0, 0] id: 776
      loadstring(game:HttpGet("https://pastebin.com/raw/yGxeT8zC", true))()
    end)
    r89_454:Button("Shadow X Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1014
      loadstring(game:HttpGet("https://pastebin.com/raw/1fAnGAA0"))()
    end)
    r89_454:Button("Neptune Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 681
      loadstring(game:HttpGet("https://pastebin.com/raw/y3jhxS5r"))()
    end)
    r89_454:Button("ECCS•AI Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 662
      loadstring(game:HttpGet("https://pastebin.com/raw/7nAMYduv"))("Copyright ERROR_CODE ECCS Co")
    end)
    r89_454:Button("ECCS•ID Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 739
      loadstring(game:HttpGet("https://pastebin.com/raw/hFkBRgxb"))("Copyright ERROR_CODE ECCS Co")
    end)
    r89_454:Button("NewExec V1", "Credits to Owner", function()
      -- line: [0, 0] id: 595
      loadstring(game:HttpGet("https://pastebin.com/raw/6sp92FDj", true))()
    end)
    r89_454:Button("Bad Ware", "Credits to Owner", function()
      -- line: [0, 0] id: 929
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sluucker/badware/main/loader", true))()
    end)
    r89_454:Button("Stigma", "Credits to Owner", function()
      -- line: [0, 0] id: 556
      loadstring(game:HttpGet("https://pastebin.com/raw/mG8XGpmD", true))()
    end)
    r89_454:Button("Luigi Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 883
      loadstring(game:HttpGet("https://pastebin.com/raw/UaTjPQMP"))()
    end)
    r89_454:Button("Rc7 Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 467
      loadstring(game:HttpGet("https://gist.githubusercontent.com/jointeamck/40a11b97bfb6881a72dba218cce85e2a/raw/02ca8af7ef7904182abd4208064d9a22df0010b5/rc7"))()
    end)
    r89_454:Button("ShitSploit", "Credits to Owner", function()
      -- line: [0, 0] id: 484
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shitsploit-9386"))()
    end)
    r89_454:Button("Mario", "Credits to Owner", function()
      -- line: [0, 0] id: 477
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-by-c00lkidd-9388"))()
    end)
    r89_454:Button("Mario Premium", "Credits to Owner", function()
      -- line: [0, 0] id: 789
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-premium-9389"))()
    end)
    r89_454:Button("Sexy Hamood (Premium)", "Credits to Owner", function()
      -- line: [0, 0] id: 698
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hamoot-script-9408"))()
    end)
    r89_454:Button("C00lsploit Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 881
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lsploit-9391"))()
    end)
    r89_454:Button("Serverside executor gui", "Credits to Owner", function()
      -- line: [0, 0] id: 986
      loadstring(game:HttpGet("https://pastebin.com/raw/PXAdj6ED"))()
    end)
    local r90_454 = r88_454:Section("Admin")
    r90_454:Button("Infinite Yield", "Infinite Yield Script", function()
      -- line: [0, 0] id: 526
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    r90_454:Button("Iv Admin", "Infinite Yield Script", function()
      -- line: [0, 0] id: 988
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodyBurns/Hex/main/Iv%20Admin%20v3.lua"))()
    end)
    r90_454:Button("Cmd-X", "Credits to Owner", function()
      -- line: [0, 0] id: 593
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
    r90_454:Button("Fates Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 960
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end)
    r90_454:Button("GrimEx Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 559
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JoeScriptHub/GrimEx-Admin/main/GrimEx%20Admin"))()
    end)
    r90_454:Button("Gx Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 597
      loadstring(game:HttpGet("https://pastebin.com/raw/v6E9BmFK", true))()
    end)
    r90_454:Button("Leg Admin v2", "Credits to Owner", function()
      -- line: [0, 0] id: 540
      loadstring(game:HttpGet("https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua"))()
    end)
    r90_454:Button("Nameless Admin | Working", "Credits to Owner", function()
      -- line: [0, 0] id: 622
      loadstring(game:HttpGet("https://gist.github.com/inuk84/ca841931f45f242c945405298b26bd71/raw/af364e5d4ea5b0d2eac404a5376d83c84a23cbe4/na.lua"))()
    end)
    r90_454:Button("Nameless Admin | Discontinued", "Credits to Owner", function()
      -- line: [0, 0] id: 782
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end)
    r90_454:Button("Admin Script", "Credits to Owner", function()
      -- line: [0, 0] id: 677
      loadstring("loadstring(game:HttpGet((\'https://pastefy.ga/fGYa4i7t/raw\'),true))()\n")()
    end)
    r90_454:Button("Reviz Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 523
      loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
    end)
    r90_454:Button("Simple Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 779
      loadstring(game:HttpGet("https://pastebin.com/raw/3hDQcTaD"))()
    end)
    r90_454:Button("Property Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 866
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Copinface/MainSource/main/PropertyAdmin"))()
    end)
    r90_454:Button("Vortex Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 489
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/Fe-Vortex-admin-V2/main/VortexCompany/C4/Discord.lua"))()
    end)
    local r91_454 = r88_454:Section("Best Gui Script")
    r91_454:Button("Script Searcher", "Credits to Owner", function()
      -- line: [0, 0] id: 821
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end)
    r91_454:Button("ECCS•Searcher", "Credits to Owner", function()
      -- line: [0, 0] id: 760
      loadstring(game:HttpGet("https://pastebin.com/raw/zhQ9gfJm"))("Copyright ERROR_CODE ECCS Co")
    end)
    r91_454:Button("Games Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 690
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    end)
    r91_454:Button("Vex Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 511
      loadstring(game:HttpGet("https://raw.githubusercontent.com/V31nc/On-Discord/Created/VexHub"))()
    end)
    r91_454:Button("Sirius Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 672
      loadstring(game:HttpGet("https://sirius.menu/script"))()
    end)
    r91_454:Button("Moon Ui", "Credits to Owner", function()
      -- line: [0, 0] id: 997
      loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
    end)
    r91_454:Button("HarshTech v7.6", "Credits to Owner", function()
      -- line: [0, 0] id: 792
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/Loadstring/main/HarshTechV7.6-Pc-Or-Mobile.lua"))()
    end)
    r91_454:Button("Multi Scripter X", "Credits to Owner", function()
      -- line: [0, 0] id: 601
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader"))()
    end)
    r91_454:Button("Mocha Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 842
      loadstring(game:HttpGet("https://pastebin.com/raw/0MriWAjK"))()
    end)
    r91_454:Button("Fathom Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 879
      loadstring(game:HttpGet("https://pastebin.com/raw/Y4AGJALY"))()
    end)
    r91_454:Button("Gigachad Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1010
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua", true))()
    end)
    r91_454:Button("Astrolynx", "Credits to Owner", function()
      -- line: [0, 0] id: 631
      loadstring(game:HttpGet("https://freenote.biz/raw/vBfN3NeVYN", true))()
    end)
    r91_454:Button("Alysse", "Credits to Owner", function()
      -- line: [0, 0] id: 625
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/loader.lua"))()
    end)
    r91_454:Button("GHub", "Credits to Owner", function()
      -- line: [0, 0] id: 703
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/GHUBV13S/main/GHUBv13S.txt"))()
    end)
    r91_454:Button("British Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 557
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat7888/BH/main/Protected_6274400031599569.lua%20(1).txt"))()
    end)
    r92_454 = r88_454:Section("Good Gui Script")
    r92_454:Button("123 Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 700
      loadstring(game:HttpGet("https://pastebin.com/raw/qCBVxR3e", true))()
    end)
    r92_454:Button("Acrylix v2.0", "Credits to Owner", function()
      -- line: [0, 0] id: 573
      loadstring(game:HttpGet("https://raw.githubusercontent.com/HubbyScripts/FE-Trolling-Hub/main/source"))()
    end)
    r92_454:Button("ADSKer Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 913
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ADSKerHub/main/ADSKExe"))()
    end)
    r92_454:Button("Alex Universal", "Credits to Owner", function()
      -- line: [0, 0] id: 1006
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexScripts1/AlexUniversalV4/main/Release"))()
    end)
    r92_454:Button("All Obby Bido Skins", "Credits to Owner", function()
      -- line: [0, 0] id: 501
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/All%20obby%20Bido%20Skins%20V1.0"))()
    end)
    r92_454:Button("All Tycoons v3", "Credits to Owner", function()
      -- line: [0, 0] id: 525
      loadstring(game:HttpGet("https://freenote.biz/raw/SkG1nrBqE8", true))()
    end)
    r92_454:Button("Aloneo Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 797
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YogaProjectRblx/AloneUniversal/main/README.md"))()
    end)
    r92_454:Button("Artillery Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 630
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LynchHHU/ArtilleryHub/main/GameHub/LynchYT"))()
    end)
    r92_454:Button("Astral Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1002
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua", true))()
    end)
    r92_454:Button("Astrava", "Credits to Owner", function()
      -- line: [0, 0] id: 522
      loadstring(game:GetObjects("rbxassetid://1468845733")[1].Source)()
    end)
    r92_454:Button("Auratus X", "Credits to Owner", function()
      -- line: [0, 0] id: 735
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RealMrQuacks/AuratusX/master/Load"))()
    end)
    r92_454:Button("Autput", "Credits to Owner", function()
      -- line: [0, 0] id: 494
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Autput/main/Autputus"))()
    end)
    r92_454:Button("Bendy And Ink Machine", "Credits to Owner", function()
      -- line: [0, 0] id: 612
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
    end)
    r92_454:Button("B Genesis", "Credits to Owner", function()
      -- line: [0, 0] id: 594
      loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis"))()
    end)
    r92_454:Button("Bido Skins v1.9", "Credits to Owner", function()
      -- line: [0, 0] id: 486
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9"))()
    end)
    r92_454:Button("British Hub Pvp", "Credits to Owner", function()
      -- line: [0, 0] id: 521
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat33/Britishhub/main/Protected_4290863539999994.lua.txt"))()
    end)
    r92_454:Button("Butif Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 551
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/Butif%20Hub"))()
    end)
    r92_454:Button("Chaddest Cat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 647
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Yopapa699/Key-System/main/Loader.lua"))()
    end)
    r92_454:Button("Chat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 726
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20Chat%20Hub"))()
    end)
    r92_454:Button("Chiezzy Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 529
      loadstring(game:HttpGet("https://raw.githubusercontent.com/chiepz/aslbnmnkhby7e/main/crqhryvjahdjwysrnegsf%5Csgd"))()
    end)
    r92_454:Button("Comsal Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 619
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Comsal-Hub/main/main"))()
    end)
    r92_454:Button("Coolgui", "Credits to Owner", function()
      -- line: [0, 0] id: 544
      loadstring(game:GetObjects("rbxassetid://9827584846")[1].Source)()
    end)
    r92_454:Button("Cosmos Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 515
      loadstring(game:HttpGet("https://pastebin.com/raw/tFivBbmb"))()
    end)
    r92_454:Button("Davi Hub v1", "Credits to Owner", function()
      -- line: [0, 0] id: 860
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua", true))()
    end)
    r92_454:Button("Davi Hub v2", "Credits to Owner", function()
      -- line: [0, 0] id: 518
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/DaviguiV2prealphaloader.lua", true))()
    end)
    r92_454:Button("Davi Hub v2.3", "Credits to Owner", function()
      -- line: [0, 0] id: 843
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davi-hub-V2.3/main/davi.lua", true))()
    end)
    r92_454:Button("Delux Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 500
      loadstring(game:HttpGet("https://raw.githubusercontent.com/UniversalXploits/f/master/DeluxHub.txt", true))()
    end)
    r92_454:Button("Dynamic Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 724
      loadstring(game:HttpGet("https://pastebin.com/raw/bzySVjhX"))()
    end)
    r92_454:Button("ECCS•GearGiver", "Credits to Owner", function()
      -- line: [0, 0] id: 558
      loadstring(game:HttpGet("https://pastebin.com/raw/Dhgnt7hi"))("Copyright ERROR_CODE ECCS Co")
    end)
    r92_454:Button("Eminence Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 995
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ChainGotStucked/a55af82d82574/main/Eminence%20Hub%20V1.6"))()
    end)
    r92_454:Button("Equinox Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 697
      loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
    end)
    r92_454:Button("Executor Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 938
      loadstring(game:HttpGet("https://pastebin.com/raw/WxS2CFBX"))()
    end)
    r92_454:Button("Exploitz Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 867
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBloxYT/ExploitzHub-Games.lua/main/ExploitzHub%20Universal%20(v.3.0%20.)"))()
      setclipboard("ia3i38")
    end)
    r92_454:Button("Extreme Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 693
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/Exhub/main/Key.lua", true))()
    end)
    r92_454:Button("Ez Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 820
      loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
    end)
    r92_454:Button("F3x Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 499
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/f3xhub/main/f3xhub"))()
    end)
    r92_454:Button("FeliciaXxxHub", "Credits to Owner", function()
      -- line: [0, 0] id: 980
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDMJakey/Obfc/main/Protected_7979642737588973.lua", true))()
    end)
    r92_454:Button("Feyz Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 730
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FeyzRBLX/FeyzHub/main/Feyz%20Hub%20V2"))()
    end)
    r92_454:Button("FireHubV1", "Credits to Owner", function()
      -- line: [0, 0] id: 537
      loadstring(game:HttpGet("https://pastebin.com/raw/REuMknBd", True))()
    end)
    r92_454:Button("Fun Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 602
      loadstring(game:HttpGet("https://pastebin.com/raw/3xqzxtYN"))()
    end)
    r92_454:Button("Game Hub by:tomm_xx", "Credits to Owner", function()
      -- line: [0, 0] id: 824
      loadstring(game:HttpGet("https://pastebin.com/raw/18ji1xzk"))()
    end)
    r92_454:Button("Game Hub/Script Hub By HN BLOX", "Credits to Owner", function()
      -- line: [0, 0] id: 1007
      loadstring(game:HttpGet("https://pastebin.com/raw/brWwrinf", true))()
    end)
    r92_454:Button("Ghost Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 528
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end)
    r92_454:Button("Googol", "Credits to Owner", function()
      -- line: [0, 0] id: 538
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Scripts/main/Googol", true))()
    end)
    r92_454:Button("Gravity Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 916
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XDMODZ1040/LUA-DEVSCRIPT/main/GRAVITY%20HUB"))()
    end)
    r92_454:Button("Gucci Ui", "Credits to Owner", function()
      -- line: [0, 0] id: 874
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BeStHaXYT/Gucci/main/BeStHaXYT"))()
    end)
    r92_454:Button("Gx Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 835
      loadstring(game:HttpGet("https://pastebin.com/raw/qWqrZVyt"))()
    end)
    r92_454:Button("Hat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 786
      loadstring(game:HttpGet("https://pastebin.com/raw/6tshcUd2"))()
    end)
    r92_454:Button("Harked Reborn", "Credits to Owner", function()
      -- line: [0, 0] id: 716
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
    end)
    r92_454:Button("Haxker Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1016
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/Script-Hub/Version-3.3"))()
    end)
    r92_454:Button("Holf Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1008
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r92_454:Button("Hydro Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 989
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
    end)
    r92_454:Button("Hyperlib Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 623
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"))()
    end)
    r92_454:Button("Juanko Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 585
      loadstring(game:HttpGet("https://pastebin.com/raw/d5BS5qiX"))()
    end)
    r92_454:Button("Juice Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 541
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WeAreCrews/Juice-Hub/main/Juice%20Hub"))()
    end)
    r92_454:Button("Juqua Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 802
      loadstring(game:HttpGet("https://pastebin.com/raw/GTL1CCdg"))()
    end)
    r92_454:Button("Killer Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 565
      loadstring(game:HttpGet("https://pastebin.com/raw/7MDajezY"))()
    end)
    r92_454:Button("Lego Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 981
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Lego-Hub/main/main"))()
    end)
    r92_454:Button("Legon X Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 621
      loadstring(game:HttpGet("https://pastebin.com/raw/Lmaz8vF7", true))()
    end)
    r92_454:Button("LHYT UNIVERSAL", "Credits to Owner", function()
      -- line: [0, 0] id: 788
      loadstring(game:HttpGet("https://pastefy.app/upAOsiaJ/raw", true))()
    end)
    r92_454:Button("Lightning Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 803
      loadstring(game:HttpGet("https://pastebin.com/raw/CSC0Ky7Z", true))()
    end)
    r92_454:Button("Lightzone v2", "Credits to Owner", function()
      -- line: [0, 0] id: 907
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Idjrf5/main/Protected_3590052699937668.lua.txt"))()
    end)
    r92_454:Button("Link To Loadstring", "Credits to Owner", function()
      -- line: [0, 0] id: 702
      loadstring(game:HttpGet("https://pastebin.com/raw/tsYdcZPJ"))()
    end)
    r92_454:Button("LittHub", "Credits to Owner", function()
      -- line: [0, 0] id: 737
      loadstring(game:HttpGet("https://pastebin.com/raw/v4nf9WVz"))()
    end)
    r92_454:Button("Lollypop Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 969
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rrixh/lollypop-hub/main/v6.5%40lulaslollipop", true))()
    end)
    r92_454:Button("MegaHub", "Credits To Owner ", function()
      -- line: [0, 0] id: 603
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WholeF00ds/Mega/main/Obfuscated%20Loader", true))()
    end)
    r92_454:Button("Mini Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 710
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB", true))()
    end)
    r92_454:Button("Mil Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 870
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/MilHub/main/V3"))()
    end)
    r92_454:Button("Music Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 798
      loadstring(game:HttpGet("https://pastebin.com/raw/UmuK3sGL"))()
    end)
    r92_454:Button("Multi Hub v3", "Credits to Owner", function()
      -- line: [0, 0] id: 823
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/Multi-Hub-V3/main/Multi%20Hub%20V3"))()
    end)
    r92_454:Button("Multi Script Hub X", "Credits to Owner", function()
      -- line: [0, 0] id: 457
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0n1kidd/Multi-Script-Hub-X/main/Protected.lua_1.txt"))()
    end)
    r92_454:Button("NukeVsCity", "Credits to Owner", function()
      -- line: [0, 0] id: 1011
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))()
    end)
    r92_454:Button("OpFinality", "Credits to Owner", function()
      -- line: [0, 0] id: 987
      loadstring(game:HttpGet("https://pastebin.com/raw/3axt0ia1"))()
    end)
    r92_454:Button("Orange X", "Credits to Owner", function()
      -- line: [0, 0] id: 490
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Ab2rW/main/ORANGEX%20V5%20RELEASED%20ORANGEX%20ON%20TOP%20.txt"))()
    end)
    r92_454:Button("Orca", "Credits to Owner", function()
      -- line: [0, 0] id: 767
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end)
    r92_454:Button("Pirutun Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 549
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Catserverrr/pirutunHubRbx/main/Protected_2932223426116900.lua.txt"))()
    end)
    r92_454:Button("Pissware", "Credits To Owner", function()
      -- line: [0, 0] id: 887
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/Pissware/main/Main/MobileMain.lua"))()
    end)
    r92_454:Button("PritishHub V1", "Credits To Owner", function()
      -- line: [0, 0] id: 930
      loadstring(game:HttpGet("https://cdn.discordapp.com/attachments/996659065096765502/996659173213343804/out.lua", true))()
    end)
    r92_454:Button("Psy Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 810
      loadstring(game:HttpGet("https://pastebin.com/raw/SCwrB1ws"))()
    end)
    r92_454:Button("Rambo Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 931
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Anaszaxo555/Rambo-hub-1.6/main/Rambo%20hub%201.6"))()
    end)
    r92_454:Button("Rayfield Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 903
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Essinity/Rayfield-Hub/main/Script", true))()
    end)
    r92_454:Button("Rebranded Official Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 768
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Cerbiale/Rebranded/main/RebrandedHubLoader.lua"))()
    end)
    r92_454:Button("Red Coat", "Credits to Owner", function()
      -- line: [0, 0] id: 895
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/RedCoat8102-obfuscated.lua"))()
    end)
    r92_454:Button("RemX", "Credits to Owner", function()
      -- line: [0, 0] id: 629
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Henry887/RemX-Script-Hub/main/main.lua", true))()
    end)
    r92_454:Button("ReVP Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 898
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/Protected%20"))()
    end)
    r92_454:Button("Rose Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 519
      loadstring(game:HttpGet("https://pastebin.com/raw/9q2nraUs", true))()
    end)
    r92_454:Button("Rolf Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 975
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r92_454:Button("Salakitos Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 542
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAKALITOS/Salakitoshub/main/scriptSK"))()
    end)
    r92_454:Button("Scripter Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 998
      loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SCRIPTER%20HUB%20V5"))()
    end)
    r92_454:Button("Script Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 764
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
    end)
    r92_454:Button("Script Hub V2", "Credits to Owner", function()
      -- line: [0, 0] id: 510
      loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV2/main/SCRIPTHUBV2", true))()
    end)
    r92_454:Button("Secret Service Panel", "Credits to Owner", function()
      -- line: [0, 0] id: 852
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
    end)
    r92_454:Button("Shadows Scripts HUB", "Credits to Owner", function()
      -- line: [0, 0] id: 729
      loadstring(game:HttpGet("https://pastebin.com/raw/tuDMk1pr", true))()
    end)
    r92_454:Button("Shakars Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 516
      loadstring(game:HttpGet("https://raw.githubusercontent.com/shakar60/USH.P/main/rotected", true))()
    end)
    r92_454:Button("Shizzuru Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 974
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ggshizuru/myScriptHub/main/ShizzuruHub.1.lua", true))()
    end)
    r92_454:Button("Sigma Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 771
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrixCoding/SigmaHubV2/main/SigmaHubV2"))()
    end)
    r92_454:Button("Simple Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 959
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GearV4/Simple-Hub-X-Gear-SSX.lua/main/Gear%20SSX%20X%20Simple%20Hub"))()
    end)
    r92_454:Button("SlapX v1", "Credits to Owner", function()
      -- line: [0, 0] id: 555
      loadstring(r32_454:HttpGet("https://raw.githubusercontent.com/Slinzo1/Hh/main/Hh"))()
    end)
    r92_454:Button("SlapX v2", "Credits to Owner", function()
      -- line: [0, 0] id: 990
      loadstring(r32_454:HttpGet("https://raw.githubusercontent.com/Slinzo1/SlapX-v2-hub/main/SlapX%20Hub%20v2"))()
    end)
    r92_454:Button("SnapDragon", "Credits to Owner", function()
      -- line: [0, 0] id: 481
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ruszelds/Snap/main/Dragon", true))()
      setclipboard("SnapDragon")
    end)
    r92_454:Button("SoninhaHub", "Credits to Owner", function()
      -- line: [0, 0] id: 550
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SoninhaHub/Universal/main/Source.Lua"))()
    end)
    r92_454:Button("Superior Vortex", "Credits to Owner", function()
      -- line: [0, 0] id: 635
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SmartModBoy/VortexAblity/main/SV"))()
    end)
    r92_454:Button("Sushi X", "Credits to Owner", function()
      -- line: [0, 0] id: 715
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/sushi/main/X", true))()
    end)
    r92_454:Button("SH_V11", "Credits to Owner", function()
      -- line: [0, 0] id: 1000
      loadstring(game:HttpGet("https://pastebin.com/raw/J1MfBXv6", true))()
    end)
    r92_454:Button("Sxrge Script Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 456
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sxrge3k/sxrge_ssh_hub/main/sxrge_script_hub"))()
    end)
    r92_454:Button("Syntax", "Credits to Owner", function()
      -- line: [0, 0] id: 560
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Memeboiyot/SyntaxRebornOfficial/main/SyntaxReborn", true))()
    end)
    r92_454:Button("System Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 777
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AHMEDPLPL/System-hub/main/System%20hub"))()
    end)
    r92_454:Button("The Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 888
      loadstring(game:HttpGet("https://raw.githubusercontent.com/hassantheking123321/TheHub/main/The%20hub%20v3%20test"))()
    end)
    r92_454:Button("THEPERFECT", "Credits to Owner", function()
      -- line: [0, 0] id: 548
      loadstring(game:HttpGet("https://raw.githubusercontent.com/theperfectexploiter2024/THE-PERFECT-HUB-v1/main/THE%20PERFECT%20HUB%20v1.txt"))()
    end)
    r92_454:Button("Thunder Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 756
      loadstring(game:HttpGet("https://pastebin.com/raw/DFjY4nMy"))()
    end)
    r92_454:Button("Tiger X Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 979
      loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back"))()
    end)
    r92_454:Button("TOPK3K REMAKE", "Credits to Owner", function()
      -- line: [0, 0] id: 678
      loadstring(game:HttpGet("https://pastebin.com/raw/ecfcBQNr", true))()
    end)
    r92_454:Button("Universe Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 808
      loadstring(game:HttpGet("https://pastebin.com/raw/ApcKYREY", true))()
    end)
    r92_454:Button("Version Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 826
      loadstring(game:HttpGet("https://pastebin.com/raw/wKc5r6CM"))()
    end)
    r92_454:Button("VcskV Public", "Credits to Owner", function()
      -- line: [0, 0] id: 685
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Hub/main.lua", true))()
    end)
    r92_454:Button("Void Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 769
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Voidhub.lua/main/VoidHub.lua"))()
    end)
    r92_454:Button("Yarhm", "Credits to Owner", function()
      -- line: [0, 0] id: 547
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm-dev.lua"))()
    end)
    r92_454:Button("YourMom", "Credits to Owner", function()
      -- line: [0, 0] id: 517
      loadstring(game:GetObjects("rbxassetid://289110135")[1].Source)()
    end)
    r92_454:Button("YT Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 859
      loadstring(game:HttpGet("https://raw.githubusercontent.com/OWJBWKQLAISH/Yt-Hub/main/YouTuber%20Hub"))()
    end)
    r92_454:Button("Zars Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 858
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BumbleBeeSaga/BumbleBeeSaga/main/ZarsGUI1.0", true))()
    end)
    r92_454:Button("Zaza Sploit", "Credits to Owner", function()
      -- line: [0, 0] id: 880
      loadstring(game:HttpGet("https://pastebin.com/raw/DE8Ltg6j"))()
    end)
    r92_454:Button("Zxykerz Devil\'s Hub v2", "Credits to Owner", function()
      -- line: [0, 0] id: 943
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ZxkGamingOfficial/Zxykerz-Devil-s-Hub-V2-New/main/Zxykerz%20Devil\'s%20Hub%20V2"))()
    end)
    local r93_454 = r88_454:Section("Other Gui Script")
    r93_454:Button("Hitbox Expander", "Credits to Owner", function()
      -- line: [0, 0] id: 949
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end)
    r93_454:Button("Hitbox Expander | CheatX", "Credits to Owner", function()
      -- line: [0, 0] id: 811
      loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/shit%20script%20pack/CheatX"))()
    end)
    r93_454:Button("Chat Filter Bypass", "Bypass Chat Filter", function()
      -- line: [0, 0] id: 482
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRobloxSS/zetra/main/ZetPanel", true))()
    end)
    r93_454:Button("Reach Gui v3", "Bypass Chat Filter", function()
      -- line: [0, 0] id: 1013
      loadstring(game:HttpGet("https://pastebin.com/raw/iKn1rhZv"))()
    end)
    r93_454:Button("Ultimate Trolling Gui v1.5", "Credits to Owner", function()
      -- line: [0, 0] id: 923
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/9abbc0733af7c9113a5ecbaf4bb2ed5013a4e693/Ultimate%20Trolling%20GUI%20v1.5"))()
    end)
    r93_454:Button("Ultimate Trolling Gui v2", "Credits to Owner", function()
      -- line: [0, 0] id: 936
      loadstring(game:HttpGet("https://github.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/raw/main/Akil\'s%20UTG%20v2.0%20full"))()
    end)
    r93_454:Button("Chanzo Trolling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 993
      loadstring(game:HttpGet("https://pastebin.com/raw/y94Ejz3B", true))()
    end)
    r93_454:Button("Chat hack Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 818
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r93_454:Button("1X1X1X1 GUI", "Credits to Owner", function()
      -- line: [0, 0] id: 699
      loadstring(game:HttpGet("https://pastebin.com/raw/CYye6uA4"))()
    end)
    r93_454:Button("c00lgui", "Credits to Owner", function()
      -- line: [0, 0] id: 574
      loadstring(game:HttpGet("https://pastebin.com/raw/HkE93XjW"))()
    end)
    r93_454:Button("c00lgui2", "Credits to Owner", function()
      -- line: [0, 0] id: 965
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
    end)
    r93_454:Button("c00lkidd2", "Credits to Owner", function()
      -- line: [0, 0] id: 878
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
    end)
    r93_454:Button("cOOlkidd Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 455
      loadstring(game:HttpGet("https://pastebin.com/raw/UPZCQ31W"))()
    end)
    r93_454:Button("K00pgui", "Credits to Owner", function()
      -- line: [0, 0] id: 498
      loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/K00pgui/a50a7131568adf4337053c428733c2eaf308ac6a/K00pgui"))()
    end)
    local r94_454 = r10_454:Tab("Fe")
    local r95_454 = r94_454:Section("Fe Gui")
    r95_454:Button("B4krs Chat Bypasser", "Credits to Owner", function()
      -- line: [0, 0] id: 791
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/v4lsB4krscbR/main/Loadstring%20version%20chat%20bypasser"))()
    end)
    r95_454:Button("Comet", "Credits to Owner", function()
      -- line: [0, 0] id: 624
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/Comet"))()
    end)
    r95_454:Button("Epix\'s Fe Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1001
      loadstring(game:HttpGet("https://pastebin.com/raw/jMAwjKcb"))()
    end)
    r95_454:Button("Energize [R6]", "Credits to Owner", function()
      -- line: [0, 0] id: 688
      loadstring(game:HttpGet("https://pastebin.com/raw/1p6xnBNf", true))()
    end)
    r95_454:Button("Fex", "Credits to Owner", function()
      -- line: [0, 0] id: 736
      loadstring(game:HttpGet("https://pastebin.com/raw/ES6xMCn7", true))()
    end)
    r95_454:Button("Free Gamepasses Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 948
      loadstring(game:HttpGet("https://pastebin.com/raw/QtQ4YnVR"))()
    end)
    r95_454:Button("Free Gamepass Gui(dark modz)", "Credits to Owner", function()
      -- line: [0, 0] id: 705
      loadstring(game:HttpGet("https://pastebin.com/raw/53yY1S39"))()
    end)
    r95_454:Button("Nulware v3", "Credits to Owner", function()
      -- line: [0, 0] id: 711
      local r0_711 = game:GetService("Players").LocalPlayer
      game:GetService("RunService").Heartbeat:Connect(function()
        -- line: [0, 0] id: 712
        r0_711.MaximumSimulationRadius = math.huge
        sethiddenproperty(r0_711, "SimulationRadius", math.huge)
      end)
      getgenv().Theme = "Blue"
      loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn?identifier=" .. (function()
        -- line: [0, 0] id: 713
        -- notice: unreachable block#8
        local r0_713 = ""
        for r4_713 = 1, 256, 1 do
          local r5_713 = math.random(1, 3)
          local r6_713 = r0_713
          local r7_713 = string.char
          local r8_713 = nil	-- notice: implicit variable refs by block#[9]
          if r5_713 == 1 then
            r8_713 = math.random(48, 57)
            if not r8_713 then
              ::label_22::
              if r5_713 == 2 then
                r8_713 = math.random(97, 122)
                if not r8_713 then
                  ::label_31::
                  if r5_713 == 3 then
                    r8_713 = math.random(65, 90)
                  else
                    r8_713 = false
                  end
                end
              else
                goto label_31	-- block#5 is visited secondly
              end
            end
          else
            goto label_22	-- block#3 is visited secondly
          end
          r0_713 = r6_713 .. r7_713(r8_713)
        end
        return r0_713
      end)()))()
    end)
    r95_454:Button("Player Orbit", "Credits to Owner", function()
      -- line: [0, 0] id: 996
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
    end)
    r95_454:Button("Tool Giver", "Credits to Owner", function()
      -- line: [0, 0] id: 927
      loadstring(game:HttpGet("https://pastebin.com/raw/Ctqjmtkv", true))()
    end)
    r95_454:Button("Troll GUI", "Credits to Owner", function()
      -- line: [0, 0] id: 796
      loadstring(game:HttpGet("https://pastebin.com/raw/nwGzXh1V", true))()
    end)
    r95_454:Button("Trolling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 837
      loadstring(game:HttpGet("https://pastefy.app/ic5m4aJG/raw", true))()
    end)
    r95_454:Button("Xuctry FE Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 919
      loadstring(game:HttpGet("https://pastebin.com/raw/Zz4YDvLb", true))()
    end)
    local r96_454 = r94_454:Section("Fe Script")
    r96_454:Button("Fe Anti Afk", "Credits to Owner", function()
      -- line: [0, 0] id: 765
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Huubb/main/Mobile%20Scripting"))()
    end)
    r96_454:Button("Fe Anti Fall", "Credits To Owner", function()
      -- line: [0, 0] id: 652
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/AntiFall/main/Script"))()
    end)
    r96_454:Button("Fe Chat Bypasser", "Credits to Owner", function()
      -- line: [0, 0] id: 758
      loadstring(game:HttpGet("https://raw.githubusercontent.com/bedra45/chetbypasser/main/chetbypass"))()
    end)
    r96_454:Button("Fe Chat Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 877
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor", true))()
    end)
    r96_454:Button("Fe Chat Hack", "Credits To Owner", function()
      -- line: [0, 0] id: 653
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r96_454:Button("Fe Chat Hax", "Credits to Owner", function()
      -- line: [0, 0] id: 953
      loadstring(game:HttpGet("https://pastebin.com/raw/XFdQEjzx", true))()
    end)
    r96_454:Button("Fe Clone", "Credits to Owner", function()
      -- line: [0, 0] id: 566
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end)
    r96_454:Button("Fe Collision", "Credits to Owner", function()
      -- line: [0, 0] id: 827
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt", true))()
    end)
    r96_454:Button("Fe Control Npc", "Credits to Owner", function()
      -- line: [0, 0] id: 968
      loadstring(game:HttpGet("https://pastefy.app/x8nWWq0M/raw", true))()
    end)
    r96_454:Button("Fe Crawl Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 740
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))()
    end)
    r96_454:Button("Fe Death Note", "Credits to Owner", function()
      -- line: [0, 0] id: 743
      loadstring(game:HttpGet("https://pastefy.app/GoKxYBkU/raw", true))()
    end)
    r96_454:Button("Fe Dino Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 732
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_K2n31uc6t2wY5A8786eR4K15sgbUF0vdQ80a0LzgvLRkSNYd89H1AS3124gMR6SM.lua.txt", true))()
    end)
    r96_454:Button("Fe Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 527
      loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end)
    r96_454:Button("Fe Fling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 991
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/Fe-Fling-GUI-For-roblox/main/Main.lua", true))()
    end)
    r96_454:Button("Fe Flinger By GGH52Lan", "Credits to Owner", function()
      -- line: [0, 0] id: 924
      loadstring(game:HttpGet("https://pastebin.com/raw/xu3C3TSU"))()
    end)
    r96_454:Button("Fe Free Gamepass Tools Giver(Obby Only)", "Credits to Owner", function()
      -- line: [0, 0] id: 553
      for r3_553, r4_553 in pairs(game:GetDescendants()) do
        if r4_553.ClassName == "RemoteEvent" and (r4_553.Parent.Name == "WeaponsRemotes" or r4_553.Parent.Name == "VipRemotes" or r4_553.Parent.Name == "Remotes") then
          r4_553:FireServer()
        end
      end
    end)
    r96_454:Button("Fe Freeze", "Credits to Owner", function()
      -- line: [0, 0] id: 657
      loadstring(game:HttpGet("https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source"))()
    end)
    r96_454:Button("Fe Gamepass Tool Giver v4", "Credits to Owner", function()
      -- line: [0, 0] id: 912
      loadstring(game:HttpGet("https://pastefy.app/VYIAk3o1/raw", true))()
    end)
    r96_454:Button("Fe Ghost", "Credits to Owner", function()
      -- line: [0, 0] id: 738
      loadstring(game:HttpGet("https://pastebin.com/raw/uUtRsAX5"))()
    end)
    r96_454:Button("Fe God Mode | Obby", "Credits to Owner", function()
      -- line: [0, 0] id: 616
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main", true))()
    end)
    r96_454:Button("Fe Grab Parts", "Credits to Owner", function()
      -- line: [0, 0] id: 476
      loadstring(game:HttpGet("https://pastefy.app/BbXuvVkK/raw", true))()
    end)
    r96_454:Button("Fe Hat Spin", "Credits to Owner", function()
      -- line: [0, 0] id: 994
      loadstring(game:HttpGet("https://pastebin.com/raw/32PbiWw1", true))()
    end)
    r96_454:Button("Fe Invisible Boat", "Credits to Owner", function()
      -- line: [0, 0] id: 725
      loadstring(game:HttpGet("https://pastefy.app/0CS5vmly/raw", true))()
    end)
    r96_454:Button("Fe Ink Monster", "Credits to Owner", function()
      -- line: [0, 0] id: 992
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_f4i3ntKS5B8tK9zpCAnr31Dp7RNSYOo20gpln1fs1h2U4yjXNdNk6lFqZvN1Ft2p.lua.txt"))()
    end)
    r96_454:Button("Fe Invisible Script", "Credits to Owner", function()
      -- line: [0, 0] id: 505
      loadstring(game:HttpGet("https://pastebin.com/raw/HrbT6bNK", true))()
    end)
    r96_454:Button("Fe Invisibility Tool", "Credits to Owner", function()
      -- line: [0, 0] id: 939
      loadstring(game:HttpGet("https://pastebin.com/raw/bdBWidBC"))()
    end)
    r96_454:Button("Fe Lag Switch", "Credits to Owner", function()
      -- line: [0, 0] id: 728
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt", true))()
    end)
    r96_454:Button("Fe Lift Player Up", "Credits to Owner", function()
      -- line: [0, 0] id: 506
      player = game:GetService("Players").LocalPlayer
      mouse = player:GetMouse()
      camera = workspace.CurrentCamera
      ts = game:GetService("TweenService")
      function createtween(r0_507, r1_507, r2_507)
        -- line: [0, 0] id: 507
        tween = ts:Create(r0_507, TweenInfo.new(r2_507), {
          CFrame = r1_507,
        })
        tween:Play()
        tween.Completed:Wait()
      end
      outline = Instance.new("Highlight")
      target = nil
      mouse.Button1Up:Connect(function()
        -- line: [0, 0] id: 509
        if mouse.Target then
          local r0_509 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_509 and r0_509:FindFirstChild("Humanoid") then
            camera.CameraSubject = r0_509.Humanoid
            target = r0_509
          else
            outline.Parent = nil
          end
        end
      end)
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 508
        if player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
          if target and target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.CFrame.Y + 20 < player.Character.HumanoidRootPart.CFrame.Y then
            tween:Cancel()
          end
        end
        if mouse.Target then
          local r0_508 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_508 and r0_508:FindFirstChild("Humanoid") then
            outline.Parent = r0_508
          else
            outline.Parent = nil
          end
        end
      end)
      while task.wait() do
        local r0_506 = target
        if r0_506 ~= nil then
          r0_506 = target:FindFirstAncestorOfClass("Workspace")
          if r0_506 then
            r0_506 = target
            if r0_506 ~= player.Character then
              r0_506 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_506 then
                r0_506 = target:FindFirstChild("HumanoidRootPart")
                if r0_506 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  r0_506 = hrp
                  r0_506.CFrame = thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * -10
                end
              end
            end
          end
        end
        r0_506 = target
        if r0_506 ~= nil then
          r0_506 = target:FindFirstAncestorOfClass("Workspace")
          if r0_506 then
            r0_506 = target
            if r0_506 ~= player.Character then
              r0_506 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_506 then
                r0_506 = target:FindFirstChild("HumanoidRootPart")
                if r0_506 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  rot = thrp.CFrame * CFrame.Angles(math.rad(25), math.rad(25), math.rad(25))
                  createtween(hrp, thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * 1000000, 100000)
                end
              end
            end
          end
        end
      end
    end)
    r96_454:Button("Fe Parts Mover", "Credits to Owner", function()
      -- line: [0, 0] id: 569
      loadstring(game:HttpGet("https://pastefy.app/Vcuyg09O/raw", true))()
    end)
    r96_454:Button("Fe Punch", "Credits to Owner", function()
      -- line: [0, 0] id: 627
      loadstring(game:HttpGet("https://pastefy.ga/GvnHVjT5/raw", true))()
    end)
    r96_454:Button("Fe R15 to R6", "Credits to Owner", function()
      -- line: [0, 0] id: 893
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua", true))()
    end)
    r96_454:Button("Fe Roll Ball", "Credits to Owner", function()
      -- line: [0, 0] id: 1004
      loadstring(game:HttpGet("https://pastebin.com/raw/BZr9bGDy", true))()
    end)
    r96_454:Button("Fe SCP 173", "Credits to Owner", function()
      -- line: [0, 0] id: 606
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_nN0N66DHV2BjPwzYN59M17qSSlvJryM201CSC1sg07czxnZf48h9GHOFGd87G6Hh.lua.txt", true))()
    end)
    r96_454:Button("Fe Spy", "Credits to Owner", function()
      -- line: [0, 0] id: 926
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))()
    end)
    r96_454:Button("Fe Sword Kill All", "Credits to Owner", function()
      -- line: [0, 0] id: 783
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script"))()
    end)
    r96_454:Button("Fe Touch Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 596
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
    end)
    r96_454:Button("Fe Tp Place Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 503
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Tp%20Place%20GUI", true))()
    end)
    r96_454:Button("FE Yeet", "Credits to Owner", function()
      -- line: [0, 0] id: 707
      loadstring(game:HttpGet("https://pastebin.com/raw/saMtiek2", true))()
    end)
    r96_454:Button("Fe Zero Gravity Parts", "Credits to Owner", function()
      -- line: [0, 0] id: 849
      loadstring(game:HttpGet("https://pastebin.com/raw/aXgyQyKY"))()
    end)
    r96_454:Button("Fe Zombie Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 571
      loadstring(game:HttpGet("https://pastefy.app/w7KnPY70/raw", true))()
    end)
    local r97_454 = r94_454:Section("Not Sure Fe")
    r97_454:Button("Among Us", "Credits to Owner", function()
      -- line: [0, 0] id: 804
      loadstring(game:HttpGet("https://pastebin.com/raw/vNiNzr34"))()
    end)
    r97_454:Button("Backflip", "Credits to Owner", function()
      -- line: [0, 0] id: 787
      loadstring(game:HttpGet("https://pastebin.com/raw/n2gUwjc4"))()
    end)
    r97_454:Button("Bloody Knife", "Credits to Owner", function()
      -- line: [0, 0] id: 812
      loadstring(game:HttpGet("https://pastebin.com/raw/25P2tVPD"))()
    end)
    r97_454:Button("Coolkid Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 970
      loadstring(game:HttpGet("https://pastebin.com/raw/YsVaUfYQ", true))()
    end)
    r97_454:Button("Gale Fighter", "Credits to Owner", function()
      -- line: [0, 0] id: 873
      loadstring(game:HttpGet("https://pastebin.com/raw/YCH5P19e"))()
    end)
    r97_454:Button("Psychopath", "Credits to Owner", function()
      -- line: [0, 0] id: 512
      loadstring(game:HttpGet("https://pastebin.com/raw/9Lharw50"))()
    end)
    r97_454:Button("Slasher", "Credits to Owner", function()
      -- line: [0, 0] id: 910
      loadstring(game:HttpGet("https://pastebin.com/raw/sVEn1Tza"))()
    end)
    r97_454:Button("Snake", "Credits to Owner", function()
      -- line: [0, 0] id: 946
      loadstring(game:HttpGet("https://pastebin.com/raw/naRUdxrc", true))()
    end)
    r97_454:Button("Spider", "Credits to Owner", function()
      -- line: [0, 0] id: 935
      loadstring(game:HttpGet("https://pastebin.com/raw/txsk1LJg"))()
    end)
    local r98_454 = r94_454:Section("Useful")
    r98_454:Button("Animation Gui", "loads s fe gui that has different animation for you to use", function()
      -- line: [0, 0] id: 954
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end)
    r98_454:Button("Emotes Gui | Best", "loads a fe gui that has different emotes for you to use", function()
      -- line: [0, 0] id: 922
      loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()
    end)
    r98_454:Button("Emotes Gui", "loads a fe gui that has different emotes for you to use", function()
      -- line: [0, 0] id: 829
      loadstring(game:HttpGet("https://pastebin.com/raw/fitjHU5J"))()
    end)
    local r99_454 = r94_454:Section("Sus Script")
    r99_454:Button("Pendulum Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 660
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
    end)
    r99_454:Button("Sussy hub", "Credits to Owner", function()
      -- line: [0, 0] id: 717
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub"))()
    end)
    local r100_454 = r10_454:Tab("Other")
    local r101_454 = r100_454:Section("Player")
    local r102_454 = 16
    local r103_454 = false
    local r106_454 = "Textbox"
    r106_454 = "Walk Speed"
    r101_454:[r106_454](r106_454, "Set Walk Speed", function(r0_863)
      -- line: [0, 0] id: 863
      r102_454 = r0_863
      pcall(function()
        -- line: [0, 0] id: 864
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r0_863
      end)
    end)
    r101_454:Toggle("Loop Walk Speed", "If You Die The Walk Speed Won\'t Reset", function(r0_642)
      -- line: [0, 0] id: 642
      r103_454 = r0_642
      if r0_642 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 643
          if r103_454 then
            pcall(function()
              -- line: [0, 0] id: 644
              game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r102_454
            end)
          end
        end)
      end
    end)
    local r104_454 = 50
    local r105_454 = false
    local r108_454 = "Textbox"
    r108_454 = "Jump Power"
    r101_454:[r108_454](r108_454, "Set Jump Power", function(r0_957)
      -- line: [0, 0] id: 957
      r104_454 = r0_957
      pcall(function()
        -- line: [0, 0] id: 958
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r0_957
      end)
    end)
    r101_454:Toggle("Loop Jump Power", "If You Die The Jump Power Won\'t Reset", function(r0_853)
      -- line: [0, 0] id: 853
      r105_454 = r0_853
      if r0_853 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 854
          if r105_454 then
            pcall(function()
              -- line: [0, 0] id: 855
              game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r104_454
            end)
          end
        end)
      end
    end)
    r108_454 = "Textbox"
    r108_454 = "Gravity"
    r101_454:[r108_454](r108_454, "Set Gravity", function(r0_794)
      -- line: [0, 0] id: 794
      game.Workspace.Gravity = r0_794
    end)
    r108_454 = "Textbox"
    r108_454 = "Zoom Distance"
    r101_454:[r108_454](r108_454, "Set Zoom Distance", function(r0_633)
      -- line: [0, 0] id: 633
      game.Players.LocalPlayer.CameraMaxZoomDistance = r0_633
    end)
    r101_454:Button("Endless Zoom", "Make You Zoom Infinitely", function()
      -- line: [0, 0] id: 909
      local r0_909 = game.Players.LocalPlayer
      r0_909.CameraMaxZoomDistance = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      r0_909.CameraMinZoomDistance = 0
    end)
    r101_454:Button("Reset", "Reset Above", function()
      -- line: [0, 0] id: 862
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      game.Workspace.Gravity = 196.2
      game.Players.LocalPlayer.CameraMaxZoomDistance = 200
    end)
    r101_454:Toggle("Infinite Jump", "Make You Jump Unlimited", function(r0_875)
      -- line: [0, 0] id: 875
      getgenv().InfiniteJumpEnabled = r0_875
      game:GetService("UserInputService").JumpRequest:connect(function()
        -- line: [0, 0] id: 876
        if InfiniteJumpEnabled == true then
          game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
      end)
    end)
    r101_454:Toggle("Auto jump", "Jump Automatically", function(r0_833)
      -- line: [0, 0] id: 833
      J = r0_833
      spawn(function()
        -- line: [0, 0] id: 834
        while wait() do
          local r0_834 = J
          if r0_834 then
            r0_834 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            r0_834.Jump = true
          else
            break
          end
        end
      end)
    end)
    r101_454:Toggle("Fov", "Changes Fov", function(r0_718)
      -- line: [0, 0] id: 718
      if r0_718 then
        game.Workspace.CurrentCamera.FieldOfView = 120
      else
        game.Workspace.CurrentCamera.FieldOfView = 70
      end
    end)
    r101_454:Button("Reset Character", "Reset Your Character", function()
      -- line: [0, 0] id: 921
      game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)
    r101_454:Toggle("Noclip [Beta]", "A Simple Noclip Toggle", function(r0_721)
      -- line: [0, 0] id: 721
      getgenv().noclipEnabled = r0_721
      game:GetService("RunService").Stepped:connect(function()
        -- line: [0, 0] id: 722
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(noclip)
        if noclipEnabled == true then
          local r0_722 = true
          local r1_722 = game.Players.LocalPlayer
          for r6_722, r7_722 in pairs((r1_722.Character or r1_722.CharacterAdded:Wait()):GetDescendants()) do
            pcall(function()
              -- line: [0, 0] id: 723
              if r7_722:IsA("BasePart") then
                r7_722.CanCollide = false
              end
            end)
            -- close: r6_722
          end
        end
        game:GetService("RunService").Stepped:wait()
      end)
    end)
    r101_454:Button("No Clip | Press E To Use", "Use Keyboard Script On Mobile", function()
      -- line: [0, 0] id: 814
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/No%20Clip"))()
    end)
    r101_454:Button("Shift Lock", "Shift Lock Gui", function()
      -- line: [0, 0] id: 464
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Shiftlock"))()
    end)
    r101_454:Button("Console Button", "Good For Script Maker", function()
      -- line: [0, 0] id: 580
      local r0_580 = Instance.new("ScreenGui")
      r0_580.Name = "console"
      r0_580.Parent = game.CoreGui
      local r1_580 = Instance.new("TextButton")
      r1_580.Name = "button"
      r1_580.Parent = r0_580
      r1_580.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      r1_580.BackgroundTransparency = 0.5
      r1_580.Position = UDim2.new(0, 105, 0, -32)
      r1_580.Size = UDim2.new(0, 32, 0, 32)
      r1_580.Text = "< >"
      r1_580.TextColor3 = Color3.fromRGB(200, 200, 200)
      r1_580.Font = "Code"
      r1_580.TextSize = 15
      local r2_580 = Instance.new("UICorner")
      r2_580.CornerRadius = UDim.new(0, 8)
      r2_580.Parent = r1_580
      r1_580.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 581
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9", false, game)
      end)
    end)
    r101_454:Button("Fly | Pc", "Literally Fly", function()
      -- line: [0, 0] id: 964
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script"))()
    end)
    r101_454:Button("Fps Booster", "Make your game smother", function()
      -- line: [0, 0] id: 636
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/FpsBooster"))()
    end)
    r101_454:Button("Ping Counter", "Check if your wifi is good", function()
      -- line: [0, 0] id: 530
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ping"))()
    end)
    r101_454:Button("Fps Counter", "See if Your roblox is laggy", function()
      -- line: [0, 0] id: 497
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fps"))()
    end)
    r101_454:Button("Anti Afk", "Don\'t get kicked while afk", function()
      -- line: [0, 0] id: 955
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Anti-Afk-Remastered-Script-or-Diffrent-Cool-UI-2097"))()
    end)
    r101_454:Button("Anti Fling", "Player cant fling you anymore", function()
      -- line: [0, 0] id: 781
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Anti%20Fling", true))()
    end)
    r101_454:Button("Fling With No Collision", "Fling people i guess ", function()
      -- line: [0, 0] id: 706
      loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/544f7efbe88235666b5b7add65b7344d/raw/f20804bb85542dcc3bc938982e1f05b7ff05cded/FE%2520Hat%2520Fling"))()
    end)
    r101_454:Button("Guardian", "Protector", function()
      -- line: [0, 0] id: 952
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
    end)
    r106_454 = r100_454:Section("Guis")
    r106_454:Button("Walk Speed Gui", "", function()
      -- line: [0, 0] id: 604
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Walk-Speed-Gui"))()
    end)
    r106_454:Button("Jump Power Gui", "", function()
      -- line: [0, 0] id: 966
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Jump-Power-Gui"))()
    end)
    r106_454:Button("Gravity Gui", "", function()
      -- line: [0, 0] id: 977
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Gravity-Gui"))()
    end)
    r106_454:Button("Fov Gui", "", function()
      -- line: [0, 0] id: 944
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fov-Gui"))()
    end)
    r106_454:Button("Fly Gui | Mobile", "Fly Gui Modified", function()
      -- line: [0, 0] id: 582
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fly-New"))()
    end)
    r106_454:Button("VFly", "Fly Gui", function()
      -- line: [0, 0] id: 675
      loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end)
    r106_454:Button("No Clip Gui", "", function()
      -- line: [0, 0] id: 682
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/NoClip_Gui"))()
    end)
    local r107_454 = r100_454:Section("Esp/Hitbox")
    r108_454 = workspace.CurrentCamera
    local r109_454 = false
    local r110_454 = game:GetService("RunService")
    function lookAt(r0_805, r1_805)
      -- line: [0, 0] id: 805
      r108_454.CFrame = CFrame.new(r0_805, r1_805)
    end
    function getClosestPlayerToCursor(r0_592)
      -- line: [0, 0] id: 592
      local r2_592 = math.huge
      local r1_592 = nil	-- notice: implicit variable refs by block#[10]
      for r6_592, r7_592 in ipairs(game.Players:GetPlayers()) do
        if r7_592 ~= game.Players.LocalPlayer and r7_592.Character and r7_592.Character:FindFirstChild(r0_592) then
          local r9_592, r10_592 = r108_454:WorldToViewportPoint(r7_592.Character[r0_592].Position)
          local r13_592 = (Vector2.new(r9_592.x, r9_592.y) - Vector2.new(r108_454.ViewportSize.x / 2, r108_454.ViewportSize.y / 2)).magnitude
          if r13_592 < r2_592 and r10_592 and r109_454 and r13_592 < 400 then
            r2_592 = r13_592
            r1_592 = r7_592
          end
        end
      end
      return r1_592
    end
    r110_454.RenderStepped:Connect(function()
      -- line: [0, 0] id: 570
      local r0_570 = getClosestPlayerToCursor("Head")
      if r109_454 and r0_570 and r0_570.Character:FindFirstChild("Head") and r0_570.TeamColor ~= game.Players.LocalPlayer.TeamColor and 0 < r0_570.Character.Humanoid.Health and 99 < r0_570.Character.HumanoidRootPart.Position.Y then
        lookAt(r108_454.CFrame.p, r0_570.Character.Head.Position + Vector3.new(0, -((game.Players.LocalPlayer.Character.Head.Position - r0_570.Character.Head.Position)).magnitude / 4.2, 0))
      end
    end)
    r107_454:Toggle("Aimbot [Beta]", "Auto Aim", function(r0_463)
      -- line: [0, 0] id: 463
      r109_454 = r0_463
    end)
    r107_454:Button("Aimbot/SilentAim", "?", function()
      -- line: [0, 0] id: 514
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Aimbot_SilentAim"))()
    end)
    r107_454:Button("Esp Box", "Opens Esp Box", function()
      -- line: [0, 0] id: 982
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp%20Box"))()
    end)
    r107_454:Button("Tracers", "Opens Tracers", function()
      -- line: [0, 0] id: 963
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Tracers"))()
    end)
    r107_454:Button("Esp", "Enable Esp", function()
      -- line: [0, 0] id: 755
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp"))()
    end)
    r107_454:Button("Hitbox", "Increase Range", function()
      -- line: [0, 0] id: 534
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/HitBox"))()
    end)
    local r111_454 = r100_454:Section("Shader")
    r111_454:Button("Realistic Shader", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 775
      loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
    end)
    r111_454:Button("P Rtx", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 620
      loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))()
    end)
    r111_454:Button("Pshade", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 626
      loadstring(game:HttpGet("https://pastebin.com/raw/Cd76B8Lh"))()
    end)
    r111_454:Button("Chillz\'s Enhancer v0.2", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 816
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/enhancer.txt"))()
    end)
    local r112_454 = r100_454:Section("Time Changer")
    r112_454:Button("Day | Night Cycle [Beta]", "", function()
      -- line: [0, 0] id: 694
      loadstring(game:HttpGet("https://pastebin.com/raw/hiZMgnkc"))()
    end)
    local r115_454 = "Textbox"
    r115_454 = "Time Set"
    r112_454:[r115_454](r115_454, "Set Game Time", function(r0_753)
      -- line: [0, 0] id: 753
      game.Lighting.TimeOfDay = r0_753
    end)
    local r113_454 = nil
    function TimeCh()
      -- line: [0, 0] id: 754
      return r113_454
    end
    function TimeChangeOption()
      -- line: [0, 0] id: 475
      if TimeChange() == "Morning | 6:00 AM" then
        game.Lighting.TimeOfDay = 6
      elseif TimeChange() == "Morning | 9:00 AM" then
        game.Lighting.TimeOfDay = 9
      elseif TimeChange() == "Noon | 12:00 PM" then
        game.Lighting.TimeOfDay = 12
      elseif TimeChange() == "Afternoon | 3:00 PM" then
        game.Lighting.TimeOfDay = 15
      elseif TimeChange() == "Evening | 6:00 PM" then
        game.Lighting.TimeOfDay = 18
      elseif TimeChange() == "Night | 9:00 PM" then
        game.Lighting.TimeOfDay = 21
      elseif TimeChange() == "Midnight | 12:00 AM" then
        game.Lighting.TimeOfDay = 24
      elseif TimeChange() == "Midnight | 3:00 AM" then
        game.Lighting.TimeOfDay = 3
      end
    end
    r112_454:Dropdown("Game Time [Beta]", "Change Time On Your Game Not Fe", {
      "Morning | 6:00 AM",
      "Morning | 9:00 AM",
      "Noon | 12:00 PM",
      "Afternoon | 3:00 PM",
      "Evening | 6:00 PM",
      "Night | 9:00 PM",
      "Midnight | 12:00 AM",
      "Midnight | 3:00 AM"
    }, function(r0_618)
      -- line: [0, 0] id: 618
      r113_454 = r0_618
      TimeChangeOption()
    end)
    local r114_454 = r100_454:Section("Server")
    r114_454:Button("Rejoin(Join Same Server)", "", function()
      -- line: [0, 0] id: 572
      game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end)
    r114_454:Button("ServerHop", "", function()
      -- line: [0, 0] id: 692
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Rejoin"))()
    end)
    r114_454:Button("Rejoin Button", "Make you able to rejoin if you get disconnected", function()
      -- line: [0, 0] id: 727
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts-2/main/rejoin%20button%20for%20kick%20message.lua", true))()
    end)
    r115_454 = r100_454:Section("Other")
    r115_454:Button("Backdoor.exe", "Backdoor Executor", function()
      -- line: [0, 0] id: 902
      loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua"))()
    end)
    r115_454:Button("Break Camera Script", "Break Your Camera", function()
      -- line: [0, 0] id: 483
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r115_454:Button("Bt Tools", "Admin Tools", function()
      -- line: [0, 0] id: 900
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bt%20Tools"))()
    end)
    r115_454:Button("Camera Spy", "Credits to Owner", function()
      -- line: [0, 0] id: 731
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/CameraSpy/main/Script", true))()
    end)
    r115_454:Button("Chat Spam", "Credits to Owner", function()
      -- line: [0, 0] id: 904
      loadstring(game:HttpGet("https://pastebin.com/raw/8Htx56Ab"))()
    end)
    r115_454:Button("Dex 2.0", "Better Than Dex 4 If Your In Mobile", function()
      -- line: [0, 0] id: 759
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    r115_454:Button("Dex 4", "Dark Mode I Guess", function()
      -- line: [0, 0] id: 600
      loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/dexV4/main/main.lua"))()
    end)
    r115_454:Button("F3x", "Backdoor Executor", function()
      -- line: [0, 0] id: 847
      loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)
    r115_454:Button("Fog Spawner", "Fog", function()
      -- line: [0, 0] id: 896
      loadstring(game:HttpGet("https://pastebin.com/raw/bxgUc8BX"))()
    end)
    r115_454:Button("FraktureSS", "Backdoor Executor", function()
      -- line: [0, 0] id: 504
      loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/source.lua", true))()
    end)
    r115_454:Button("Free Cam | Best", "Like Minecraft But In Roblox", function()
      -- line: [0, 0] id: 908
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    r115_454:Button("Free Cam", "Like Minecraft But In Roblox", function()
      -- line: [0, 0] id: 780
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r115_454:Button("Freeze Camera Script", "Freeze Yor Camera", function()
      -- line: [0, 0] id: 937
      loadstring(game:HttpGet("https://pastebin.com/raw/T0S0RPTW"))()
    end)
    r115_454:Button("GreenScreen Gui", "Not Fe But Perfect For Videos", function()
      -- line: [0, 0] id: 687
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Green%20Screen"))()
    end)
    r115_454:Button("Keyboard", "Keyboard Gui", function()
      -- line: [0, 0] id: 704
      loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    r115_454:Button("Keyboard v3", "Keyboard Gui", function()
      -- line: [0, 0] id: 845
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/mobkeyboardv3"))()
    end)
    r115_454:Button("Keystrokes Gui v2", "Keyboard Script", function()
      -- line: [0, 0] id: 683
      loadstring(game:HttpGet("https://pastefy.app/Te4dwSw2/raw", true))()
    end)
    r115_454:Button("Mouse Cursor V2", "Mouse Cursor I Guess ", function()
      -- line: [0, 0] id: 799
      loadstring(game:HttpGet("https://pastefy.ga/58d8d52G/raw", true))()
    end)
    r115_454:Button("Multi Tools", "Gives You Cool Tools To Use", function()
      -- line: [0, 0] id: 520
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/MultiToolsV1/main/script"))()
    end)
    r115_454:Button("Platform", "Platform", function()
      -- line: [0, 0] id: 680
      local r0_680 = Instance.new("Part", workspace)
      local r1_680 = game:GetService("TweenService")
      r0_680.Anchored = true
      r0_680.CanCollide = true
      r0_680.Size = Vector3.new(5.246, 0.271, 4.852)
      _G.e = true
      while _G.e == true do
        wait()
        r1_680:Create(r0_680, TweenInfo.new(0.2), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0),
        }):Play()
      end
    end)
    r115_454:Button("Rainbow Map", "Make You Game Rainbow", function()
      -- line: [0, 0] id: 524
      -- notice: unreachable block#5
      while true do
        for r3_524, r4_524 in ipairs(workspace:GetDescendants()) do
          if r4_524:IsA("BasePart") then
            r4_524.BrickColor = BrickColor.new(Color3.new(math.random(), math.random(), math.random()))
          end
        end
        wait(0.5)
      end
    end)
    r115_454:Button("Realistic First Person", "First Person", function()
      -- line: [0, 0] id: 885
      local r1_885 = "Pastefy"
      local r2_885 = "bwTjFg4P"
      local r3_885 = "7wTjFg4P"
      local r4_885 = "kTjGhS9L"
      local r5_885 = "d2RcPf6T"
      local r6_885 = "7nWrEg5Q"
      local r7_885 = "p9JhTd4B"
      local r8_885 = "r8CjQf3N"
      local r9_885 = "s2CkRd6W"
      local r10_885 = "v5PhZg8L"
      local r11_885 = "3sQjRf5T"
      local r13_885 = "o7KjXg4L"
      local r14_885 = "t9GnQd1R"
      local r15_885 = "y6LmSf2N"
      local r16_885 = "x3QjDg6P"
      local r17_885 = "c4VmLb8N"
      local r18_885 = "z2PkTf5J"
      local r19_885 = "e8LcGh9E"
      local r20_885 = "k5RfPd2W"
      local r21_885 = "2qFdRg7M"
      local r22_885 = "i2QbLh8S"
      local r23_885 = "g6ScTd3N"
      local r24_885 = "w9LbRf5G"
      local r25_885 = "b4NjDc7M"
      loadstring(game:HttpGet("https://paste" .. "f" .. "" .. "y" .. "" .. ".app/" .. "NpDhqikw" .. "/raw", true))()
    end)
    r115_454:Button("Remote Spy v2", "Make Fe Script Or Any Script", function()
      -- line: [0, 0] id: 611
      loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
    end)
    r115_454:Button("Sound Player", "Credits to Owner", function()
      -- line: [0, 0] id: 891
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
    end)
    r115_454:Button("Spectate", "Spectate People", function()
      -- line: [0, 0] id: 951
      loadstring(game:HttpGet("https://pastebin.com/raw/wyvdb7gr"))()
    end)
    r115_454:Button("Speed Tool", "Gives You A Tool To Speed Up", function()
      -- line: [0, 0] id: 645
      loadstring(game:HttpGet("https://pastebin.com/raw/iShZQHw7"))()
    end)
    r115_454:Button("Studs Walked Gui", "", function()
      -- line: [0, 0] id: 669
      local r0_669 = game.Players.LocalPlayer
      local r1_669 = r0_669:WaitForChild("PlayerGui")
      local r2_669 = Instance.new("ScreenGui")
      r2_669.Parent = r1_669
      r2_669.ResetOnSpawn = false
      local r3_669 = Instance.new("TextLabel")
      r3_669.Name = "DistanceLabel"
      r3_669.Parent = r2_669
      r3_669.Size = UDim2.new(0, 200, 0, 50)
      r3_669.Position = UDim2.new(0.5, -100, 0, 20)
      r3_669.BackgroundTransparency = 1
      r3_669.Font = Enum.Font.Gotham
      r3_669.TextSize = 18
      r3_669.TextColor3 = Color3.new(1, 1, 1)
      r3_669.Text = "Distance walked: 0 studs"
      (function()
        -- line: [0, 0] id: 670
        -- notice: unreachable block#4
        local r1_670 = (r0_669.Character or r0_669.CharacterAdded:Wait()):WaitForChild("Humanoid")
        local r2_670 = r1_670.RootPart.Position
        local r3_670 = 0
        while true do
          wait(0)
          local r4_670 = r1_670.RootPart.Position
          r2_670 = r4_670
          r3_669.Text = "Distance walked: " .. math.floor(r3_670 + (r4_670 - r2_670).Magnitude) .. " studs"
        end
        goto label_33	-- block#4 is visited secondly
      end)()
    end)
    r115_454:Button("Super Tools", "Gives You Cool Tools To Use", function()
      -- line: [0, 0] id: 778
      loadstring(game:HttpGet("https://pastebin.com/raw/sQWeMuB0"))()
    end)
    r115_454:Button("Telescope gui", "Loads A Telescope Gui Not Fe", function()
      -- line: [0, 0] id: 983
      loadstring(game:HttpGet("https://pastebin.com/raw/8T0STS4f"))()
    end)
    r115_454:Button("Tool Giver V2 Script", "Item That Suppose To Be In The Game Your In", function()
      -- line: [0, 0] id: 793
      loadstring(game:HttpGet("https://pastebin.com/raw/Fj8KWmLC"))()
    end)
    r115_454:Button("Tp Tool", "Gives You Tool to Tp Where You Click", function()
      -- line: [0, 0] id: 872
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TP-TOOL-8406"))()
    end)
    r115_454:Button("Torch Tool", "Gives You Tool to Tp Where You Click", function()
      -- line: [0, 0] id: 752
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/77_LYGCA1V7C3RWMJ.lua"), true)()
    end)
    r115_454:Button("TweenTeleporter", "Credits to Owner", function()
      -- line: [0, 0] id: 744
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/TweenTeleporter"))()
    end)
    r115_454:Button("Unanchored To Player Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 459
      loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 460
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end)
    end)
    loadstring(game:HttpGet("https://pastefy.app/z7MPlBlF/raw"))()
    local r116_454 = r10_454:Tab("Settings")
    local r117_454 = r116_454:Section("Watermark")
    r117_454:Button("Hide Watermark", "", function()
      -- line: [0, 0] id: 628
      r24_454.Visible = false
    end)
    r117_454:Button("Show Watermark", "", function()
      -- line: [0, 0] id: 839
      r24_454.Visible = true
    end)
    local r118_454 = r116_454:Section("Toggle")
    r118_454:Button("Hide Toggle", "", function()
      -- line: [0, 0] id: 836
      r28_454.Visible = false
    end)
    r118_454:Button("Show Toggle", "", function()
      -- line: [0, 0] id: 474
      r28_454.Visible = true
    end)
    r116_454:Section("Destroy"):Button("Destroy Script", "", function()
      -- line: [0, 0] id: 807
      r23_454:Destroy()
      r27_454:Destroy()
      r9_454:Destroy()
    end)
    local r120_454 = r116_454:Section("Other")
    r120_454:Button("Feedback", "", function()
      -- line: [0, 0] id: 608
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Feedback"))()
    end)
    r120_454:Button("Suggestion", "", function()
      -- line: [0, 0] id: 1003
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Suggestion"))()
    end)
    r120_454:Button("Bug-Report", "", function()
      -- line: [0, 0] id: 933
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bug-Report"))()
    end)
    local r121_454 = r10_454:Tab("Showcaser")
    local r122_454 = r121_454:Section("Showcasers")
    r122_454:Button("HE_flash", "", function()
      -- line: [0, 0] id: 766
      setclipboard("https://youtube.com/@Heflashh")
    end)
    r122_454:Button("JN HH Gaming", "", function()
      -- line: [0, 0] id: 806
      setclipboard("https://youtube.com/@JNHHGaming")
    end)
    r122_454:Button("A2br", "", function()
      -- line: [0, 0] id: 999
      setclipboard("https://youtube.com/@Abrahamvideogames")
    end)
    r122_454:Button("GHacks Script", "", function()
      -- line: [0, 0] id: 838
      setclipboard("https://youtube.com/@Ghacks_script")
    end)
    r122_454:Button("Scripter Gaming", "", function()
      -- line: [0, 0] id: 918
      setclipboard("https://youtube.com/@Scripter_Gaming")
    end)
    r122_454:Button("ZXZpigXD", "", function()
      -- line: [0, 0] id: 567
      setclipboard("https://youtube.com/@zxzpigxd3465")
    end)
    r122_454:Button("Mobile Scripts", "", function()
      -- line: [0, 0] id: 1005
      setclipboard("https://youtube.com/@RobloxScript23")
    end)
    r122_454:Button("Py Xd", "", function()
      -- line: [0, 0] id: 972
      setclipboard("https://youtube.com/@PYXD")
    end)
    r122_454:Button("Xtreme/Zephyr", "", function()
      -- line: [0, 0] id: 480
      setclipboard("https://youtube.com/@XtremeScripts")
    end)
    r122_454:Button("Arceus Script Showcaser", "", function()
      -- line: [0, 0] id: 470
      setclipboard("https://youtube.com/@ArceusxScriptShowcaser")
    end)
    r122_454:Button("Alkaid Scripts", "", function()
      -- line: [0, 0] id: 871
      setclipboard("https://youtube.com/@AlkaidScriptYT")
    end)
    r122_454:Button("ScyMe", "", function()
      -- line: [0, 0] id: 942
      setclipboard("https://youtube.com/@ScyMeet")
    end)
    r122_454:Button("Zeltas Script Yt", "", function()
      -- line: [0, 0] id: 848
      setclipboard("https://youtube.com/@Zeltas_Script_yt")
    end)
    r122_454:Button("XHackerPlusX", "", function()
      -- line: [0, 0] id: 578
      setclipboard("https://youtube.com/@XHackerPlusX_YT")
    end)
    r122_454:Button("Ervin Scripts", "", function()
      -- line: [0, 0] id: 809
      setclipboard("https://youtube.com/@ervin607")
    end)
    r122_454:Button("Pkxdjosh56", "", function()
      -- line: [0, 0] id: 663
      setclipboard("https://youtube.com/@cube_nothing")
    end)
    r122_454:Button("Yournerby", "", function()
      -- line: [0, 0] id: 587
      setclipboard("https://youtube.com/@yournerby")
    end)
    r122_454:Button("Zenzy Scripts", "", function()
      -- line: [0, 0] id: 851
      setclipboard("https://youtube.com/@zenzyscripts")
    end)
    r122_454:Button("NOT QUI - Hax", "", function()
      -- line: [0, 0] id: 865
      setclipboard("https://youtube.com/@Dscyte")
    end)
    r122_454:Button("K00pzskidd", "", function()
      -- line: [0, 0] id: 473
      setclipboard("https://youtube.com/@k00pzskidd")
    end)
    r121_454:Section("Note"):Button("If you already showcased this script and you\'re\nnot here comment on my latest video", "", function()
      -- line: [0, 0] id: 901
    end)
    local r125_454 = r10_454:Tab("Credits"):Section("✦ Externality Credits")
    r125_454:Button("YouTube Channel", "Subscribe i guess", function()
      -- line: [0, 0] id: 1009
      setclipboard("https://www.youtube.com/@GamerScripter")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r125_454:Button("Discord", "Join i guess", function()
      -- line: [0, 0] id: 666
      setclipboard("https://discord.gg/H4E277MV6c")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r125_454:Label("Crafted with ♥ by the Externality Team")
    local r127_454 = r10_454:Tab("Updated Log"):Section("What\'s New?")
    r127_454:Label("[+] Added More Scripts In Games")
    r127_454:Label("[+] Added More Scripts In Hub | Gui")
    r127_454:Label("[+] Added More Scripts In Fe")
    r127_454:Label("[+] Added More Scripts In Other")
    r127_454:Label("[+] New Chooser")
    r127_454:Label("[+] Showcaser Tab Has Been Updated")
    r127_454:Label("[-] Remove Custom Theme")
    r127_454:Label("[–] Removed Script That\'s Not Working")
  end)
  r11_2.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 1024
    animateOut()
    wait()
    local r0_1024 = Instance.new("Sound", workspace)
    r0_1024.PlaybackSpeed = 1.5
    r0_1024.Volume = 0.88
    r0_1024.SoundId = "rbxassetid://170765130"
    r0_1024.PlayOnRemove = true
    r0_1024:Destroy()
    local r1_1024 = Instance.new("ScreenGui")
    local r2_1024 = Instance.new("Frame")
    local r3_1024 = Instance.new("UICorner")
    local r4_1024 = Instance.new("TextLabel")
    local r5_1024 = Instance.new("TextLabel")
    r1_1024.Name = "Notification"
    r1_1024.Parent = game.CoreGui
    r1_1024.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r2_1024.Name = "Frame"
    r2_1024.Parent = r1_1024
    r2_1024.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r2_1024.BackgroundTransparency = 0
    r2_1024.BorderSizePixel = 0
    r2_1024.Position = UDim2.new(1, 0, 0.9, -45)
    r2_1024.Size = UDim2.new(0, 175, 0, 80)
    r3_1024.Parent = r2_1024
    r4_1024.Name = "Title"
    r4_1024.Parent = r2_1024
    r4_1024.BackgroundTransparency = 1
    r4_1024.Position = UDim2.new(0, 11, 0, 4)
    r4_1024.Size = UDim2.new(1, -20, 0, 30)
    r4_1024.Font = Enum.Font.SourceSansBold
    r4_1024.Text = "Externality Made In Heaven"
    r4_1024.TextColor3 = Color3.fromRGB(255, 255, 255)
    r4_1024.TextSize = 20
    r5_1024.Name = "Description"
    r5_1024.Parent = r2_1024
    r5_1024.BackgroundTransparency = 1
    r5_1024.Position = UDim2.new(0, 12, 0, 25)
    r5_1024.Size = UDim2.new(1, -20, 0, 50)
    r5_1024.Font = Enum.Font.SourceSans
    r5_1024.Text = "Externality Made In Heaven · Premium"
    r5_1024.TextColor3 = Color3.fromRGB(255, 255, 255)
    r5_1024.TextSize = 16
    r5_1024.TextWrapped = true
    coroutine.wrap(function()
      -- line: [0, 0] id: 1379
      local r0_1379 = Instance.new("LocalScript", r2_1024)
      wait()
      r0_1379.Parent:TweenPosition(UDim2.new(0.9, -85, 0.9, -45), "Out", "Quad", 0.5, true)
    end)()
    wait(3)
    coroutine.wrap(function()
      -- line: [0, 0] id: 1152
      local r0_1152 = Instance.new("LocalScript", r2_1024)
      wait()
      r0_1152.Parent:TweenPosition(UDim2.new(1, -0, 0.9, -45), "Out", "Quad", 0.5, true)
      wait(0.5)
      r1_1024:Destroy()
    end)()
    wait()
    local r8_1024 = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ui-Lib/New-Ui"))()
    local r9_1024 = r8_1024:Create("Externality Made In Heaven", "Premium Edition")
    local r10_1024 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local r11_1024 = game.PlaceId
    local r13_1024 = game:GetService("Players").LocalPlayer
    local r14_1024 = r13_1024.Name
    local r15_1024 = r13_1024.DisplayName
    local r16_1024 = r13_1024.UserId
    local r17_1024 = r13_1024.Character
    local r18_1024 = r13_1024.AccountAge
    local r19_1024 = #game.Players:GetPlayers()
    local r20_1024 = identifyexecutor() or "unknown"
    local r21_1024 = ""
    if game:GetService("UserInputService").GamepadEnabled then
      r21_1024 = "Controller"
    elseif game:GetService("UserInputService").TouchEnabled then
      r21_1024 = "Mobile"
    else
      r21_1024 = "PC"
    end
    local r22_1024 = Instance.new("ScreenGui")
    local r23_1024 = Instance.new("TextLabel")
    r22_1024.Name = "EXT_Watermark"
    r22_1024.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r22_1024.ResetOnSpawn = false
    r23_1024.Parent = r22_1024
    r23_1024.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r23_1024.BackgroundTransparency = 1
    r23_1024.BorderSizePixel = 0
    r23_1024.Position = UDim2.new(-0.000662226602, 0, 0.0143558267, 0)
    r23_1024.Size = UDim2.new(10, 0, 0, 20)
    r23_1024.Font = Enum.Font.GothamBold
    r23_1024.Text = "  ✦ Externality Made In Heaven  "
    r23_1024.TextColor3 = Color3.fromRGB(255, 255, 255)
    r23_1024.TextScaled = true
    r23_1024.TextSize = 15
    r23_1024.TextXAlignment = Enum.TextXAlignment.Left
    local r24_1024 = 0
    local r25_1024 = 0.01
    game:GetService("RunService").RenderStepped:Connect(function()
      -- line: [0, 0] id: 1082
      r24_1024 = (r24_1024 + r25_1024) % 1
      r23_1024.TextColor3 = Color3.fromHSV(r24_1024, 1, 1)
    end)
    local r26_1024 = Instance.new("ScreenGui")
    local r27_1024 = Instance.new("TextButton")
    local r28_1024 = Instance.new("UICorner")
    r26_1024.Name = "ScreenGui"
    r26_1024.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r26_1024.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r26_1024.ResetOnSpawn = false
    r27_1024.Name = "Toggle"
    r27_1024.Parent = r26_1024
    r27_1024.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r27_1024.Position = UDim2.new(0, 50, 0, 34)
    r27_1024.Size = UDim2.new(0, 45, 0, 28)
    r27_1024.Font = Enum.Font.SourceSansBold
    r27_1024.Text = "Externality Made In Heaven"
    r27_1024.TextColor3 = Color3.fromRGB(20, 52, 164)
    r27_1024.TextSize = 14
    r27_1024.TextWrapped = true
    r27_1024.ZIndex = 16
    r27_1024.Draggable = true
    r27_1024.MouseButton1Click:connect(function()
      -- line: [0, 0] id: 1287
      r8_1024:Toggle()
    end)
    r28_1024.Parent = r27_1024
    local r29_1024 = r9_1024:Tab("Home")
    r29_1024:Label("Welcome " .. r15_1024 .. " To Externality Made In Heaven")
    r29_1024:Label("Username: " .. r14_1024 .. "")
    r29_1024:Label("Display Name: " .. r15_1024 .. "")
    r29_1024:Label("User Id: " .. r16_1024 .. "")
    r29_1024:Label("Account Age: " .. r18_1024 .. "")
    r29_1024:Label("Executor: " .. r20_1024 .. "")
    r29_1024:Label("Device: " .. r21_1024 .. "")
    r29_1024:Label("————————————————————————————————")
    r29_1024:Label("Externality Made In Heaven — Premium Edition")
    local r30_1024 = r9_1024:Tab("Games")
    r30_1024:Section("Current Game")
    r30_1024:Button("Game: " .. r10_1024 .. " | " .. game.PlaceId .. "", function()
      -- line: [0, 0] id: 1286
    end)
    r30_1024:Section("Games")
    r30_1024:Dropdown("Adopt Me", {
      "Eazvy Hub",
      "Eclipse Hub",
      "Ice Hub",
      "Prodigy X",
      "Speed Hub X",
      "V.G Hub"
    }, function(r0_1201)
      -- line: [0, 0] id: 1201
      if r0_1201 == "Eazvy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/Eazvy-Hub/main/GameLoader.lua"))()
      elseif r0_1201 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_1201 = loadstring
        local r2_1201 = request
        if not r2_1201 then
          r2_1201 = http_request
          if not r2_1201 then
            r2_1201 = http
            if r2_1201 then
              r2_1201 = http.request or syn and syn.request
            else
              goto label_29	-- block#7 is visited secondly
            end
          end
        end
        local r4_1201 = tostring
        local r5_1201 = "https://api.eclipsehub.xyz/auth"
        assert(r1_1201 and r2_1201, "Executor not Supported")
        r1_1201(r2_1201({
          Url = r5_1201 .. "?key=" .. r4_1201(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_1201 == "Ice Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
      elseif r0_1201 == "Prodigy X" then
        loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
      elseif r0_1201 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif r0_1201 == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    r30_1024:Dropdown("All Star Tower Defense", {
      "KarmaPanda",
      "Trap Hub"
    }, function(r0_1417)
      -- line: [0, 0] id: 1417
      if r0_1417 == "KarmaPanda" then
        loadstring(game:HttpGet("https://script.karmapanda.dev/"))()
      elseif r0_1417 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_1024:Dropdown("Anime Adventures", {
      "Anime Adventures by Craymel02",
      "Arpon Hub",
      "Crimson Hub",
      "Keybrew Hub",
      "Trap Hub"
    }, function(r0_1037)
      -- line: [0, 0] id: 1037
      if r0_1037 == "Anime Adventures by Craymel02" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures.lua"))()
      elseif r0_1037 == "Arpon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures_v2__Beta.lua"))()
      elseif r0_1037 == "Crimson Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/C_Loader"))()
      elseif r0_1037 == "Keybrew Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borntodiekuv/KeybrewHub/main/AA"))()
      elseif r0_1037 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_1024:Dropdown("Anime Champions Simulator", {
      "Banana Hub",
      "Fazium Hub",
      "HarPy",
      "Krzysztof Hub",
      "Muimi Hub",
      "Perfectus Hub",
      "Sky Hub",
      "Yuto Hub"
    }, function(r0_1179)
      -- line: [0, 0] id: 1179
      if r0_1179 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif r0_1179 == "Fazium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Fazium-files/main/Loader"))()
      elseif r0_1179 == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/HarPy_loader.lua"))()
      elseif r0_1179 == "Krzysztof Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrzysztofHub/script/main/loader.lua"))()
      elseif r0_1179 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      elseif r0_1179 == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/Perfectus-Hub/main/perfectus-hub"))()
      elseif r0_1179 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif r0_1179 == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/ACS"))()
      end
    end)
    r30_1024:Dropdown("Anime Dimensions", {
      "Anime Ghost",
      "Bird Hub",
      "Intruders",
      "Itachi"
    }, function(r0_1338)
      -- line: [0, 0] id: 1338
      if r0_1338 == "Anime Ghost" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ghost-home/public/main/AnimeGhost.lua", true))()
      elseif r0_1338 == "Bird Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheWitch-BirdHub/BirdHubv0.1/main/load"))()
      elseif r0_1338 == "Intruders" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lifaiossama/errors/main/Intruders.html"))()
      elseif r0_1338 == "Itachi" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      end
    end)
    r30_1024:Dropdown("Anime Fighters Simulator", {
      "Banana Hub",
      "Platinium Hub",
      "SSJ3 Hub",
      "Yuto Hub",
      "Zer0 Hub"
    }, function(r0_1172)
      -- line: [0, 0] id: 1172
      if r0_1172 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif r0_1172 == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif r0_1172 == "SSJ3 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Gohan9k/ANFSnew/main/GOHANSSJ3"))()
      elseif r0_1172 == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/afss"))()
      elseif r0_1172 == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end)
    r30_1024:Dropdown("Anime Fighting Simulator X", {
      "Blox Hub",
      "Muimi Hub",
      "Project Nexus",
      "Sky Hub"
    }, function(r0_1313)
      -- line: [0, 0] id: 1313
      if r0_1313 == "Blox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/malicious-dev/RobloxScripting/main/AFSX.lua", true))()
      elseif r0_1313 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/AnimeFightingX"))()
      elseif r0_1313 == "Project Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IkkyyDF/ProjectNexus/main/Loader.lua"))()
      elseif r0_1313 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      end
    end)
    r30_1024:Dropdown("Anime Warriors Simulator 2", {
      "JumbleScripts",
      "Verny Hub V2"
    }, function(r0_1169)
      -- line: [0, 0] id: 1169
      if r0_1169 == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/AnimeWarriorsSimulator2.lua"))()
      elseif r0_1169 == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end)
    r30_1024:Dropdown("Arm Wrestler Simulator", {
      "Flame Hub",
      "HarPy",
      "Kenniel",
      "LDS Hub",
      "Legend HandlesYT",
      "Linear Hub",
      "Muimi Hub",
      "Nebula Hub",
      "Pikachu Hub",
      "Project WD",
      "Screech Hub",
      "Skull Hub",
      "Spirit Hub"
    }, function(r0_1099)
      -- line: [0, 0] id: 1099
      if r0_1099 == "Flame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/flame/main/loader"))()
      elseif r0_1099 == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/script.lua"))()
      elseif r0_1099 == "Kenniel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Arm-Wrestle-Simulator-Script/main/Arm-Wrestle-Simulator-Script", true))()
      elseif r0_1099 == "LDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS"))()
      elseif r0_1099 == "Legacy HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/arm7/main/wrestling"))()
      elseif r0_1099 == "Linear Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoolovr/Linear-Hub/main/loader.lua"))()
      elseif r0_1099 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/main.lua"))()
      elseif r0_1099 == "Nebula Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Saitamahaah/SaitaHub/main/NebulaHub"))()
      elseif r0_1099 == "Pikachu Hun" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()
      elseif r0_1099 == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_1099 == "Screech Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/screech/main/AWS"))()
      elseif r0_1099 == "Skull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/SkullHub/main/Loader.lua"))()
      elseif r0_1099 == "Spirit Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/gay-scripts/main/Loader.lua"), true)()
      end
    end)
    r30_1024:Dropdown("Arsenal", {
      "AdvanceTechV3",
      "Arsenal",
      "DarkHub",
      "Faded",
      "F2b Hub",
      "OwlHub",
      "Tiger-Hub",
      "V.Ghub"
    }, function(r0_1419)
      -- line: [0, 0] id: 1419
      if r0_1419 == "AdvanceTechV3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/UltimateCromaSin-Arsenal-Gui/main/AdvanceTechV3.lua"))()
      elseif r0_1419 == "Arsenal" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
      elseif r0_1419 == "DarkHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      elseif r0_1419 == "Faded" then
        _G.Toggles = "V"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
      elseif r0_1419 == "F2b Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif r0_1419 == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif r0_1419 == "Tiger-Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plutoguy/Tiger-Hub/main/loader.lua"))()
      elseif r0_1419 == "V.Ghub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    r30_1024:Dropdown("Bed Wars", {
      "AURORA",
      "IceCat",
      "JH NN Gaming Bedwars V3.0",
      "Raven B4",
      "SOFT BED",
      "SNOW X V2",
      "Future",
      "Nightbed",
      "Vape V4",
      "Vezt(Private)",
      "Xrayon"
    }, function(r0_1466)
      -- line: [0, 0] id: 1466
      if r0_1466 == "AURORA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XStormDeveloper/AuroraForRoblox/main/lua", true))()
      elseif r0_1466 == "IceCat" then
        loadstring(game:HttpGet("https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars", true))()
      elseif r0_1466 == "JH NN Gaming Bedwars V3.0" then
        loadstring(game:HttpGet("https://pastebin.com/raw/2HNVwUvm"))()
      elseif r0_1466 == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif r0_1466 == "SOFT BED" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iWxWxX2M", true))()
      elseif r0_1466 == "SNOW X V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SNOW%20X%20V2"))()
      elseif r0_1466 == "Future" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua", true))()
      elseif r0_1466 == "Nightbed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedX/main/NightbedScriptLol/mostNightbed.lua", true))()
      elseif r0_1466 == "Vape V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
      elseif r0_1466 == "Vezt(Private)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/Vezt/main/Vezt%20-%20BedWars%20(Private).lua"))()
      elseif r0_1466 == "Xrayon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dorukqpx/Xrayon/main/xrayonv2.lua", true))()
      end
    end)
    r30_1024:Dropdown("Bee Swarm Simulator", {
      "Blue Hub",
      "Cloud Hub",
      "Histy Hub",
      "Kometa Hub",
      "Macro Hub",
      "Pepsi Swarm"
    }, function(r0_1104)
      -- line: [0, 0] id: 1104
      if r0_1104 == "Blue Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
      elseif r0_1104 == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif r0_1104 == "Histy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
      elseif r0_1104 == "Kometa Hub" then
        loadstring(game:HttpGet("https://s.kometa.pw/kometa.lua"))()
      elseif r0_1104 == "Macro Hub" then
        loadstring(game:HttpGet("https://www.macrov2-script.xyz/macrov2.lua"))()
      elseif r0_1104 == "Pepsi Swarm" then
        loadstring(game:GetObjects("rbxassetid://4384103988")[1].Source)("Pepsi Swarm")
      end
    end)
    r30_1024:Dropdown("Blade Ball", {
      "Alchemy Hub",
      "AlSploit",
      "Artis Z",
      "Auto Parry by FFJ",
      "Bedol Hub",
      "Berserk Hub",
      "Blade Ball",
      "Darkrai Hub",
      "Del Hub",
      "EminX Hub",
      "Freya Hub",
      "Fuji Hub",
      "Galaxy Hub",
      "Hexa Hub",
      "Lightux Hub",
      "Ln Hub",
      "Luy Hub",
      "Mynhub",
      "Neo.x",
      "Neptune Hub",
      "Neva Hub",
      "Nextix Hub",
      "Nexus",
      "Noob",
      "Nova x Fusion Hub",
      "OMG Hub",
      "Oxox Hub",
      "Prolex",
      "R4mpage V4",
      "Raven B4",
      "REDz HUB",
      "SaZx HubZ",
      "ScriptX",
      "Sirius",
      "Stellar Hub",
      "Symphony Hub",
      "THub",
      "Visual",
      "Visualize",
      "White Hub",
      "Wii Hub",
      "xyz.beta",
      "Ysacxy Hub",
      "Zap Hub",
      "Zen.cc",
      nil,
      nil,
      nil
    }, function(r0_1429)
      -- line: [0, 0] id: 1429
      if r0_1429 == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif r0_1429 == "AlSploit" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/BladeBall"))()
      elseif r0_1429 == "Artis Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lightHubDev/ArtisZ/a6dd81c647a4b4a51b0ecee8fb868472d45eacad/Artis Z Main"))()
      elseif r0_1429 == "Auto Parry by FFJ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
      elseif r0_1429 == "Bedol Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/Loaders/main/Blade_Ball.lua"))()
      elseif r0_1429 == "Berserk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samirayt/Whitelist/main/Whitelist%20Pago"))()
      elseif r0_1429 == "Blade Ball" then
        loadstring(game:HttpGet("https://pastebin.com/raw/qxA2ETxy"))()
      elseif r0_1429 == "Darkrai Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-On-YouTube/main/Script%20Collection"))()
      elseif r0_1429 == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/ADjr564T"))()
        setclipboard("Key= 8oidGmQNhbiZdIFTWcIC")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_1429 == "EminX Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
      elseif r0_1429 == "Freya Hub" then
        loadstring(game:HttpGet("https://pastefy.app/qpzOA8ZR/raw"))()
      elseif r0_1429 == "Fuji Hub" then
        loadstring(game:HttpGet("https://shz.al/~main/dread/Fuji-Hub/script"))()
      elseif r0_1429 == "Galaxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/fruEwHqY"))()
      elseif r0_1429 == "Hexa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brothinkimnoob/AUTO-PARRY-HEXA-V3/main/HEXA%20V3"))()
      elseif r0_1429 == "Lightux Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif r0_1429 == "Ln Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/No6No6No7yt/Lumin-Hub/main/BladeV4.lua"))()
      elseif r0_1429 == "Luy Hub" then
        loadstring(game:HttpGet("https://shz.al/~LUYHUB"))()
      elseif r0_1429 == "Mynhub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/MYNHUB/main/BLADEBALL"))()
      elseif r0_1429 == "Neo.x" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DomainXV3/NEO.X/main/Velocity.lua"))()
      elseif r0_1429 == "Neptune Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TopPlayzYT/BladeBall/main/open"))()
      elseif r0_1429 == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif r0_1429 == "Nextix Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/Nextix-Hub/main/Loader"))()
      elseif r0_1429 == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
      elseif r0_1429 == "Noob" then
        loadstring(game:HttpGet("https://pastebin.com/raw/sYWb0Uin"))()
      elseif r0_1429 == "Nova x Fusion Hub" then
        loadstring(game:HttpGet("https://pastefy.app/xOAWDWaA/raw"))()
      elseif r0_1429 == "OMG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_1429 == "Oxox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krnow1/Bladeball_g/main/Credits_krnow"))()
      elseif r0_1429 == "Prolex" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/1734a4ee207844b994df2f36157afacd/files/1e79ac12fc8a47ef8263d5e9d43b7137/raw"))()
      elseif r0_1429 == "R4mpage V4" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/c2ba80c243e04cdaba2926ef0b747d9d/files/4471c9e60f444ebb98927dc25c52e8c7/raw"))()
      elseif r0_1429 == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif r0_1429 == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/eng"))()
      elseif r0_1429 == "SaZx HubZ" then
        loadstring(game:HttpGet("https://pastefy.app/0r7T66Gx/raw"))()
      elseif r0_1429 == "ScriptX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/Blade-Ball-Working-Most-Latest/main/Blade%20Ball%20Script%20X%20v1", true))()
      elseif r0_1429 == "Sirius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/Siriusisbetter/main/xyz.bb.lua", true))()
      elseif r0_1429 == "Stellar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/LoaderScripts/main/LoaderScripts"))()
      elseif r0_1429 == "Symphony Hub" then
        local r1_1429 = loadstring
        local r2_1429 = request
        if not r2_1429 then
          r2_1429 = http_request
          if not r2_1429 then
            r2_1429 = http
            if r2_1429 then
              r2_1429 = http.request or syn and syn.request
            else
              goto label_385	-- block#75 is visited secondly
            end
          end
        end
        local r4_1429 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r1_1429 and r2_1429, "Your Executor does not support.")
        r1_1429(r2_1429({
          Url = r4_1429,
          Method = "GET",
        }).Body)()
      elseif r0_1429 == "THub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tibe0124/tibe0124/main/Thub-blade-ur-balls"))()
      elseif r0_1429 == "Visual" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevTravDYT/VisualProductV10/main/KeySystem/ThankForUsing!/by-d-e-v-t-r-a-v/lua", true))()
        setclipboard("IUseVisualFree")
        game:GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_1429 == "Visualize" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif r0_1429 == "White Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/E07Wyg7L"))()
      elseif r0_1429 == "Wii Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif r0_1429 == "xyz.beta" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/xyz.BB/main/xyz.bb.lua", true))()
      elseif r0_1429 == "Ysacxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/Hqr4NnFU", true))()
      elseif r0_1429 == "Zap Hub" then
        loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
      elseif r0_1429 == "Zen.cc" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/zen.cc/main/zenultramax.lua", true))()
      end
    end)
    r30_1024:Dropdown("Bloxburg", {
      "BloxBurger",
      "Evo v4",
      "Vysor"
    }, function(r0_1471)
      -- line: [0, 0] id: 1471
      if r0_1471 == "BloxBurger" then
        loadstring(game:HttpGet("https://bloxburger.eu/scripts/free/script.lua"))()
      elseif r0_1471 == "Evo v4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif r0_1471 == "Vysor" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2f213cf4f330b8eb17423eaa4ae64ff6.lua"))()
      end
    end)
    r30_1024:Dropdown("Blox Fruit", {
      "Alchemy Hub",
      "Apple Hub",
      "Atomic Hub",
      "Beo Hub",
      "Blck Hub",
      "BlackTrap",
      "Bull Hub",
      "CFrame Hub",
      "Cokka Hub",
      "Destiny Hub",
      "Domadic Hub",
      "Dynamic Hub",
      "Ez Beli",
      "Fao Hub",
      "Flare Hub",
      "FTS V2",
      "Gringo Hub",
      "Halo X Hub",
      "Hoho Hub",
      "Hung Hub",
      "JJTx Hub",
      "Law Hub",
      "Madox Hub",
      "Makima Hub",
      "Makori Hub",
      "Makori Hub",
      "Master Hub",
      "Mama Hub",
      "MeMayBeo",
      "Modz Hub",
      "MTriet Hub",
      "Mukuro Hub",
      "Nexuz Hub",
      "Neva Hub",
      "Night Hub",
      "Omg Hub",
      "Pado Hub",
      "Raito Hub",
      "Rblx Hub",
      "REDzHUB",
      "Sagi Hub",
      "Saki Hub",
      "Sara Hub",
      "Secret Hub",
      "Snow Hub",
      "Sonic Hub",
      "Speed Hub X",
      "Switch Hub",
      "T7GFY",
      "Tawan Hub",
      "TNG Hub",
      "Thunder Z",
      "Turbo Hub",
      "Uranium Hub",
      "Vector Hub",
      "Void Hub",
      "Winnable Hub",
      "Xenon Hub",
      "Zamex Hub",
      "Zaque Hub",
      "Zaque Hub(PC)",
      "Zee Hub",
      "Zekrom Hub X",
      "Zen Hub"
    }, function(r0_1203)
      -- line: [0, 0] id: 1203
      if r0_1203 == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif r0_1203 == "Apple Hub" then
        getgenv().NgonNguScript = true
        repeat
          task.wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImTienNguyenZ/AppleHub/main/LoaderBF"))()
      elseif r0_1203 == "Atomic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArceusXHub/atomic-hub/main/atomic-hub.lua"))()
      elseif r0_1203 == "Beo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bestxemchua/agagagaq/main/BeoHUB/BeoHUB.lua"))()
      elseif r0_1203 == "Blck Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()
      elseif r0_1203 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_1203 == "Bull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/BullMain"))()
      elseif r0_1203 == "CFrame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
      elseif r0_1203 == "Cokka Hub" then
        loadstring(game:HttpGet("https://codeberg.org/CokkaHub/Loadstring/raw/branch/main/CokkaHub.lua"))()
      elseif r0_1203 == "Destiny Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KudoCon/DestinyHub/main/DestinyKey"))()
      elseif r0_1203 == "Domadic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
      elseif r0_1203 == "Dynamic Hub" then
        loadstring(game:HttpGetAsync("https://Dynamic.xcodehoster.com/loader.lua"))()
      elseif r0_1203 == "Ez Beli" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/ChestFarmOp"))()
      elseif r0_1203 == "Fao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PNguyen0199/Script/main/Fai-Fao.lua"))()
      elseif r0_1203 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flares"))()
      elseif r0_1203 == "FTS V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tulam2000/FTS-HUB/main/FTS%20x%20Hub"))()
      elseif r0_1203 == "Gringo Hub" then
        loadstring(game:HttpGet("https://github.com/LeVanNhatIT/GringoHub/raw/main/Loading_Ui/Loading"))()
      elseif r0_1203 == "Halo X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HALOxHUB/ScriptLoader/main/Loader.lua"))()
      elseif r0_1203 == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif r0_1203 == "Hung Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/Loading"))()
      elseif r0_1203 == "JJTx Hub" then
        loadstring(r30_1024:HttpGet("https://raw.githubusercontent.com/JJTChannel/JJTxHUB/main/Re-come.lua"))()
      elseif r0_1203 == "Law Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/Law%20hub"))()
      elseif r0_1203 == "Madox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/MadoxHubKey", true))()
      elseif r0_1203 == "Makima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Piwwy0909/MakimaRemake/main/Cumback.Makima"))()
      elseif r0_1203 == "Makori Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt"))()
      elseif r0_1203 == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onepicesenpai/onepicesenpai/main/onichanokaka"))()
      elseif r0_1203 == "Mama Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
      elseif r0_1203 == "MeMayBeo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Z/main/MeMayBeo"))()
      elseif r0_1203 == "Modz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/modz"))()
      elseif r0_1203 == "MTriet Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
      elseif r0_1203 == "Mukuro Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
      elseif r0_1203 == "Nexuz Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NexuzHub/Main-/main/Script"))()
      elseif r0_1203 == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif r0_1203 == "Night Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NIGHTHUBONTOP/Main/main/NIGHT-HUB"))()
      elseif r0_1203 == "Omg Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_1203 == "Pado Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REWzaKunGz1/premium/main/PadoHub"))()
      elseif r0_1203 == "Raito Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
      elseif r0_1203 == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif r0_1203 == "REDzHUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
      elseif r0_1203 == "Sagi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/SagiHub"))()
      elseif r0_1203 == "Saki Hub" then
        loadstring(game:HttpGetAsync("https://sharetext.me/raw/u3if6m3hgr"))()
      elseif r0_1203 == "Sara Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SaraSenpai/bloxfruist/main/Sarahub"))()
      elseif r0_1203 == "Secret Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FtsHub/main/main/SecretHub.Lua"))()
      elseif r0_1203 == "Snow Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Hub/main/SnowHub-BloxFruit"))()
      elseif r0_1203 == "Sonic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/Protected-25.lua"))()
      elseif r0_1203 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif r0_1203 == "Switch Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumX/main/src_.lua.txt"))()
      elseif r0_1203 == "T7GFY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
      elseif r0_1203 == "Tawan Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kill55547/TAWAN_HUB/main/TAWANxHUB_V2.lua.txt", true))()
      elseif r0_1203 == "TNG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tngaming123/TNGHub/main/AutoRaceV4.lua"))()
      elseif r0_1203 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_1203 == "Turbo Hub" then
        loadstring(r30_1024:HttpGet("https://gitlab.com/turbohubz/loader.xyz/loader/-/raw/main/TurboHub-Loader"))()
      elseif r0_1203 == "Uranium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
      elseif r0_1203 == "Vector Hub" then
        _G.Mode = "English"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MBPC"))()
      elseif r0_1203 == "Void Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/VoidHub/main/Script"))()
      elseif r0_1203 == "Winnable Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlostpexz/tyuiop/Fps/Loading.lua"))()
      elseif r0_1203 == "Xenon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Larinax999/leak/main/khemtitgamerHUB-BF.lua"))()
      elseif r0_1203 == "Zamex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua"))()
      elseif r0_1203 == "Zaque Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mei2232/ZaqueHub/main/Zaque%20Hub"))()
      elseif r0_1203 == "Zaque Hub(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/BloxFruitPC/main/Protected.lua"))()
      elseif r0_1203 == "Zee Hub" then
        loadstring(game:HttpGet("https://zKuzy.link/ZeeHub.lua"))()
      elseif r0_1203 == "Zekrom Hub X" then
        loadstring(r30_1024:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif r0_1203 == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubTheBest/Main/main/Loader", true))()
      end
    end)
    r30_1024:Dropdown("Break In 2", {
      "Breaking Blitz",
      "Break In 2 Kavo",
      "Break In 2 Orion",
      "Camping Trip",
      "D8rk Hub",
      "F Hub",
      "IceWare",
      "Jn Hh Gaming",
      "Legend HandlesYT",
      "Playvora + JNHH Hub"
    }, function(r0_1210)
      -- line: [0, 0] id: 1210
      if r0_1210 == "Breaking Blitz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif r0_1210 == "Break In 2 Kavo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt", true))()
      elseif r0_1210 == "Break In 2 Orion" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_1210 == "Camping Trip" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yieviro92creepy/Testfu/main/Breakin2"))()
      elseif r0_1210 == "D8rk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Games/Break%20In%202.lua", true))()
      elseif r0_1210 == "F Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/Hide/main/Break%20in%202"))()
      elseif r0_1210 == "IceWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif r0_1210 == "Jn Hh Gaming" then
        loadstring(game:HttpGet("https://freenote.biz/raw/ScmsS7SwTW", true))()
      elseif r0_1210 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Break/main/In"))()
      elseif r0_1210 == "Playvora + JNHH Hub" then
        loadstring(game:HttpGet("https://freenote.biz/raw/80jXm2Q0a7", true))()
      end
    end)
    r30_1024:Dropdown("Build A Boat", {
      "Astra Hub",
      "Auto Build",
      "Buil a boat for treasure",
      "Eclipse Hub",
      "NooVster",
      "Ruby Hub",
      "Space Hub",
      "Thunder Z",
      "Vynixius 2.0",
      "Zolars X"
    }, function(r0_1269)
      -- line: [0, 0] id: 1269
      if r0_1269 == "Astra Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/0YezNNRh", true))()
      elseif r0_1269 == "Auto Build" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
      elseif r0_1269 == "Buil a boat for treasure" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua"))()
      elseif r0_1269 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_1269 = loadstring
        local r2_1269 = request
        if not r2_1269 then
          r2_1269 = http_request
          if not r2_1269 then
            r2_1269 = http
            if r2_1269 then
              r2_1269 = http.request or syn and syn.request
            else
              goto label_50	-- block#11 is visited secondly
            end
          end
        end
        local r4_1269 = tostring
        local r5_1269 = "https://api.eclipsehub.xyz/auth"
        assert(r1_1269 and r2_1269, "Executor not Supported")
        r1_1269(r2_1269({
          Url = r5_1269 .. "?key=" .. r4_1269(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_1269 == "NooVster" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NooVster/v1.1/main/Source"))()
      elseif r0_1269 == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/BABFT/main/Ruby%20Hub", true))()
      elseif r0_1269 == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/spacvehubloader"))()
      elseif r0_1269 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_1269 == "Vynixius 2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
      elseif r0_1269 == "Zolars X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua"))()
      end
    end)
    r30_1024:Dropdown("Chaos", {
      "AstralHub",
      "Bad Hub",
      "Chaos Script",
      "SlapX Chaos Gui",
      "Juanko hub v4",
      "Ro Flux",
      "TSSChaosScript",
      "Chaos Gui"
    }, function(r0_1259)
      -- line: [0, 0] id: 1259
      if r0_1259 == "AstralHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
      elseif r0_1259 == "Bad Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/idkfffff/MainScript/main/BadHub.lua"))()
      elseif r0_1259 == "Chaos Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt"))()
      elseif r0_1259 == "SlapX Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Slinzo1/Chao-s-/main/Chaos"))()
      elseif r0_1259 == "Juanko Hub v4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/VzPbD7GW"))()
      elseif r0_1259 == "Ro Flux" then
        pcall(function()
          -- line: [0, 0] id: 1260
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif r0_1259 == "TSSChaosScript" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Idkwhatudoin/TSS/main/TSSChaosScript", true))()
      elseif r0_1259 == "Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aidanlolol/MainScript/main/ChaosScriptVersionTwoPointOne.lua"))()
      end
    end)
    r30_1024:Dropdown("Color Or Die", {
      "Color 0r Die | YT ToraIsMe",
      "Now Mon"
    }, function(r0_1216)
      -- line: [0, 0] id: 1216
      if r0_1216 == "Color 0r Die | YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0color", true))()
      elseif r0_1216 == "Now Mon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoWMoN/Color-0r-DIE/main/NoWMoN.lua"))()
      end
    end)
    r30_1024:Dropdown("Combat Warriors", {
      "Cwhb",
      "Hydra Ui",
      "Nova Hub",
      "Project-Hook",
      "Zap Hub"
    }, function(r0_1463)
      -- line: [0, 0] id: 1463
      if r0_1463 == "Cwhb" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
      elseif r0_1463 == "Hydra Ui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CheeseOnGithub/cheese-hook/main/main%20hydra%20ui.lua", true))()
      elseif r0_1463 == "Nova Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NOVA_HUB_SOURCE"))()
      elseif r0_1463 == "Project-Hook" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/required.lua"))()
      elseif r0_1463 == "Zap Hub" then
        loadstring(game:HttpGet("https://www.itots.tk/zaphub/combat-warriors.lua", true))()
      end
    end)
    r30_1024:Dropdown("Da Hood", {
      "DaHub",
      "DragonWare",
      "Enclosed",
      "Focus",
      "Lanxility",
      "OxHub",
      "Pluto",
      "RayX",
      "Serenity",
      "Space Hub",
      "Space X",
      "SwagMode",
      "Vortex",
      "Zapped",
      "Zinc Hub"
    }, function(r0_1160)
      -- line: [0, 0] id: 1160
      if r0_1160 == "DaHub" then
        getgenv().Toggle = "v"
        getgenv().Intro = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoUGotbannedlol/DaHubV3/main/Launch"))()
      elseif r0_1160 == "DragonWare" then
        loadstring(game:HttpGet("https://paste-drop.com/raw/ZAE0Or8c3y"))()
      elseif r0_1160 == "Enclosed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dylannpro123/enclosed/main/enclosed"))()
      elseif r0_1160 == "Focus" then
        loadstring(game:HttpGet("https://pastebin.com/raw/5BkTV67C", true))()
      elseif r0_1160 == "Lanxility" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
      elseif r0_1160 == "OxHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/patrickhackplus/oxhub/main/kidsinmybasement"))()
      elseif r0_1160 == "Pluto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Scrvpter/Pluto/Lua/Loader.Lua", true))()
      elseif r0_1160 == "RayX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua"))()
      elseif r0_1160 == "Serenity" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cypherdh/Serenity/main/script"))()
      elseif r0_1160 == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHubLoader"))()
      elseif r0_1160 == "Space X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood"))()
      elseif r0_1160 == "SwagMode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
      elseif r0_1160 == "Vortex" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
      elseif r0_1160 == "Zapped" then
        loadstring(game:HttpGet("https://ekso.gq/raw/relases/zapped.lua"))()
      elseif r0_1160 == "Zinc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua"))()
      end
    end)
    r30_1024:Dropdown("Doors", {
      "Black Hub",
      "DarkCheatClient",
      "Darkrai X",
      "Dxrk Hub",
      "ENTITY SPAWNER",
      "King Hub",
      "MSDOORS",
      "Nerd Hub V3",
      "Nerd Hub V4",
      "Nerd Hub V5",
      "Poop Doors"
    }, function(r0_1243)
      -- line: [0, 0] id: 1243
      if r0_1243 == "Black Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Doors"))()
      elseif r0_1243 == "DarkCheatClient" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      elseif r0_1243 == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
      elseif r0_1243 == "Dxrk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/dxrkhub/main/doors-scripts/hub-source"))()
      elseif r0_1243 == "ENTITY SPAWNER" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI"))()
      elseif r0_1243 == "King Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv"))()
      elseif r0_1243 == "MSDOORS" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua", true))()
      elseif r0_1243 == "Nerd Hub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/DoorsV3_ByNerd.lua"))()
      elseif r0_1243 == "Nerd Hub V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/doorsnerdv4.lua"))()
      elseif r0_1243 == "Nerd Hub V5" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/NeRDV5.lua"))()
      elseif r0_1243 == "Poop Doors" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua"))()
      end
    end)
    r30_1024:Dropdown("Evade", {
      "Darkrai-X",
      "Evade",
      "Evade Gui",
      "Evade Tuperx",
      "Hydra",
      "Nex Hub",
      "Project-WD",
      "Real-King Evade",
      "Speed Evade"
    }, function(r0_1035)
      -- line: [0, 0] id: 1035
      if r0_1035 == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
      elseif r0_1035 == "Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua"))()
      elseif r0_1035 == "Evade Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
      elseif r0_1035 == "Evade Tuperx" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TUPERX/TUPERX/Main/MenuBF/README.md"))()
      elseif r0_1035 == "Hydra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Main.lua", true))()
      elseif r0_1035 == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif r0_1035 == "Project-WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_1035 == "Real-King Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua"))()
      elseif r0_1035 == "Speed Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Speed.txt"))()
      end
    end)
    r30_1024:Dropdown("Grand Piece Online", {
      "Lazer Hub",
      "Xno Hub",
      "Zephyrion Hub"
    }, function(r0_1106)
      -- line: [0, 0] id: 1106
      if r0_1106 == "Lazer Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/lazer"))()
      elseif r0_1106 == "Xno Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/955dd3e8f43767eedf49f84ffac60170.lua"))()
        setclipboard("babyshark")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_1106 == "Zephyrion Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d2744abe1146d9accd91646050d082db.lua"))()
      end
    end)
    r30_1024:Dropdown("Haze Piece", {
      "Beli Hunter",
      "Hyper Hub",
      "Legend HandlesYT",
      "Mystic Hub",
      "Thunder Z",
      "Xtrey10x Hub"
    }, function(r0_1410)
      -- line: [0, 0] id: 1410
      if r0_1410 == "Beli Hunter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Belihunter"))()
      elseif r0_1410 == "Hyper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/All-Script/main/hp.lua"))()
      elseif r0_1410 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Haze/main/Piece"))()
      elseif r0_1410 == "Mystic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mo061/MysticHub/main/README.md"))()
      elseif r0_1410 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/Loader/AllGame.lua"))()
      elseif r0_1410 == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/Haze%20Piece"))()
      end
    end)
    r30_1024:Dropdown("Jail Break", {
      "OneMoreHub",
      "Project Auto",
      "Sexsation",
      "Vestra"
    }, function(r0_1318)
      -- line: [0, 0] id: 1318
      if r0_1318 == "OneMoreHub" then
        loadstring(game:HttpGet("https://gitlab.com/wspcontr/onemorehub/-/raw/main/scriptloader.lua"))()
      elseif r0_1318 == "Project Auto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/free"))()
      elseif r0_1318 == "Sexsation" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
      elseif r0_1318 == "Vestra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VestraTech/Vestra/main/Roblox/loader.lua"))()
      end
    end)
    r30_1024:Dropdown("Kat", {
      "Darkrai X",
      "Darkyy Ware X",
      "Kat Killer by JN HH Gaming",
      "OwlHub",
      "SilentAim",
      "Unfair Hub"
    }, function(r0_1081)
      -- line: [0, 0] id: 1081
      if r0_1081 == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/KAT"))()
      elseif r0_1081 == "Darkyy Ware X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/NOWAY/main/darkyyware.lua"))()
      elseif r0_1081 == "Kat Killer by JN HH Gaming" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Kat12/main/Kat"))()
      elseif r0_1081 == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif r0_1081 == "SilentAim" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/sa"))()
      elseif r0_1081 == "Unfair Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua", true))()
      end
    end)
    r30_1024:Dropdown("King Legacy", {
      "BlackTrap",
      "Hyper Hub",
      "Mukuro X Quartyz",
      "One X Hub",
      "Reaper Hub",
      "Speed Hub X",
      "ThunderZ",
      "Zen Hub"
    }, function(r0_1033)
      -- line: [0, 0] id: 1033
      if r0_1033 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_1033 == "Hyper Hub" then
        pcall(function()
          -- line: [0, 0] id: 1034
          repeat
            wait()
          until game:IsLoaded()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
        end)
      elseif r0_1033 == "Mukuro X Quartyz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
      elseif r0_1033 == "One X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xOne2/King-Legacy/main/README.md"))()
      elseif r0_1033 == "Reaper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
      elseif r0_1033 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif r0_1033 == "ThunderZ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_1033 == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
      end
    end)
    r30_1024:Dropdown("Legends Of Speed", {
      "Arch",
      "Code Hub",
      "Cryo Hub",
      "Legends Of Speed 1",
      "Legends Of Speed 2",
      "Legends Of Speed 3",
      "Legends Of Speed Rayfield",
      "Legends Of Speed by Waza80",
      "Pog Hub No Carte",
      "Project L",
      "Project Meow",
      "Project Omega",
      "Proxima Hub",
      "Pss Hub",
      "Sky Hub",
      "Speed Hub X",
      "SuPray",
      "Tbao Hub",
      "Uciha Hub",
      "Vynixius",
      "Weinz",
      nil
    }, function(r0_1292)
      -- line: [0, 0] id: 1292
      if r0_1292 == "Arch" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lux933/Arch/main/Utilities/loader.lua"))()
      elseif r0_1292 == "Code Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/coder382/CodeHub/main/Loader.lua"))()
      elseif r0_1292 == "Cryo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryoScript/Scripts.lua/main/Legends%20of%20Speed.lua", true))()
      elseif r0_1292 == "Legends Of Speed 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhackyCode/SPEEDDEVIL/main/legendsofspeed.lua"))()
      elseif r0_1292 == "Legends Of Speed 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YukiTM/Roblox/main/Legends", true))()
      elseif r0_1292 == "Legends Of Speed 3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Legenos%20of%20speedos"))()
      elseif r0_1292 == "Legends Of Speed Rayfield" then
        loadstring(game:HttpGet("https://pastebin.com/raw/wGjDdXNX"))()
      elseif r0_1292 == "Legends Of Speed by Waza80" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/los"))()
      elseif r0_1292 == "Pog Hub No Carte" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/Loader/main/Loader.lua"))()
      elseif r0_1292 == "Project L" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsThisMe01/Project-L/main/LegendsOfSpeed.lua"))()
      elseif r0_1292 == "Project Meow" then
        loadstring(game:HttpGet("https://scriptblox.com/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
      elseif r0_1292 == "Project Omega" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptPirate/ProjectOmega/main/ProjectOmegaLoader.lua"))()
      elseif r0_1292 == "Proxima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
      elseif r0_1292 == "Pss Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/psswaldo/psshub/main/main.lua"))()
      elseif r0_1292 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arlists/Sky-Hub/main/Main", true))()
      elseif r0_1292 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif r0_1292 == "SuPray" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/SuPray/main/Speed-of-Legends.lua"))()
      elseif r0_1292 == "Tbao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
      elseif r0_1292 == "Uciha Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fareljr1/Hub/main/Loader"))()
      elseif r0_1292 == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
      elseif r0_1292 == "Weinz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/weiny-ez/w-main/main/loader.lua"))()
      end
    end)
    r30_1024:Dropdown("Mad City", {
      "ProBacon Hub",
      "Ruby Hub Free",
      "Ruby Hub v2.0"
    }, function(r0_1138)
      -- line: [0, 0] id: 1138
      if r0_1138 == "ProBacon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aymarko/ProBaconHub/main/probacon1234/aymarko/MadCity/GUI/Beta"))()
      elseif r0_1138 == "Ruby Hub Free" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20Chapter%202", true))()
      elseif r0_1138 == "Ruby Hub v2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20v1.1", true))()
      end
    end)
    r30_1024:Dropdown("Murder Mystery 2", {
      "Auto Coin",
      "Dreadz Hub",
      "Eclipse Hub",
      "Ghost Hub",
      "Highlight Hub",
      "Jayy Hub",
      "Kidachi Hub",
      "Lunar Hub",
      "Murder Mystery 2",
      "Murder Mystery 2 by:ScriptX Version X",
      "Nexus Hub",
      "R3th Priv",
      "Ski Hub",
      "Symphony Hub"
    }, function(r0_1277)
      -- line: [0, 0] id: 1277
      if r0_1277 == "Auto Coin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tvgueimer84/tvgueimerr23232/main/mmm2"))()
      elseif r0_1277 == "Dreadz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DreadzHub2/DreadzHub-Scripts-FR/main/Loader"))()
      elseif r0_1277 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_1277 = loadstring
        local r2_1277 = request
        if not r2_1277 then
          r2_1277 = http_request
          if not r2_1277 then
            r2_1277 = http
            if r2_1277 then
              r2_1277 = http.request or syn and syn.request
            else
              goto label_39	-- block#9 is visited secondly
            end
          end
        end
        local r4_1277 = tostring
        local r5_1277 = "https://api.eclipsehub.xyz/auth"
        assert(r1_1277 and r2_1277, "Executor not Supported")
        r1_1277(r2_1277({
          Url = r5_1277 .. "?key=" .. r4_1277(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_1277 == "Ghost Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
      elseif r0_1277 == "Highlight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Free"))()
      elseif r0_1277 == "Jayy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reed192512/jayyhubcloud/main/MainLoadstring", true))()
      elseif r0_1277 == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/MM2_V2"))()
      elseif r0_1277 == "Lunar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
      elseif r0_1277 == "Murder Mystery 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/mm2", true))()
      elseif r0_1277 == "Murder Mystery 2 by:ScriptX Version X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/SORIX-Hub/main/Murder%20Mystery%202%20Version%20X"))()
      elseif r0_1277 == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring"))()
      elseif r0_1277 == "R3th Priv" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3TH-PRIV/main/LOAD.lua"))()
      elseif r0_1277 == "Ski Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/203DBjLx", true))()
      elseif r0_1277 == "Symphony Hub" then
        local r1_1277 = loadstring
        local r2_1277 = request
        if not r2_1277 then
          r2_1277 = http_request
          if not r2_1277 then
            r2_1277 = http
            if r2_1277 then
              r2_1277 = http.request or syn and syn.request
            else
              goto label_190	-- block#39 is visited secondly
            end
          end
        end
        local r4_1277 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r1_1277 and r2_1277, "Your Executor does not support.")
        r1_1277(r2_1277({
          Url = r4_1277,
          Method = "GET",
        }).Body)()
      end
    end)
    r30_1024:Dropdown("Murderers Vs Sheriffs", {
      "Bebo Scripts",
      "Emptyness Hub",
      "Kenniel Script",
      "Legend HandlesYT",
      "Muderer Vs Sheriff",
      "Oasis Hub",
      "Ranxware",
      "Ro Flux Hub",
      "Ruby Hub"
    }, function(r0_1383)
      -- line: [0, 0] id: 1383
      if r0_1383 == "Bebo Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
      elseif r0_1383 == "Emptyness Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/EmptynessNoBlur"))()
      elseif r0_1383 == "Kenniel Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Murderers-VS-Sheriffs-Duels-script/main/Murderers%20VS%20Sheriffs%20Duels%20script", true))()
      elseif r0_1383 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Duels7/main/Sheriffs56"))()
      elseif r0_1383 == "Muderer Vs Sheriff" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/mvs"))()
      elseif r0_1383 == "Oasis Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/bruvzz/oasishub/main/script"))()
      elseif r0_1383 == "Ranxware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AsteriskCodes/Ranxware-V2-Restored/main/source.lua"))()
      elseif r0_1383 == "Ro Flux Hub" then
        _G.Key = "FreeKey2023"
        pcall(function()
          -- line: [0, 0] id: 1384
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif r0_1383 == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
      end
    end)
    r30_1024:Dropdown("My Restaurant", {
      "Milk Up",
      "My Restaurant",
      "Project Lightning",
      "Project WD",
      "Rafa Hub",
      "Wyn\'s Script"
    }, function(r0_1284)
      -- line: [0, 0] id: 1284
      if r0_1284 == "Milk Up" then
        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
      elseif r0_1284 == "My Restaurant" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/MyRestaurant"))()
      elseif r0_1284 == "Project Lightning" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectLightningDev/Project-Lightning-Loader/main/Loader.Lua"))()
      elseif r0_1284 == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_1284 == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
      elseif r0_1284 == "Wyn\'s Script" then
        loadstring(game:HttpGet("https://system-exodus.com/scripts/MyRestaurant/MyRestaurant.lua", true))()
      end
    end)
    r30_1024:Dropdown("Natural Disaster Survival", {
      "Binary Hub",
      "CH Hub",
      "Dark Ware",
      "Eclipse Hub",
      "Natural Disaster Hub",
      "Natural Disaster Survival",
      "Natural Disaster Survival By:RIP",
      "NDS_A\'X",
      "NDS Hub",
      "NDS GUI",
      "One Protocol",
      "Rawnder",
      "Six Hub",
      "Zeerox Hub"
    }, function(r0_1162)
      -- line: [0, 0] id: 1162
      if r0_1162 == "Binary Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BinaryHubOfficial/binaryhub/main/init.lua"))()
      elseif r0_1162 == "CH Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
      elseif r0_1162 == "Dark Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yarik312/DarkWare/main/MainLoader", true))()
      elseif r0_1162 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_1162 = loadstring
        local r2_1162 = request
        if not r2_1162 then
          r2_1162 = http_request
          if not r2_1162 then
            r2_1162 = http
            if r2_1162 then
              r2_1162 = http.request or syn and syn.request
            else
              goto label_50	-- block#11 is visited secondly
            end
          end
        end
        local r4_1162 = tostring
        local r5_1162 = "https://api.eclipsehub.xyz/auth"
        assert(r1_1162 and r2_1162, "Executor not Supported")
        r1_1162(r2_1162({
          Url = r5_1162 .. "?key=" .. r4_1162(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_1162 == "Natural Disaster Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hussain1323232234/My-Scripts/main/Natural%20Disaster"))()
      elseif r0_1162 == "Natural Disaster Survival" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()
      elseif r0_1162 == "Natural Disaster Survival By:RIP" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/NaturalDisasterSurvival.lua"))()
      elseif r0_1162 == "NDS_A\'X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/NDS_A%5EX"))()
      elseif r0_1162 == "NDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main"))()
      elseif r0_1162 == "NDS GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
      elseif r0_1162 == "One Protocol" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneProtocol/Project/main/Loader", true))()
      elseif r0_1162 == "Rawnder" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster"))()
      elseif r0_1162 == "Six Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE"))()
      elseif r0_1162 == "Zeerox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
      end
    end)
    r30_1024:Dropdown("Nico NextBot", {
      "Darkrai-X",
      "Hp Hub",
      "NexHub",
      "Nico NextBot",
      "WercT"
    }, function(r0_1321)
      -- line: [0, 0] id: 1321
      if r0_1321 == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/NicoNextBots", true))()
      elseif r0_1321 == "Hp Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/HPHub/main/HPHub.lua"))()
      elseif r0_1321 == "NexHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif r0_1321 == "Nico NextBot" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DFfKb4i9"))()
      elseif r0_1321 == "WercT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dropouut/Shindai/main/wercT.lua"))()
      end
    end)
    r30_1024:Dropdown("Pet Catchers", {
      "Banana Hub",
      "GatoHub",
      "Huge Games",
      "IdiotHub",
      "Lenut Hub",
      "Nexus Hub",
      "Pet Catchers"
    }, function(r0_1262)
      -- line: [0, 0] id: 1262
      if r0_1262 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif r0_1262 == "GatoHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchers"))()
      elseif r0_1262 == "Huge Games" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f38c17c4a5e9f38a7dac14ce0940688d.lua"))()
      elseif r0_1262 == "IdiotHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main"))()
      elseif r0_1262 == "Lenut Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lenutjr/pc/main/petcatchers"))()
      elseif r0_1262 == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyHub123/NexusHubMain/main/Main.lua"))()
      elseif r0_1262 == "Pet Catchers" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/PET%20CATCHERS", true))()
      end
    end)
    r30_1024:Dropdown("Pet Simulator 99", {
      "Auto Stairway To Heaven",
      "Banana Hub",
      "Huge Games",
      "Idiot Hub",
      "Legend HandlesYT",
      "REDz HUB",
      "Sky Hub",
      "Syrex Hub",
      "Zekrom Hub X",
      "Zer0 Hub"
    }, function(r0_1174)
      -- line: [0, 0] id: 1174
      if r0_1174 == "Auto Stairway To Heaven" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fissurectomy/woah/main/ps99_stairway.lua"))()
      elseif r0_1174 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif r0_1174 == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/ps99"))()
      elseif r0_1174 == "Idiot Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Somerandomidiot/Lua/main/PS99_Protected.txt"))()
      elseif r0_1174 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Sim2/main/Pet99"))()
      elseif r0_1174 == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
      elseif r0_1174 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif r0_1174 == "Syrex Hub" then
        loadstring(game:HttpGet("https://syrexhub.netlify.app/raw/petsimulator99/syrexhub"))()
      elseif r0_1174 == "Zekrom Hub X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif r0_1174 == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end)
    r30_1024:Dropdown("Pet Simulator X", {
      "BlackTrap",
      "Catalyst",
      "Cloud Hub",
      "Extreme Hub",
      "EVO V4",
      "Huge Games",
      "Milk Up",
      "Project WD",
      "Rafa Hub",
      "Rblx Hub",
      "ThunderZ(PC)"
    }, function(r0_1272)
      -- line: [0, 0] id: 1272
      if r0_1272 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_1272 == "Catalyst" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/catalyst/itachi/main.lua"))()
      elseif r0_1272 == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif r0_1272 == "Extreme Hub" then
        _G.ExtremeHUBLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/All-Scripts-Obfuscated.lua"))()
      elseif r0_1272 == "EVO V4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif r0_1272 == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/psx"))()
      elseif r0_1272 == "Milk Up" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2a31571481d9db7f3be01903493bfc9a.lua"))()
      elseif r0_1272 == "Project WD" then
        getgenv().boothsnipe = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_1272 == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/psx.lua"))()
      elseif r0_1272 == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif r0_1272 == "ThunderZ(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      end
    end)
    r30_1024:Dropdown("Prison Life", {
      "Astral Hub",
      "Del Hub",
      "Fe Btools",
      "Fe Disabled Tool Gui",
      "Juanko",
      "Moonlight",
      "Tiger Admin",
      "Vynixius"
    }, function(r0_1196)
      -- line: [0, 0] id: 1196
      if r0_1196 == "Astral Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Games/PrisonLife/main.lua"))()
      elseif r0_1196 == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/QY07DaJS"))()
      elseif r0_1196 == "Fe Btools" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-btools-script-for-prison-life-9706"))()
      elseif r0_1196 == "Fe Disabled Tool Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
      elseif r0_1196 == "Juanko" then
        loadstring(game:HttpGet("https://pastebin.com/raw/rfAULQ83"))()
      elseif r0_1196 == "Moonlight" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Prison-life/main/Moonlight%20Client%20Prison%20Life", true))()
      elseif r0_1196 == "Tiger Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script"))()
      elseif r0_1196 == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Prison%20Life"))()
      end
    end)
    r30_1024:Dropdown("Project Mugetsu", {
      "JumbleScripts",
      "Pm",
      "Purple Hub",
      "Valynium",
      "Verny Hub V2"
    }, function(r0_1079)
      -- line: [0, 0] id: 1079
      if r0_1079 == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/ProjectMugetsu.lua"))()
      elseif r0_1079 == "Pm" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrickyAH/Scripts/main/loader.lua"))()
      elseif r0_1079 == "Purple Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheyCallMeVox/scripts/main/PM"))()
      elseif r0_1079 == "Valynium" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XO-3S-CL-VCK-jf-3HDM/Products/main/Project-Mugetsu.lua"))()
      elseif r0_1079 == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end)
    r30_1024:Dropdown("Project Slayer", {
      "Nuke Hub",
      "Oni Hub",
      "Shark Hub",
      "Skeered Hub",
      "Sylveon Hub",
      "Versaware Hub",
      "Zyrc Hub"
    }, function(r0_1054)
      -- line: [0, 0] id: 1054
      if r0_1054 == "Nuke Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2023/main/projslayerthingy", true))()
      elseif r0_1054 == "Oni Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/01471f12f9adfd4537f4cc0b3b7bba14.lua"))()
      elseif r0_1054 == "Shark Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/TcbS1i6E"))()
      elseif r0_1054 == "Skeered Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skeereddo/name/main/krnl", true))()
      elseif r0_1054 == "Sylveon Hub" then
        local r1_1054 = "https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/Mobile.lua"
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet(r1_1054))()
      elseif r0_1054 == "Versaware Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware_free/main/VersawareFree.lua", true))()
      elseif r0_1054 == "Zyrc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/mugentr"))()
      end
    end)
    r30_1024:Dropdown("Punch Simulator", {
      "Angeel Hub",
      "Blue GUI",
      "Perfectus Hub",
      "Tora Hub"
    }, function(r0_1322)
      -- line: [0, 0] id: 1322
      if r0_1322 == "Angeel Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Angeelvxg/PunchSimulator/main/PunchSimulator.lua", true))()
      elseif r0_1322 == "Blue GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
      elseif r0_1322 == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/dbevo/main/asfasfasfasf"))()
      elseif r0_1322 == "Tora Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0PUNCH"))()
      end
    end)
    r30_1024:Dropdown("Punch Wall Simulator", {
      "Codexus Trial",
      "ImperorLegend Hub",
      "Nexus",
      "Platinium Hub",
      "Punch Wall Simulator",
      "Punch Wall Simulator YT ToraIsMe",
      "Yoto Hub"
    }, function(r0_1291)
      -- line: [0, 0] id: 1291
      if r0_1291 == "Codexus Trial" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/PunchWallSim.lua"))()
      elseif r0_1291 == "ImperorLegend Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImperorLegend/Orig-PWSim-Script/main/Script"))()
      elseif r0_1291 == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif r0_1291 == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif r0_1291 == "Punch Wall Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/momentBr/game-script/main/Punch%20Wall%20Simulator"))()
      elseif r0_1291 == "Punch Wall Simulator YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0punch"))()
      elseif r0_1291 == "Yoto Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/GUI-SCRIPT/main/Main"))()
      end
    end)
    r30_1024:Dropdown("Rainbow Friends(Chapter 2)", {
      "BorkWare",
      "Frightened Hub",
      "Rainbow Friends KEPA",
      "Rainbow Friends",
      "ToraIsMe",
      "Voidz"
    }, function(r0_1357)
      -- line: [0, 0] id: 1357
      if r0_1357 == "BorkWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/" .. game.GameId .. ".lua"))(" Watermelon ? ")
      elseif r0_1357 == "Frightened Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/FrightenedHub/main/Loader.lua", true))()
      elseif r0_1357 == "Rainbow Friends KEPA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Keparetiolpxe/rbxscript/main/RainbowFriendsKEPA"))()
      elseif r0_1357 == "Rainbow Friends" then
        loadstring(game:HttpGet("https://pastebin.com/raw/yVhAwibN"))()
      elseif r0_1357 == "ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow"))()
      elseif r0_1357 == "Voidz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
      end
    end)
    r30_1024:Dropdown("Shadow Boxing", {
      "Flare Hub",
      "Trey\'s Hub"
    }, function(r0_1432)
      -- line: [0, 0] id: 1432
      if r0_1432 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/ShadowBoxing"))()
      elseif r0_1432 == "Trey\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/shadow"))()
      end
    end)
    r30_1024:Dropdown("Slap Battles", {
      "CherryUI\'s Hub",
      "Dizzy Hub",
      "Hub That Exists",
      "Infinite Ware",
      "Purple R20 Hub",
      "Slap Battle Gui",
      "R20-Exploiter",
      "Vantra Hub",
      "Whopper"
    }, function(r0_1282)
      -- line: [0, 0] id: 1282
      if r0_1282 == "CherryUI\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
      elseif r0_1282 == "Dizzy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/dizzy_hub/scripts/slap_battles.lua"))()
      elseif r0_1282 == "Hub That Exists" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
      elseif r0_1282 == "Infinite Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackie-coke/InfiniteWare/main/KS.lua", true))()
      elseif r0_1282 == "Purple R20 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/anakinn"))()
      elseif r0_1282 == "Slap Battle Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
      elseif r0_1282 == "R20-Exploiter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua"))()
      elseif r0_1282 == "Vantra Hub" then
        loadstring(game:HttpGet("https://vantra.cc/api/script/get?placeid=MainLoader"))()
      elseif r0_1282 == "Whopper" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/whopper.lua"))()
      end
    end)
    r30_1024:Dropdown("Sol\'s RNG", {
      "HoHo Hub",
      "Legend Handless Hub",
      "Sol\'s RNG",
      "Sol\'s RNG Panel"
    }, function(r0_1370)
      -- line: [0, 0] id: 1370
      if r0_1370 == "HoHo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif r0_1370 == "Legend Handless Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/upd/main/rng"))()
      elseif r0_1370 == "Sol\'s RNG" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Toilet71/Games-Sol-s/main/Sol\'s%20Script"))()
      elseif r0_1370 == "Sols RNG Panel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
      end
    end)
    r30_1024:Dropdown("Sonic Speed Simulator", {
      "Cheater Soul",
      "Master Hub",
      "Skays",
      "Sonic Speed Simulator"
    }, function(r0_1068)
      -- line: [0, 0] id: 1068
      if r0_1068 == "Cheater Soul" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luciquad/credit/main/sonicspeedsimulator.lua"))()
      elseif r0_1068 == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      elseif r0_1068 == "Skays" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SkaysGG-2095"))()
      elseif r0_1068 == "Sonic Speed Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kkeyy-hash/roblox/main/SonicSpeedSimulator2.lua"))()
      end
    end)
    r30_1024:Dropdown("The Strongest Battlegrounds", {
      "Hawk Hub",
      "Nex Hub",
      "Nicuse Hub",
      "LOLking123456",
      "Xtrey10x Hub"
    }, function(r0_1281)
      -- line: [0, 0] id: 1281
      if r0_1281 == "Hawk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHanki/Hawk/main/Loader", true))()
      elseif r0_1281 == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader", true))()
      elseif r0_1281 == "Nicuse Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
      elseif r0_1281 == "LOLking123456" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/battleground1/main/Saitama41"))()
      elseif r0_1281 == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/saitama"))()
      end
    end)
    r30_1024:Dropdown("Tower Of Hell", {
      "Admin",
      "Eclipse Hub",
      "Floater Scripts",
      "Garfield Hub",
      "LighTux",
      "Tower Of Hell Gui",
      "Tower Of Hell Gui by:The Mystery O_O"
    }, function(r0_1367)
      -- line: [0, 0] id: 1367
      if r0_1367 == "Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TwomadJR/nto/main/admiin"))()
      elseif r0_1367 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_1367 = loadstring
        local r2_1367 = request
        if not r2_1367 then
          r2_1367 = http_request
          if not r2_1367 then
            r2_1367 = http
            if r2_1367 then
              r2_1367 = http.request or syn and syn.request
            else
              goto label_29	-- block#7 is visited secondly
            end
          end
        end
        local r4_1367 = tostring
        local r5_1367 = "https://api.eclipsehub.xyz/auth"
        assert(r1_1367 and r2_1367, "Executor not Supported")
        r1_1367(r2_1367({
          Url = r5_1367 .. "?key=" .. r4_1367(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_1367 == "Floater Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iiProductionz/Floater-Scripts/main/WaifuEdition/Tower%20Of%20Hell"))()
      elseif r0_1367 == "Garfield Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
      elseif r0_1367 == "LighTux" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif r0_1367 == "Tower Of Hell Gui" then
        loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/85f97364b6367baac677e109488c9905/raw/c2972a2b892c4193509ddb2fe1ba3061435e1a8a/gistfile1.txt"))()
      elseif r0_1367 == "Tower Of Hell Gui by:The Mystery O_O" then
        loadstring(game:HttpGet("https://pastebin.com/raw/BbVHjH56"))()
      end
    end)
    r30_1024:Dropdown("UnderGround War", {
      "Multi Hub",
      "Unique Hub",
      "UnderGround War Gui",
      "UnderGround War 1"
    }, function(r0_1220)
      -- line: [0, 0] id: 1220
      if r0_1220 == "Multi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jj123llol/multi-hub/main/Multi", true))()
      elseif r0_1220 == "Unique Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jynzl/UniqueHub/main/UniqueHubv2Intro", true))()
      elseif r0_1220 == "UnderGround War Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iuqYjEAX"))()
      elseif r0_1220 == "UnderGround War 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War%203"))()
      end
    end)
    r30_1024:Dropdown("Wisteria 2", {
      "Flare Hub",
      "Jumble Hub",
      "Kidachi Hub"
    }, function(r0_1339)
      -- line: [0, 0] id: 1339
      if r0_1339 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/wisteria2script"))()
      elseif r0_1339 == "Jumble Hub" then
        loadstring(game:HttpGet("https://jumblescripts.com/JumbleHub.lua"))()
      elseif r0_1339 == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/Wisteria", true))()
      end
    end)
    r30_1024:Dropdown("Your Bizarre Adventure", {
      "CuHub V3",
      "Green Gui B-Boy",
      "Gui by Death",
      "Midnight Hub"
    }, function(r0_1285)
      -- line: [0, 0] id: 1285
      if r0_1285 == "CuHub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ItachiPvPUchiha/CuHub/main/yba.lua"))()
      elseif r0_1285 == "Green Gui B-Boy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
      elseif r0_1285 == "Gui by Death" then
        _G.Options = {
          ToggleKey = "Delete",
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGaster/Scripts/main/" .. tostring(game.PlaceId), true))()
      elseif r0_1285 == "Midnight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheFarowHywolf/YBA-Midnight-script/master/YBA.lua"))()
      end
    end)
    r30_1024:Dropdown("3008", {
      "CheatX",
      "God Mode",
      "V.G Hub"
    }, function(r0_1424)
      -- line: [0, 0] id: 1424
      if r0_1424 == "CheatX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/3008"))()
      elseif r0_1424 == "God Mode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CHnamedata/WhatDaHeck/main/3008GodMode.lua"))()
      elseif r0_1424 == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    r30_1024:Dropdown("More Next Update", {
      "Next Update"
    }, function()
      -- line: [0, 0] id: 1069
    end)
    local r31_1024 = r9_1024:Tab("Hub | Gui")
    r31_1024:Section("Executor")
    local r34_1024 = "Textbox"
    r34_1024 = "Script Executer"
    r31_1024:[r34_1024](r34_1024, "Executor", function(r0_1111)
      -- line: [0, 0] id: 1111
      loadstring(r0_1111)()
    end)
    r31_1024:Button("Arceus X v3", function()
      -- line: [0, 0] id: 1057
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end)
    r31_1024:Button("Fluxus Coral", function()
      -- line: [0, 0] id: 1444
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
    end)
    r31_1024:Button("Delta Fan Made", function()
      -- line: [0, 0] id: 1038
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Delta-Executor-J-O-K-E-7664"))()
    end)
    r31_1024:Button("Krnl Gui", function()
      -- line: [0, 0] id: 1271
      loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
    end)
    r31_1024:Button("Synapse X Gui", function()
      -- line: [0, 0] id: 1298
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
    end)
    r31_1024:Button("NotePad", function()
      -- line: [0, 0] id: 1121
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAScripts/Favorable/main/NotePad.lua"))()
    end)
    r31_1024:Button("NoCom Executor", function()
      -- line: [0, 0] id: 1077
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/NoCom-Executor/main/NoCom"))()
    end)
    r31_1024:Button("Executor Gui By AZY#0348", function()
      -- line: [0, 0] id: 1241
      loadstring(game:HttpGet("https://pastebin.com/raw/yGxeT8zC", true))()
    end)
    r31_1024:Button("Shadow X Executor", function()
      -- line: [0, 0] id: 1188
      loadstring(game:HttpGet("https://pastebin.com/raw/1fAnGAA0"))()
    end)
    r31_1024:Button("Neptune Executor", function()
      -- line: [0, 0] id: 1365
      loadstring(game:HttpGet("https://pastebin.com/raw/y3jhxS5r"))()
    end)
    r31_1024:Button("ECCS•AI Executor", function()
      -- line: [0, 0] id: 1236
      loadstring(game:HttpGet("https://pastebin.com/raw/7nAMYduv"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_1024:Button("ECCS•ID Executor", function()
      -- line: [0, 0] id: 1301
      loadstring(game:HttpGet("https://pastebin.com/raw/hFkBRgxb"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_1024:Button("NewExec V1", function()
      -- line: [0, 0] id: 1070
      loadstring(game:HttpGet("https://pastebin.com/raw/6sp92FDj", true))()
    end)
    r31_1024:Button("Bad Ware", function()
      -- line: [0, 0] id: 1197
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sluucker/badware/main/loader", true))()
    end)
    r31_1024:Button("Stigma", function()
      -- line: [0, 0] id: 1358
      loadstring(game:HttpGet("https://pastebin.com/raw/mG8XGpmD", true))()
    end)
    r31_1024:Button("Luigi Executor", function()
      -- line: [0, 0] id: 1048
      loadstring(game:HttpGet("https://pastebin.com/raw/UaTjPQMP"))()
    end)
    r31_1024:Button("Rc7 Executor", function()
      -- line: [0, 0] id: 1028
      loadstring(game:HttpGet("https://gist.githubusercontent.com/jointeamck/40a11b97bfb6881a72dba218cce85e2a/raw/02ca8af7ef7904182abd4208064d9a22df0010b5/rc7"))()
    end)
    r31_1024:Button("ShitSploit", function()
      -- line: [0, 0] id: 1193
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shitsploit-9386"))()
    end)
    r31_1024:Button("Mario", function()
      -- line: [0, 0] id: 1412
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-by-c00lkidd-9388"))()
    end)
    r31_1024:Button("Mario Premium", function()
      -- line: [0, 0] id: 1458
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-premium-9389"))()
    end)
    r31_1024:Button("Sexy Hamood (Premium)", function()
      -- line: [0, 0] id: 1437
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hamoot-script-9408"))()
    end)
    r31_1024:Button("C00lsploit Executor", function()
      -- line: [0, 0] id: 1264
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lsploit-9391"))()
    end)
    r31_1024:Button("Serverside Executor Gui", function()
      -- line: [0, 0] id: 1386
      loadstring(game:HttpGet("https://pastebin.com/raw/PXAdj6ED"))()
    end)
    r31_1024:Section("Admin")
    r31_1024:Button("Infinite Yield", function()
      -- line: [0, 0] id: 1120
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    r31_1024:Button("Iv Admin", function()
      -- line: [0, 0] id: 1031
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodyBurns/Hex/main/Iv%20Admin%20v3.lua"))()
    end)
    r31_1024:Button("Cmd-X", function()
      -- line: [0, 0] id: 1217
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
    r31_1024:Button("Fates Admin", function()
      -- line: [0, 0] id: 1165
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end)
    r31_1024:Button("GrimEx Admin", function()
      -- line: [0, 0] id: 1343
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JoeScriptHub/GrimEx-Admin/main/GrimEx%20Admin"))()
    end)
    r31_1024:Button("Gx Admin", function()
      -- line: [0, 0] id: 1064
      loadstring(game:HttpGet("https://pastebin.com/raw/v6E9BmFK", true))()
    end)
    r31_1024:Button("Leg Admin v2", function()
      -- line: [0, 0] id: 1446
      loadstring(game:HttpGet("https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua"))()
    end)
    r31_1024:Button("Nameless Admin | Working", function()
      -- line: [0, 0] id: 1346
      loadstring(game:HttpGet("https://gist.github.com/inuk84/ca841931f45f242c945405298b26bd71/raw/af364e5d4ea5b0d2eac404a5376d83c84a23cbe4/na.lua"))()
    end)
    r31_1024:Button("Nameless Admin | Discontinued", function()
      -- line: [0, 0] id: 1247
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end)
    r31_1024:Button("Admin Script", function()
      -- line: [0, 0] id: 1464
      loadstring("loadstring(game:HttpGet((\'https://pastefy.ga/fGYa4i7t/raw\'),true))()\n")()
    end)
    r31_1024:Button("Reviz Admin", function()
      -- line: [0, 0] id: 1159
      loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
    end)
    r31_1024:Button("Simple Admin", function()
      -- line: [0, 0] id: 1150
      loadstring(game:HttpGet("https://pastebin.com/raw/3hDQcTaD"))()
    end)
    r31_1024:Button("Property Admin", function()
      -- line: [0, 0] id: 1317
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Copinface/MainSource/main/PropertyAdmin"))()
    end)
    r31_1024:Button("Vortex Admin", function()
      -- line: [0, 0] id: 1293
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/Fe-Vortex-admin-V2/main/VortexCompany/C4/Discord.lua"))()
    end)
    r31_1024:Section("Best Gui Script")
    r31_1024:Button("Script Searcher", function()
      -- line: [0, 0] id: 1340
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end)
    r31_1024:Button("ECCS•Searcher", function()
      -- line: [0, 0] id: 1170
      loadstring(game:HttpGet("https://pastebin.com/raw/zhQ9gfJm"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_1024:Button("Games Hub", function()
      -- line: [0, 0] id: 1465
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    end)
    r31_1024:Button("Vex Hub", function()
      -- line: [0, 0] id: 1026
      loadstring(game:HttpGet("https://raw.githubusercontent.com/V31nc/On-Discord/Created/VexHub"))()
    end)
    r31_1024:Button("Sirius Hub", function()
      -- line: [0, 0] id: 1208
      loadstring(game:HttpGet("https://sirius.menu/script"))()
    end)
    r31_1024:Button("Moon Ui", function()
      -- line: [0, 0] id: 1047
      loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
    end)
    r31_1024:Button("HarshTech v7.6", function()
      -- line: [0, 0] id: 1090
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/Loadstring/main/HarshTechV7.6-Pc-Or-Mobile.lua"))()
    end)
    r31_1024:Button("Multi Scripter X", function()
      -- line: [0, 0] id: 1027
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader"))()
    end)
    r31_1024:Button("Mocha Hub", function()
      -- line: [0, 0] id: 1133
      loadstring(game:HttpGet("https://pastebin.com/raw/0MriWAjK"))()
    end)
    r31_1024:Button("Fathom Hub", function()
      -- line: [0, 0] id: 1039
      loadstring(game:HttpGet("https://pastebin.com/raw/Y4AGJALY"))()
    end)
    r31_1024:Button("Gigachad Hub", function()
      -- line: [0, 0] id: 1072
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua", true))()
    end)
    r31_1024:Button("Astrolynx", function()
      -- line: [0, 0] id: 1109
      loadstring(game:HttpGet("https://freenote.biz/raw/vBfN3NeVYN", true))()
    end)
    r31_1024:Button("Alysse", function()
      -- line: [0, 0] id: 1257
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/loader.lua"))()
    end)
    r31_1024:Button("GHub", function()
      -- line: [0, 0] id: 1156
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/GHUBV13S/main/GHUBv13S.txt"))()
    end)
    r31_1024:Button("British Hub", function()
      -- line: [0, 0] id: 1329
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat7888/BH/main/Protected_6274400031599569.lua%20(1).txt"))()
    end)
    r31_1024:Section("Good Gui Script")
    r31_1024:Button("123 Gui", function()
      -- line: [0, 0] id: 1378
      loadstring(game:HttpGet("https://pastebin.com/raw/qCBVxR3e", true))()
    end)
    r31_1024:Button("Acrylix v2.0", function()
      -- line: [0, 0] id: 1470
      loadstring(game:HttpGet("https://raw.githubusercontent.com/HubbyScripts/FE-Trolling-Hub/main/source"))()
    end)
    r31_1024:Button("ADSKer Hub", function()
      -- line: [0, 0] id: 1248
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ADSKerHub/main/ADSKExe"))()
    end)
    r31_1024:Button("Alex Universal", function()
      -- line: [0, 0] id: 1401
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexScripts1/AlexUniversalV4/main/Release"))()
    end)
    r31_1024:Button("All Obby Bido Skins", function()
      -- line: [0, 0] id: 1359
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/All%20obby%20Bido%20Skins%20V1.0"))()
    end)
    r31_1024:Button("All Tycoons v3", function()
      -- line: [0, 0] id: 1040
      loadstring(game:HttpGet("https://freenote.biz/raw/SkG1nrBqE8", true))()
    end)
    r31_1024:Button("Aloneo Hub", function()
      -- line: [0, 0] id: 1434
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YogaProjectRblx/AloneUniversal/main/README.md"))()
    end)
    r31_1024:Button("Artillery Hub", function()
      -- line: [0, 0] id: 1344
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LynchHHU/ArtilleryHub/main/GameHub/LynchYT"))()
    end)
    r31_1024:Button("Astral Hub", function()
      -- line: [0, 0] id: 1078
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua", true))()
    end)
    r31_1024:Button("Astrava", function()
      -- line: [0, 0] id: 1191
      loadstring(game:GetObjects("rbxassetid://1468845733")[1].Source)()
    end)
    r31_1024:Button("Auratus X", function()
      -- line: [0, 0] id: 1323
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RealMrQuacks/AuratusX/master/Load"))()
    end)
    r31_1024:Button("Autput", function()
      -- line: [0, 0] id: 1448
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Autput/main/Autputus"))()
    end)
    r31_1024:Button("Bendy And Ink Machine", function()
      -- line: [0, 0] id: 1226
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
    end)
    r31_1024:Button("B Genesis", function()
      -- line: [0, 0] id: 1142
      loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis"))()
    end)
    r31_1024:Button("Bido Skins v1.9", function()
      -- line: [0, 0] id: 1134
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9"))()
    end)
    r31_1024:Button("British Hub Pvp", function()
      -- line: [0, 0] id: 1373
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat33/Britishhub/main/Protected_4290863539999994.lua.txt"))()
    end)
    r31_1024:Button("Butif Hub", function()
      -- line: [0, 0] id: 1229
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/Butif%20Hub"))()
    end)
    r31_1024:Button("Chaddest Cat Hub", function()
      -- line: [0, 0] id: 1105
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Yopapa699/Key-System/main/Loader.lua"))()
    end)
    r31_1024:Button("Chat Hub", function()
      -- line: [0, 0] id: 1089
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20Chat%20Hub"))()
    end)
    r31_1024:Button("Chiezzy Hub", function()
      -- line: [0, 0] id: 1148
      loadstring(game:HttpGet("https://raw.githubusercontent.com/chiepz/aslbnmnkhby7e/main/crqhryvjahdjwysrnegsf%5Csgd"))()
    end)
    r31_1024:Button("Comsal Hub", function()
      -- line: [0, 0] id: 1395
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Comsal-Hub/main/main"))()
    end)
    r31_1024:Button("Coolgui", function()
      -- line: [0, 0] id: 1451
      loadstring(game:GetObjects("rbxassetid://9827584846")[1].Source)()
    end)
    r31_1024:Button("Cosmos Hub", function()
      -- line: [0, 0] id: 1265
      loadstring(game:HttpGet("https://pastebin.com/raw/tFivBbmb"))()
    end)
    r31_1024:Button("Davi Hub v1", function()
      -- line: [0, 0] id: 1462
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua", true))()
    end)
    r31_1024:Button("Davi Hub v2", function()
      -- line: [0, 0] id: 1459
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/DaviguiV2prealphaloader.lua", true))()
    end)
    r31_1024:Button("Davi Hub v2.3", function()
      -- line: [0, 0] id: 1063
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davi-hub-V2.3/main/davi.lua", true))()
    end)
    r31_1024:Button("Delux Hub", function()
      -- line: [0, 0] id: 1418
      loadstring(game:HttpGet("https://raw.githubusercontent.com/UniversalXploits/f/master/DeluxHub.txt", true))()
    end)
    r31_1024:Button("Dynamic Hub", function()
      -- line: [0, 0] id: 1454
      loadstring(game:HttpGet("https://pastebin.com/raw/bzySVjhX"))()
    end)
    r31_1024:Button("ECCS•GearGiver", function()
      -- line: [0, 0] id: 1119
      loadstring(game:HttpGet("https://pastebin.com/raw/Dhgnt7hi"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_1024:Button("Eminence Hub", function()
      -- line: [0, 0] id: 1056
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ChainGotStucked/a55af82d82574/main/Eminence%20Hub%20V1.6"))()
    end)
    r31_1024:Button("Equinox Hub", function()
      -- line: [0, 0] id: 1244
      loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
    end)
    r31_1024:Button("Executor Hub", function()
      -- line: [0, 0] id: 1166
      loadstring(game:HttpGet("https://pastebin.com/raw/WxS2CFBX"))()
    end)
    r31_1024:Button("Exploitz Hub", function()
      -- line: [0, 0] id: 1268
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBloxYT/ExploitzHub-Games.lua/main/ExploitzHub%20Universal%20(v.3.0%20.)"))()
      setclipboard("ia3i38")
    end)
    r31_1024:Button("Extreme Hub", function()
      -- line: [0, 0] id: 1112
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/Exhub/main/Key.lua", true))()
    end)
    r31_1024:Button("Ez Hub", function()
      -- line: [0, 0] id: 1371
      loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
    end)
    r31_1024:Button("F3x Hub", function()
      -- line: [0, 0] id: 1472
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/f3xhub/main/f3xhub"))()
    end)
    r31_1024:Button("FeliciaXxxHub", function()
      -- line: [0, 0] id: 1267
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDMJakey/Obfc/main/Protected_7979642737588973.lua", true))()
    end)
    r31_1024:Button("Feyz Hub", function()
      -- line: [0, 0] id: 1237
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FeyzRBLX/FeyzHub/main/Feyz%20Hub%20V2"))()
    end)
    r31_1024:Button("FireHubV1", function()
      -- line: [0, 0] id: 1155
      loadstring(game:HttpGet("https://pastebin.com/raw/REuMknBd", True))()
    end)
    r31_1024:Button("Fun Hub", function()
      -- line: [0, 0] id: 1397
      loadstring(game:HttpGet("https://pastebin.com/raw/3xqzxtYN"))()
    end)
    r31_1024:Button("Game Hub by:tomm_xx", function()
      -- line: [0, 0] id: 1101
      loadstring(game:HttpGet("https://pastebin.com/raw/18ji1xzk"))()
    end)
    r31_1024:Button("Game Hub/Script Hub By HN BLOX", function()
      -- line: [0, 0] id: 1246
      loadstring(game:HttpGet("https://pastebin.com/raw/brWwrinf", true))()
    end)
    r31_1024:Button("Ghost Hub", function()
      -- line: [0, 0] id: 1473
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end)
    r31_1024:Button("Googol", function()
      -- line: [0, 0] id: 1328
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Scripts/main/Googol", true))()
    end)
    r31_1024:Button("Gravity Hub", function()
      -- line: [0, 0] id: 1307
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XDMODZ1040/LUA-DEVSCRIPT/main/GRAVITY%20HUB"))()
    end)
    r31_1024:Button("Gucci Ui", function()
      -- line: [0, 0] id: 1375
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BeStHaXYT/Gucci/main/BeStHaXYT"))()
    end)
    r31_1024:Button("Gx Hub", function()
      -- line: [0, 0] id: 1147
      loadstring(game:HttpGet("https://pastebin.com/raw/qWqrZVyt"))()
    end)
    r31_1024:Button("Hat Hub", function()
      -- line: [0, 0] id: 1442
      loadstring(game:HttpGet("https://pastebin.com/raw/6tshcUd2"))()
    end)
    r31_1024:Button("Harked Reborn", function()
      -- line: [0, 0] id: 1212
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
    end)
    r31_1024:Button("Haxker Hub", function()
      -- line: [0, 0] id: 1098
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/Script-Hub/Version-3.3"))()
    end)
    r31_1024:Button("Holf Hub", function()
      -- line: [0, 0] id: 1242
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r31_1024:Button("Hydro Hub", function()
      -- line: [0, 0] id: 1200
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
    end)
    r31_1024:Button("Hyperlib Hub", function()
      -- line: [0, 0] id: 1102
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"))()
    end)
    r31_1024:Button("Juanko Hub", function()
      -- line: [0, 0] id: 1178
      loadstring(game:HttpGet("https://pastebin.com/raw/d5BS5qiX"))()
    end)
    r31_1024:Button("Juice Hub", function()
      -- line: [0, 0] id: 1299
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WeAreCrews/Juice-Hub/main/Juice%20Hub"))()
    end)
    r31_1024:Button("Juqua Hub", function()
      -- line: [0, 0] id: 1228
      loadstring(game:HttpGet("https://pastebin.com/raw/GTL1CCdg"))()
    end)
    r31_1024:Button("Killer Hub", function()
      -- line: [0, 0] id: 1211
      loadstring(game:HttpGet("https://pastebin.com/raw/7MDajezY"))()
    end)
    r31_1024:Button("Lego Hub", function()
      -- line: [0, 0] id: 1194
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Lego-Hub/main/main"))()
    end)
    r31_1024:Button("Legon X Hub", function()
      -- line: [0, 0] id: 1036
      loadstring(game:HttpGet("https://pastebin.com/raw/Lmaz8vF7", true))()
    end)
    r31_1024:Button("LHYT UNIVERSAL", function()
      -- line: [0, 0] id: 1450
      loadstring(game:HttpGet("https://pastefy.app/upAOsiaJ/raw", true))()
    end)
    r31_1024:Button("Lightning Hub", function()
      -- line: [0, 0] id: 1146
      loadstring(game:HttpGet("https://pastebin.com/raw/CSC0Ky7Z", true))()
    end)
    r31_1024:Button("Lightzone v2", function()
      -- line: [0, 0] id: 1240
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Idjrf5/main/Protected_3590052699937668.lua.txt"))()
    end)
    r31_1024:Button("Link To Loadstring", function()
      -- line: [0, 0] id: 1053
      loadstring(game:HttpGet("https://pastebin.com/raw/tsYdcZPJ"))()
    end)
    r31_1024:Button("LittHub", function()
      -- line: [0, 0] id: 1131
      loadstring(game:HttpGet("https://pastebin.com/raw/v4nf9WVz"))()
    end)
    r31_1024:Button("Lollypop Hub", function()
      -- line: [0, 0] id: 1153
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rrixh/lollypop-hub/main/v6.5%40lulaslollipop", true))()
    end)
    r31_1024:Button("MegaHub", function()
      -- line: [0, 0] id: 1443
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WholeF00ds/Mega/main/Obfuscated%20Loader", true))()
    end)
    r31_1024:Button("Mini Hub", function()
      -- line: [0, 0] id: 1116
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB", true))()
    end)
    r31_1024:Button("Mil Hub", function()
      -- line: [0, 0] id: 1405
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/MilHub/main/V3"))()
    end)
    r31_1024:Button("Music Hub", function()
      -- line: [0, 0] id: 1066
      loadstring(game:HttpGet("https://pastebin.com/raw/UmuK3sGL"))()
    end)
    r31_1024:Button("Multi Hub v3", function()
      -- line: [0, 0] id: 1377
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/Multi-Hub-V3/main/Multi%20Hub%20V3"))()
    end)
    r31_1024:Button("Multi Script Hub X", function()
      -- line: [0, 0] id: 1266
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0n1kidd/Multi-Script-Hub-X/main/Protected.lua_1.txt"))()
    end)
    r31_1024:Button("NukeVsCity", function()
      -- line: [0, 0] id: 1030
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))()
    end)
    r31_1024:Button("OpFinality", function()
      -- line: [0, 0] id: 1151
      loadstring(game:HttpGet("https://pastebin.com/raw/3axt0ia1"))()
    end)
    r31_1024:Button("Orange X", function()
      -- line: [0, 0] id: 1467
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Ab2rW/main/ORANGEX%20V5%20RELEASED%20ORANGEX%20ON%20TOP%20.txt"))()
    end)
    r31_1024:Button("Orca", function()
      -- line: [0, 0] id: 1252
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end)
    r31_1024:Button("Pirutun Hub", function()
      -- line: [0, 0] id: 1400
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Catserverrr/pirutunHubRbx/main/Protected_2932223426116900.lua.txt"))()
    end)
    r31_1024:Button("Pissware", function()
      -- line: [0, 0] id: 1439
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/Pissware/main/Main/MobileMain.lua"))()
    end)
    r31_1024:Button("PritishHub V1", function()
      -- line: [0, 0] id: 1086
      loadstring(game:HttpGet("https://cdn.discordapp.com/attachments/996659065096765502/996659173213343804/out.lua", true))()
    end)
    r31_1024:Button("Psy Hub", function()
      -- line: [0, 0] id: 1390
      loadstring(game:HttpGet("https://pastebin.com/raw/SCwrB1ws"))()
    end)
    r31_1024:Button("Rambo Hub", function()
      -- line: [0, 0] id: 1202
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Anaszaxo555/Rambo-hub-1.6/main/Rambo%20hub%201.6"))()
    end)
    r31_1024:Button("Rayfield Hub", function()
      -- line: [0, 0] id: 1176
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Essinity/Rayfield-Hub/main/Script", true))()
    end)
    r31_1024:Button("Rebranded Official Hub", function()
      -- line: [0, 0] id: 1145
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Cerbiale/Rebranded/main/RebrandedHubLoader.lua"))()
    end)
    r31_1024:Button("Red Coat", function()
      -- line: [0, 0] id: 1330
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/RedCoat8102-obfuscated.lua"))()
    end)
    r31_1024:Button("RemX", function()
      -- line: [0, 0] id: 1407
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Henry887/RemX-Script-Hub/main/main.lua", true))()
    end)
    r31_1024:Button("ReVP Hub", function()
      -- line: [0, 0] id: 1255
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/Protected%20"))()
    end)
    r31_1024:Button("Rose Hub", function()
      -- line: [0, 0] id: 1381
      loadstring(game:HttpGet("https://pastebin.com/raw/9q2nraUs", true))()
    end)
    r31_1024:Button("Rolf Hub", function()
      -- line: [0, 0] id: 1115
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r31_1024:Button("Salakitos Hub", function()
      -- line: [0, 0] id: 1094
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAKALITOS/Salakitoshub/main/scriptSK"))()
    end)
    r31_1024:Button("Scripter Hub", function()
      -- line: [0, 0] id: 1190
      loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SCRIPTER%20HUB%20V5"))()
    end)
    r31_1024:Button("Script Hub", function()
      -- line: [0, 0] id: 1420
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
    end)
    r31_1024:Button("Script Hub V2", function()
      -- line: [0, 0] id: 1065
      loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV2/main/SCRIPTHUBV2", true))()
    end)
    r31_1024:Button("Secret Service Panel", function()
      -- line: [0, 0] id: 1164
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
    end)
    r31_1024:Button("Shadows Scripts HUB", function()
      -- line: [0, 0] id: 1422
      loadstring(game:HttpGet("https://pastebin.com/raw/tuDMk1pr", true))()
    end)
    r31_1024:Button("Shakars Hub", function()
      -- line: [0, 0] id: 1449
      loadstring(game:HttpGet("https://raw.githubusercontent.com/shakar60/USH.P/main/rotected", true))()
    end)
    r31_1024:Button("Shizzuru Hub", function()
      -- line: [0, 0] id: 1438
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ggshizuru/myScriptHub/main/ShizzuruHub.1.lua", true))()
    end)
    r31_1024:Button("Sigma Hub", function()
      -- line: [0, 0] id: 1354
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrixCoding/SigmaHubV2/main/SigmaHubV2"))()
    end)
    r31_1024:Button("Simple Hub", function()
      -- line: [0, 0] id: 1029
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GearV4/Simple-Hub-X-Gear-SSX.lua/main/Gear%20SSX%20X%20Simple%20Hub"))()
    end)
    r31_1024:Button("SlapX v1", function()
      -- line: [0, 0] id: 1235
      loadstring(r30_1024:HttpGet("https://raw.githubusercontent.com/Slinzo1/Hh/main/Hh"))()
    end)
    r31_1024:Button("SlapX v2", function()
      -- line: [0, 0] id: 1394
      loadstring(r30_1024:HttpGet("https://raw.githubusercontent.com/Slinzo1/SlapX-v2-hub/main/SlapX%20Hub%20v2"))()
    end)
    r31_1024:Button("SnapDragon", function()
      -- line: [0, 0] id: 1238
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ruszelds/Snap/main/Dragon", true))()
      setclipboard("SnapDragon")
    end)
    r31_1024:Button("SoninhaHub", function()
      -- line: [0, 0] id: 1319
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SoninhaHub/Universal/main/Source.Lua"))()
    end)
    r31_1024:Button("Superior Vortex", function()
      -- line: [0, 0] id: 1096
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SmartModBoy/VortexAblity/main/SV"))()
    end)
    r31_1024:Button("Sushi X", function()
      -- line: [0, 0] id: 1431
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/sushi/main/X", true))()
    end)
    r31_1024:Button("SH_V11", function()
      -- line: [0, 0] id: 1175
      loadstring(game:HttpGet("https://pastebin.com/raw/J1MfBXv6", true))()
    end)
    r31_1024:Button("Sxrge Script Hub", function()
      -- line: [0, 0] id: 1335
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sxrge3k/sxrge_ssh_hub/main/sxrge_script_hub"))()
    end)
    r31_1024:Button("Syntax", function()
      -- line: [0, 0] id: 1184
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Memeboiyot/SyntaxRebornOfficial/main/SyntaxReborn", true))()
    end)
    r31_1024:Button("System Hub", function()
      -- line: [0, 0] id: 1185
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AHMEDPLPL/System-hub/main/System%20hub"))()
    end)
    r31_1024:Button("The Hub", function()
      -- line: [0, 0] id: 1189
      loadstring(game:HttpGet("https://raw.githubusercontent.com/hassantheking123321/TheHub/main/The%20hub%20v3%20test"))()
    end)
    r31_1024:Button("THEPERFECT", function()
      -- line: [0, 0] id: 1207
      loadstring(game:HttpGet("https://raw.githubusercontent.com/theperfectexploiter2024/THE-PERFECT-HUB-v1/main/THE%20PERFECT%20HUB%20v1.txt"))()
    end)
    r31_1024:Button("Thunder Hub", function()
      -- line: [0, 0] id: 1314
      loadstring(game:HttpGet("https://pastebin.com/raw/DFjY4nMy"))()
    end)
    r31_1024:Button("Tiger X Hub", function()
      -- line: [0, 0] id: 1132
      loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back"))()
    end)
    r31_1024:Button("TOPK3K REMAKE", function()
      -- line: [0, 0] id: 1427
      loadstring(game:HttpGet("https://pastebin.com/raw/ecfcBQNr", true))()
    end)
    r31_1024:Button("Universe Hub", function()
      -- line: [0, 0] id: 1414
      loadstring(game:HttpGet("https://pastebin.com/raw/ApcKYREY", true))()
    end)
    r31_1024:Button("Version Hub", function()
      -- line: [0, 0] id: 1396
      loadstring(game:HttpGet("https://pastebin.com/raw/wKc5r6CM"))()
    end)
    r31_1024:Button("VcskV Public", function()
      -- line: [0, 0] id: 1137
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Hub/main.lua", true))()
    end)
    r31_1024:Button("Void Hub", function()
      -- line: [0, 0] id: 1457
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Voidhub.lua/main/VoidHub.lua"))()
    end)
    r31_1024:Button("Yarhm", function()
      -- line: [0, 0] id: 1416
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm-dev.lua"))()
    end)
    r31_1024:Button("YourMom", function()
      -- line: [0, 0] id: 1278
      loadstring(game:GetObjects("rbxassetid://289110135")[1].Source)()
    end)
    r31_1024:Button("YT Hub", function()
      -- line: [0, 0] id: 1100
      loadstring(game:HttpGet("https://raw.githubusercontent.com/OWJBWKQLAISH/Yt-Hub/main/YouTuber%20Hub"))()
    end)
    r31_1024:Button("Zars Gui", function()
      -- line: [0, 0] id: 1225
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BumbleBeeSaga/BumbleBeeSaga/main/ZarsGUI1.0", true))()
    end)
    r31_1024:Button("Zaza Sploit", function()
      -- line: [0, 0] id: 1385
      loadstring(game:HttpGet("https://pastebin.com/raw/DE8Ltg6j"))()
    end)
    r31_1024:Button("Zxykerz Devil\'s Hub v2", function()
      -- line: [0, 0] id: 1254
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ZxkGamingOfficial/Zxykerz-Devil-s-Hub-V2-New/main/Zxykerz%20Devil\'s%20Hub%20V2"))()
    end)
    r31_1024:Section("Other Gui Script")
    r31_1024:Button("Hitbox Expander", function()
      -- line: [0, 0] id: 1158
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end)
    r31_1024:Button("Hitbox Expander | CheatX", function()
      -- line: [0, 0] id: 1408
      loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/shit%20script%20pack/CheatX"))()
    end)
    r31_1024:Button("Chat Filter Bypass", function()
      -- line: [0, 0] id: 1331
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRobloxSS/zetra/main/ZetPanel", true))()
    end)
    r31_1024:Button("Reach Gui v3", function()
      -- line: [0, 0] id: 1435
      loadstring(game:HttpGet("https://pastebin.com/raw/iKn1rhZv"))()
    end)
    r31_1024:Button("Ultimate Trolling Gui v1.5", function()
      -- line: [0, 0] id: 1353
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/9abbc0733af7c9113a5ecbaf4bb2ed5013a4e693/Ultimate%20Trolling%20GUI%20v1.5"))()
    end)
    r31_1024:Button("Ultimate Trolling Gui v2", function()
      -- line: [0, 0] id: 1067
      loadstring(game:HttpGet("https://github.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/raw/main/Akil\'s%20UTG%20v2.0%20full"))()
    end)
    r31_1024:Button("Chanzo Trolling Gui", function()
      -- line: [0, 0] id: 1305
      loadstring(game:HttpGet("https://pastebin.com/raw/y94Ejz3B", true))()
    end)
    r31_1024:Button("Chat hack Gui", function()
      -- line: [0, 0] id: 1097
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r31_1024:Button("1X1X1X1 GUI", function()
      -- line: [0, 0] id: 1263
      loadstring(game:HttpGet("https://pastebin.com/raw/CYye6uA4"))()
    end)
    r31_1024:Button("c00lgui", function()
      -- line: [0, 0] id: 1387
      loadstring(game:HttpGet("https://pastebin.com/raw/HkE93XjW"))()
    end)
    r31_1024:Button("c00lgui2", function()
      -- line: [0, 0] id: 1302
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
    end)
    r31_1024:Button("c00lkidd2", function()
      -- line: [0, 0] id: 1221
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
    end)
    r31_1024:Button("cOOlkidd Gui", function()
      -- line: [0, 0] id: 1270
      loadstring(game:HttpGet("https://pastebin.com/raw/UPZCQ31W"))()
    end)
    r31_1024:Button("K00pgui", function()
      -- line: [0, 0] id: 1183
      loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/K00pgui/a50a7131568adf4337053c428733c2eaf308ac6a/K00pgui"))()
    end)
    local r32_1024 = r9_1024:Tab("Fe")
    r32_1024:Section("Fe Gui")
    r32_1024:Button("B4krs Chat Bypasser", function()
      -- line: [0, 0] id: 1044
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/v4lsB4krscbR/main/Loadstring%20version%20chat%20bypasser"))()
    end)
    r32_1024:Button("Comet", function()
      -- line: [0, 0] id: 1426
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/Comet"))()
    end)
    r32_1024:Button("Epix\'s Fe Gui", function()
      -- line: [0, 0] id: 1157
      loadstring(game:HttpGet("https://pastebin.com/raw/jMAwjKcb"))()
    end)
    r32_1024:Button("Energize [R6]", function()
      -- line: [0, 0] id: 1468
      loadstring(game:HttpGet("https://pastebin.com/raw/1p6xnBNf", true))()
    end)
    r32_1024:Button("Fex", function()
      -- line: [0, 0] id: 1447
      loadstring(game:HttpGet("https://pastebin.com/raw/ES6xMCn7", true))()
    end)
    r32_1024:Button("Free gamepasses gui", function()
      -- line: [0, 0] id: 1167
      loadstring(game:HttpGet("https://pastebin.com/raw/QtQ4YnVR"))()
    end)
    r32_1024:Button("Free Gamepass Gui(dark modz)", function()
      -- line: [0, 0] id: 1294
      loadstring(game:HttpGet("https://pastebin.com/raw/53yY1S39"))()
    end)
    r32_1024:Button("Nulware v3", function()
      -- line: [0, 0] id: 1288
      local r0_1288 = game:GetService("Players").LocalPlayer
      game:GetService("RunService").Heartbeat:Connect(function()
        -- line: [0, 0] id: 1290
        r0_1288.MaximumSimulationRadius = math.huge
        sethiddenproperty(r0_1288, "SimulationRadius", math.huge)
      end)
      getgenv().Theme = "Blue"
      loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn?identifier=" .. (function()
        -- line: [0, 0] id: 1289
        -- notice: unreachable block#8
        local r0_1289 = ""
        for r4_1289 = 1, 256, 1 do
          local r5_1289 = math.random(1, 3)
          local r6_1289 = r0_1289
          local r7_1289 = string.char
          local r8_1289 = nil	-- notice: implicit variable refs by block#[9]
          if r5_1289 == 1 then
            r8_1289 = math.random(48, 57)
            if not r8_1289 then
              ::label_22::
              if r5_1289 == 2 then
                r8_1289 = math.random(97, 122)
                if not r8_1289 then
                  ::label_31::
                  if r5_1289 == 3 then
                    r8_1289 = math.random(65, 90)
                  else
                    r8_1289 = false
                  end
                end
              else
                goto label_31	-- block#5 is visited secondly
              end
            end
          else
            goto label_22	-- block#3 is visited secondly
          end
          r0_1289 = r6_1289 .. r7_1289(r8_1289)
        end
        return r0_1289
      end)()))()
    end)
    r32_1024:Button("Player Orbit", function()
      -- line: [0, 0] id: 1425
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
    end)
    r32_1024:Button("Tool Giver", function()
      -- line: [0, 0] id: 1303
      loadstring(game:HttpGet("https://pastebin.com/raw/Ctqjmtkv", true))()
    end)
    r32_1024:Button("Troll GUI", function()
      -- line: [0, 0] id: 1421
      loadstring(game:HttpGet("https://pastebin.com/raw/nwGzXh1V", true))()
    end)
    r32_1024:Button("Trolling Gui", function()
      -- line: [0, 0] id: 1204
      loadstring(game:HttpGet("https://pastefy.app/ic5m4aJG/raw", true))()
    end)
    r32_1024:Button("Xuctry FE Gui", function()
      -- line: [0, 0] id: 1276
      loadstring(game:HttpGet("https://pastebin.com/raw/Zz4YDvLb", true))()
    end)
    r32_1024:Section("Fe Script")
    r32_1024:Button("Fe Anti Afk", function()
      -- line: [0, 0] id: 1195
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Huubb/main/Mobile%20Scripting"))()
    end)
    r32_1024:Button("Fe Anti Fall", function()
      -- line: [0, 0] id: 1436
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/AntiFall/main/Script"))()
    end)
    r32_1024:Button("Fe Chat Bypasser", function()
      -- line: [0, 0] id: 1430
      loadstring(game:HttpGet("https://raw.githubusercontent.com/bedra45/chetbypasser/main/chetbypass"))()
    end)
    r32_1024:Button("Fe Chat Executor", function()
      -- line: [0, 0] id: 1168
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor", true))()
    end)
    r32_1024:Button("Fe Chat Hack", function()
      -- line: [0, 0] id: 1376
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r32_1024:Button("Fe Chat Hax", function()
      -- line: [0, 0] id: 1177
      loadstring(game:HttpGet("https://pastebin.com/raw/XFdQEjzx", true))()
    end)
    r32_1024:Button("Fe Clone", function()
      -- line: [0, 0] id: 1280
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end)
    r32_1024:Button("Fe Collision", function()
      -- line: [0, 0] id: 1351
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt", true))()
    end)
    r32_1024:Button("Fe Control Npc", function()
      -- line: [0, 0] id: 1052
      loadstring(game:HttpGet("https://pastefy.app/x8nWWq0M/raw", true))()
    end)
    r32_1024:Button("Fe Crawl Gui", function()
      -- line: [0, 0] id: 1310
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))()
    end)
    r32_1024:Button("Fe Death Note", function()
      -- line: [0, 0] id: 1080
      loadstring(game:HttpGet("https://pastefy.app/GoKxYBkU/raw", true))()
    end)
    r32_1024:Button("Fe Dino Fling", function()
      -- line: [0, 0] id: 1192
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_K2n31uc6t2wY5A8786eR4K15sgbUF0vdQ80a0LzgvLRkSNYd89H1AS3124gMR6SM.lua.txt", true))()
    end)
    r32_1024:Button("Fe Fling", function()
      -- line: [0, 0] id: 1283
      loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end)
    r32_1024:Button("Fe Fling Gui", function()
      -- line: [0, 0] id: 1103
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/Fe-Fling-GUI-For-roblox/main/Main.lua", true))()
    end)
    r32_1024:Button("Fe Flinger By GGH52Lan", function()
      -- line: [0, 0] id: 1398
      loadstring(game:HttpGet("https://pastebin.com/raw/xu3C3TSU"))()
    end)
    r32_1024:Button("Fe Free Gamepass Tools Giver(Obby Only)", function()
      -- line: [0, 0] id: 1186
      for r3_1186, r4_1186 in pairs(game:GetDescendants()) do
        if r4_1186.ClassName == "RemoteEvent" and (r4_1186.Parent.Name == "WeaponsRemotes" or r4_1186.Parent.Name == "VipRemotes" or r4_1186.Parent.Name == "Remotes") then
          r4_1186:FireServer()
        end
      end
    end)
    r32_1024:Button("Fe Freeze", function()
      -- line: [0, 0] id: 1205
      loadstring(game:HttpGet("https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source"))()
    end)
    r32_1024:Button("Fe Gamepass Tool Giver v4", function()
      -- line: [0, 0] id: 1356
      loadstring(game:HttpGet("https://pastefy.app/VYIAk3o1/raw", true))()
    end)
    r32_1024:Button("Fe Ghost", function()
      -- line: [0, 0] id: 1415
      loadstring(game:HttpGet("https://pastebin.com/raw/uUtRsAX5"))()
    end)
    r32_1024:Button("Fe God Mode | Obby", function()
      -- line: [0, 0] id: 1409
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main", true))()
    end)
    r32_1024:Button("Fe Grab Parts", function()
      -- line: [0, 0] id: 1083
      loadstring(game:HttpGet("https://pastefy.app/BbXuvVkK/raw", true))()
    end)
    r32_1024:Button("Fe Hat Spin", function()
      -- line: [0, 0] id: 1423
      loadstring(game:HttpGet("https://pastebin.com/raw/32PbiWw1", true))()
    end)
    r32_1024:Button("Fe Invisible Boat", function()
      -- line: [0, 0] id: 1445
      loadstring(game:HttpGet("https://pastefy.app/0CS5vmly/raw", true))()
    end)
    r32_1024:Button("Fe Ink Monster", function()
      -- line: [0, 0] id: 1136
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_f4i3ntKS5B8tK9zpCAnr31Dp7RNSYOo20gpln1fs1h2U4yjXNdNk6lFqZvN1Ft2p.lua.txt"))()
    end)
    r32_1024:Button("Fe Invisible Script", function()
      -- line: [0, 0] id: 1440
      loadstring(game:HttpGet("https://pastebin.com/raw/HrbT6bNK", true))()
    end)
    r32_1024:Button("Fe Invisibility Tool", function()
      -- line: [0, 0] id: 1222
      loadstring(game:HttpGet("https://pastebin.com/raw/bdBWidBC"))()
    end)
    r32_1024:Button("Fe Lag Switch", function()
      -- line: [0, 0] id: 1404
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt", true))()
    end)
    r32_1024:Button("Fe Lift Player Up", function()
      -- line: [0, 0] id: 1347
      player = game:GetService("Players").LocalPlayer
      mouse = player:GetMouse()
      camera = workspace.CurrentCamera
      ts = game:GetService("TweenService")
      function createtween(r0_1348, r1_1348, r2_1348)
        -- line: [0, 0] id: 1348
        tween = ts:Create(r0_1348, TweenInfo.new(r2_1348), {
          CFrame = r1_1348,
        })
        tween:Play()
        tween.Completed:Wait()
      end
      outline = Instance.new("Highlight")
      target = nil
      mouse.Button1Up:Connect(function()
        -- line: [0, 0] id: 1350
        if mouse.Target then
          local r0_1350 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_1350 and r0_1350:FindFirstChild("Humanoid") then
            camera.CameraSubject = r0_1350.Humanoid
            target = r0_1350
          else
            outline.Parent = nil
          end
        end
      end)
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 1349
        if player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
          if target and target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.CFrame.Y + 20 < player.Character.HumanoidRootPart.CFrame.Y then
            tween:Cancel()
          end
        end
        if mouse.Target then
          local r0_1349 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_1349 and r0_1349:FindFirstChild("Humanoid") then
            outline.Parent = r0_1349
          else
            outline.Parent = nil
          end
        end
      end)
      while task.wait() do
        local r0_1347 = target
        if r0_1347 ~= nil then
          r0_1347 = target:FindFirstAncestorOfClass("Workspace")
          if r0_1347 then
            r0_1347 = target
            if r0_1347 ~= player.Character then
              r0_1347 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_1347 then
                r0_1347 = target:FindFirstChild("HumanoidRootPart")
                if r0_1347 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  r0_1347 = hrp
                  r0_1347.CFrame = thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * -10
                end
              end
            end
          end
        end
        r0_1347 = target
        if r0_1347 ~= nil then
          r0_1347 = target:FindFirstAncestorOfClass("Workspace")
          if r0_1347 then
            r0_1347 = target
            if r0_1347 ~= player.Character then
              r0_1347 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_1347 then
                r0_1347 = target:FindFirstChild("HumanoidRootPart")
                if r0_1347 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  rot = thrp.CFrame * CFrame.Angles(math.rad(25), math.rad(25), math.rad(25))
                  createtween(hrp, thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * 1000000, 100000)
                end
              end
            end
          end
        end
      end
    end)
    r32_1024:Button("Fe Parts Mover", function()
      -- line: [0, 0] id: 1239
      loadstring(game:HttpGet("https://pastefy.app/Vcuyg09O/raw", true))()
    end)
    r32_1024:Button("Fe Punch", function()
      -- line: [0, 0] id: 1334
      loadstring(game:HttpGet("https://pastefy.ga/GvnHVjT5/raw", true))()
    end)
    r32_1024:Button("Fe R15 to R6", function()
      -- line: [0, 0] id: 1341
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua", true))()
    end)
    r32_1024:Button("Fe Roll Ball", function()
      -- line: [0, 0] id: 1141
      loadstring(game:HttpGet("https://pastebin.com/raw/BZr9bGDy", true))()
    end)
    r32_1024:Button("Fe SCP 173", function()
      -- line: [0, 0] id: 1297
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_nN0N66DHV2BjPwzYN59M17qSSlvJryM201CSC1sg07czxnZf48h9GHOFGd87G6Hh.lua.txt", true))()
    end)
    r32_1024:Button("Fe Spy", function()
      -- line: [0, 0] id: 1088
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))()
    end)
    r32_1024:Button("Fe Sword Kill All", function()
      -- line: [0, 0] id: 1433
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script"))()
    end)
    r32_1024:Button("Fe Touch Fling", function()
      -- line: [0, 0] id: 1231
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
    end)
    r32_1024:Button("Fe Tp Place Gui", function()
      -- line: [0, 0] id: 1315
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Tp%20Place%20GUI", true))()
    end)
    r32_1024:Button("FE Yeet", function()
      -- line: [0, 0] id: 1360
      loadstring(game:HttpGet("https://pastebin.com/raw/saMtiek2", true))()
    end)
    r32_1024:Button("Fe Zero Gravity Parts", function()
      -- line: [0, 0] id: 1374
      loadstring(game:HttpGet("https://pastebin.com/raw/aXgyQyKY"))()
    end)
    r32_1024:Button("Fe Zombie Fling", function()
      -- line: [0, 0] id: 1337
      loadstring(game:HttpGet("https://pastefy.app/w7KnPY70/raw", true))()
    end)
    r32_1024:Section("Not Sure Fe")
    r32_1024:Button("Among Us", function()
      -- line: [0, 0] id: 1051
      loadstring(game:HttpGet("https://pastebin.com/raw/vNiNzr34"))()
    end)
    r32_1024:Button("Backflip", function()
      -- line: [0, 0] id: 1219
      loadstring(game:HttpGet("https://pastebin.com/raw/n2gUwjc4"))()
    end)
    r32_1024:Button("Bloody Knife", function()
      -- line: [0, 0] id: 1342
      loadstring(game:HttpGet("https://pastebin.com/raw/25P2tVPD"))()
    end)
    r32_1024:Button("Coolkid Gui", function()
      -- line: [0, 0] id: 1042
      loadstring(game:HttpGet("https://pastebin.com/raw/YsVaUfYQ", true))()
    end)
    r32_1024:Button("Gale Fighter", function()
      -- line: [0, 0] id: 1362
      loadstring(game:HttpGet("https://pastebin.com/raw/YCH5P19e"))()
    end)
    r32_1024:Button("Psychopath", function()
      -- line: [0, 0] id: 1380
      loadstring(game:HttpGet("https://pastebin.com/raw/9Lharw50"))()
    end)
    r32_1024:Button("Slasher", function()
      -- line: [0, 0] id: 1163
      loadstring(game:HttpGet("https://pastebin.com/raw/sVEn1Tza"))()
    end)
    r32_1024:Button("Snake", function()
      -- line: [0, 0] id: 1388
      loadstring(game:HttpGet("https://pastebin.com/raw/naRUdxrc", true))()
    end)
    r32_1024:Button("Spider", function()
      -- line: [0, 0] id: 1441
      loadstring(game:HttpGet("https://pastebin.com/raw/txsk1LJg"))()
    end)
    r32_1024:Section("Useful")
    r32_1024:Button("Animation Gui", function()
      -- line: [0, 0] id: 1355
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end)
    r32_1024:Button("Emotes Gui | Best", function()
      -- line: [0, 0] id: 1352
      loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()
    end)
    r32_1024:Button("Emotes Gui", function()
      -- line: [0, 0] id: 1198
      loadstring(game:HttpGet("https://pastebin.com/raw/fitjHU5J"))()
    end)
    r32_1024:Section("Sus Script")
    r32_1024:Button("Pendulum Hub", function()
      -- line: [0, 0] id: 1402
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
    end)
    r32_1024:Button("Sussy hub", function()
      -- line: [0, 0] id: 1154
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub"))()
    end)
    local r33_1024 = r9_1024:Tab("Other")
    r33_1024:Section("Player")
    r34_1024 = 16
    local r35_1024 = false
    local r38_1024 = "Textbox"
    r38_1024 = "Walk Speed"
    r33_1024:[r38_1024](r38_1024, "Set Walk Speed", function(r0_1113)
      -- line: [0, 0] id: 1113
      r34_1024 = r0_1113
      pcall(function()
        -- line: [0, 0] id: 1114
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r0_1113
      end)
    end)
    r33_1024:Toggle("Loop Walk Speed", function(r0_1073)
      -- line: [0, 0] id: 1073
      r35_1024 = r0_1073
      if r0_1073 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 1074
          if r35_1024 then
            pcall(function()
              -- line: [0, 0] id: 1075
              game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r34_1024
            end)
          end
        end)
      end
    end)
    local r36_1024 = 50
    local r37_1024 = false
    local r40_1024 = "Textbox"
    r40_1024 = "Jump Power"
    r33_1024:[r40_1024](r40_1024, "Set Jump Power", function(r0_1324)
      -- line: [0, 0] id: 1324
      r36_1024 = r0_1324
      pcall(function()
        -- line: [0, 0] id: 1325
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r0_1324
      end)
    end)
    r33_1024:Toggle("Loop Jump Power", function(r0_1180)
      -- line: [0, 0] id: 1180
      r37_1024 = r0_1180
      if r0_1180 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 1181
          if r37_1024 then
            pcall(function()
              -- line: [0, 0] id: 1182
              game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r36_1024
            end)
          end
        end)
      end
    end)
    r40_1024 = "Textbox"
    r40_1024 = "Gravity"
    r33_1024:[r40_1024](r40_1024, "Set Gravity", function(r0_1041)
      -- line: [0, 0] id: 1041
      game.Workspace.Gravity = r0_1041
    end)
    r40_1024 = "Textbox"
    r40_1024 = "Zoom Distance"
    r33_1024:[r40_1024](r40_1024, "Set Zoom Distance", function(r0_1333)
      -- line: [0, 0] id: 1333
      game.Players.LocalPlayer.CameraMaxZoomDistance = r0_1333
    end)
    r33_1024:Button("Endless Zoom", function()
      -- line: [0, 0] id: 1249
      local r0_1249 = game.Players.LocalPlayer
      r0_1249.CameraMaxZoomDistance = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      r0_1249.CameraMinZoomDistance = 0
    end)
    r33_1024:Button("Reset", function()
      -- line: [0, 0] id: 1123
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      game.Workspace.Gravity = 196.2
      game.Players.LocalPlayer.CameraMaxZoomDistance = 200
    end)
    r33_1024:Toggle("Infinite Jump", function(r0_1084)
      -- line: [0, 0] id: 1084
      getgenv().InfiniteJumpEnabled = r0_1084
      game:GetService("UserInputService").JumpRequest:connect(function()
        -- line: [0, 0] id: 1085
        if InfiniteJumpEnabled == true then
          game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
      end)
    end)
    r33_1024:Toggle("Auto jump", function(r0_1363)
      -- line: [0, 0] id: 1363
      J = r0_1363
      spawn(function()
        -- line: [0, 0] id: 1364
        while wait() do
          local r0_1364 = J
          if r0_1364 then
            r0_1364 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            r0_1364.Jump = true
          else
            break
          end
        end
      end)
    end)
    r33_1024:Toggle("Fov", function(r0_1245)
      -- line: [0, 0] id: 1245
      if r0_1245 then
        game.Workspace.CurrentCamera.FieldOfView = 120
      else
        game.Workspace.CurrentCamera.FieldOfView = 70
      end
    end)
    r33_1024:Button("Reset Character", function()
      -- line: [0, 0] id: 1213
      game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)
    r33_1024:Toggle("Noclip [Beta]", function(r0_1273)
      -- line: [0, 0] id: 1273
      getgenv().noclipEnabled = r0_1273
      game:GetService("RunService").Stepped:connect(function()
        -- line: [0, 0] id: 1274
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(noclip)
        if noclipEnabled == true then
          local r0_1274 = true
          local r1_1274 = game.Players.LocalPlayer
          for r6_1274, r7_1274 in pairs((r1_1274.Character or r1_1274.CharacterAdded:Wait()):GetDescendants()) do
            pcall(function()
              -- line: [0, 0] id: 1275
              if r7_1274:IsA("BasePart") then
                r7_1274.CanCollide = false
              end
            end)
            -- close: r6_1274
          end
        end
        game:GetService("RunService").Stepped:wait()
      end)
    end)
    r33_1024:Button("No Clip | Press E To Use", function()
      -- line: [0, 0] id: 1320
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/No%20Clip"))()
    end)
    r33_1024:Button("Shift Lock", function()
      -- line: [0, 0] id: 1326
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Shiftlock"))()
    end)
    r33_1024:Button("Console Button", function()
      -- line: [0, 0] id: 1107
      local r0_1107 = Instance.new("ScreenGui")
      r0_1107.Name = "console"
      r0_1107.Parent = game.CoreGui
      local r1_1107 = Instance.new("TextButton")
      r1_1107.Name = "button"
      r1_1107.Parent = r0_1107
      r1_1107.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      r1_1107.BackgroundTransparency = 0.5
      r1_1107.Position = UDim2.new(0, 105, 0, -32)
      r1_1107.Size = UDim2.new(0, 32, 0, 32)
      r1_1107.Text = "< >"
      r1_1107.TextColor3 = Color3.fromRGB(200, 200, 200)
      r1_1107.Font = "Code"
      r1_1107.TextSize = 15
      local r2_1107 = Instance.new("UICorner")
      r2_1107.CornerRadius = UDim.new(0, 8)
      r2_1107.Parent = r1_1107
      r1_1107.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 1108
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9", false, game)
      end)
    end)
    r33_1024:Button("Fly | Pc", function()
      -- line: [0, 0] id: 1234
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script"))()
    end)
    r33_1024:Button("Fps Booster", function()
      -- line: [0, 0] id: 1025
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/FpsBooster"))()
    end)
    r33_1024:Button("Ping Counter", function()
      -- line: [0, 0] id: 1117
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ping"))()
    end)
    r33_1024:Button("Fps Counter", function()
      -- line: [0, 0] id: 1125
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fps"))()
    end)
    r33_1024:Button("Anti Afk", function()
      -- line: [0, 0] id: 1187
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Anti-Afk-Remastered-Script-or-Diffrent-Cool-UI-2097"))()
    end)
    r33_1024:Button("Anti Fling", function()
      -- line: [0, 0] id: 1392
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Anti%20Fling", true))()
    end)
    r33_1024:Button("Fling With No Collision", function()
      -- line: [0, 0] id: 1279
      loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/544f7efbe88235666b5b7add65b7344d/raw/f20804bb85542dcc3bc938982e1f05b7ff05cded/FE%2520Hat%2520Fling"))()
    end)
    r33_1024:Button("Guardian", function()
      -- line: [0, 0] id: 1199
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
    end)
    r33_1024:Section("Guis")
    r33_1024:Button("Walk Speed Gui", function()
      -- line: [0, 0] id: 1143
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Walk-Speed-Gui"))()
    end)
    r33_1024:Button("Jump Power Gui", function()
      -- line: [0, 0] id: 1316
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Jump-Power-Gui"))()
    end)
    r33_1024:Button("Gravity Gui", function()
      -- line: [0, 0] id: 1224
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Gravity-Gui"))()
    end)
    r33_1024:Button("Fov Gui", function()
      -- line: [0, 0] id: 1126
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fov-Gui"))()
    end)
    r33_1024:Button("Fly Gui | Mobile", function()
      -- line: [0, 0] id: 1455
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fly-New"))()
    end)
    r33_1024:Button("VFly", function()
      -- line: [0, 0] id: 1071
      loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end)
    r33_1024:Button("No Clip Gui", function()
      -- line: [0, 0] id: 1059
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/NoClip_Gui"))()
    end)
    r33_1024:Section("Esp/Hitbox")
    r38_1024 = workspace.CurrentCamera
    local r39_1024 = false
    r40_1024 = game:GetService("RunService")
    function lookAt(r0_1428, r1_1428)
      -- line: [0, 0] id: 1428
      r38_1024.CFrame = CFrame.new(r0_1428, r1_1428)
    end
    function getClosestPlayerToCursor(r0_1043)
      -- line: [0, 0] id: 1043
      local r2_1043 = math.huge
      local r1_1043 = nil	-- notice: implicit variable refs by block#[10]
      for r6_1043, r7_1043 in ipairs(game.Players:GetPlayers()) do
        if r7_1043 ~= game.Players.LocalPlayer and r7_1043.Character and r7_1043.Character:FindFirstChild(r0_1043) then
          local r9_1043, r10_1043 = r38_1024:WorldToViewportPoint(r7_1043.Character[r0_1043].Position)
          local r13_1043 = (Vector2.new(r9_1043.x, r9_1043.y) - Vector2.new(r38_1024.ViewportSize.x / 2, r38_1024.ViewportSize.y / 2)).magnitude
          if r13_1043 < r2_1043 and r10_1043 and r39_1024 and r13_1043 < 400 then
            r2_1043 = r13_1043
            r1_1043 = r7_1043
          end
        end
      end
      return r1_1043
    end
    r40_1024.RenderStepped:Connect(function()
      -- line: [0, 0] id: 1076
      local r0_1076 = getClosestPlayerToCursor("Head")
      if r39_1024 and r0_1076 and r0_1076.Character:FindFirstChild("Head") and r0_1076.TeamColor ~= game.Players.LocalPlayer.TeamColor and 0 < r0_1076.Character.Humanoid.Health and 99 < r0_1076.Character.HumanoidRootPart.Position.Y then
        lookAt(r38_1024.CFrame.p, r0_1076.Character.Head.Position + Vector3.new(0, -((game.Players.LocalPlayer.Character.Head.Position - r0_1076.Character.Head.Position)).magnitude / 4.2, 0))
      end
    end)
    r33_1024:Toggle("Aimbot [Beta]", function(r0_1130)
      -- line: [0, 0] id: 1130
      r39_1024 = r0_1130
    end)
    r33_1024:Button("Aimbot/SilentAim", function()
      -- line: [0, 0] id: 1233
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Aimbot_SilentAim"))()
    end)
    r33_1024:Button("Esp Box", function()
      -- line: [0, 0] id: 1227
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp%20Box"))()
    end)
    r33_1024:Button("Tracers", function()
      -- line: [0, 0] id: 1403
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Tracers"))()
    end)
    r33_1024:Button("Esp", function()
      -- line: [0, 0] id: 1161
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp"))()
    end)
    r33_1024:Button("Hitbox", function()
      -- line: [0, 0] id: 1413
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/HitBox"))()
    end)
    r33_1024:Section("Shader")
    r33_1024:Button("Realistic Shader", function()
      -- line: [0, 0] id: 1087
      loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
    end)
    r33_1024:Button("P Rtx", function()
      -- line: [0, 0] id: 1050
      loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))()
    end)
    r33_1024:Button("Pshade", function()
      -- line: [0, 0] id: 1218
      loadstring(game:HttpGet("https://pastebin.com/raw/Cd76B8Lh"))()
    end)
    r33_1024:Button("Chillz\'s Enhancer v0.2", function()
      -- line: [0, 0] id: 1461
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/enhancer.txt"))()
    end)
    r33_1024:Section("Time Changer")
    r33_1024:Button("Day | Night Cycle [Beta]", function()
      -- line: [0, 0] id: 1173
      loadstring(game:HttpGet("https://pastebin.com/raw/hiZMgnkc"))()
    end)
    local r43_1024 = "Textbox"
    r43_1024 = "Time Set"
    r33_1024:[r43_1024](r43_1024, "Set Game Time", function(r0_1327)
      -- line: [0, 0] id: 1327
      game.Lighting.TimeOfDay = r0_1327
    end)
    r33_1024:Dropdown("Game Time", {
      "Morning | 6:00 AM",
      "Morning | 9:00 AM",
      "Noon | 12:00 PM",
      "Afternoon | 3:00 PM",
      "Evening | 6:00 PM",
      "Night | 9:00 PM",
      "Midnight | 12:00 AM",
      "Midnight | 3:00 AM"
    }, function(r0_1250)
      -- line: [0, 0] id: 1250
      if r0_1250 == "Morning | 6:00 AM" then
        game.Lighting.TimeOfDay = 6
      elseif r0_1250 == "Morning | 9:00 AM" then
        game.Lighting.TimeOfDay = 9
      elseif r0_1250 == "Noon | 12:00 PM" then
        game.Lighting.TimeOfDay = 12
      elseif r0_1250 == "Afternoon | 3:00 PM" then
        game.Lighting.TimeOfDay = 15
      elseif r0_1250 == "Evening | 6:00 PM" then
        game.Lighting.TimeOfDay = 18
      elseif r0_1250 == "Night | 9:00 PM" then
        game.Lighting.TimeOfDay = 21
      elseif r0_1250 == "Midnight | 12:00 AM" then
        game.Lighting.TimeOfDay = 24
      elseif r0_1250 == "Midnight | 3:00 AM" then
        game.Lighting.TimeOfDay = 3
      end
    end)
    r33_1024:Section("Server")
    r33_1024:Button("Rejoin(Join Same Server)", function()
      -- line: [0, 0] id: 1232
      game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end)
    r33_1024:Button("ServerHop", function()
      -- line: [0, 0] id: 1118
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Rejoin"))()
    end)
    r33_1024:Button("Rejoin Button", function()
      -- line: [0, 0] id: 1372
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts-2/main/rejoin%20button%20for%20kick%20message.lua", true))()
    end)
    r33_1024:Section("Other")
    r33_1024:Button("Backdoor.exe", function()
      -- line: [0, 0] id: 1332
      loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua"))()
    end)
    r33_1024:Button("Break Camera Script", function()
      -- line: [0, 0] id: 1149
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r33_1024:Button("Bt Tools", function()
      -- line: [0, 0] id: 1032
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bt%20Tools"))()
    end)
    r33_1024:Button("Camera Spy", function()
      -- line: [0, 0] id: 1366
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/CameraSpy/main/Script", true))()
    end)
    r33_1024:Button("Chat Spam", function()
      -- line: [0, 0] id: 1256
      loadstring(game:HttpGet("https://pastebin.com/raw/8Htx56Ab"))()
    end)
    r33_1024:Button("Dex 2.0", function()
      -- line: [0, 0] id: 1128
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    r33_1024:Button("Dex 4", function()
      -- line: [0, 0] id: 1453
      loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/dexV4/main/main.lua"))()
    end)
    r33_1024:Button("F3x", function()
      -- line: [0, 0] id: 1095
      loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)
    r33_1024:Button("Fog Spawner", function()
      -- line: [0, 0] id: 1049
      loadstring(game:HttpGet("https://pastebin.com/raw/bxgUc8BX"))()
    end)
    r33_1024:Button("FraktureSS", function()
      -- line: [0, 0] id: 1300
      loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/source.lua", true))()
    end)
    r33_1024:Button("Free Cam | Best", function()
      -- line: [0, 0] id: 1399
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    r33_1024:Button("Free Cam", function()
      -- line: [0, 0] id: 1336
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r33_1024:Button("Freeze Camera Script", function()
      -- line: [0, 0] id: 1206
      loadstring(game:HttpGet("https://pastebin.com/raw/T0S0RPTW"))()
    end)
    r33_1024:Button("GreenScreen Gui", function()
      -- line: [0, 0] id: 1091
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Green%20Screen"))()
    end)
    r33_1024:Button("Keyboard", function()
      -- line: [0, 0] id: 1393
      loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    r33_1024:Button("Keyboard v3", function()
      -- line: [0, 0] id: 1045
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/mobkeyboardv3"))()
    end)
    r33_1024:Button("Keystrokes Gui v2", function()
      -- line: [0, 0] id: 1171
      loadstring(game:HttpGet("https://pastefy.app/Te4dwSw2/raw", true))()
    end)
    r33_1024:Button("Mouse Cursor V2", function()
      -- line: [0, 0] id: 1311
      loadstring(game:HttpGet("https://pastefy.ga/58d8d52G/raw", true))()
    end)
    r33_1024:Button("Multi Tools", function()
      -- line: [0, 0] id: 1215
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/MultiToolsV1/main/script"))()
    end)
    r33_1024:Button("Platform", "Platform", function()
      -- line: [0, 0] id: 1092
      local r0_1092 = Instance.new("Part", workspace)
      local r1_1092 = game:GetService("TweenService")
      r0_1092.Anchored = true
      r0_1092.CanCollide = true
      r0_1092.Size = Vector3.new(5.246, 0.271, 4.852)
      _G.e = true
      while _G.e == true do
        wait()
        r1_1092:Create(r0_1092, TweenInfo.new(0.2), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0),
        }):Play()
      end
    end)
    r33_1024:Button("Rainbow Map", function()
      -- line: [0, 0] id: 1456
      -- notice: unreachable block#5
      while true do
        for r3_1456, r4_1456 in ipairs(workspace:GetDescendants()) do
          if r4_1456:IsA("BasePart") then
            r4_1456.BrickColor = BrickColor.new(Color3.new(math.random(), math.random(), math.random()))
          end
        end
        wait(0.5)
      end
    end)
    r33_1024:Button("Realistic First Person", function()
      -- line: [0, 0] id: 1295
      local r1_1295 = "Pastefy"
      local r2_1295 = "bwTjFg4P"
      local r3_1295 = "7wTjFg4P"
      local r4_1295 = "kTjGhS9L"
      local r5_1295 = "d2RcPf6T"
      local r6_1295 = "7nWrEg5Q"
      local r7_1295 = "p9JhTd4B"
      local r8_1295 = "r8CjQf3N"
      local r9_1295 = "s2CkRd6W"
      local r10_1295 = "v5PhZg8L"
      local r11_1295 = "3sQjRf5T"
      local r13_1295 = "o7KjXg4L"
      local r14_1295 = "t9GnQd1R"
      local r15_1295 = "y6LmSf2N"
      local r16_1295 = "x3QjDg6P"
      local r17_1295 = "c4VmLb8N"
      local r18_1295 = "z2PkTf5J"
      local r19_1295 = "e8LcGh9E"
      local r20_1295 = "k5RfPd2W"
      local r21_1295 = "2qFdRg7M"
      local r22_1295 = "i2QbLh8S"
      local r23_1295 = "g6ScTd3N"
      local r24_1295 = "w9LbRf5G"
      local r25_1295 = "b4NjDc7M"
      loadstring(game:HttpGet("https://paste" .. "f" .. "" .. "y" .. "" .. ".app/" .. "NpDhqikw" .. "/raw", true))()
    end)
    r33_1024:Button("Remote Spy v2", function()
      -- line: [0, 0] id: 1411
      loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
    end)
    r33_1024:Button("Sound Player", function()
      -- line: [0, 0] id: 1304
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
    end)
    r33_1024:Button("Spectate", function()
      -- line: [0, 0] id: 1469
      loadstring(game:HttpGet("https://pastebin.com/raw/wyvdb7gr"))()
    end)
    r33_1024:Button("Speed Tool", function()
      -- line: [0, 0] id: 1361
      loadstring(game:HttpGet("https://pastebin.com/raw/iShZQHw7"))()
    end)
    r33_1024:Button("Studs Walked Gui", function()
      -- line: [0, 0] id: 1308
      local r0_1308 = game.Players.LocalPlayer
      local r1_1308 = r0_1308:WaitForChild("PlayerGui")
      local r2_1308 = Instance.new("ScreenGui")
      r2_1308.Parent = r1_1308
      r2_1308.ResetOnSpawn = false
      local r3_1308 = Instance.new("TextLabel")
      r3_1308.Name = "DistanceLabel"
      r3_1308.Parent = r2_1308
      r3_1308.Size = UDim2.new(0, 200, 0, 50)
      r3_1308.Position = UDim2.new(0.5, -100, 0, 20)
      r3_1308.BackgroundTransparency = 1
      r3_1308.Font = Enum.Font.Gotham
      r3_1308.TextSize = 18
      r3_1308.TextColor3 = Color3.new(1, 1, 1)
      r3_1308.Text = "Distance walked: 0 studs"
      (function()
        -- line: [0, 0] id: 1309
        -- notice: unreachable block#4
        local r1_1309 = (r0_1308.Character or r0_1308.CharacterAdded:Wait()):WaitForChild("Humanoid")
        local r2_1309 = r1_1309.RootPart.Position
        local r3_1309 = 0
        while true do
          wait(0)
          local r4_1309 = r1_1309.RootPart.Position
          r2_1309 = r4_1309
          r3_1308.Text = "Distance walked: " .. math.floor(r3_1309 + (r4_1309 - r2_1309).Magnitude) .. " studs"
        end
        goto label_33	-- block#4 is visited secondly
      end)()
    end)
    r33_1024:Button("Super Tools", function()
      -- line: [0, 0] id: 1391
      loadstring(game:HttpGet("https://pastebin.com/raw/sQWeMuB0"))()
    end)
    r33_1024:Button("Telescope gui", function()
      -- line: [0, 0] id: 1230
      loadstring(game:HttpGet("https://pastebin.com/raw/8T0STS4f"))()
    end)
    r33_1024:Button("Tool Giver V2 Script", function()
      -- line: [0, 0] id: 1124
      loadstring(game:HttpGet("https://pastebin.com/raw/Fj8KWmLC"))()
    end)
    r33_1024:Button("Tp Tool", function()
      -- line: [0, 0] id: 1296
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TP-TOOL-8406"))()
    end)
    r33_1024:Button("Torch Tool", function()
      -- line: [0, 0] id: 1046
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/77_LYGCA1V7C3RWMJ.lua"), true)()
    end)
    r33_1024:Button("TweenTeleporter", function()
      -- line: [0, 0] id: 1129
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/TweenTeleporter"))()
    end)
    r33_1024:Button("Unanchored To Player Gui", function()
      -- line: [0, 0] id: 1368
      loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 1369
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end)
    end)
    loadstring(game:HttpGet("https://pastefy.app/bPRh3uL4/raw"))()
    local r41_1024 = r9_1024:Tab("Settings")
    r41_1024:Section("Settings")
    r41_1024:Toggle("Hide/Show Watermark", function(r0_1060)
      -- line: [0, 0] id: 1060
      if r0_1060 then
        r23_1024.Visible = false
      else
        r23_1024.Visible = true
      end
    end)
    r41_1024:Toggle("Hide/Show Toggle", function(r0_1144)
      -- line: [0, 0] id: 1144
      if r0_1144 then
        r27_1024.Visible = false
      else
        r27_1024.Visible = true
      end
    end)
    r41_1024:Button("Destroy Script", function()
      -- line: [0, 0] id: 1312
      r22_1024:Destroy()
      r26_1024:Destroy()
      r8_1024:Destroy()
    end)
    r41_1024:Section("Other")
    r41_1024:Button("Feedback", function()
      -- line: [0, 0] id: 1452
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Feedback"))()
    end)
    r41_1024:Button("Suggestion", function()
      -- line: [0, 0] id: 1382
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Suggestion"))()
    end)
    r41_1024:Button("Bug-Report", function()
      -- line: [0, 0] id: 1061
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bug-Report"))()
    end)
    local r42_1024 = r9_1024:Tab("Showcaser")
    r42_1024:Section("Showcasers")
    r42_1024:Button("HE_flash", function()
      -- line: [0, 0] id: 1306
      setclipboard("https://youtube.com/@Heflashh")
    end)
    r42_1024:Button("JN HH Gaming", function()
      -- line: [0, 0] id: 1474
      setclipboard("https://youtube.com/@JNHHGaming")
    end)
    r42_1024:Button("A2br", function()
      -- line: [0, 0] id: 1389
      setclipboard("https://youtube.com/@Abrahamvideogames")
    end)
    r42_1024:Button("GHacks Script", function()
      -- line: [0, 0] id: 1258
      setclipboard("https://youtube.com/@Ghacks_script")
    end)
    r42_1024:Button("Scripter Gaming", function()
      -- line: [0, 0] id: 1406
      setclipboard("https://youtube.com/@Scripter_Gaming")
    end)
    r42_1024:Button("ZXZpigXD", function()
      -- line: [0, 0] id: 1110
      setclipboard("https://youtube.com/@zxzpigxd3465")
    end)
    r42_1024:Button("Mobile Scripts", function()
      -- line: [0, 0] id: 1209
      setclipboard("https://youtube.com/@RobloxScript23")
    end)
    r42_1024:Button("Py Xd", function()
      -- line: [0, 0] id: 1345
      setclipboard("https://youtube.com/@PYXD")
    end)
    r42_1024:Button("Xtreme/Zephyr", function()
      -- line: [0, 0] id: 1223
      setclipboard("https://youtube.com/@XtremeScripts")
    end)
    r42_1024:Button("Arceus Script Showcaser", function()
      -- line: [0, 0] id: 1058
      setclipboard("https://youtube.com/@ArceusxScriptShowcaser")
    end)
    r42_1024:Button("Alkaid Scripts", function()
      -- line: [0, 0] id: 1122
      setclipboard("https://youtube.com/@AlkaidScriptYT")
    end)
    r42_1024:Button("ScyMe", function()
      -- line: [0, 0] id: 1055
      setclipboard("https://youtube.com/@ScyMeet")
    end)
    r42_1024:Button("Zeltas Script Yt", function()
      -- line: [0, 0] id: 1214
      setclipboard("https://youtube.com/@Zeltas_Script_yt")
    end)
    r42_1024:Button("XHackerPlusX", function()
      -- line: [0, 0] id: 1139
      setclipboard("https://youtube.com/@XHackerPlusX_YT")
    end)
    r42_1024:Button("Ervin Scripts", function()
      -- line: [0, 0] id: 1251
      setclipboard("https://youtube.com/@ervin607")
    end)
    r42_1024:Button("Pkxdjosh56", function()
      -- line: [0, 0] id: 1093
      setclipboard("https://youtube.com/@cube_nothing")
    end)
    r42_1024:Button("Yournerby", function()
      -- line: [0, 0] id: 1062
      setclipboard("https://youtube.com/@yournerby")
    end)
    r42_1024:Button("Zenzy Scripts", function()
      -- line: [0, 0] id: 1135
      setclipboard("https://youtube.com/@zenzyscripts")
    end)
    r42_1024:Button("NOT QUI - Hax", function()
      -- line: [0, 0] id: 1261
      setclipboard("https://youtube.com/@Dscyte")
    end)
    r42_1024:Button("K00pzskidd", function()
      -- line: [0, 0] id: 1140
      setclipboard("https://youtube.com/@k00pzskidd")
    end)
    r42_1024:Section("Note")
    r42_1024:Button("If you already showcased this script and you\'re not\nhere comment on my latest video", function()
      -- line: [0, 0] id: 1253
    end)
    r43_1024 = r9_1024:Tab("Credits")
    r43_1024:Label("✦ Externality Made In Heaven")
    r43_1024:Button("YouTube Channel", function()
      -- line: [0, 0] id: 1127
      setclipboard("https://www.youtube.com/@GamerScripter")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r43_1024:Button("Discord", function()
      -- line: [0, 0] id: 1460
      setclipboard("https://discord.gg/H4E277MV6c")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r43_1024:Label("Crafted with ♥ by the Externality Team")
    local r44_1024 = r9_1024:Tab("Update Log")
    r44_1024:Label("[+] Added More Scripts In Games")
    r44_1024:Label("[+] Added More Scripts In Hub | Gui")
    r44_1024:Label("[+] Added More Scripts In Fe")
    r44_1024:Label("[+] Added More Scripts In Other")
    r44_1024:Label("[+] New Chooser")
    r44_1024:Label("[+] Showcaser Tab Has Been Updated")
    r44_1024:Label("[–] Removed Script That\'s Not Working")
  end)
  r13_2.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 1475
    animateOut()
    wait()
    local r0_1475 = Instance.new("Sound", workspace)
    r0_1475.PlaybackSpeed = 1.5
    r0_1475.Volume = 0.88
    r0_1475.SoundId = "rbxassetid://170765130"
    r0_1475.PlayOnRemove = true
    r0_1475:Destroy()
    local r1_1475 = Instance.new("ScreenGui")
    local r2_1475 = Instance.new("Frame")
    local r3_1475 = Instance.new("UICorner")
    local r4_1475 = Instance.new("TextLabel")
    local r5_1475 = Instance.new("TextLabel")
    r1_1475.Name = "Notification"
    r1_1475.Parent = game.CoreGui
    r1_1475.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r2_1475.Name = "Frame"
    r2_1475.Parent = r1_1475
    r2_1475.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r2_1475.BackgroundTransparency = 0
    r2_1475.BorderSizePixel = 0
    r2_1475.Position = UDim2.new(1, 0, 0.9, -45)
    r2_1475.Size = UDim2.new(0, 175, 0, 80)
    r3_1475.Parent = r2_1475
    r4_1475.Name = "Title"
    r4_1475.Parent = r2_1475
    r4_1475.BackgroundTransparency = 1
    r4_1475.Position = UDim2.new(0, 11, 0, 4)
    r4_1475.Size = UDim2.new(1, -20, 0, 30)
    r4_1475.Font = Enum.Font.SourceSansBold
    r4_1475.Text = "Externality Made In Heaven"
    r4_1475.TextColor3 = Color3.fromRGB(255, 255, 255)
    r4_1475.TextSize = 20
    r5_1475.Name = "Description"
    r5_1475.Parent = r2_1475
    r5_1475.BackgroundTransparency = 1
    r5_1475.Position = UDim2.new(0, 12, 0, 25)
    r5_1475.Size = UDim2.new(1, -20, 0, 50)
    r5_1475.Font = Enum.Font.SourceSans
    r5_1475.Text = "Externality Made In Heaven · Premium"
    r5_1475.TextColor3 = Color3.fromRGB(255, 255, 255)
    r5_1475.TextSize = 16
    r5_1475.TextWrapped = true
    coroutine.wrap(function()
      -- line: [0, 0] id: 1976
      local r0_1976 = Instance.new("LocalScript", r2_1475)
      wait()
      r0_1976.Parent:TweenPosition(UDim2.new(0.9, -85, 0.9, -45), "Out", "Quad", 0.5, true)
    end)()
    wait(3)
    coroutine.wrap(function()
      -- line: [0, 0] id: 2006
      local r0_2006 = Instance.new("LocalScript", r2_1475)
      wait()
      r0_2006.Parent:TweenPosition(UDim2.new(1, -0, 0.9, -45), "Out", "Quad", 0.5, true)
      wait(0.5)
      r1_1475:Destroy()
    end)()
    wait()
    local r8_1475 = {
      SchemeColor = Color3.fromRGB(64, 64, 64),
      Background = Color3.fromRGB(0, 0, 0),
      Header = Color3.fromRGB(0, 0, 0),
      TextColor = Color3.fromRGB(255, 255, 255),
      ElementColor = Color3.fromRGB(20, 20, 20),
    }
    local r9_1475 = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ui-Lib/Old-Ui-Dark"))()
    local r10_1475 = r9_1475.CreateLib("Externality Made In Heaven", r8_1475)
    local r11_1475 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local r12_1475 = game.PlaceId
    local r14_1475 = game:GetService("Players").LocalPlayer
    local r15_1475 = r14_1475.Name
    local r16_1475 = r14_1475.DisplayName
    local r17_1475 = r14_1475.UserId
    local r18_1475 = r14_1475.Character
    local r19_1475 = r14_1475.AccountAge
    local r20_1475 = #game.Players:GetPlayers()
    local r21_1475 = identifyexecutor() or "unknown"
    local r22_1475 = ""
    if game:GetService("UserInputService").GamepadEnabled then
      r22_1475 = "Controller"
    elseif game:GetService("UserInputService").TouchEnabled then
      r22_1475 = "Mobile"
    else
      r22_1475 = "PC"
    end
    local r23_1475 = Instance.new("ScreenGui")
    local r24_1475 = Instance.new("TextLabel")
    r23_1475.Name = "EXT_Watermark"
    r23_1475.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r23_1475.ResetOnSpawn = false
    r24_1475.Parent = r23_1475
    r24_1475.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r24_1475.BackgroundTransparency = 1
    r24_1475.BorderSizePixel = 0
    r24_1475.Position = UDim2.new(-0.000662226602, 0, 0.0143558267, 0)
    r24_1475.Size = UDim2.new(10, 0, 0, 20)
    r24_1475.Font = Enum.Font.GothamBold
    r24_1475.Text = "  ✦ Externality Made In Heaven  "
    r24_1475.TextColor3 = Color3.fromRGB(255, 255, 255)
    r24_1475.TextScaled = true
    r24_1475.TextSize = 15
    r24_1475.TextXAlignment = Enum.TextXAlignment.Left
    local r25_1475 = 0
    local r26_1475 = 0.01
    game:GetService("RunService").RenderStepped:Connect(function()
      -- line: [0, 0] id: 1773
      r25_1475 = (r25_1475 + r26_1475) % 1
      r24_1475.TextColor3 = Color3.fromHSV(r25_1475, 1, 1)
    end)
    local r27_1475 = Instance.new("ScreenGui")
    local r28_1475 = Instance.new("TextButton")
    local r29_1475 = Instance.new("UICorner")
    r27_1475.Name = "ScreenGui"
    r27_1475.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r27_1475.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r27_1475.ResetOnSpawn = false
    r28_1475.Name = "Toggle"
    r28_1475.Parent = r27_1475
    r28_1475.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r28_1475.Position = UDim2.new(0, 50, 0, 34)
    r28_1475.Size = UDim2.new(0, 45, 0, 28)
    r28_1475.Font = Enum.Font.SourceSansBold
    r28_1475.Text = "Externality Made In Heaven"
    r28_1475.TextColor3 = Color3.fromRGB(64, 64, 64)
    r28_1475.TextSize = 14
    r28_1475.TextWrapped = true
    r28_1475.ZIndex = 16
    r28_1475.Draggable = true
    r28_1475.MouseButton1Click:connect(function()
      -- line: [0, 0] id: 1684
      r9_1475:Toggle()
    end)
    r29_1475.Parent = r28_1475
    local r31_1475 = r10_1475:Tab("Home"):Section("Welcome " .. r16_1475 .. " To Externality Made In Heaven")
    r31_1475:Label("Username: " .. r15_1475 .. "")
    r31_1475:Label("Display Name: " .. r16_1475 .. "")
    r31_1475:Label("User Id: " .. r17_1475 .. "")
    r31_1475:Label("Account Age: " .. r19_1475 .. "")
    r31_1475:Label("Executor: " .. r21_1475 .. "")
    r31_1475:Label("Device: " .. r22_1475 .. "")
    r31_1475:Label("──────────────────────────────")
    r31_1475:Label("Externality Made In Heaven — Premium Edition")
    local r32_1475 = r10_1475:Tab("Games")
    local r33_1475 = r32_1475:Section("Current Game")
    r33_1475:Button("Game: " .. r11_1475 .. " | " .. r12_1475 .. "", "", function()
      -- line: [0, 0] id: 1776
    end)
    r33_1475:Label("Games")
    local r34_1475 = nil
    function AdoptMe()
      -- line: [0, 0] id: 1920
      return r34_1475
    end
    function AdoptMeOption()
      -- line: [0, 0] id: 1799
      if AdoptMe() == "Eazvy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/Eazvy-Hub/main/GameLoader.lua"))()
      elseif AdoptMe() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_1799 = loadstring
        local r1_1799 = request
        if not r1_1799 then
          r1_1799 = http_request
          if not r1_1799 then
            r1_1799 = http
            if r1_1799 then
              r1_1799 = http.request or syn and syn.request
            else
              goto label_33	-- block#7 is visited secondly
            end
          end
        end
        local r3_1799 = tostring
        local r4_1799 = "https://api.eclipsehub.xyz/auth"
        assert(r0_1799 and r1_1799, "Executor not Supported")
        r0_1799(r1_1799({
          Url = r4_1799 .. "?key=" .. r3_1799(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif AdoptMe() == "Ice Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
      elseif AdoptMe() == "Prodigy X" then
        loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
      elseif AdoptMe() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif AdoptMe() == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_1475:Dropdown("Adopt Me", "Credits to Owner", {
      "Eazvy Hub",
      "Eclipse Hub",
      "Ice Hub",
      "Prodigy X",
      "Speed Hub X",
      "V.G Hub"
    }, function(r0_1912)
      -- line: [0, 0] id: 1912
      r34_1475 = r0_1912
      AdoptMeOption()
    end)
    local r35_1475 = nil
    function AllStar()
      -- line: [0, 0] id: 1602
      return r35_1475
    end
    function AllStarOption()
      -- line: [0, 0] id: 2025
      if AllSta() == "KarmaPanda" then
        loadstring(game:HttpGet("https://script.karmapanda.dev/"))()
      elseif AllSta() == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end
    r33_1475:Dropdown("All Star Tower Defense", "Credits to Owner", {
      "KarmaPanda",
      "Trap Hub"
    }, function(r0_1746)
      -- line: [0, 0] id: 1746
      r35_1475 = r0_1746
      AllStarOption()
    end)
    local r36_1475 = nil
    function Adventures()
      -- line: [0, 0] id: 1514
      return r36_1475
    end
    function AdventuresOption()
      -- line: [0, 0] id: 1756
      if AnimeAd() == "Anime Adventures by Craymel02" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures.lua"))()
      elseif AnimeAd() == "Arpon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures_v2__Beta.lua"))()
      elseif AnimeAd() == "Crimson Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/C_Loader"))()
      elseif AnimeAd() == "Keybrew Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borntodiekuv/KeybrewHub/main/AA"))()
      elseif AnimeAd() == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end
    r33_1475:Dropdown("Anime Adventures", "Credits to Owner", {
      "Anime Adventures by Craymel02",
      "Arpon Hub",
      "Crimson Hub",
      "Keybrew Hub",
      "Trap Hub"
    }, function(r0_1643)
      -- line: [0, 0] id: 1643
      r36_1475 = r0_1643
      AdventuresOption()
    end)
    local r37_1475 = nil
    function Champions()
      -- line: [0, 0] id: 1933
      return r37_1475
    end
    function AnimeOption()
      -- line: [0, 0] id: 1748
      if AnimeChampions() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif AnimeChampions() == "Fazium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Fazium-files/main/Loader"))()
      elseif AnimeChampions() == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/HarPy_loader.lua"))()
      elseif AnimeChampions() == "Krzysztof Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrzysztofHub/script/main/loader.lua"))()
      elseif AnimeChampions() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      elseif AnimeChampions() == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/Perfectus-Hub/main/perfectus-hub"))()
      elseif AnimeChampions() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif AnimeChampions() == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/ACS"))()
      end
    end
    r33_1475:Dropdown("Anime Champions Simulator", "Credits to Owner", {
      "Banana Hub",
      "Fazium Hub",
      "HarPy",
      "Krzysztof Hub",
      "Muimi Hub",
      "Perfectus Hub",
      "Sky Hub",
      "Yuto Hub"
    }, function(r0_1579)
      -- line: [0, 0] id: 1579
      r37_1475 = r0_1579
      AnimeOption()
    end)
    local r38_1475 = nil
    function Dimensions()
      -- line: [0, 0] id: 1793
      return r38_1475
    end
    function DimensionsOption()
      -- line: [0, 0] id: 1648
      if AnimeDi() == "Anime Ghost" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ghost-home/public/main/AnimeGhost.lua", true))()
      elseif AnimeDi() == "Bird Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheWitch-BirdHub/BirdHubv0.1/main/load"))()
      elseif AnimeDi() == "Intruders" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lifaiossama/errors/main/Intruders.html"))()
      elseif AnimeDi() == "Itachi" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      end
    end
    r33_1475:Dropdown("Anime Dimensions", "Credits to Owner", {
      "Anime Ghost",
      "Bird Hub",
      "Intruders",
      "Itachi"
    }, function(r0_1961)
      -- line: [0, 0] id: 1961
      r38_1475 = r0_1961
      DimensionsOption()
    end)
    local r39_1475 = nil
    function Fighters()
      -- line: [0, 0] id: 1624
      return r39_1475
    end
    function FightersOption()
      -- line: [0, 0] id: 1893
      if AnimeFi() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif AnimeFi() == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif AnimeFi() == "SSJ3 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Gohan9k/ANFSnew/main/GOHANSSJ3"))()
      elseif AnimeFi() == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/afss"))()
      elseif AnimeFi() == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end
    r33_1475:Dropdown("Anime Fighters Simulator", "Credits to Owner", {
      "Banana Hub",
      "Platinium Hub",
      "SSJ3 Hub",
      "Yuto Hub",
      "Zer0 Hub"
    }, function(r0_1924)
      -- line: [0, 0] id: 1924
      r39_1475 = r0_1924
      FightersOption()
    end)
    local r40_1475 = nil
    function Fightersx()
      -- line: [0, 0] id: 1724
      return r40_1475
    end
    function FightersxOption()
      -- line: [0, 0] id: 1892
      if AnimeFix() == "Blox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/malicious-dev/RobloxScripting/main/AFSX.lua", true))()
      elseif AnimeFix() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/AnimeFightingX"))()
      elseif AnimeFix() == "Project Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IkkyyDF/ProjectNexus/main/Loader.lua"))()
      elseif AnimeFix() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      end
    end
    r33_1475:Dropdown("Anime Fighting Simulator X", "Credits to Owner", {
      "Blox Hub",
      "Muimi Hub",
      "Project Nexus",
      "Sky Hub"
    }, function(r0_1711)
      -- line: [0, 0] id: 1711
      r40_1475 = r0_1711
      FightersxOption()
    end)
    local r41_1475 = nil
    function Warriors()
      -- line: [0, 0] id: 1656
      return r41_1475
    end
    function WarriorsOption()
      -- line: [0, 0] id: 1876
      if AnimeWar() == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/AnimeWarriorsSimulator2.lua"))()
      elseif AnimeWar() == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end
    r33_1475:Dropdown("Anime Warriors Simulator 2", "Credits to Owner", {
      "JumbleScripts",
      "Verny Hub V2"
    }, function(r0_1675)
      -- line: [0, 0] id: 1675
      r41_1475 = r0_1675
      WarriorsOption()
    end)
    local r42_1475 = nil
    function Wrestler()
      -- line: [0, 0] id: 1908
      return r42_1475
    end
    function WrestlerOption()
      -- line: [0, 0] id: 1958
      if WrestlerSim() == "Flame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/flame/main/loader"))()
      elseif WrestlerSim() == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/script.lua"))()
      elseif WrestlerSim() == "Kenniel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Arm-Wrestle-Simulator-Script/main/Arm-Wrestle-Simulator-Script", true))()
      elseif WrestlerSim() == "LDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS"))()
      elseif WrestlerSim() == "Legacy HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/arm7/main/wrestling"))()
      elseif WrestlerSim() == "Linear Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoolovr/Linear-Hub/main/loader.lua"))()
      elseif WrestlerSim() == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/main.lua"))()
      elseif WrestlerSim() == "Nebula Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Saitamahaah/SaitaHub/main/NebulaHub"))()
      elseif WrestlerSim() == "Pikachu Hun" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()
      elseif WrestlerSim() == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif WrestlerSim() == "Screech Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/screech/main/AWS"))()
      elseif WrestlerSim() == "Skull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/SkullHub/main/Loader.lua"))()
      elseif WrestlerSim() == "Spirit Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/gay-scripts/main/Loader.lua"), true)()
      end
    end
    r33_1475:Dropdown("Arm Wrestler Simulator", "Credits to Owner", {
      "Flame Hub",
      "HarPy",
      "Kenniel",
      "LDS Hub",
      "Legend HandlesYT",
      "Linear Hub",
      "Muimi Hub",
      "Nebula Hub",
      "Pikachu Hub",
      "Project WD",
      "Screech Hub",
      "Skull Hub",
      "Spirit Hub"
    }, function(r0_1489)
      -- line: [0, 0] id: 1489
      r42_1475 = r0_1489
      WrestlerOption()
    end)
    local r43_1475 = nil
    function Arsenal()
      -- line: [0, 0] id: 2023
      return r43_1475
    end
    function ArsenOption()
      -- line: [0, 0] id: 1989
      if Arsenal() == "AdvanceTechV3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/UltimateCromaSin-Arsenal-Gui/main/AdvanceTechV3.lua"))()
      elseif Arsenal() == "Arsenal" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
      elseif Arsenal() == "DarkHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      elseif Arsenal() == "Faded" then
        _G.Toggles = "V"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
      elseif Arsenal() == "F2b Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif Arsenal() == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif Arsenal() == "Tiger-Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plutoguy/Tiger-Hub/main/loader.lua"))()
      elseif Arsenal() == "V.Ghub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_1475:Dropdown("Arsenal", "Credits to Owner", {
      "AdvanceTechV3",
      "Arsenal",
      "DarkHub",
      "Faded",
      "F2b Hub",
      "OwlHub",
      "Tiger-Hub",
      "V.Ghub"
    }, function(r0_1505)
      -- line: [0, 0] id: 1505
      r43_1475 = r0_1505
      ArsenOption()
    end)
    local r44_1475 = nil
    function BedW()
      -- line: [0, 0] id: 1794
      return r44_1475
    end
    function BedWarOption()
      -- line: [0, 0] id: 1481
      if BedWars() == "AURORA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XStormDeveloper/AuroraForRoblox/main/lua", true))()
      elseif BedWars() == "IceCat" then
        loadstring(game:HttpGet("https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars", true))()
      elseif BedWars() == "JH NN Gaming Bedwars V3.0" then
        loadstring(game:HttpGet("https://pastebin.com/raw/2HNVwUvm"))()
      elseif BedWars() == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif BedWars() == "SOFT BED" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iWxWxX2M", true))()
      elseif BedWars() == "SNOW X V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SNOW%20X%20V2"))()
      elseif BedWars() == "Future" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua", true))()
      elseif BedWars() == "Nightbed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedX/main/NightbedScriptLol/mostNightbed.lua", true))()
      elseif BedWars() == "Vape V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
      elseif BedWars() == "Vezt(Private)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/Vezt/main/Vezt%20-%20BedWars%20(Private).lua"))()
      elseif BedWars() == "Xrayon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dorukqpx/Xrayon/main/xrayonv2.lua", true))()
      end
    end
    r33_1475:Dropdown("Bed Wars", "Credits to Owner", {
      "AURORA",
      "IceCat",
      "JH NN Gaming Bedwars V3.0",
      "Raven B4",
      "SOFT BED",
      "SNOW X V2",
      "Future",
      "Nightbed",
      "Vape V4",
      "Vezt(Private)",
      "Xrayon"
    }, function(r0_1891)
      -- line: [0, 0] id: 1891
      r44_1475 = r0_1891
      BedWarOption()
    end)
    local r45_1475 = nil
    function BeeSwarm()
      -- line: [0, 0] id: 1621
      return r45_1475
    end
    function BeeSwarmOption()
      -- line: [0, 0] id: 1767
      if BeeSwarmSim() == "Blue Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
      elseif BeeSwarmSim() == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif BeeSwarmSim() == "Histy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
      elseif BeeSwarmSim() == "Kometa Hub" then
        loadstring(game:HttpGet("https://s.kometa.pw/kometa.lua"))()
      elseif BeeSwarmSim() == "Macro Hub" then
        loadstring(game:HttpGet("https://www.macrov2-script.xyz/macrov2.lua"))()
      elseif BeeSwarmSim() == "Pepsi Swarm" then
        loadstring(game:GetObjects("rbxassetid://4384103988")[1].Source)("Pepsi Swarm")
      end
    end
    r33_1475:Dropdown("Bee Swarm Simulator", "Credits to Owner", {
      "Blue Hub",
      "Cloud Hub",
      "Histy Hub",
      "Kometa Hub",
      "Macro Hub",
      "Pepsi Swarm"
    }, function(r0_1831)
      -- line: [0, 0] id: 1831
      r45_1475 = r0_1831
      BeeSwarmOption()
    end)
    local r46_1475 = nil
    function Blade()
      -- line: [0, 0] id: 1698
      return r46_1475
    end
    function BlaOption()
      -- line: [0, 0] id: 1879
      if BladeBall() == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif BladeBall() == "AlSploit" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/BladeBall"))()
      elseif BladeBall() == "Artis Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lightHubDev/ArtisZ/a6dd81c647a4b4a51b0ecee8fb868472d45eacad/Artis Z Main"))()
      elseif BladeBall() == "Auto Parry by FFJ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
      elseif BladeBall() == "Bedol Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/Loaders/main/Blade_Ball.lua"))()
      elseif BladeBall() == "Berserk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samirayt/Whitelist/main/Whitelist%20Pago"))()
      elseif BladeBall() == "Blade Ball" then
        loadstring(game:HttpGet("https://pastebin.com/raw/qxA2ETxy"))()
      elseif BladeBall() == "Darkrai Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-On-YouTube/main/Script%20Collection"))()
      elseif BladeBall() == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/ADjr564T"))()
        setclipboard("Key= 8oidGmQNhbiZdIFTWcIC")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif BladeBall() == "EminX Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
      elseif BladeBall() == "Freya Hub" then
        loadstring(game:HttpGet("https://pastefy.app/qpzOA8ZR/raw"))()
      elseif BladeBall() == "Fuji Hub" then
        loadstring(game:HttpGet("https://shz.al/~main/dread/Fuji-Hub/script"))()
      elseif BladeBall() == "Galaxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/fruEwHqY"))()
      elseif BladeBall() == "Hexa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brothinkimnoob/AUTO-PARRY-HEXA-V3/main/HEXA%20V3"))()
      elseif BladeBall() == "Lightux Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif BladeBall() == "Ln Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/No6No6No7yt/Lumin-Hub/main/BladeV4.lua"))()
      elseif BladeBall() == "Luy Hub" then
        loadstring(game:HttpGet("https://shz.al/~LUYHUB"))()
      elseif BladeBall() == "Mynhub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/MYNHUB/main/BLADEBALL"))()
      elseif BladeBall() == "Neo.x" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DomainXV3/NEO.X/main/Velocity.lua"))()
      elseif BladeBall() == "Neptune Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TopPlayzYT/BladeBall/main/open"))()
      elseif BladeBall() == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif BladeBall() == "Nextix Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/Nextix-Hub/main/Loader"))()
      elseif BladeBall() == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
      elseif BladeBall() == "Noob" then
        loadstring(game:HttpGet("https://pastebin.com/raw/sYWb0Uin"))()
      elseif BladeBall() == "Nova x Fusion Hub" then
        loadstring(game:HttpGet("https://pastefy.app/xOAWDWaA/raw"))()
      elseif BladeBall() == "OMG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BladeBall() == "Oxox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krnow1/Bladeball_g/main/Credits_krnow"))()
      elseif BladeBall() == "Prolex" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/1734a4ee207844b994df2f36157afacd/files/1e79ac12fc8a47ef8263d5e9d43b7137/raw"))()
      elseif BladeBall() == "R4mpage V4" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/c2ba80c243e04cdaba2926ef0b747d9d/files/4471c9e60f444ebb98927dc25c52e8c7/raw"))()
      elseif BladeBall() == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif BladeBall() == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/eng"))()
      elseif BladeBall() == "SaZx HubZ" then
        loadstring(game:HttpGet("https://pastefy.app/0r7T66Gx/raw"))()
      elseif BladeBall() == "ScriptX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/Blade-Ball-Working-Most-Latest/main/Blade%20Ball%20Script%20X%20v1", true))()
      elseif BladeBall() == "Sirius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/Siriusisbetter/main/xyz.bb.lua", true))()
      elseif BladeBall() == "Stellar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/LoaderScripts/main/LoaderScripts"))()
      elseif BladeBall() == "Symphony Hub" then
        local r0_1879 = loadstring
        local r1_1879 = request
        if not r1_1879 then
          r1_1879 = http_request
          if not r1_1879 then
            r1_1879 = http
            if r1_1879 then
              r1_1879 = http.request or syn and syn.request
            else
              goto label_457	-- block#75 is visited secondly
            end
          end
        end
        local r3_1879 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r0_1879 and r1_1879, "Your Executor does not support.")
        r0_1879(r1_1879({
          Url = r3_1879,
          Method = "GET",
        }).Body)()
      elseif BladeBall() == "THub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tibe0124/tibe0124/main/Thub-blade-ur-balls"))()
      elseif BladeBall() == "Visual" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevTravDYT/VisualProductV10/main/KeySystem/ThankForUsing!/by-d-e-v-t-r-a-v/lua", true))()
        setclipboard("IUseVisualFree")
        game:GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif BladeBall() == "Visualize" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif BladeBall() == "White Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/E07Wyg7L"))()
      elseif BladeBall() == "Wii Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif BladeBall() == "xyz.beta" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/xyz.BB/main/xyz.bb.lua", true))()
      elseif BladeBall() == "Ysacxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/Hqr4NnFU", true))()
      elseif BladeBall() == "Zap Hub" then
        loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
      elseif BladeBall() == "Zen.cc" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/zen.cc/main/zenultramax.lua", true))()
      end
    end
    r33_1475:Dropdown("Blade Ball", "Credits to Owner", {
      "Alchemy Hub",
      "AlSploit",
      "Artis Z",
      "Auto Parry by FFJ",
      "Bedol Hub",
      "Berserk Hub",
      "Blade Ball",
      "Darkrai Hub",
      "Del Hub",
      "EminX Hub",
      "Freya Hub",
      "Fuji Hub",
      "Galaxy Hub",
      "Hexa Hub",
      "Lightux Hub",
      "Ln Hub",
      "Luy Hub",
      "Mynhub",
      "Neo.x",
      "Neptune Hub",
      "Neva Hub",
      "Nextix Hub",
      "Nexus",
      "Noob",
      "Nova x Fusion Hub",
      "OMG Hub",
      "Oxox Hub",
      "Prolex",
      "R4mpage V4",
      "Raven B4",
      "REDz HUB",
      "SaZx HubZ",
      "ScriptX",
      "Sirius",
      "Stellar Hub",
      "Symphony Hub",
      "THub",
      "Visual",
      "Visualize",
      "White Hub",
      "Wii Hub",
      "xyz.beta",
      "Ysacxy Hub",
      "Zap Hub",
      "Zen.cc",
      nil,
      nil,
      nil
    }, function(r0_2014)
      -- line: [0, 0] id: 2014
      r46_1475 = r0_2014
      BlaOption()
    end)
    local r47_1475 = nil
    function Bloxburg()
      -- line: [0, 0] id: 1549
      return r47_1475
    end
    function BloxburgOption()
      -- line: [0, 0] id: 2035
      if Bloxburg() == "BloxBurger" then
        loadstring(game:HttpGet("https://bloxburger.eu/scripts/free/script.lua"))()
      elseif Bloxburg() == "Evo v4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif Bloxburg() == "Vysor" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2f213cf4f330b8eb17423eaa4ae64ff6.lua"))()
      end
    end
    r33_1475:Dropdown("Bloxburg", "Credits to Owner", {
      "BloxBurger",
      "Evo v4",
      "Vysor"
    }, function(r0_1524)
      -- line: [0, 0] id: 1524
      r47_1475 = r0_1524
      BloxburgOption()
    end)
    local r48_1475 = nil
    function BloxFruit()
      -- line: [0, 0] id: 1719
      return r48_1475
    end
    function BloxFruitOption()
      -- line: [0, 0] id: 1769
      if BloxFruit() == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif BloxFruit() == "Apple Hub" then
        getgenv().NgonNguScript = true
        repeat
          task.wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImTienNguyenZ/AppleHub/main/LoaderBF"))()
      elseif BloxFruit() == "Atomic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArceusXHub/atomic-hub/main/atomic-hub.lua"))()
      elseif BloxFruit() == "Beo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bestxemchua/agagagaq/main/BeoHUB/BeoHUB.lua"))()
      elseif BloxFruit() == "Blck Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()
      elseif BloxFruit() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif BloxFruit() == "Bull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/BullMain"))()
      elseif BloxFruit() == "CFrame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
      elseif BloxFruit() == "Cokka Hub" then
        loadstring(game:HttpGet("https://codeberg.org/CokkaHub/Loadstring/raw/branch/main/CokkaHub.lua"))()
      elseif BloxFruit() == "Destiny Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KudoCon/DestinyHub/main/DestinyKey"))()
      elseif BloxFruit() == "Domadic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
      elseif BloxFruit() == "Dynamic Hub" then
        loadstring(game:HttpGetAsync("https://Dynamic.xcodehoster.com/loader.lua"))()
      elseif BloxFruit() == "Ez Beli" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/ChestFarmOp"))()
      elseif BloxFruit() == "Fao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PNguyen0199/Script/main/Fai-Fao.lua"))()
      elseif BloxFruit() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flares"))()
      elseif BloxFruit() == "FTS V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tulam2000/FTS-HUB/main/FTS%20x%20Hub"))()
      elseif BloxFruit() == "Gringo Hub" then
        loadstring(game:HttpGet("https://github.com/LeVanNhatIT/GringoHub/raw/main/Loading_Ui/Loading"))()
      elseif BloxFruit() == "Halo X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HALOxHUB/ScriptLoader/main/Loader.lua"))()
      elseif BloxFruit() == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif BloxFruit() == "Hung Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/Loading"))()
      elseif BloxFruit() == "JJTx Hub" then
        loadstring(r32_1475:HttpGet("https://raw.githubusercontent.com/JJTChannel/JJTxHUB/main/Re-come.lua"))()
      elseif BloxFruit() == "Law Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/Law%20hub"))()
      elseif BloxFruit() == "Madox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/MadoxHubKey", true))()
      elseif BloxFruit() == "Makima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Piwwy0909/MakimaRemake/main/Cumback.Makima"))()
      elseif BloxFruit() == "Makori Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt"))()
      elseif BloxFruit() == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onepicesenpai/onepicesenpai/main/onichanokaka"))()
      elseif BloxFruit() == "Mama Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
      elseif BloxFruit() == "MeMayBeo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Z/main/MeMayBeo"))()
      elseif BloxFruit() == "Modz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/modz"))()
      elseif BloxFruit() == "MTriet Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
      elseif BloxFruit() == "Mukuro Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
      elseif BloxFruit() == "Nexuz Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NexuzHub/Main-/main/Script"))()
      elseif BloxFruit() == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif BloxFruit() == "Night Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NIGHTHUBONTOP/Main/main/NIGHT-HUB"))()
      elseif BloxFruit() == "Omg Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BloxFruit() == "Pado Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REWzaKunGz1/premium/main/PadoHub"))()
      elseif BloxFruit() == "Raito Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
      elseif BloxFruit() == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif BloxFruit() == "REDzHUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
      elseif BloxFruit() == "Sagi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/SagiHub"))()
      elseif BloxFruit() == "Saki Hub" then
        loadstring(game:HttpGetAsync("https://sharetext.me/raw/u3if6m3hgr"))()
      elseif BloxFruit() == "Sara Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SaraSenpai/bloxfruist/main/Sarahub"))()
      elseif BloxFruit() == "Secret Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FtsHub/main/main/SecretHub.Lua"))()
      elseif BloxFruit() == "Snow Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Hub/main/SnowHub-BloxFruit"))()
      elseif BloxFruit() == "Sonic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/Protected-25.lua"))()
      elseif BloxFruit() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif BloxFruit() == "Switch Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumX/main/src_.lua.txt"))()
      elseif BloxFruit() == "T7GFY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
      elseif BloxFruit() == "Tawan Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kill55547/TAWAN_HUB/main/TAWANxHUB_V2.lua.txt", true))()
      elseif BloxFruit() == "TNG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tngaming123/TNGHub/main/AutoRaceV4.lua"))()
      elseif BloxFruit() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif BloxFruit() == "Turbo Hub" then
        loadstring(r32_1475:HttpGet("https://gitlab.com/turbohubz/loader.xyz/loader/-/raw/main/TurboHub-Loader"))()
      elseif BloxFruit() == "Uranium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
      elseif BloxFruit() == "Vector Hub" then
        _G.Mode = "English"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MBPC"))()
      elseif BloxFruit() == "Void Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/VoidHub/main/Script"))()
      elseif BloxFruit() == "Winnable Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlostpexz/tyuiop/Fps/Loading.lua"))()
      elseif BloxFruit() == "Xenon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Larinax999/leak/main/khemtitgamerHUB-BF.lua"))()
      elseif BloxFruit() == "Zamex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua"))()
      elseif BloxFruit() == "Zaque Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mei2232/ZaqueHub/main/Zaque%20Hub"))()
      elseif BloxFruit() == "Zaque Hub(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/BloxFruitPC/main/Protected.lua"))()
      elseif BloxFruit() == "Zee Hub" then
        loadstring(game:HttpGet("https://zKuzy.link/ZeeHub.lua"))()
      elseif BloxFruit() == "Zekrom Hub X" then
        loadstring(r32_1475:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif BloxFruit() == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubTheBest/Main/main/Loader", true))()
      end
    end
    r33_1475:Dropdown("Blox Fruit", "Credits to Owner", {
      "Alchemy Hub",
      "Apple Hub",
      "Atomic Hub",
      "Beo Hub",
      "Blck Hub",
      "BlackTrap",
      "Bull Hub",
      "CFrame Hub",
      "Cokka Hub",
      "Destiny Hub",
      "Domadic Hub",
      "Dynamic Hub",
      "Ez Beli",
      "Fao Hub",
      "Flare Hub",
      "FTS V2",
      "Gringo Hub",
      "Halo X Hub",
      "Hoho Hub",
      "Hung Hub",
      "JJTx Hub",
      "Law Hub",
      "Madox Hub",
      "Makima Hub",
      "Makori Hub",
      "Makori Hub",
      "Master Hub",
      "Mama Hub",
      "MeMayBeo",
      "Modz Hub",
      "MTriet Hub",
      "Mukuro Hub",
      "Nexuz Hub",
      "Neva Hub",
      "Night Hub",
      "Omg Hub",
      "Pado Hub",
      "Raito Hub",
      "Rblx Hub",
      "REDzHUB",
      "Sagi Hub",
      "Saki Hub",
      "Sara Hub",
      "Secret Hub",
      "Snow Hub",
      "Sonic Hub",
      "Speed Hub X",
      "Switch Hub",
      "T7GFY",
      "Tawan Hub",
      "TNG Hub",
      "Thunder Z",
      "Turbo Hub",
      "Uranium Hub",
      "Vector Hub",
      "Void Hub",
      "Winnable Hub",
      "Xenon Hub",
      "Zamex Hub",
      "Zaque Hub",
      "Zaque Hub(PC)",
      "Zee Hub",
      "Zekrom Hub X",
      "Zen Hub"
    }, function(r0_1575)
      -- line: [0, 0] id: 1575
      r48_1475 = r0_1575
      BloxFruitOption()
    end)
    local r49_1475 = nil
    function BreakIn()
      -- line: [0, 0] id: 1564
      return r49_1475
    end
    function BreakOption()
      -- line: [0, 0] id: 1631
      if BreakIn2() == "Breaking Blitz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif BreakIn2() == "Break In 2 Kavo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt", true))()
      elseif BreakIn2() == "Break In 2 Orion" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif BreakIn2() == "Camping Trip" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yieviro92creepy/Testfu/main/Breakin2"))()
      elseif BreakIn2() == "D8rk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Games/Break%20In%202.lua", true))()
      elseif BreakIn2() == "F Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/Hide/main/Break%20in%202"))()
      elseif BreakIn2() == "IceWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif BreakIn2() == "Jn Hh Gaming" then
        loadstring(game:HttpGet("https://freenote.biz/raw/ScmsS7SwTW", true))()
      elseif BreakIn2() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Break/main/In"))()
      elseif BreakIn2() == "Playvora + JNHH Hub" then
        loadstring(game:HttpGet("https://freenote.biz/raw/80jXm2Q0a7", true))()
      end
    end
    r33_1475:Dropdown("Break In 2", "Credits to Owner", {
      "Breaking Blitz",
      "Break In 2 Kavo",
      "Break In 2 Orion",
      "Camping Trip",
      "D8rk Hub",
      "F Hub",
      "IceWare",
      "Jn Hh Gaming",
      "Legend HandlesYT",
      "Playvora + JNHH Hub"
    }, function(r0_1805)
      -- line: [0, 0] id: 1805
      r49_1475 = r0_1805
      BreakOption()
    end)
    local r50_1475 = nil
    function BuildA()
      -- line: [0, 0] id: 1712
      return r50_1475
    end
    function BuildOption()
      -- line: [0, 0] id: 1601
      if BuildABoat() == "Astra Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/0YezNNRh", true))()
      elseif BuildABoat() == "Auto Build" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
      elseif BuildABoat() == "Buil a boat for treasure" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua"))()
      elseif BuildABoat() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_1601 = loadstring
        local r1_1601 = request
        if not r1_1601 then
          r1_1601 = http_request
          if not r1_1601 then
            r1_1601 = http
            if r1_1601 then
              r1_1601 = http.request or syn and syn.request
            else
              goto label_58	-- block#11 is visited secondly
            end
          end
        end
        local r3_1601 = tostring
        local r4_1601 = "https://api.eclipsehub.xyz/auth"
        assert(r0_1601 and r1_1601, "Executor not Supported")
        r0_1601(r1_1601({
          Url = r4_1601 .. "?key=" .. r3_1601(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif BuildABoat() == "NooVster" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NooVster/v1.1/main/Source"))()
      elseif BuildABoat() == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/BABFT/main/Ruby%20Hub", true))()
      elseif BuildABoat() == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/spacvehubloader"))()
      elseif BuildABoat() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif BuildABoat() == "Vynixius 2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
      elseif BuildABoat() == "Zolars X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua"))()
      end
    end
    r33_1475:Dropdown("Build A Boat", "Credits to Owner", {
      "Astra Hub",
      "Auto Build",
      "Buil a boat for treasure",
      "Eclipse Hub",
      "NooVster",
      "Ruby Hub",
      "Space Hub",
      "Thunder Z",
      "Vynixius 2.0",
      "Zolars X"
    }, function(r0_2008)
      -- line: [0, 0] id: 2008
      r50_1475 = r0_2008
      BuildOption()
    end)
    local r51_1475 = nil
    function Chao()
      -- line: [0, 0] id: 1551
      return r51_1475
    end
    function ChaosOption()
      -- line: [0, 0] id: 1589
      if Chaos() == "AstralHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
      elseif Chaos() == "Bad Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/idkfffff/MainScript/main/BadHub.lua"))()
      elseif Chaos() == "Chaos Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt"))()
      elseif Chaos() == "SlapX Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Slinzo1/Chao-s-/main/Chaos"))()
      elseif Chaos() == "Juanko Hub v4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/VzPbD7GW"))()
      elseif Chaos() == "Ro Flux" then
        pcall(function()
          -- line: [0, 0] id: 1590
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif Chaos() == "TSSChaosScript" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Idkwhatudoin/TSS/main/TSSChaosScript", true))()
      elseif Chaos() == "Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aidanlolol/MainScript/main/ChaosScriptVersionTwoPointOne.lua"))()
      end
    end
    r33_1475:Dropdown("Chaos", "Credits to Owner", {
      "AstralHub",
      "Bad Hub",
      "Chaos Script",
      "SlapX Chaos Gui",
      "Juanko hub v4",
      "Ro Flux",
      "TSSChaosScript",
      "Chaos Gui"
    }, function(r0_1931)
      -- line: [0, 0] id: 1931
      r51_1475 = r0_1931
      ChaosOption()
    end)
    local r52_1475 = nil
    function ColorOr()
      -- line: [0, 0] id: 1917
      return r52_1475
    end
    function ColorOption()
      -- line: [0, 0] id: 1965
      if ColorOrDie() == "Color 0r Die | YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0color", true))()
      elseif ColorOrDie() == "Now Mon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoWMoN/Color-0r-DIE/main/NoWMoN.lua"))()
      end
    end
    r33_1475:Dropdown("Color Or Die", "Credits to Owner", {
      "Color 0r Die | YT ToraIsMe",
      "Now Mon"
    }, function(r0_1732)
      -- line: [0, 0] id: 1732
      r52_1475 = r0_1732
      ColorOption()
    end)
    local r53_1475 = nil
    function CombatWar()
      -- line: [0, 0] id: 1807
      return r53_1475
    end
    function CombatOption()
      -- line: [0, 0] id: 2004
      if CombatWarriors() == "Cwhb" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
      elseif CombatWarriors() == "Hydra Ui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CheeseOnGithub/cheese-hook/main/main%20hydra%20ui.lua", true))()
      elseif CombatWarriors() == "Nova Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NOVA_HUB_SOURCE"))()
      elseif CombatWarriors() == "Project-Hook" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/required.lua"))()
      elseif CombatWarriors() == "Zap Hub" then
        loadstring(game:HttpGet("https://www.itots.tk/zaphub/combat-warriors.lua", true))()
      end
    end
    r33_1475:Dropdown("Combat Warriors", "Credits to Owner", {
      "Cwhb",
      "Hydra Ui",
      "Nova Hub",
      "Project-Hook",
      "Zap Hub"
    }, function(r0_1739)
      -- line: [0, 0] id: 1739
      r53_1475 = r0_1739
      CombatOption()
    end)
    local r54_1475 = nil
    function DaHo()
      -- line: [0, 0] id: 1708
      return r54_1475
    end
    function DaOption()
      -- line: [0, 0] id: 1597
      if DaHood() == "DaHub" then
        getgenv().Toggle = "v"
        getgenv().Intro = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoUGotbannedlol/DaHubV3/main/Launch"))()
      elseif DaHood() == "DragonWare" then
        loadstring(game:HttpGet("https://paste-drop.com/raw/ZAE0Or8c3y"))()
      elseif DaHood() == "Enclosed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dylannpro123/enclosed/main/enclosed"))()
      elseif DaHood() == "Focus" then
        loadstring(game:HttpGet("https://pastebin.com/raw/5BkTV67C", true))()
      elseif DaHood() == "Lanxility" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
      elseif DaHood() == "OxHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/patrickhackplus/oxhub/main/kidsinmybasement"))()
      elseif DaHood() == "Pluto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Scrvpter/Pluto/Lua/Loader.Lua", true))()
      elseif DaHood() == "RayX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua"))()
      elseif DaHood() == "Serenity" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cypherdh/Serenity/main/script"))()
      elseif DaHood() == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHubLoader"))()
      elseif DaHood() == "Space X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood"))()
      elseif DaHood() == "SwagMode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
      elseif DaHood() == "Vortex" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
      elseif DaHood() == "Zapped" then
        loadstring(game:HttpGet("https://ekso.gq/raw/relases/zapped.lua"))()
      elseif DaHood() == "Zinc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua"))()
      end
    end
    r33_1475:Dropdown("Da Hood", "Credits to Owner", {
      "DaHub",
      "DragonWare",
      "Enclosed",
      "Focus",
      "Lanxility",
      "OxHub",
      "Pluto",
      "RayX",
      "Serenity",
      "Space Hub",
      "Space X",
      "SwagMode",
      "Vortex",
      "Zapped",
      "Zinc Hub"
    }, function(r0_1576)
      -- line: [0, 0] id: 1576
      r54_1475 = r0_1576
      DaOption()
    end)
    local r55_1475 = nil
    function Door()
      -- line: [0, 0] id: 1841
      return r55_1475
    end
    function DoorsOption()
      -- line: [0, 0] id: 1567
      if Doors() == "Black Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Doors"))()
      elseif Doors() == "DarkCheatClient" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      elseif Doors() == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
      elseif Doors() == "Dxrk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/dxrkhub/main/doors-scripts/hub-source"))()
      elseif Doors() == "ENTITY SPAWNER" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI"))()
      elseif Doors() == "King Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv"))()
      elseif Doors() == "MSDOORS" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua", true))()
      elseif Doors() == "Nerd Hub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/DoorsV3_ByNerd.lua"))()
      elseif Doors() == "Nerd Hub V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/doorsnerdv4.lua"))()
      elseif Doors() == "Nerd Hub V5" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/NeRDV5.lua"))()
      elseif Doors() == "Poop Doors" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua"))()
      end
    end
    r33_1475:Dropdown("Doors", "Credits to Owner", {
      "Black Hub",
      "DarkCheatClient",
      "Darkrai X",
      "Dxrk Hub",
      "ENTITY SPAWNER",
      "King Hub",
      "MSDOORS",
      "Nerd Hub V3",
      "Nerd Hub V4",
      "Nerd Hub V5",
      "Poop Doors"
    }, function(r0_1565)
      -- line: [0, 0] id: 1565
      r55_1475 = r0_1565
      DoorsOption()
    end)
    local r56_1475 = nil
    function Evad()
      -- line: [0, 0] id: 1815
      return r56_1475
    end
    function EvadeOption()
      -- line: [0, 0] id: 2031
      if Evade() == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
      elseif Evade() == "Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua"))()
      elseif Evade() == "Evade Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
      elseif Evade() == "Evade Tuperx" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TUPERX/TUPERX/Main/MenuBF/README.md"))()
      elseif Evade() == "Hydra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Main.lua", true))()
      elseif Evade() == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif Evade() == "Project-WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif Evade() == "Real-King Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua"))()
      elseif Evade() == "Speed Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Speed.txt"))()
      end
    end
    r33_1475:Dropdown("Evade", "Credits to Owner", {
      "Darkrai-X",
      "Evade",
      "Evade Gui",
      "Evade Tuperx",
      "Hydra",
      "Nex Hub",
      "Project-WD",
      "Real-King Evade",
      "Speed Evade"
    }, function(r0_1483)
      -- line: [0, 0] id: 1483
      r56_1475 = r0_1483
      EvadeOption()
    end)
    local r57_1475 = nil
    function GrandPiece()
      -- line: [0, 0] id: 1726
      return r57_1475
    end
    function GrandOption()
      -- line: [0, 0] id: 2013
      if GrandPieceOnline() == "Lazer Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/lazer"))()
      elseif GrandPieceOnline() == "Xno Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/955dd3e8f43767eedf49f84ffac60170.lua"))()
        setclipboard("babyshark")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif GrandPieceOnline() == "Zephyrion Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d2744abe1146d9accd91646050d082db.lua"))()
      end
    end
    r33_1475:Dropdown("Grand Piece Online", "Credits to Owner", {
      "Lazer Hub",
      "Xno Hub",
      "Zephyrion Hub"
    }, function(r0_1881)
      -- line: [0, 0] id: 1881
      r57_1475 = r0_1881
      GrandOption()
    end)
    local r58_1475 = nil
    function HazePi()
      -- line: [0, 0] id: 1612
      return r58_1475
    end
    function HazeOption()
      -- line: [0, 0] id: 1736
      if HazePiece() == "Beli Hunter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Belihunter"))()
      elseif HazePiece() == "Hyper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/All-Script/main/hp.lua"))()
      elseif HazePiece() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Haze/main/Piece"))()
      elseif HazePiece() == "Mystic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mo061/MysticHub/main/README.md"))()
      elseif HazePiece() == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/Loader/AllGame.lua"))()
      elseif HazePiece() == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/Haze%20Piece"))()
      end
    end
    r33_1475:Dropdown("Haze Piece", "Credits to Owner", {
      "Beli Hunter",
      "Hyper Hub",
      "Legend HandlesYT",
      "Mystic Hub",
      "Thunder Z",
      "Xtrey10x Hub"
    }, function(r0_1766)
      -- line: [0, 0] id: 1766
      r58_1475 = r0_1766
      HazeOption()
    end)
    local r59_1475 = nil
    function JailBre()
      -- line: [0, 0] id: 1477
      return r59_1475
    end
    function JailOption()
      -- line: [0, 0] id: 1974
      if JailBreak() == "OneMoreHub" then
        loadstring(game:HttpGet("https://gitlab.com/wspcontr/onemorehub/-/raw/main/scriptloader.lua"))()
      elseif JailBreak() == "Project Auto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/free"))()
      elseif JailBreak() == "Sexsation" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
      elseif JailBreak() == "Vestra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VestraTech/Vestra/main/Roblox/loader.lua"))()
      end
    end
    r33_1475:Dropdown("Jail Break", "Credits to Owner", {
      "OneMoreHub",
      "Project Auto",
      "Sexsation",
      "Vestra"
    }, function(r0_1540)
      -- line: [0, 0] id: 1540
      r59_1475 = r0_1540
      JailOption()
    end)
    local r60_1475 = nil
    function Kats()
      -- line: [0, 0] id: 1865
      return r60_1475
    end
    function KatOption()
      -- line: [0, 0] id: 1853
      if Kat() == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/KAT"))()
      elseif Kat() == "Darkyy Ware X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/NOWAY/main/darkyyware.lua"))()
      elseif Kat() == "Kat Killer by JN HH Gaming" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Kat12/main/Kat"))()
      elseif Kat() == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif Kat() == "SilentAim" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/sa"))()
      elseif Kat() == "Unfair Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua", true))()
      end
    end
    r33_1475:Dropdown("Kat", "Credits to Owner", {
      "Darkrai X",
      "Darkyy Ware X",
      "Kat Killer by JN HH Gaming",
      "OwlHub",
      "SilentAim",
      "Unfair Hub"
    }, function(r0_1500)
      -- line: [0, 0] id: 1500
      Kat = r0_1500
      KatOption()
    end)
    local r61_1475 = nil
    function KingLeg()
      -- line: [0, 0] id: 1671
      return r61_1475
    end
    function KingOption()
      -- line: [0, 0] id: 1585
      if KingLegacy() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif KingLegacy() == "Hyper Hub" then
        pcall(function()
          -- line: [0, 0] id: 1586
          repeat
            wait()
          until game:IsLoaded()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
        end)
      elseif KingLegacy() == "Mukuro X Quartyz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
      elseif KingLegacy() == "One X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xOne2/King-Legacy/main/README.md"))()
      elseif KingLegacy() == "Reaper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
      elseif KingLegacy() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif KingLegacy() == "ThunderZ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif KingLegacy() == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
      end
    end
    r33_1475:Dropdown("King Legacy", "Credits to Owner", {
      "BlackTrap",
      "Hyper Hub",
      "Mukuro X Quartyz",
      "One X Hub",
      "Reaper Hub",
      "Speed Hub X",
      "ThunderZ",
      "Zen Hub"
    }, function(r0_1703)
      -- line: [0, 0] id: 1703
      r61_1475 = r0_1703
      KingOption()
    end)
    local r62_1475 = nil
    function LegendsOf()
      -- line: [0, 0] id: 1955
      return r62_1475
    end
    function LegendsOption()
      -- line: [0, 0] id: 1714
      if LegendsOfSpeed() == "Arch" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lux933/Arch/main/Utilities/loader.lua"))()
      elseif LegendsOfSpeed() == "Code Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/coder382/CodeHub/main/Loader.lua"))()
      elseif LegendsOfSpeed() == "Cryo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryoScript/Scripts.lua/main/Legends%20of%20Speed.lua", true))()
      elseif LegendsOfSpeed() == "Legends Of Speed 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhackyCode/SPEEDDEVIL/main/legendsofspeed.lua"))()
      elseif LegendsOfSpeed() == "Legends Of Speed 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YukiTM/Roblox/main/Legends", true))()
      elseif LegendsOfSpeed() == "Legends Of Speed 3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Legenos%20of%20speedos"))()
      elseif LegendsOfSpeed() == "Legends Of Speed Rayfield" then
        loadstring(game:HttpGet("https://pastebin.com/raw/wGjDdXNX"))()
      elseif LegendsOfSpeed() == "Legends Of Speed by Waza80" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/los"))()
      elseif LegendsOfSpeed() == "Pog Hub No Carte" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/Loader/main/Loader.lua"))()
      elseif LegendsOfSpeed() == "Project L" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsThisMe01/Project-L/main/LegendsOfSpeed.lua"))()
      elseif LegendsOfSpeed() == "Project Meow" then
        loadstring(game:HttpGet("https://scriptblox.com/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
      elseif LegendsOfSpeed() == "Project Omega" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptPirate/ProjectOmega/main/ProjectOmegaLoader.lua"))()
      elseif LegendsOfSpeed() == "Proxima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
      elseif LegendsOfSpeed() == "Pss Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/psswaldo/psshub/main/main.lua"))()
      elseif LegendsOfSpeed() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arlists/Sky-Hub/main/Main", true))()
      elseif LegendsOfSpeed() == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif LegendsOfSpeed() == "SuPray" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/SuPray/main/Speed-of-Legends.lua"))()
      elseif LegendsOfSpeed() == "Tbao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
      elseif LegendsOfSpeed() == "Uciha Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fareljr1/Hub/main/Loader"))()
      elseif LegendsOfSpeed() == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
      elseif LegendsOfSpeed() == "Weinz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/weiny-ez/w-main/main/loader.lua"))()
      end
    end
    r33_1475:Dropdown("Legends Of Speed", "Credits to Owner", {
      "Arch",
      "Code Hub",
      "Cryo Hub",
      "Legends Of Speed 1",
      "Legends Of Speed 2",
      "Legends Of Speed 3",
      "Legends Of Speed Rayfield",
      "Legends Of Speed by Waza80",
      "Pog Hub No Carte",
      "Project L",
      "Project Meow",
      "Project Omega",
      "Proxima Hub",
      "Pss Hub",
      "Sky Hub",
      "Speed Hub X",
      "SuPray",
      "Tbao Hub",
      "Uciha Hub",
      "Vynixius",
      "Weinz",
      nil
    }, function(r0_1584)
      -- line: [0, 0] id: 1584
      r62_1475 = r0_1584
      LegendsOption()
    end)
    local r63_1475 = nil
    function MadCi()
      -- line: [0, 0] id: 1665
      return r63_1475
    end
    function MadOption()
      -- line: [0, 0] id: 1571
      if MadCity() == "ProBacon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aymarko/ProBaconHub/main/probacon1234/aymarko/MadCity/GUI/Beta"))()
      elseif MadCity() == "Ruby Hub Free" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20Chapter%202", true))()
      elseif MadCity() == "Ruby Hub v2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20v1.1", true))()
      end
    end
    r33_1475:Dropdown("Mad City", "Credits to Owner", {
      "ProBacon Hub",
      "Ruby Hub Free",
      "Ruby Hub v2.0"
    }, function(r0_1533)
      -- line: [0, 0] id: 1533
      r63_1475 = r0_1533
      MadOption()
    end)
    local r64_1475 = nil
    function MurderMys()
      -- line: [0, 0] id: 1572
      return r64_1475
    end
    function MurderOption()
      -- line: [0, 0] id: 1846
      if MurderMystery2() == "Auto Coin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tvgueimer84/tvgueimerr23232/main/mmm2"))()
      elseif MurderMystery2() == "Dreadz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DreadzHub2/DreadzHub-Scripts-FR/main/Loader"))()
      elseif MurderMystery2() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_1846 = loadstring
        local r1_1846 = request
        if not r1_1846 then
          r1_1846 = http_request
          if not r1_1846 then
            r1_1846 = http
            if r1_1846 then
              r1_1846 = http.request or syn and syn.request
            else
              goto label_45	-- block#9 is visited secondly
            end
          end
        end
        local r3_1846 = tostring
        local r4_1846 = "https://api.eclipsehub.xyz/auth"
        assert(r0_1846 and r1_1846, "Executor not Supported")
        r0_1846(r1_1846({
          Url = r4_1846 .. "?key=" .. r3_1846(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif MurderMystery2() == "Ghost Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
      elseif MurderMystery2() == "Highlight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Free"))()
      elseif MurderMystery2() == "Jayy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reed192512/jayyhubcloud/main/MainLoadstring", true))()
      elseif MurderMystery2() == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/MM2_V2"))()
      elseif MurderMystery2() == "Lunar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
      elseif MurderMystery2() == "Murder Mystery 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/mm2", true))()
      elseif MurderMystery2() == "Murder Mystery 2 by:ScriptX Version X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/SORIX-Hub/main/Murder%20Mystery%202%20Version%20X"))()
      elseif MurderMystery2() == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring"))()
      elseif MurderMystery2() == "R3th Priv" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3TH-PRIV/main/LOAD.lua"))()
      elseif MurderMystery2() == "Ski Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/203DBjLx", true))()
      elseif MurderMystery2() == "Symphony Hub" then
        local r0_1846 = loadstring
        local r1_1846 = request
        if not r1_1846 then
          r1_1846 = http_request
          if not r1_1846 then
            r1_1846 = http
            if r1_1846 then
              r1_1846 = http.request or syn and syn.request
            else
              goto label_218	-- block#39 is visited secondly
            end
          end
        end
        local r3_1846 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r0_1846 and r1_1846, "Your Executor does not support.")
        r0_1846(r1_1846({
          Url = r3_1846,
          Method = "GET",
        }).Body)()
      end
    end
    r33_1475:Dropdown("Murder Mystery 2", "Credits to Owner", {
      "Auto Coin",
      "Dreadz Hub",
      "Eclipse Hub",
      "Ghost Hub",
      "Highlight Hub",
      "Jayy Hub",
      "Kidachi Hub",
      "Lunar Hub",
      "Murder Mystery 2",
      "Murder Mystery 2 by:ScriptX Version X",
      "Nexus Hub",
      "R3th Priv",
      "Ski Hub",
      "Symphony Hub"
    }, function(r0_1574)
      -- line: [0, 0] id: 1574
      r64_1475 = r0_1574
      MurderOption()
    end)
    local r65_1475 = nil
    function MurderersVs()
      -- line: [0, 0] id: 1721
      return r65_1475
    end
    function MurderersOption()
      -- line: [0, 0] id: 1645
      if MurderersVsSheriffs() == "Bebo Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
      elseif MurderersVsSheriffs() == "Emptyness Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/EmptynessNoBlur"))()
      elseif MurderersVsSheriffs() == "Kenniel Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Murderers-VS-Sheriffs-Duels-script/main/Murderers%20VS%20Sheriffs%20Duels%20script", true))()
      elseif MurderersVsSheriffs() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Duels7/main/Sheriffs56"))()
      elseif MurderersVsSheriffs() == "Muderer Vs Sheriff" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/mvs"))()
      elseif MurderersVsSheriffs() == "Oasis Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/bruvzz/oasishub/main/script"))()
      elseif MurderersVsSheriffs() == "Ranxware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AsteriskCodes/Ranxware-V2-Restored/main/source.lua"))()
      elseif MurderersVsSheriffs() == "Ro Flux Hub" then
        _G.Key = "FreeKey2023"
        pcall(function()
          -- line: [0, 0] id: 1646
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif MurderersVsSheriffs() == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
      end
    end
    r33_1475:Dropdown("Murderers Vs Sheriffs", "Credits to Owner", {
      "Bebo Scripts",
      "Emptyness Hub",
      "Kenniel Script",
      "Legend HandlesYT",
      "Muderer Vs Sheriff",
      "Oasis Hub",
      "Ranxware",
      "Ro Flux Hub",
      "Ruby Hub"
    }, function(r0_1592)
      -- line: [0, 0] id: 1592
      r65_1475 = r0_1592
      MurderersOption()
    end)
    local r66_1475 = nil
    function MyRes()
      -- line: [0, 0] id: 1752
      return r66_1475
    end
    function MyOption()
      -- line: [0, 0] id: 1982
      if MyRestaurant() == "Milk Up" then
        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
      elseif MyRestaurant() == "My Restaurant" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/MyRestaurant"))()
      elseif MyRestaurant() == "Project Lightning" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectLightningDev/Project-Lightning-Loader/main/Loader.Lua"))()
      elseif MyRestaurant() == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif MyRestaurant() == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
      elseif MyRestaurant() == "Wyn\'s Script" then
        loadstring(game:HttpGet("https://system-exodus.com/scripts/MyRestaurant/MyRestaurant.lua", true))()
      end
    end
    r33_1475:Dropdown("My Restaurant", "Credits to Owner", {
      "Milk Up",
      "My Restaurant",
      "Project Lightning",
      "Project WD",
      "Rafa Hub",
      "Wyn\'s Script"
    }, function(r0_1971)
      -- line: [0, 0] id: 1971
      r66_1475 = r0_1971
      MyOption()
    end)
    local r67_1475 = nil
    function NaturalDi()
      -- line: [0, 0] id: 1521
      return r67_1475
    end
    function NaturalOption()
      -- line: [0, 0] id: 1870
      if NaturalDisaster() == "Binary Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BinaryHubOfficial/binaryhub/main/init.lua"))()
      elseif NaturalDisaster() == "CH Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
      elseif NaturalDisaster() == "Dark Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yarik312/DarkWare/main/MainLoader", true))()
      elseif NaturalDisaster() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_1870 = loadstring
        local r1_1870 = request
        if not r1_1870 then
          r1_1870 = http_request
          if not r1_1870 then
            r1_1870 = http
            if r1_1870 then
              r1_1870 = http.request or syn and syn.request
            else
              goto label_58	-- block#11 is visited secondly
            end
          end
        end
        local r3_1870 = tostring
        local r4_1870 = "https://api.eclipsehub.xyz/auth"
        assert(r0_1870 and r1_1870, "Executor not Supported")
        r0_1870(r1_1870({
          Url = r4_1870 .. "?key=" .. r3_1870(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif NaturalDisaster() == "Natural Disaster Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hussain1323232234/My-Scripts/main/Natural%20Disaster"))()
      elseif NaturalDisaster() == "Natural Disaster Survival" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()
      elseif NaturalDisaster() == "Natural Disaster Survival By:RIP" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/NaturalDisasterSurvival.lua"))()
      elseif NaturalDisaster() == "NDS_A\'X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/NDS_A%5EX"))()
      elseif NaturalDisaster() == "NDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main"))()
      elseif NaturalDisaster() == "NDS GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
      elseif NaturalDisaster() == "One Protocol" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneProtocol/Project/main/Loader", true))()
      elseif NaturalDisaster() == "Rawnder" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster"))()
      elseif NaturalDisaster() == "Six Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE"))()
      elseif NaturalDisaster() == "Zeerox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
      end
    end
    r33_1475:Dropdown("Natural Disaster Survival", "Credits to Owner", {
      "Binary Hub",
      "CH Hub",
      "Dark Ware",
      "Eclipse Hub",
      "Natural Disaster Hub",
      "Natural Disaster Survival",
      "Natural Disaster Survival By:RIP",
      "NDS_A\'X",
      "NDS Hub",
      "NDS GUI",
      "One Protocol",
      "Rawnder",
      "Six Hub",
      "Zeerox Hub"
    }, function(r0_1599)
      -- line: [0, 0] id: 1599
      r67_1475 = r0_1599
      NaturalOption()
    end)
    local r68_1475 = nil
    function NicoNext()
      -- line: [0, 0] id: 1898
      return r68_1475
    end
    function NicoOption()
      -- line: [0, 0] id: 1855
      if NicoNextBot() == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/NicoNextBots", true))()
      elseif NicoNextBot() == "Hp Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/HPHub/main/HPHub.lua"))()
      elseif NicoNextBot() == "NexHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif NicoNextBot() == "Nico NextBot" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DFfKb4i9"))()
      elseif NicoNextBot() == "WercT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dropouut/Shindai/main/wercT.lua"))()
      end
    end
    r33_1475:Dropdown("Nico NextBot", "Credits to Owner", {
      "Darkrai-X",
      "Hp Hub",
      "NexHub",
      "Nico NextBot",
      "WercT"
    }, function(r0_1859)
      -- line: [0, 0] id: 1859
      r68_1475 = r0_1859
      NicoOption()
    end)
    local r69_1475 = nil
    function PetCat()
      -- line: [0, 0] id: 1523
      return r69_1475
    end
    function PetCOption()
      -- line: [0, 0] id: 1966
      if PetCatchers() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif PetCatchers() == "GatoHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchers"))()
      elseif PetCatchers() == "Huge Games" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f38c17c4a5e9f38a7dac14ce0940688d.lua"))()
      elseif PetCatchers() == "IdiotHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main"))()
      elseif PetCatchers() == "Lenut Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lenutjr/pc/main/petcatchers"))()
      elseif PetCatchers() == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyHub123/NexusHubMain/main/Main.lua"))()
      elseif PetCatchers() == "Pet Catchers" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/PET%20CATCHERS", true))()
      end
    end
    r33_1475:Dropdown("Pet Catchers", "Credits to Owner", {
      "Banana Hub",
      "GatoHub",
      "Huge Games",
      "IdiotHub",
      "Lenut Hub",
      "Nexus Hub",
      "Pet Catchers"
    }, function(r0_1942)
      -- line: [0, 0] id: 1942
      r69_1475 = r0_1942
      PetCOption()
    end)
    local r70_1475 = nil
    function PetSim9()
      -- line: [0, 0] id: 1649
      return r70_1475
    end
    function Pet9Option()
      -- line: [0, 0] id: 1511
      if PetSimulator99() == "Auto Stairway To Heaven" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fissurectomy/woah/main/ps99_stairway.lua"))()
      elseif PetSimulator99() == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif PetSimulator99() == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/ps99"))()
      elseif PetSimulator99() == "Idiot Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Somerandomidiot/Lua/main/PS99_Protected.txt"))()
      elseif PetSimulator99() == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Sim2/main/Pet99"))()
      elseif PetSimulator99() == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
      elseif PetSimulator99() == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif PetSimulator99() == "Syrex Hub" then
        loadstring(game:HttpGet("https://syrexhub.netlify.app/raw/petsimulator99/syrexhub"))()
      elseif PetSimulator99() == "Zekrom Hub X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif PetSimulator99() == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end
    r33_1475:Dropdown("Pet Simulator 99", "Credits to Owner", {
      "Auto Stairway To Heaven",
      "Banana Hub",
      "Huge Games",
      "Idiot Hub",
      "Legend HandlesYT",
      "REDz HUB",
      "Sky Hub",
      "Syrex Hub",
      "Zekrom Hub X",
      "Zer0 Hub"
    }, function(r0_1627)
      -- line: [0, 0] id: 1627
      r70_1475 = r0_1627
      Pet9Option()
    end)
    local r71_1475 = nil
    function PetSim()
      -- line: [0, 0] id: 1944
      return r71_1475
    end
    function PetOption()
      -- line: [0, 0] id: 2027
      if PetSimulatorX() == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif PetSimulatorX() == "Catalyst" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/catalyst/itachi/main.lua"))()
      elseif PetSimulatorX() == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif PetSimulatorX() == "Extreme Hub" then
        _G.ExtremeHUBLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/All-Scripts-Obfuscated.lua"))()
      elseif PetSimulatorX() == "EVO V4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif PetSimulatorX() == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/psx"))()
      elseif PetSimulatorX() == "Milk Up" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2a31571481d9db7f3be01903493bfc9a.lua"))()
      elseif PetSimulatorX() == "Project WD" then
        getgenv().boothsnipe = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif PetSimulatorX() == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/psx.lua"))()
      elseif PetSimulatorX() == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif PetSimulatorX() == "ThunderZ(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      end
    end
    r33_1475:Dropdown("Pet Simulator X", "Credits to Owner", {
      "BlackTrap",
      "Catalyst",
      "Cloud Hub",
      "Extreme Hub",
      "EVO V4",
      "Huge Games",
      "Milk Up",
      "Project WD",
      "Rafa Hub",
      "Rblx Hub",
      "ThunderZ(PC)"
    }, function(r0_1593)
      -- line: [0, 0] id: 1593
      r71_1475 = r0_1593
      PetOption()
    end)
    local r72_1475 = nil
    function PrisonLi()
      -- line: [0, 0] id: 1918
      return r72_1475
    end
    function PrisonOption()
      -- line: [0, 0] id: 1967
      if PrisonLife() == "Astral Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Games/PrisonLife/main.lua"))()
      elseif PrisonLife() == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/QY07DaJS"))()
      elseif PrisonLife() == "Fe Btools" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-btools-script-for-prison-life-9706"))()
      elseif PrisonLife() == "Fe Disabled Tool Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
      elseif PrisonLife() == "Juanko" then
        loadstring(game:HttpGet("https://pastebin.com/raw/rfAULQ83"))()
      elseif PrisonLife() == "Moonlight" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Prison-life/main/Moonlight%20Client%20Prison%20Life", true))()
      elseif PrisonLife() == "Tiger Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script"))()
      elseif PrisonLife() == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Prison%20Life"))()
      end
    end
    r33_1475:Dropdown("Prison Life", "Credits to Owner", {
      "Astral Hub",
      "Del Hub",
      "Fe Btools",
      "Fe Disabled Tool Gui",
      "Juanko",
      "Moonlight",
      "Tiger Admin",
      "Vynixius"
    }, function(r0_1517)
      -- line: [0, 0] id: 1517
      r72_1475 = r0_1517
      PrisonOption()
    end)
    local r73_1475 = nil
    function ProjectMu()
      -- line: [0, 0] id: 1583
      return r73_1475
    end
    function ProjectOption()
      -- line: [0, 0] id: 1632
      if ProjectMugetsu() == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/ProjectMugetsu.lua"))()
      elseif ProjectMugetsu() == "Pm" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrickyAH/Scripts/main/loader.lua"))()
      elseif ProjectMugetsu() == "Purple Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheyCallMeVox/scripts/main/PM"))()
      elseif ProjectMugetsu() == "Valynium" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XO-3S-CL-VCK-jf-3HDM/Products/main/Project-Mugetsu.lua"))()
      elseif ProjectMugetsu() == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end
    r33_1475:Dropdown("Project Mugetsu", "Credits to Owner", {
      "JumbleScripts",
      "Pm",
      "Purple Hub",
      "Valynium",
      "Verny Hub V2"
    }, function(r0_1884)
      -- line: [0, 0] id: 1884
      r73_1475 = r0_1884
      ProjectOption()
    end)
    local r74_1475 = nil
    function ProjectSla()
      -- line: [0, 0] id: 1782
      return r74_1475
    end
    function ProjectSOption()
      -- line: [0, 0] id: 2001
      if ProjectSlayer() == "Nuke Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2023/main/projslayerthingy", true))()
      elseif ProjectSlayer() == "Oni Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/01471f12f9adfd4537f4cc0b3b7bba14.lua"))()
      elseif ProjectSlayer() == "Shark Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/TcbS1i6E"))()
      elseif ProjectSlayer() == "Skeered Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skeereddo/name/main/krnl", true))()
      elseif ProjectSlayer() == "Sylveon Hub" then
        local r0_2001 = "https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/Mobile.lua"
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet(r0_2001))()
      elseif ProjectSlayer() == "Versaware Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware_free/main/VersawareFree.lua", true))()
      elseif ProjectSlayer() == "Zyrc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/mugentr"))()
      end
    end
    r33_1475:Dropdown("Project Slayer", "Credits to Owner", {
      "Nuke Hub",
      "Oni Hub",
      "Shark Hub",
      "Skeered Hub",
      "Sylveon Hub",
      "Versaware Hub",
      "Zyrc Hub"
    }, function(r0_1546)
      -- line: [0, 0] id: 1546
      r74_1475 = r0_1546
      ProjectSOption()
    end)
    local r75_1475 = nil
    function PunchSim()
      -- line: [0, 0] id: 1788
      return r75_1475
    end
    function PunchOption()
      -- line: [0, 0] id: 1860
      if PunchSimulator() == "Angeel Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Angeelvxg/PunchSimulator/main/PunchSimulator.lua", true))()
      elseif PunchSimulator() == "Blue GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
      elseif PunchSimulator() == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/dbevo/main/asfasfasfasf"))()
      elseif PunchSimulator() == "Tora Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0PUNCH"))()
      end
    end
    r33_1475:Dropdown("Punch Simulator", "Credits to Owner", {
      "Angeel Hub",
      "Blue GUI",
      "Perfectus Hub",
      "Tora Hub"
    }, function(r0_1723)
      -- line: [0, 0] id: 1723
      r75_1475 = r0_1723
      PunchOption()
    end)
    local r76_1475 = nil
    function MadCi()
      -- line: [0, 0] id: 1491
      return r76_1475
    end
    function PunchWaOption()
      -- line: [0, 0] id: 1869
      if PunchWall() == "Codexus Trial" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/PunchWallSim.lua"))()
      elseif PunchWall() == "ImperorLegend Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImperorLegend/Orig-PWSim-Script/main/Script"))()
      elseif PunchWall() == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif PunchWall() == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif PunchWall() == "Punch Wall Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/momentBr/game-script/main/Punch%20Wall%20Simulator"))()
      elseif PunchWall() == "Punch Wall Simulator YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0punch"))()
      elseif PunchWall() == "Yoto Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/GUI-SCRIPT/main/Main"))()
      end
    end
    r33_1475:Dropdown("Punch Wall Simulator", "Credits to Owner", {
      "Codexus Trial",
      "ImperorLegend Hub",
      "Nexus",
      "Platinium Hub",
      "Punch Wall Simulator",
      "Punch Wall Simulator YT ToraIsMe",
      "Yoto Hub"
    }, function(r0_1578)
      -- line: [0, 0] id: 1578
      r76_1475 = r0_1578
      PunchWaOption()
    end)
    local r77_1475 = nil
    function Rainbow()
      -- line: [0, 0] id: 1704
      return r77_1475
    end
    function RainOption()
      -- line: [0, 0] id: 2011
      if RainbowFriends() == "BorkWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/" .. game.GameId .. ".lua"))(" Watermelon ? ")
      elseif RainbowFriends() == "Frightened Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/FrightenedHub/main/Loader.lua", true))()
      elseif RainbowFriends() == "Rainbow Friends KEPA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Keparetiolpxe/rbxscript/main/RainbowFriendsKEPA"))()
      elseif RainbowFriends() == "Rainbow Friends" then
        loadstring(game:HttpGet("https://pastebin.com/raw/yVhAwibN"))()
      elseif RainbowFriends() == "ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow"))()
      elseif RainbowFriends() == "Voidz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
      end
    end
    r33_1475:Dropdown("Rainbow Friends(Chapter 2)", "Credits to Owner", {
      "BorkWare",
      "Frightened Hub",
      "Rainbow Friends KEPA",
      "Rainbow Friends",
      "ToraIsMe",
      "Voidz"
    }, function(r0_1532)
      -- line: [0, 0] id: 1532
      r77_1475 = r0_1532
      RainOption()
    end)
    local r78_1475 = nil
    function ShadowBox()
      -- line: [0, 0] id: 1494
      return r78_1475
    end
    function ShadowOption()
      -- line: [0, 0] id: 1529
      if ShadowBoxing() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/ShadowBoxing"))()
      elseif ShadowBoxing() == "Trey\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/shadow"))()
      end
    end
    r33_1475:Dropdown("Shadow Boxing", "Credits to Owner", {
      "Flare Hub",
      "Trey\'s Hub"
    }, function(r0_1610)
      -- line: [0, 0] id: 1610
      r78_1475 = r0_1610
      ShadowOption()
    end)
    local r79_1475 = nil
    function ShadowBox()
      -- line: [0, 0] id: 1796
      return r79_1475
    end
    function SlapOption()
      -- line: [0, 0] id: 2032
      if SlapBattles() == "CherryUI\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
      elseif SlapBattles() == "Dizzy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/dizzy_hub/scripts/slap_battles.lua"))()
      elseif SlapBattles() == "Hub That Exists" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
      elseif SlapBattles() == "Infinite Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackie-coke/InfiniteWare/main/KS.lua", true))()
      elseif SlapBattles() == "Purple R20 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/anakinn"))()
      elseif SlapBattles() == "Slap Battle Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
      elseif SlapBattles() == "R20-Exploiter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua"))()
      elseif SlapBattles() == "Vantra Hub" then
        loadstring(game:HttpGet("https://vantra.cc/api/script/get?placeid=MainLoader"))()
      elseif SlapBattles() == "Whopper" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/whopper.lua"))()
      end
    end
    r33_1475:Dropdown("Slap Battles", "Credits to Owner", {
      "CherryUI\'s Hub",
      "Dizzy Hub",
      "Hub That Exists",
      "Infinite Ware",
      "Purple R20 Hub",
      "Slap Battle Gui",
      "R20-Exploiter",
      "Vantra Hub",
      "Whopper"
    }, function(r0_1657)
      -- line: [0, 0] id: 1657
      r79_1475 = r0_1657
      SlapOption()
    end)
    local r80_1475 = nil
    function SolsR()
      -- line: [0, 0] id: 1751
      return Sonic
    end
    function SolsOption()
      -- line: [0, 0] id: 1479
      if SolsRNG() == "HoHo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif SolsRNG() == "Legend Handless Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/upd/main/rng"))()
      elseif SolsRNG() == "Sol\'s RNG" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Toilet71/Games-Sol-s/main/Sol\'s%20Script"))()
      elseif SolsRNG() == "Sols RNG Panel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
      end
    end
    r33_1475:Dropdown("Sol\'s RNG", "Credits to Owner", {
      "HoHo Hub",
      "Legend Handless Hub",
      "Sol\'s RNG",
      "Sol\'s RNG Panel"
    }, function(r0_1677)
      -- line: [0, 0] id: 1677
      r80_1475 = r0_1677
      SolsOption()
    end)
    local r81_1475 = nil
    function SonicSpeed()
      -- line: [0, 0] id: 1587
      return r81_1475
    end
    function SonicOption()
      -- line: [0, 0] id: 1760
      if SonicSpeedSimulator() == "Cheater Soul" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luciquad/credit/main/sonicspeedsimulator.lua"))()
      elseif SonicSpeedSimulator() == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      elseif SonicSpeedSimulator() == "Skays" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SkaysGG-2095"))()
      elseif SonicSpeedSimulator() == "Sonic Speed Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kkeyy-hash/roblox/main/SonicSpeedSimulator2.lua"))()
      end
    end
    r33_1475:Dropdown("Sonic Speed Simulator", "Credits to Owner", {
      "Cheater Soul",
      "Master Hub",
      "Skays",
      "Sonic Speed Simulator"
    }, function(r0_1716)
      -- line: [0, 0] id: 1716
      r81_1475 = r0_1716
      SonicOption()
    end)
    local r82_1475 = nil
    function TheStrong()
      -- line: [0, 0] id: 1688
      return r82_1475
    end
    function TheOption()
      -- line: [0, 0] id: 1548
      if TheStrongest() == "Hawk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHanki/Hawk/main/Loader", true))()
      elseif TheStrongest() == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader", true))()
      elseif TheStrongest() == "Nicuse Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
      elseif TheStrongest() == "LOLking123456" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/battleground1/main/Saitama41"))()
      elseif TheStrongest() == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/saitama"))()
      end
    end
    r33_1475:Dropdown("The Strongest Battlegrounds", "Credits to Owner", {
      "Hawk Hub",
      "Nex Hub",
      "Nicuse Hub",
      "LOLking123456",
      "Xtrey10x Hub"
    }, function(r0_1604)
      -- line: [0, 0] id: 1604
      r82_1475 = r0_1604
      TheOption()
    end)
    local r83_1475 = nil
    function TowerOf()
      -- line: [0, 0] id: 1804
      return r83_1475
    end
    function TowerOption()
      -- line: [0, 0] id: 2012
      if TowerOfHell() == "Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TwomadJR/nto/main/admiin"))()
      elseif TowerOfHell() == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r0_2012 = loadstring
        local r1_2012 = request
        if not r1_2012 then
          r1_2012 = http_request
          if not r1_2012 then
            r1_2012 = http
            if r1_2012 then
              r1_2012 = http.request or syn and syn.request
            else
              goto label_33	-- block#7 is visited secondly
            end
          end
        end
        local r3_2012 = tostring
        local r4_2012 = "https://api.eclipsehub.xyz/auth"
        assert(r0_2012 and r1_2012, "Executor not Supported")
        r0_2012(r1_2012({
          Url = r4_2012 .. "?key=" .. r3_2012(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif TowerOfHell() == "Floater Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iiProductionz/Floater-Scripts/main/WaifuEdition/Tower%20Of%20Hell"))()
      elseif TowerOfHell() == "Garfield Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
      elseif TowerOfHell() == "LighTux" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif TowerOfHell() == "Tower Of Hell Gui" then
        loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/85f97364b6367baac677e109488c9905/raw/c2972a2b892c4193509ddb2fe1ba3061435e1a8a/gistfile1.txt"))()
      elseif TowerOfHell() == "Tower Of Hell Gui by:The Mystery O_O" then
        loadstring(game:HttpGet("https://pastebin.com/raw/BbVHjH56"))()
      end
    end
    r33_1475:Dropdown("Tower Of Hell", "Credits to Owner", {
      "Admin",
      "Eclipse Hub",
      "Floater Scripts",
      "Garfield Hub",
      "LighTux",
      "Tower Of Hell Gui",
      "Tower Of Hell Gui by:The Mystery O_O"
    }, function(r0_1547)
      -- line: [0, 0] id: 1547
      r83_1475 = r0_1547
      TowerOption()
    end)
    local r84_1475 = nil
    function UnderGround()
      -- line: [0, 0] id: 1968
      return r84_1475
    end
    function UnderOption()
      -- line: [0, 0] id: 1543
      if UnderGroundWar() == "Multi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jj123llol/multi-hub/main/Multi", true))()
      elseif UnderGroundWar() == "Unique Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jynzl/UniqueHub/main/UniqueHubv2Intro", true))()
      elseif UnderGroundWar() == "UnderGround War Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iuqYjEAX"))()
      elseif UnderGroundWar() == "UnderGround War 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War%203"))()
      end
    end
    r33_1475:Dropdown("UnderGround War", "Credits to Owner", {
      "Multi Hub",
      "Unique Hub",
      "UnderGround War Gui",
      "UnderGround War 1"
    }, function(r0_1635)
      -- line: [0, 0] id: 1635
      r84_1475 = r0_1635
      UnderOption()
    end)
    local r85_1475 = nil
    function Wiste()
      -- line: [0, 0] id: 1720
      return r85_1475
    end
    function WisOption()
      -- line: [0, 0] id: 1973
      if Wisteria() == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/wisteria2script"))()
      elseif Wisteria() == "Jumble Hub" then
        loadstring(game:HttpGet("https://jumblescripts.com/JumbleHub.lua"))()
      elseif Wisteria() == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/Wisteria", true))()
      end
    end
    r33_1475:Dropdown("Wisteria 2", "Credits to Owner", {
      "Flare Hub",
      "Jumble Hub",
      "Kidachi Hub"
    }, function(r0_1808)
      -- line: [0, 0] id: 1808
      r85_1475 = r0_1808
      WisOption()
    end)
    local r86_1475 = nil
    function YourBi()
      -- line: [0, 0] id: 1658
      return r86_1475
    end
    function YourOption()
      -- line: [0, 0] id: 1541
      if YourBizarre() == "CuHub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ItachiPvPUchiha/CuHub/main/yba.lua"))()
      elseif YourBizarre() == "Green Gui B-Boy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
      elseif YourBizarre() == "Gui by Death" then
        _G.Options = {
          ToggleKey = "Delete",
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGaster/Scripts/main/" .. tostring(game.PlaceId), true))()
      elseif YourBizarre() == "Midnight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheFarowHywolf/YBA-Midnight-script/master/YBA.lua"))()
      end
    end
    r33_1475:Dropdown("Your Bizarre Adventure", "Credits to Owner", {
      "CuHub V3",
      "Green Gui B-Boy",
      "Gui by Death",
      "Midnight Hub"
    }, function(r0_1770)
      -- line: [0, 0] id: 1770
      r86_1475 = r0_1770
      YourOption()
    end)
    local r87_1475 = nil
    function abc()
      -- line: [0, 0] id: 1852
      return r87_1475
    end
    function abcOption()
      -- line: [0, 0] id: 1914
      if abc() == "CheatX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/3008"))()
      elseif abc() == "God Mode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CHnamedata/WhatDaHeck/main/3008GodMode.lua"))()
      elseif abc() == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end
    r33_1475:Dropdown("3008", "Credits to Owner", {
      "CheatX",
      "God Mode",
      "V.G Hub"
    }, function(r0_1638)
      -- line: [0, 0] id: 1638
      r87_1475 = r0_1638
      abcOption()
    end)
    r33_1475:Dropdown("More Next Update", "", {
      "Next Update"
    }, function()
      -- line: [0, 0] id: 1556
    end)
    local r88_1475 = r10_1475:Tab("Hub | Gui")
    local r89_1475 = r88_1475:Section("Executor")
    local r92_1475 = "Textbox"
    r92_1475 = "Script Executer"
    r89_1475:[r92_1475](r92_1475, "Execute Scripts", function(r0_1779)
      -- line: [0, 0] id: 1779
      loadstring(r0_1779)()
    end)
    r89_1475:Button("Arceus X v3", "Credits to Owner", function()
      -- line: [0, 0] id: 1667
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end)
    r89_1475:Button("Fluxus Coral", "Credits to Owner", function()
      -- line: [0, 0] id: 1847
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
    end)
    r89_1475:Button("Delta Fan Made", "Credits to Owner", function()
      -- line: [0, 0] id: 1900
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Delta-Executor-J-O-K-E-7664"))()
    end)
    r89_1475:Button("Krnl Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1502
      loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
    end)
    r89_1475:Button("Synapse X Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1890
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
    end)
    r89_1475:Button("NotePad", "Credits to Owner", function()
      -- line: [0, 0] id: 1928
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAScripts/Favorable/main/NotePad.lua"))()
    end)
    r89_1475:Button("NoCom Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1519
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/NoCom-Executor/main/NoCom"))()
    end)
    r89_1475:Button("Executor Gui By AZY#0348", "Credits to Owner", function()
      -- line: [0, 0] id: 1636
      loadstring(game:HttpGet("https://pastebin.com/raw/yGxeT8zC", true))()
    end)
    r89_1475:Button("Shadow X Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1897
      loadstring(game:HttpGet("https://pastebin.com/raw/1fAnGAA0"))()
    end)
    r89_1475:Button("Neptune Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1907
      loadstring(game:HttpGet("https://pastebin.com/raw/y3jhxS5r"))()
    end)
    r89_1475:Button("ECCS•AI Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1996
      loadstring(game:HttpGet("https://pastebin.com/raw/7nAMYduv"))("Copyright ERROR_CODE ECCS Co")
    end)
    r89_1475:Button("ECCS•ID Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1484
      loadstring(game:HttpGet("https://pastebin.com/raw/hFkBRgxb"))("Copyright ERROR_CODE ECCS Co")
    end)
    r89_1475:Button("NewExec V1", "Credits to Owner", function()
      -- line: [0, 0] id: 1596
      loadstring(game:HttpGet("https://pastebin.com/raw/6sp92FDj", true))()
    end)
    r89_1475:Button("Bad Ware", "Credits to Owner", function()
      -- line: [0, 0] id: 1476
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sluucker/badware/main/loader", true))()
    end)
    r89_1475:Button("Stigma", "Credits to Owner", function()
      -- line: [0, 0] id: 1570
      loadstring(game:HttpGet("https://pastebin.com/raw/mG8XGpmD", true))()
    end)
    r89_1475:Button("Luigi Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1895
      loadstring(game:HttpGet("https://pastebin.com/raw/UaTjPQMP"))()
    end)
    r89_1475:Button("Rc7 Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1569
      loadstring(game:HttpGet("https://gist.githubusercontent.com/jointeamck/40a11b97bfb6881a72dba218cce85e2a/raw/02ca8af7ef7904182abd4208064d9a22df0010b5/rc7"))()
    end)
    r89_1475:Button("ShitSploit", "Credits to Owner", function()
      -- line: [0, 0] id: 1894
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shitsploit-9386"))()
    end)
    r89_1475:Button("Mario", "Credits to Owner", function()
      -- line: [0, 0] id: 1683
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-by-c00lkidd-9388"))()
    end)
    r89_1475:Button("Mario Premium", "Credits to Owner", function()
      -- line: [0, 0] id: 1641
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-premium-9389"))()
    end)
    r89_1475:Button("Sexy Hamood (Premium)", "Credits to Owner", function()
      -- line: [0, 0] id: 1660
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hamoot-script-9408"))()
    end)
    r89_1475:Button("C00lsploit Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1705
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lsploit-9391"))()
    end)
    r89_1475:Button("Serverside executor gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1903
      loadstring(game:HttpGet("https://pastebin.com/raw/PXAdj6ED"))()
    end)
    local r90_1475 = r88_1475:Section("Admin")
    r90_1475:Button("Infinite Yield", "Infinite Yield Script", function()
      -- line: [0, 0] id: 1637
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    r90_1475:Button("Iv Admin", "Infinite Yield Script", function()
      -- line: [0, 0] id: 2020
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodyBurns/Hex/main/Iv%20Admin%20v3.lua"))()
    end)
    r90_1475:Button("Cmd-X", "Credits to Owner", function()
      -- line: [0, 0] id: 1692
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
    r90_1475:Button("Fates Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1503
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end)
    r90_1475:Button("GrimEx Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1633
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JoeScriptHub/GrimEx-Admin/main/GrimEx%20Admin"))()
    end)
    r90_1475:Button("Gx Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1981
      loadstring(game:HttpGet("https://pastebin.com/raw/v6E9BmFK", true))()
    end)
    r90_1475:Button("Leg Admin v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1786
      loadstring(game:HttpGet("https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua"))()
    end)
    r90_1475:Button("Nameless Admin | Working", "Credits to Owner", function()
      -- line: [0, 0] id: 1525
      loadstring(game:HttpGet("https://gist.github.com/inuk84/ca841931f45f242c945405298b26bd71/raw/af364e5d4ea5b0d2eac404a5376d83c84a23cbe4/na.lua"))()
    end)
    r90_1475:Button("Nameless Admin | Discontinued", "Credits to Owner", function()
      -- line: [0, 0] id: 1926
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end)
    r90_1475:Button("Admin Script", "Credits to Owner", function()
      -- line: [0, 0] id: 1493
      loadstring("loadstring(game:HttpGet((\'https://pastefy.ga/fGYa4i7t/raw\'),true))()\n")()
    end)
    r90_1475:Button("Reviz Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1538
      loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
    end)
    r90_1475:Button("Simple Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1480
      loadstring(game:HttpGet("https://pastebin.com/raw/3hDQcTaD"))()
    end)
    r90_1475:Button("Property Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1664
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Copinface/MainSource/main/PropertyAdmin"))()
    end)
    r90_1475:Button("Vortex Admin", "Credits to Owner", function()
      -- line: [0, 0] id: 1653
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/Fe-Vortex-admin-V2/main/VortexCompany/C4/Discord.lua"))()
    end)
    local r91_1475 = r88_1475:Section("Best Gui Script")
    r91_1475:Button("Script Searcher", "Credits to Owner", function()
      -- line: [0, 0] id: 1878
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end)
    r91_1475:Button("ECCS•Searcher", "Credits to Owner", function()
      -- line: [0, 0] id: 1536
      loadstring(game:HttpGet("https://pastebin.com/raw/zhQ9gfJm"))("Copyright ERROR_CODE ECCS Co")
    end)
    r91_1475:Button("Games Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1733
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    end)
    r91_1475:Button("Vex Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1790
      loadstring(game:HttpGet("https://raw.githubusercontent.com/V31nc/On-Discord/Created/VexHub"))()
    end)
    r91_1475:Button("Sirius Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1970
      loadstring(game:HttpGet("https://sirius.menu/script"))()
    end)
    r91_1475:Button("Moon Ui", "Credits to Owner", function()
      -- line: [0, 0] id: 1504
      loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
    end)
    r91_1475:Button("HarshTech v7.6", "Credits to Owner", function()
      -- line: [0, 0] id: 1985
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/Loadstring/main/HarshTechV7.6-Pc-Or-Mobile.lua"))()
    end)
    r91_1475:Button("Multi Scripter X", "Credits to Owner", function()
      -- line: [0, 0] id: 1925
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader"))()
    end)
    r91_1475:Button("Mocha Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1999
      loadstring(game:HttpGet("https://pastebin.com/raw/0MriWAjK"))()
    end)
    r91_1475:Button("Fathom Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1696
      loadstring(game:HttpGet("https://pastebin.com/raw/Y4AGJALY"))()
    end)
    r91_1475:Button("Gigachad Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1531
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua", true))()
    end)
    r91_1475:Button("Astrolynx", "Credits to Owner", function()
      -- line: [0, 0] id: 1963
      loadstring(game:HttpGet("https://freenote.biz/raw/vBfN3NeVYN", true))()
    end)
    r91_1475:Button("Alysse", "Credits to Owner", function()
      -- line: [0, 0] id: 1839
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/loader.lua"))()
    end)
    r91_1475:Button("GHub", "Credits to Owner", function()
      -- line: [0, 0] id: 1828
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/GHUBV13S/main/GHUBv13S.txt"))()
    end)
    r91_1475:Button("British Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1496
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat7888/BH/main/Protected_6274400031599569.lua%20(1).txt"))()
    end)
    r92_1475 = r88_1475:Section("Good Gui Script")
    r92_1475:Button("123 Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1950
      loadstring(game:HttpGet("https://pastebin.com/raw/qCBVxR3e", true))()
    end)
    r92_1475:Button("Acrylix v2.0", "Credits to Owner", function()
      -- line: [0, 0] id: 1935
      loadstring(game:HttpGet("https://raw.githubusercontent.com/HubbyScripts/FE-Trolling-Hub/main/source"))()
    end)
    r92_1475:Button("ADSKer Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1956
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ADSKerHub/main/ADSKExe"))()
    end)
    r92_1475:Button("Alex Universal", "Credits to Owner", function()
      -- line: [0, 0] id: 1763
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexScripts1/AlexUniversalV4/main/Release"))()
    end)
    r92_1475:Button("All Obby Bido Skins", "Credits to Owner", function()
      -- line: [0, 0] id: 1668
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/All%20obby%20Bido%20Skins%20V1.0"))()
    end)
    r92_1475:Button("All Tycoons v3", "Credits to Owner", function()
      -- line: [0, 0] id: 1560
      loadstring(game:HttpGet("https://freenote.biz/raw/SkG1nrBqE8", true))()
    end)
    r92_1475:Button("Aloneo Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1522
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YogaProjectRblx/AloneUniversal/main/README.md"))()
    end)
    r92_1475:Button("Artillery Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1699
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LynchHHU/ArtilleryHub/main/GameHub/LynchYT"))()
    end)
    r92_1475:Button("Astral Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1896
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua", true))()
    end)
    r92_1475:Button("Astrava", "Credits to Owner", function()
      -- line: [0, 0] id: 2016
      loadstring(game:GetObjects("rbxassetid://1468845733")[1].Source)()
    end)
    r92_1475:Button("Auratus X", "Credits to Owner", function()
      -- line: [0, 0] id: 1490
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RealMrQuacks/AuratusX/master/Load"))()
    end)
    r92_1475:Button("Autput", "Credits to Owner", function()
      -- line: [0, 0] id: 1550
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Autput/main/Autputus"))()
    end)
    r92_1475:Button("Bendy And Ink Machine", "Credits to Owner", function()
      -- line: [0, 0] id: 1478
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
    end)
    r92_1475:Button("B Genesis", "Credits to Owner", function()
      -- line: [0, 0] id: 1816
      loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis"))()
    end)
    r92_1475:Button("Bido Skins v1.9", "Credits to Owner", function()
      -- line: [0, 0] id: 2029
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9"))()
    end)
    r92_1475:Button("British Hub Pvp", "Credits to Owner", function()
      -- line: [0, 0] id: 1866
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat33/Britishhub/main/Protected_4290863539999994.lua.txt"))()
    end)
    r92_1475:Button("Butif Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1952
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/Butif%20Hub"))()
    end)
    r92_1475:Button("Chaddest Cat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 2005
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Yopapa699/Key-System/main/Loader.lua"))()
    end)
    r92_1475:Button("Chat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1562
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20Chat%20Hub"))()
    end)
    r92_1475:Button("Chiezzy Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1753
      loadstring(game:HttpGet("https://raw.githubusercontent.com/chiepz/aslbnmnkhby7e/main/crqhryvjahdjwysrnegsf%5Csgd"))()
    end)
    r92_1475:Button("Comsal Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1962
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Comsal-Hub/main/main"))()
    end)
    r92_1475:Button("Coolgui", "Credits to Owner", function()
      -- line: [0, 0] id: 1768
      loadstring(game:GetObjects("rbxassetid://9827584846")[1].Source)()
    end)
    r92_1475:Button("Cosmos Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1718
      loadstring(game:HttpGet("https://pastebin.com/raw/tFivBbmb"))()
    end)
    r92_1475:Button("Davi Hub v1", "Credits to Owner", function()
      -- line: [0, 0] id: 2019
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua", true))()
    end)
    r92_1475:Button("Davi Hub v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1887
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/DaviguiV2prealphaloader.lua", true))()
    end)
    r92_1475:Button("Davi Hub v2.3", "Credits to Owner", function()
      -- line: [0, 0] id: 1783
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davi-hub-V2.3/main/davi.lua", true))()
    end)
    r92_1475:Button("Delux Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1765
      loadstring(game:HttpGet("https://raw.githubusercontent.com/UniversalXploits/f/master/DeluxHub.txt", true))()
    end)
    r92_1475:Button("Dynamic Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1588
      loadstring(game:HttpGet("https://pastebin.com/raw/bzySVjhX"))()
    end)
    r92_1475:Button("ECCS•GearGiver", "Credits to Owner", function()
      -- line: [0, 0] id: 1829
      loadstring(game:HttpGet("https://pastebin.com/raw/Dhgnt7hi"))("Copyright ERROR_CODE ECCS Co")
    end)
    r92_1475:Button("Eminence Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1863
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ChainGotStucked/a55af82d82574/main/Eminence%20Hub%20V1.6"))()
    end)
    r92_1475:Button("Equinox Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1591
      loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
    end)
    r92_1475:Button("Executor Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1737
      loadstring(game:HttpGet("https://pastebin.com/raw/WxS2CFBX"))()
    end)
    r92_1475:Button("Exploitz Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1984
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBloxYT/ExploitzHub-Games.lua/main/ExploitzHub%20Universal%20(v.3.0%20.)"))()
      setclipboard("ia3i38")
    end)
    r92_1475:Button("Extreme Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1762
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/Exhub/main/Key.lua", true))()
    end)
    r92_1475:Button("Ez Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 2022
      loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
    end)
    r92_1475:Button("F3x Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1818
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/f3xhub/main/f3xhub"))()
    end)
    r92_1475:Button("FeliciaXxxHub", "Credits to Owner", function()
      -- line: [0, 0] id: 1873
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDMJakey/Obfc/main/Protected_7979642737588973.lua", true))()
    end)
    r92_1475:Button("Feyz Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1821
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FeyzRBLX/FeyzHub/main/Feyz%20Hub%20V2"))()
    end)
    r92_1475:Button("FireHubV1", "Credits to Owner", function()
      -- line: [0, 0] id: 1820
      loadstring(game:HttpGet("https://pastebin.com/raw/REuMknBd", True))()
    end)
    r92_1475:Button("Fun Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1508
      loadstring(game:HttpGet("https://pastebin.com/raw/3xqzxtYN"))()
    end)
    r92_1475:Button("Game Hub by:tomm_xx", "Credits to Owner", function()
      -- line: [0, 0] id: 1882
      loadstring(game:HttpGet("https://pastebin.com/raw/18ji1xzk"))()
    end)
    r92_1475:Button("Game Hub/Script Hub By HN BLOX", "Credits to Owner", function()
      -- line: [0, 0] id: 1957
      loadstring(game:HttpGet("https://pastebin.com/raw/brWwrinf", true))()
    end)
    r92_1475:Button("Ghost Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1883
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end)
    r92_1475:Button("Googol", "Credits to Owner", function()
      -- line: [0, 0] id: 1817
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Scripts/main/Googol", true))()
    end)
    r92_1475:Button("Gravity Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 2010
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XDMODZ1040/LUA-DEVSCRIPT/main/GRAVITY%20HUB"))()
    end)
    r92_1475:Button("Gucci Ui", "Credits to Owner", function()
      -- line: [0, 0] id: 1951
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BeStHaXYT/Gucci/main/BeStHaXYT"))()
    end)
    r92_1475:Button("Gx Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1537
      loadstring(game:HttpGet("https://pastebin.com/raw/qWqrZVyt"))()
    end)
    r92_1475:Button("Hat Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1581
      loadstring(game:HttpGet("https://pastebin.com/raw/6tshcUd2"))()
    end)
    r92_1475:Button("Harked Reborn", "Credits to Owner", function()
      -- line: [0, 0] id: 1693
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
    end)
    r92_1475:Button("Haxker Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1792
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/Script-Hub/Version-3.3"))()
    end)
    r92_1475:Button("Holf Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1835
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r92_1475:Button("Hydro Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1530
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
    end)
    r92_1475:Button("Hyperlib Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1488
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"))()
    end)
    r92_1475:Button("Juanko Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1501
      loadstring(game:HttpGet("https://pastebin.com/raw/d5BS5qiX"))()
    end)
    r92_1475:Button("Juice Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1838
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WeAreCrews/Juice-Hub/main/Juice%20Hub"))()
    end)
    r92_1475:Button("Juqua Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1921
      loadstring(game:HttpGet("https://pastebin.com/raw/GTL1CCdg"))()
    end)
    r92_1475:Button("Killer Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1857
      loadstring(game:HttpGet("https://pastebin.com/raw/7MDajezY"))()
    end)
    r92_1475:Button("Lego Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1691
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Lego-Hub/main/main"))()
    end)
    r92_1475:Button("Legon X Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1854
      loadstring(game:HttpGet("https://pastebin.com/raw/Lmaz8vF7", true))()
    end)
    r92_1475:Button("LHYT UNIVERSAL", "Credits to Owner", function()
      -- line: [0, 0] id: 1700
      loadstring(game:HttpGet("https://pastefy.app/upAOsiaJ/raw", true))()
    end)
    r92_1475:Button("Lightning Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1741
      loadstring(game:HttpGet("https://pastebin.com/raw/CSC0Ky7Z", true))()
    end)
    r92_1475:Button("Lightzone v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1871
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Idjrf5/main/Protected_3590052699937668.lua.txt"))()
    end)
    r92_1475:Button("Link To Loadstring", "Credits to Owner", function()
      -- line: [0, 0] id: 1486
      loadstring(game:HttpGet("https://pastebin.com/raw/tsYdcZPJ"))()
    end)
    r92_1475:Button("LittHub", "Credits to Owner", function()
      -- line: [0, 0] id: 1823
      loadstring(game:HttpGet("https://pastebin.com/raw/v4nf9WVz"))()
    end)
    r92_1475:Button("Lollypop Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1991
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rrixh/lollypop-hub/main/v6.5%40lulaslollipop", true))()
    end)
    r92_1475:Button("MegaHub", "Credits To Owner ", function()
      -- line: [0, 0] id: 1972
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WholeF00ds/Mega/main/Obfuscated%20Loader", true))()
    end)
    r92_1475:Button("Mini Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1563
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB", true))()
    end)
    r92_1475:Button("Mil Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1986
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/MilHub/main/V3"))()
    end)
    r92_1475:Button("Music Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1506
      loadstring(game:HttpGet("https://pastebin.com/raw/UmuK3sGL"))()
    end)
    r92_1475:Button("Multi Hub v3", "Credits to Owner", function()
      -- line: [0, 0] id: 1577
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/Multi-Hub-V3/main/Multi%20Hub%20V3"))()
    end)
    r92_1475:Button("Multi Script Hub X", "Credits to Owner", function()
      -- line: [0, 0] id: 1833
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0n1kidd/Multi-Script-Hub-X/main/Protected.lua_1.txt"))()
    end)
    r92_1475:Button("NukeVsCity", "Credits to Owner", function()
      -- line: [0, 0] id: 1642
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))()
    end)
    r92_1475:Button("OpFinality", "Credits to Owner", function()
      -- line: [0, 0] id: 1634
      loadstring(game:HttpGet("https://pastebin.com/raw/3axt0ia1"))()
    end)
    r92_1475:Button("Orange X", "Credits to Owner", function()
      -- line: [0, 0] id: 1600
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Ab2rW/main/ORANGEX%20V5%20RELEASED%20ORANGEX%20ON%20TOP%20.txt"))()
    end)
    r92_1475:Button("Orca", "Credits to Owner", function()
      -- line: [0, 0] id: 1617
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end)
    r92_1475:Button("Pirutun Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1888
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Catserverrr/pirutunHubRbx/main/Protected_2932223426116900.lua.txt"))()
    end)
    r92_1475:Button("Pissware", "Credits To Owner", function()
      -- line: [0, 0] id: 1975
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/Pissware/main/Main/MobileMain.lua"))()
    end)
    r92_1475:Button("PritishHub V1", "Credits To Owner", function()
      -- line: [0, 0] id: 1742
      loadstring(game:HttpGet("https://cdn.discordapp.com/attachments/996659065096765502/996659173213343804/out.lua", true))()
    end)
    r92_1475:Button("Psy Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1679
      loadstring(game:HttpGet("https://pastebin.com/raw/SCwrB1ws"))()
    end)
    r92_1475:Button("Rambo Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1977
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Anaszaxo555/Rambo-hub-1.6/main/Rambo%20hub%201.6"))()
    end)
    r92_1475:Button("Rayfield Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1802
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Essinity/Rayfield-Hub/main/Script", true))()
    end)
    r92_1475:Button("Rebranded Official Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1497
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Cerbiale/Rebranded/main/RebrandedHubLoader.lua"))()
    end)
    r92_1475:Button("Red Coat", "Credits to Owner", function()
      -- line: [0, 0] id: 1510
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/RedCoat8102-obfuscated.lua"))()
    end)
    r92_1475:Button("RemX", "Credits to Owner", function()
      -- line: [0, 0] id: 1798
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Henry887/RemX-Script-Hub/main/main.lua", true))()
    end)
    r92_1475:Button("ReVP Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1527
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/Protected%20"))()
    end)
    r92_1475:Button("Rose Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1840
      loadstring(game:HttpGet("https://pastebin.com/raw/9q2nraUs", true))()
    end)
    r92_1475:Button("Rolf Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1911
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r92_1475:Button("Salakitos Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1787
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAKALITOS/Salakitoshub/main/scriptSK"))()
    end)
    r92_1475:Button("Scripter Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1803
      loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SCRIPTER%20HUB%20V5"))()
    end)
    r92_1475:Button("Script Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 2036
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
    end)
    r92_1475:Button("Script Hub V2", "Credits to Owner", function()
      -- line: [0, 0] id: 1558
      loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV2/main/SCRIPTHUBV2", true))()
    end)
    r92_1475:Button("Secret Service Panel", "Credits to Owner", function()
      -- line: [0, 0] id: 1487
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
    end)
    r92_1475:Button("Shadows Scripts HUB", "Credits to Owner", function()
      -- line: [0, 0] id: 1552
      loadstring(game:HttpGet("https://pastebin.com/raw/tuDMk1pr", true))()
    end)
    r92_1475:Button("Shakars Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1862
      loadstring(game:HttpGet("https://raw.githubusercontent.com/shakar60/USH.P/main/rotected", true))()
    end)
    r92_1475:Button("Shizzuru Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1993
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ggshizuru/myScriptHub/main/ShizzuruHub.1.lua", true))()
    end)
    r92_1475:Button("Sigma Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1927
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrixCoding/SigmaHubV2/main/SigmaHubV2"))()
    end)
    r92_1475:Button("Simple Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1595
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GearV4/Simple-Hub-X-Gear-SSX.lua/main/Gear%20SSX%20X%20Simple%20Hub"))()
    end)
    r92_1475:Button("SlapX v1", "Credits to Owner", function()
      -- line: [0, 0] id: 1774
      loadstring(r32_1475:HttpGet("https://raw.githubusercontent.com/Slinzo1/Hh/main/Hh"))()
    end)
    r92_1475:Button("SlapX v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1889
      loadstring(r32_1475:HttpGet("https://raw.githubusercontent.com/Slinzo1/SlapX-v2-hub/main/SlapX%20Hub%20v2"))()
    end)
    r92_1475:Button("SnapDragon", "Credits to Owner", function()
      -- line: [0, 0] id: 1902
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ruszelds/Snap/main/Dragon", true))()
      setclipboard("SnapDragon")
    end)
    r92_1475:Button("SoninhaHub", "Credits to Owner", function()
      -- line: [0, 0] id: 1702
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SoninhaHub/Universal/main/Source.Lua"))()
    end)
    r92_1475:Button("Superior Vortex", "Credits to Owner", function()
      -- line: [0, 0] id: 1988
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SmartModBoy/VortexAblity/main/SV"))()
    end)
    r92_1475:Button("Sushi X", "Credits to Owner", function()
      -- line: [0, 0] id: 1655
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/sushi/main/X", true))()
    end)
    r92_1475:Button("SH_V11", "Credits to Owner", function()
      -- line: [0, 0] id: 1929
      loadstring(game:HttpGet("https://pastebin.com/raw/J1MfBXv6", true))()
    end)
    r92_1475:Button("Sxrge Script Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1670
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sxrge3k/sxrge_ssh_hub/main/sxrge_script_hub"))()
    end)
    r92_1475:Button("Syntax", "Credits to Owner", function()
      -- line: [0, 0] id: 1709
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Memeboiyot/SyntaxRebornOfficial/main/SyntaxReborn", true))()
    end)
    r92_1475:Button("System Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1685
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AHMEDPLPL/System-hub/main/System%20hub"))()
    end)
    r92_1475:Button("The Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1615
      loadstring(game:HttpGet("https://raw.githubusercontent.com/hassantheking123321/TheHub/main/The%20hub%20v3%20test"))()
    end)
    r92_1475:Button("THEPERFECT", "Credits to Owner", function()
      -- line: [0, 0] id: 2028
      loadstring(game:HttpGet("https://raw.githubusercontent.com/theperfectexploiter2024/THE-PERFECT-HUB-v1/main/THE%20PERFECT%20HUB%20v1.txt"))()
    end)
    r92_1475:Button("Thunder Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1717
      loadstring(game:HttpGet("https://pastebin.com/raw/DFjY4nMy"))()
    end)
    r92_1475:Button("Tiger X Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1611
      loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back"))()
    end)
    r92_1475:Button("TOPK3K REMAKE", "Credits to Owner", function()
      -- line: [0, 0] id: 1694
      loadstring(game:HttpGet("https://pastebin.com/raw/ecfcBQNr", true))()
    end)
    r92_1475:Button("Universe Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1745
      loadstring(game:HttpGet("https://pastebin.com/raw/ApcKYREY", true))()
    end)
    r92_1475:Button("Version Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1995
      loadstring(game:HttpGet("https://pastebin.com/raw/wKc5r6CM"))()
    end)
    r92_1475:Button("VcskV Public", "Credits to Owner", function()
      -- line: [0, 0] id: 1662
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Hub/main.lua", true))()
    end)
    r92_1475:Button("Void Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 2003
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Voidhub.lua/main/VoidHub.lua"))()
    end)
    r92_1475:Button("Yarhm", "Credits to Owner", function()
      -- line: [0, 0] id: 1819
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm-dev.lua"))()
    end)
    r92_1475:Button("YourMom", "Credits to Owner", function()
      -- line: [0, 0] id: 1856
      loadstring(game:GetObjects("rbxassetid://289110135")[1].Source)()
    end)
    r92_1475:Button("YT Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1994
      loadstring(game:HttpGet("https://raw.githubusercontent.com/OWJBWKQLAISH/Yt-Hub/main/YouTuber%20Hub"))()
    end)
    r92_1475:Button("Zars Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1811
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BumbleBeeSaga/BumbleBeeSaga/main/ZarsGUI1.0", true))()
    end)
    r92_1475:Button("Zaza Sploit", "Credits to Owner", function()
      -- line: [0, 0] id: 1659
      loadstring(game:HttpGet("https://pastebin.com/raw/DE8Ltg6j"))()
    end)
    r92_1475:Button("Zxykerz Devil\'s Hub v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1778
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ZxkGamingOfficial/Zxykerz-Devil-s-Hub-V2-New/main/Zxykerz%20Devil\'s%20Hub%20V2"))()
    end)
    local r93_1475 = r88_1475:Section("Other Gui Script")
    r93_1475:Button("Hitbox Expander", "Credits to Owner", function()
      -- line: [0, 0] id: 1916
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end)
    r93_1475:Button("Hitbox Expander | CheatX", "Credits to Owner", function()
      -- line: [0, 0] id: 1913
      loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/shit%20script%20pack/CheatX"))()
    end)
    r93_1475:Button("Chat Filter Bypass", "Bypass Chat Filter", function()
      -- line: [0, 0] id: 1682
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRobloxSS/zetra/main/ZetPanel", true))()
    end)
    r93_1475:Button("Reach Gui v3", "Bypass Chat Filter", function()
      -- line: [0, 0] id: 1528
      loadstring(game:HttpGet("https://pastebin.com/raw/iKn1rhZv"))()
    end)
    r93_1475:Button("Ultimate Trolling Gui v1.5", "Credits to Owner", function()
      -- line: [0, 0] id: 1647
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/9abbc0733af7c9113a5ecbaf4bb2ed5013a4e693/Ultimate%20Trolling%20GUI%20v1.5"))()
    end)
    r93_1475:Button("Ultimate Trolling Gui v2", "Credits to Owner", function()
      -- line: [0, 0] id: 1676
      loadstring(game:HttpGet("https://github.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/raw/main/Akil\'s%20UTG%20v2.0%20full"))()
    end)
    r93_1475:Button("Chanzo Trolling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1715
      loadstring(game:HttpGet("https://pastebin.com/raw/y94Ejz3B", true))()
    end)
    r93_1475:Button("Chat hack Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1710
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r93_1475:Button("1X1X1X1 GUI", "Credits to Owner", function()
      -- line: [0, 0] id: 1780
      loadstring(game:HttpGet("https://pastebin.com/raw/CYye6uA4"))()
    end)
    r93_1475:Button("c00lgui", "Credits to Owner", function()
      -- line: [0, 0] id: 1651
      loadstring(game:HttpGet("https://pastebin.com/raw/HkE93XjW"))()
    end)
    r93_1475:Button("c00lgui2", "Credits to Owner", function()
      -- line: [0, 0] id: 1738
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
    end)
    r93_1475:Button("c00lkidd2", "Credits to Owner", function()
      -- line: [0, 0] id: 1932
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
    end)
    r93_1475:Button("cOOlkidd Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1960
      loadstring(game:HttpGet("https://pastebin.com/raw/UPZCQ31W"))()
    end)
    r93_1475:Button("K00pgui", "Credits to Owner", function()
      -- line: [0, 0] id: 1953
      loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/K00pgui/a50a7131568adf4337053c428733c2eaf308ac6a/K00pgui"))()
    end)
    local r94_1475 = r10_1475:Tab("Fe")
    local r95_1475 = r94_1475:Section("Fe Gui")
    r95_1475:Button("B4krs Chat Bypasser", "Credits to Owner", function()
      -- line: [0, 0] id: 1594
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/v4lsB4krscbR/main/Loadstring%20version%20chat%20bypasser"))()
    end)
    r95_1475:Button("Comet", "Credits to Owner", function()
      -- line: [0, 0] id: 1622
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/Comet"))()
    end)
    r95_1475:Button("Epix\'s Fe Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1938
      loadstring(game:HttpGet("https://pastebin.com/raw/jMAwjKcb"))()
    end)
    r95_1475:Button("Energize [R6]", "Credits to Owner", function()
      -- line: [0, 0] id: 1669
      loadstring(game:HttpGet("https://pastebin.com/raw/1p6xnBNf", true))()
    end)
    r95_1475:Button("Fex", "Credits to Owner", function()
      -- line: [0, 0] id: 1725
      loadstring(game:HttpGet("https://pastebin.com/raw/ES6xMCn7", true))()
    end)
    r95_1475:Button("Free Gamepasses Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1874
      loadstring(game:HttpGet("https://pastebin.com/raw/QtQ4YnVR"))()
    end)
    r95_1475:Button("Free Gamepass Gui(dark modz)", "Credits to Owner", function()
      -- line: [0, 0] id: 1614
      loadstring(game:HttpGet("https://pastebin.com/raw/53yY1S39"))()
    end)
    r95_1475:Button("Nulware v3", "Credits to Owner", function()
      -- line: [0, 0] id: 1825
      local r0_1825 = game:GetService("Players").LocalPlayer
      game:GetService("RunService").Heartbeat:Connect(function()
        -- line: [0, 0] id: 1826
        r0_1825.MaximumSimulationRadius = math.huge
        sethiddenproperty(r0_1825, "SimulationRadius", math.huge)
      end)
      getgenv().Theme = "Blue"
      loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn?identifier=" .. (function()
        -- line: [0, 0] id: 1827
        -- notice: unreachable block#8
        local r0_1827 = ""
        for r4_1827 = 1, 256, 1 do
          local r5_1827 = math.random(1, 3)
          local r6_1827 = r0_1827
          local r7_1827 = string.char
          local r8_1827 = nil	-- notice: implicit variable refs by block#[9]
          if r5_1827 == 1 then
            r8_1827 = math.random(48, 57)
            if not r8_1827 then
              ::label_22::
              if r5_1827 == 2 then
                r8_1827 = math.random(97, 122)
                if not r8_1827 then
                  ::label_31::
                  if r5_1827 == 3 then
                    r8_1827 = math.random(65, 90)
                  else
                    r8_1827 = false
                  end
                end
              else
                goto label_31	-- block#5 is visited secondly
              end
            end
          else
            goto label_22	-- block#3 is visited secondly
          end
          r0_1827 = r6_1827 .. r7_1827(r8_1827)
        end
        return r0_1827
      end)()))()
    end)
    r95_1475:Button("Player Orbit", "Credits to Owner", function()
      -- line: [0, 0] id: 1557
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
    end)
    r95_1475:Button("Tool Giver", "Credits to Owner", function()
      -- line: [0, 0] id: 1545
      loadstring(game:HttpGet("https://pastebin.com/raw/Ctqjmtkv", true))()
    end)
    r95_1475:Button("Troll GUI", "Credits to Owner", function()
      -- line: [0, 0] id: 1654
      loadstring(game:HttpGet("https://pastebin.com/raw/nwGzXh1V", true))()
    end)
    r95_1475:Button("Trolling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1520
      loadstring(game:HttpGet("https://pastefy.app/ic5m4aJG/raw", true))()
    end)
    r95_1475:Button("Xuctry FE Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1836
      loadstring(game:HttpGet("https://pastebin.com/raw/Zz4YDvLb", true))()
    end)
    local r96_1475 = r94_1475:Section("Fe Script")
    r96_1475:Button("Fe Anti Afk", "Credits to Owner", function()
      -- line: [0, 0] id: 2017
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Huubb/main/Mobile%20Scripting"))()
    end)
    r96_1475:Button("Fe Anti Fall", "Credits To Owner", function()
      -- line: [0, 0] id: 1872
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/AntiFall/main/Script"))()
    end)
    r96_1475:Button("Fe Chat Bypasser", "Credits to Owner", function()
      -- line: [0, 0] id: 1843
      loadstring(game:HttpGet("https://raw.githubusercontent.com/bedra45/chetbypasser/main/chetbypass"))()
    end)
    r96_1475:Button("Fe Chat Executor", "Credits to Owner", function()
      -- line: [0, 0] id: 1943
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor", true))()
    end)
    r96_1475:Button("Fe Chat Hack", "Credits To Owner", function()
      -- line: [0, 0] id: 1824
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r96_1475:Button("Fe Chat Hax", "Credits to Owner", function()
      -- line: [0, 0] id: 1629
      loadstring(game:HttpGet("https://pastebin.com/raw/XFdQEjzx", true))()
    end)
    r96_1475:Button("Fe Clone", "Credits to Owner", function()
      -- line: [0, 0] id: 1747
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end)
    r96_1475:Button("Fe Collision", "Credits to Owner", function()
      -- line: [0, 0] id: 1482
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt", true))()
    end)
    r96_1475:Button("Fe Control Npc", "Credits to Owner", function()
      -- line: [0, 0] id: 2009
      loadstring(game:HttpGet("https://pastefy.app/x8nWWq0M/raw", true))()
    end)
    r96_1475:Button("Fe Crawl Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1754
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))()
    end)
    r96_1475:Button("Fe Death Note", "Credits to Owner", function()
      -- line: [0, 0] id: 1573
      loadstring(game:HttpGet("https://pastefy.app/GoKxYBkU/raw", true))()
    end)
    r96_1475:Button("Fe Dino Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 1899
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_K2n31uc6t2wY5A8786eR4K15sgbUF0vdQ80a0LzgvLRkSNYd89H1AS3124gMR6SM.lua.txt", true))()
    end)
    r96_1475:Button("Fe Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 1880
      loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end)
    r96_1475:Button("Fe Fling Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1834
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/Fe-Fling-GUI-For-roblox/main/Main.lua", true))()
    end)
    r96_1475:Button("Fe Flinger By GGH52Lan", "Credits to Owner", function()
      -- line: [0, 0] id: 1759
      loadstring(game:HttpGet("https://pastebin.com/raw/xu3C3TSU"))()
    end)
    r96_1475:Button("Fe Free Gamepass Tools Giver(Obby Only)", "Credits to Owner", function()
      -- line: [0, 0] id: 1652
      for r3_1652, r4_1652 in pairs(game:GetDescendants()) do
        if r4_1652.ClassName == "RemoteEvent" and (r4_1652.Parent.Name == "WeaponsRemotes" or r4_1652.Parent.Name == "VipRemotes" or r4_1652.Parent.Name == "Remotes") then
          r4_1652:FireServer()
        end
      end
    end)
    r96_1475:Button("Fe Freeze", "Credits to Owner", function()
      -- line: [0, 0] id: 1513
      loadstring(game:HttpGet("https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source"))()
    end)
    r96_1475:Button("Fe Gamepass Tool Giver v4", "Credits to Owner", function()
      -- line: [0, 0] id: 1623
      loadstring(game:HttpGet("https://pastefy.app/VYIAk3o1/raw", true))()
    end)
    r96_1475:Button("Fe Ghost", "Credits to Owner", function()
      -- line: [0, 0] id: 1492
      loadstring(game:HttpGet("https://pastebin.com/raw/uUtRsAX5"))()
    end)
    r96_1475:Button("Fe God Mode | Obby", "Credits to Owner", function()
      -- line: [0, 0] id: 1606
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main", true))()
    end)
    r96_1475:Button("Fe Grab Parts", "Credits to Owner", function()
      -- line: [0, 0] id: 1598
      loadstring(game:HttpGet("https://pastefy.app/BbXuvVkK/raw", true))()
    end)
    r96_1475:Button("Fe Hat Spin", "Credits to Owner", function()
      -- line: [0, 0] id: 1722
      loadstring(game:HttpGet("https://pastebin.com/raw/32PbiWw1", true))()
    end)
    r96_1475:Button("Fe Invisible Boat", "Credits to Owner", function()
      -- line: [0, 0] id: 1495
      loadstring(game:HttpGet("https://pastefy.app/0CS5vmly/raw", true))()
    end)
    r96_1475:Button("Fe Ink Monster", "Credits to Owner", function()
      -- line: [0, 0] id: 1678
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_f4i3ntKS5B8tK9zpCAnr31Dp7RNSYOo20gpln1fs1h2U4yjXNdNk6lFqZvN1Ft2p.lua.txt"))()
    end)
    r96_1475:Button("Fe Invisible Script", "Credits to Owner", function()
      -- line: [0, 0] id: 1858
      loadstring(game:HttpGet("https://pastebin.com/raw/HrbT6bNK", true))()
    end)
    r96_1475:Button("Fe Invisibility Tool", "Credits to Owner", function()
      -- line: [0, 0] id: 1954
      loadstring(game:HttpGet("https://pastebin.com/raw/bdBWidBC"))()
    end)
    r96_1475:Button("Fe Lag Switch", "Credits to Owner", function()
      -- line: [0, 0] id: 1566
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt", true))()
    end)
    r96_1475:Button("Fe Lift Player Up", "Credits to Owner", function()
      -- line: [0, 0] id: 1946
      player = game:GetService("Players").LocalPlayer
      mouse = player:GetMouse()
      camera = workspace.CurrentCamera
      ts = game:GetService("TweenService")
      function createtween(r0_1947, r1_1947, r2_1947)
        -- line: [0, 0] id: 1947
        tween = ts:Create(r0_1947, TweenInfo.new(r2_1947), {
          CFrame = r1_1947,
        })
        tween:Play()
        tween.Completed:Wait()
      end
      outline = Instance.new("Highlight")
      target = nil
      mouse.Button1Up:Connect(function()
        -- line: [0, 0] id: 1949
        if mouse.Target then
          local r0_1949 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_1949 and r0_1949:FindFirstChild("Humanoid") then
            camera.CameraSubject = r0_1949.Humanoid
            target = r0_1949
          else
            outline.Parent = nil
          end
        end
      end)
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 1948
        if player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
          if target and target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.CFrame.Y + 20 < player.Character.HumanoidRootPart.CFrame.Y then
            tween:Cancel()
          end
        end
        if mouse.Target then
          local r0_1948 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_1948 and r0_1948:FindFirstChild("Humanoid") then
            outline.Parent = r0_1948
          else
            outline.Parent = nil
          end
        end
      end)
      while task.wait() do
        local r0_1946 = target
        if r0_1946 ~= nil then
          r0_1946 = target:FindFirstAncestorOfClass("Workspace")
          if r0_1946 then
            r0_1946 = target
            if r0_1946 ~= player.Character then
              r0_1946 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_1946 then
                r0_1946 = target:FindFirstChild("HumanoidRootPart")
                if r0_1946 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  r0_1946 = hrp
                  r0_1946.CFrame = thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * -10
                end
              end
            end
          end
        end
        r0_1946 = target
        if r0_1946 ~= nil then
          r0_1946 = target:FindFirstAncestorOfClass("Workspace")
          if r0_1946 then
            r0_1946 = target
            if r0_1946 ~= player.Character then
              r0_1946 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_1946 then
                r0_1946 = target:FindFirstChild("HumanoidRootPart")
                if r0_1946 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  rot = thrp.CFrame * CFrame.Angles(math.rad(25), math.rad(25), math.rad(25))
                  createtween(hrp, thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * 1000000, 100000)
                end
              end
            end
          end
        end
      end
    end)
    r96_1475:Button("Fe Parts Mover", "Credits to Owner", function()
      -- line: [0, 0] id: 1697
      loadstring(game:HttpGet("https://pastefy.app/Vcuyg09O/raw", true))()
    end)
    r96_1475:Button("Fe Punch", "Credits to Owner", function()
      -- line: [0, 0] id: 1832
      loadstring(game:HttpGet("https://pastefy.ga/GvnHVjT5/raw", true))()
    end)
    r96_1475:Button("Fe R15 to R6", "Credits to Owner", function()
      -- line: [0, 0] id: 2000
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua", true))()
    end)
    r96_1475:Button("Fe Roll Ball", "Credits to Owner", function()
      -- line: [0, 0] id: 1516
      loadstring(game:HttpGet("https://pastebin.com/raw/BZr9bGDy", true))()
    end)
    r96_1475:Button("Fe SCP 173", "Credits to Owner", function()
      -- line: [0, 0] id: 1990
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_nN0N66DHV2BjPwzYN59M17qSSlvJryM201CSC1sg07czxnZf48h9GHOFGd87G6Hh.lua.txt", true))()
    end)
    r96_1475:Button("Fe Spy", "Credits to Owner", function()
      -- line: [0, 0] id: 1628
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))()
    end)
    r96_1475:Button("Fe Sword Kill All", "Credits to Owner", function()
      -- line: [0, 0] id: 1930
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script"))()
    end)
    r96_1475:Button("Fe Touch Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 1822
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
    end)
    r96_1475:Button("Fe Tp Place Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1518
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Tp%20Place%20GUI", true))()
    end)
    r96_1475:Button("FE Yeet", "Credits to Owner", function()
      -- line: [0, 0] id: 2002
      loadstring(game:HttpGet("https://pastebin.com/raw/saMtiek2", true))()
    end)
    r96_1475:Button("Fe Zero Gravity Parts", "Credits to Owner", function()
      -- line: [0, 0] id: 1619
      loadstring(game:HttpGet("https://pastebin.com/raw/aXgyQyKY"))()
    end)
    r96_1475:Button("Fe Zombie Fling", "Credits to Owner", function()
      -- line: [0, 0] id: 1978
      loadstring(game:HttpGet("https://pastefy.app/w7KnPY70/raw", true))()
    end)
    local r97_1475 = r94_1475:Section("Not Sure Fe")
    r97_1475:Button("Among Us", "Credits to Owner", function()
      -- line: [0, 0] id: 1868
      loadstring(game:HttpGet("https://pastebin.com/raw/vNiNzr34"))()
    end)
    r97_1475:Button("Backflip", "Credits to Owner", function()
      -- line: [0, 0] id: 1618
      loadstring(game:HttpGet("https://pastebin.com/raw/n2gUwjc4"))()
    end)
    r97_1475:Button("Bloody Knife", "Credits to Owner", function()
      -- line: [0, 0] id: 1544
      loadstring(game:HttpGet("https://pastebin.com/raw/25P2tVPD"))()
    end)
    r97_1475:Button("Coolkid Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1728
      loadstring(game:HttpGet("https://pastebin.com/raw/YsVaUfYQ", true))()
    end)
    r97_1475:Button("Gale Fighter", "Credits to Owner", function()
      -- line: [0, 0] id: 1945
      loadstring(game:HttpGet("https://pastebin.com/raw/YCH5P19e"))()
    end)
    r97_1475:Button("Psychopath", "Credits to Owner", function()
      -- line: [0, 0] id: 1837
      loadstring(game:HttpGet("https://pastebin.com/raw/9Lharw50"))()
    end)
    r97_1475:Button("Slasher", "Credits to Owner", function()
      -- line: [0, 0] id: 1801
      loadstring(game:HttpGet("https://pastebin.com/raw/sVEn1Tza"))()
    end)
    r97_1475:Button("Snake", "Credits to Owner", function()
      -- line: [0, 0] id: 1499
      loadstring(game:HttpGet("https://pastebin.com/raw/naRUdxrc", true))()
    end)
    r97_1475:Button("Spider", "Credits to Owner", function()
      -- line: [0, 0] id: 1906
      loadstring(game:HttpGet("https://pastebin.com/raw/txsk1LJg"))()
    end)
    local r98_1475 = r94_1475:Section("Useful")
    r98_1475:Button("Animation Gui", "loads s fe gui that has different animation for you to use", function()
      -- line: [0, 0] id: 1485
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end)
    r98_1475:Button("Emotes Gui | Best", "loads a fe gui that has different emotes for you to use", function()
      -- line: [0, 0] id: 1771
      loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()
    end)
    r98_1475:Button("Emotes Gui", "loads a fe gui that has different emotes for you to use", function()
      -- line: [0, 0] id: 1791
      loadstring(game:HttpGet("https://pastebin.com/raw/fitjHU5J"))()
    end)
    local r99_1475 = r94_1475:Section("Sus Script")
    r99_1475:Button("Pendulum Hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1673
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
    end)
    r99_1475:Button("Sussy hub", "Credits to Owner", function()
      -- line: [0, 0] id: 1969
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub"))()
    end)
    local r100_1475 = r10_1475:Tab("Other")
    local r101_1475 = r100_1475:Section("Player")
    local r102_1475 = 16
    local r103_1475 = false
    local r106_1475 = "Textbox"
    r106_1475 = "Walk Speed"
    r101_1475:[r106_1475](r106_1475, "Set Walk Speed", function(r0_1885)
      -- line: [0, 0] id: 1885
      r102_1475 = r0_1885
      pcall(function()
        -- line: [0, 0] id: 1886
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r0_1885
      end)
    end)
    r101_1475:Toggle("Loop Walk Speed", "If You Die The Walk Speed Won\'t Reset", function(r0_1939)
      -- line: [0, 0] id: 1939
      r103_1475 = r0_1939
      if r0_1939 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 1940
          if r103_1475 then
            pcall(function()
              -- line: [0, 0] id: 1941
              game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r102_1475
            end)
          end
        end)
      end
    end)
    local r104_1475 = 50
    local r105_1475 = false
    local r108_1475 = "Textbox"
    r108_1475 = "Jump Power"
    r101_1475:[r108_1475](r108_1475, "Set Jump Power", function(r0_1625)
      -- line: [0, 0] id: 1625
      r104_1475 = r0_1625
      pcall(function()
        -- line: [0, 0] id: 1626
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r0_1625
      end)
    end)
    r101_1475:Toggle("Loop Jump Power", "If You Die The Jump Power Won\'t Reset", function(r0_1553)
      -- line: [0, 0] id: 1553
      r105_1475 = r0_1553
      if r0_1553 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 1554
          if r105_1475 then
            pcall(function()
              -- line: [0, 0] id: 1555
              game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r104_1475
            end)
          end
        end)
      end
    end)
    r108_1475 = "Textbox"
    r108_1475 = "Gravity"
    r101_1475:[r108_1475](r108_1475, "Set Gravity", function(r0_1568)
      -- line: [0, 0] id: 1568
      game.Workspace.Gravity = r0_1568
    end)
    r108_1475 = "Textbox"
    r108_1475 = "Zoom Distance"
    r101_1475:[r108_1475](r108_1475, "Set Zoom Distance", function(r0_1877)
      -- line: [0, 0] id: 1877
      game.Players.LocalPlayer.CameraMaxZoomDistance = r0_1877
    end)
    r101_1475:Button("Endless Zoom", "Make You Zoom Infinitely", function()
      -- line: [0, 0] id: 1749
      local r0_1749 = game.Players.LocalPlayer
      r0_1749.CameraMaxZoomDistance = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      r0_1749.CameraMinZoomDistance = 0
    end)
    r101_1475:Button("Reset", "Reset Above", function()
      -- line: [0, 0] id: 1777
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      game.Workspace.Gravity = 196.2
      game.Players.LocalPlayer.CameraMaxZoomDistance = 200
    end)
    r101_1475:Toggle("Infinite Jump", "Make You Jump Unlimited", function(r0_1784)
      -- line: [0, 0] id: 1784
      getgenv().InfiniteJumpEnabled = r0_1784
      game:GetService("UserInputService").JumpRequest:connect(function()
        -- line: [0, 0] id: 1785
        if InfiniteJumpEnabled == true then
          game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
      end)
    end)
    r101_1475:Toggle("Auto jump", "Jump Automatically", function(r0_1812)
      -- line: [0, 0] id: 1812
      J = r0_1812
      spawn(function()
        -- line: [0, 0] id: 1813
        while wait() do
          local r0_1813 = J
          if r0_1813 then
            r0_1813 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            r0_1813.Jump = true
          else
            break
          end
        end
      end)
    end)
    r101_1475:Toggle("Fov", "Changes Fov", function(r0_1861)
      -- line: [0, 0] id: 1861
      if r0_1861 then
        game.Workspace.CurrentCamera.FieldOfView = 120
      else
        game.Workspace.CurrentCamera.FieldOfView = 70
      end
    end)
    r101_1475:Button("Reset Character", "Reset Your Character", function()
      -- line: [0, 0] id: 1743
      game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)
    r101_1475:Toggle("Noclip [Beta]", "A Simple Noclip Toggle", function(r0_1729)
      -- line: [0, 0] id: 1729
      getgenv().noclipEnabled = r0_1729
      game:GetService("RunService").Stepped:connect(function()
        -- line: [0, 0] id: 1730
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(noclip)
        if noclipEnabled == true then
          local r0_1730 = true
          local r1_1730 = game.Players.LocalPlayer
          for r6_1730, r7_1730 in pairs((r1_1730.Character or r1_1730.CharacterAdded:Wait()):GetDescendants()) do
            pcall(function()
              -- line: [0, 0] id: 1731
              if r7_1730:IsA("BasePart") then
                r7_1730.CanCollide = false
              end
            end)
            -- close: r6_1730
          end
        end
        game:GetService("RunService").Stepped:wait()
      end)
    end)
    r101_1475:Button("No Clip | Press E To Use", "Use Keyboard Script On Mobile", function()
      -- line: [0, 0] id: 1498
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/No%20Clip"))()
    end)
    r101_1475:Button("Shift Lock", "Shift Lock Gui", function()
      -- line: [0, 0] id: 1842
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Shiftlock"))()
    end)
    r101_1475:Button("Console Button", "Good For Script Maker", function()
      -- line: [0, 0] id: 1848
      local r0_1848 = Instance.new("ScreenGui")
      r0_1848.Name = "console"
      r0_1848.Parent = game.CoreGui
      local r1_1848 = Instance.new("TextButton")
      r1_1848.Name = "button"
      r1_1848.Parent = r0_1848
      r1_1848.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      r1_1848.BackgroundTransparency = 0.5
      r1_1848.Position = UDim2.new(0, 105, 0, -32)
      r1_1848.Size = UDim2.new(0, 32, 0, 32)
      r1_1848.Text = "< >"
      r1_1848.TextColor3 = Color3.fromRGB(200, 200, 200)
      r1_1848.Font = "Code"
      r1_1848.TextSize = 15
      local r2_1848 = Instance.new("UICorner")
      r2_1848.CornerRadius = UDim.new(0, 8)
      r2_1848.Parent = r1_1848
      r1_1848.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 1849
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9", false, game)
      end)
    end)
    r101_1475:Button("Fly | Pc", "Literally Fly", function()
      -- line: [0, 0] id: 1904
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script"))()
    end)
    r101_1475:Button("Fps Booster", "Make your game smother", function()
      -- line: [0, 0] id: 1775
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/FpsBooster"))()
    end)
    r101_1475:Button("Ping Counter", "Check if your wifi is good", function()
      -- line: [0, 0] id: 1964
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ping"))()
    end)
    r101_1475:Button("Fps Counter", "See if Your roblox is laggy", function()
      -- line: [0, 0] id: 1844
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fps"))()
    end)
    r101_1475:Button("Anti Afk", "Don\'t get kicked while afk", function()
      -- line: [0, 0] id: 1901
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Anti-Afk-Remastered-Script-or-Diffrent-Cool-UI-2097"))()
    end)
    r101_1475:Button("Anti Fling", "Player cant fling you anymore", function()
      -- line: [0, 0] id: 1620
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Anti%20Fling", true))()
    end)
    r101_1475:Button("Fling With No Collision", "Fling people i guess ", function()
      -- line: [0, 0] id: 1644
      loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/544f7efbe88235666b5b7add65b7344d/raw/f20804bb85542dcc3bc938982e1f05b7ff05cded/FE%2520Hat%2520Fling"))()
    end)
    r101_1475:Button("Guardian", "Protector", function()
      -- line: [0, 0] id: 1959
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
    end)
    r106_1475 = r100_1475:Section("Guis")
    r106_1475:Button("Walk Speed Gui", "", function()
      -- line: [0, 0] id: 1744
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Walk-Speed-Gui"))()
    end)
    r106_1475:Button("Jump Power Gui", "", function()
      -- line: [0, 0] id: 1616
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Jump-Power-Gui"))()
    end)
    r106_1475:Button("Gravity Gui", "", function()
      -- line: [0, 0] id: 1507
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Gravity-Gui"))()
    end)
    r106_1475:Button("Fov Gui", "", function()
      -- line: [0, 0] id: 1814
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fov-Gui"))()
    end)
    r106_1475:Button("Fly Gui | Mobile", "Fly Gui Modified", function()
      -- line: [0, 0] id: 1630
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fly-New"))()
    end)
    r106_1475:Button("VFly", "Fly Gui", function()
      -- line: [0, 0] id: 1755
      loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end)
    r106_1475:Button("No Clip Gui", "", function()
      -- line: [0, 0] id: 1535
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/NoClip_Gui"))()
    end)
    local r107_1475 = r100_1475:Section("Esp/Hitbox")
    r108_1475 = workspace.CurrentCamera
    local r109_1475 = false
    local r110_1475 = game:GetService("RunService")
    function lookAt(r0_1605, r1_1605)
      -- line: [0, 0] id: 1605
      r108_1475.CFrame = CFrame.new(r0_1605, r1_1605)
    end
    function getClosestPlayerToCursor(r0_2018)
      -- line: [0, 0] id: 2018
      local r2_2018 = math.huge
      local r1_2018 = nil	-- notice: implicit variable refs by block#[10]
      for r6_2018, r7_2018 in ipairs(game.Players:GetPlayers()) do
        if r7_2018 ~= game.Players.LocalPlayer and r7_2018.Character and r7_2018.Character:FindFirstChild(r0_2018) then
          local r9_2018, r10_2018 = r108_1475:WorldToViewportPoint(r7_2018.Character[r0_2018].Position)
          local r13_2018 = (Vector2.new(r9_2018.x, r9_2018.y) - Vector2.new(r108_1475.ViewportSize.x / 2, r108_1475.ViewportSize.y / 2)).magnitude
          if r13_2018 < r2_2018 and r10_2018 and r109_1475 and r13_2018 < 400 then
            r2_2018 = r13_2018
            r1_2018 = r7_2018
          end
        end
      end
      return r1_2018
    end
    r110_1475.RenderStepped:Connect(function()
      -- line: [0, 0] id: 1512
      local r0_1512 = getClosestPlayerToCursor("Head")
      if r109_1475 and r0_1512 and r0_1512.Character:FindFirstChild("Head") and r0_1512.TeamColor ~= game.Players.LocalPlayer.TeamColor and 0 < r0_1512.Character.Humanoid.Health and 99 < r0_1512.Character.HumanoidRootPart.Position.Y then
        lookAt(r108_1475.CFrame.p, r0_1512.Character.Head.Position + Vector3.new(0, -((game.Players.LocalPlayer.Character.Head.Position - r0_1512.Character.Head.Position)).magnitude / 4.2, 0))
      end
    end)
    r107_1475:Toggle("Aimbot [Beta]", "Auto Aim", function(r0_1695)
      -- line: [0, 0] id: 1695
      r109_1475 = r0_1695
    end)
    r107_1475:Button("Aimbot/SilentAim", "?", function()
      -- line: [0, 0] id: 2037
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Aimbot_SilentAim"))()
    end)
    r107_1475:Button("Esp Box", "Opens Esp Box", function()
      -- line: [0, 0] id: 1727
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp%20Box"))()
    end)
    r107_1475:Button("Tracers", "Opens Tracers", function()
      -- line: [0, 0] id: 1740
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Tracers"))()
    end)
    r107_1475:Button("Esp", "Enable Esp", function()
      -- line: [0, 0] id: 1864
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp"))()
    end)
    r107_1475:Button("Hitbox", "Increase Range", function()
      -- line: [0, 0] id: 1603
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/HitBox"))()
    end)
    local r111_1475 = r100_1475:Section("Shader")
    r111_1475:Button("Realistic Shader", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 1542
      loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
    end)
    r111_1475:Button("P Rtx", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 1515
      loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))()
    end)
    r111_1475:Button("Pshade", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 1850
      loadstring(game:HttpGet("https://pastebin.com/raw/Cd76B8Lh"))()
    end)
    r111_1475:Button("Chillz\'s Enhancer v0.2", "Makes Graphics Much More Realistic", function()
      -- line: [0, 0] id: 1875
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/enhancer.txt"))()
    end)
    local r112_1475 = r100_1475:Section("Time Changer")
    r112_1475:Button("Day | Night Cycle [Beta]", "", function()
      -- line: [0, 0] id: 1640
      loadstring(game:HttpGet("https://pastebin.com/raw/hiZMgnkc"))()
    end)
    local r115_1475 = "Textbox"
    r115_1475 = "Time Set"
    r112_1475:[r115_1475](r115_1475, "Set Game Time", function(r0_1750)
      -- line: [0, 0] id: 1750
      game.Lighting.TimeOfDay = r0_1750
    end)
    local r113_1475 = nil
    function TimeCh()
      -- line: [0, 0] id: 1867
      return r113_1475
    end
    function TimeChangeOption()
      -- line: [0, 0] id: 1687
      if TimeChange() == "Morning | 6:00 AM" then
        game.Lighting.TimeOfDay = 6
      elseif TimeChange() == "Morning | 9:00 AM" then
        game.Lighting.TimeOfDay = 9
      elseif TimeChange() == "Noon | 12:00 PM" then
        game.Lighting.TimeOfDay = 12
      elseif TimeChange() == "Afternoon | 3:00 PM" then
        game.Lighting.TimeOfDay = 15
      elseif TimeChange() == "Evening | 6:00 PM" then
        game.Lighting.TimeOfDay = 18
      elseif TimeChange() == "Night | 9:00 PM" then
        game.Lighting.TimeOfDay = 21
      elseif TimeChange() == "Midnight | 12:00 AM" then
        game.Lighting.TimeOfDay = 24
      elseif TimeChange() == "Midnight | 3:00 AM" then
        game.Lighting.TimeOfDay = 3
      end
    end
    r112_1475:Dropdown("Game Time [Beta]", "Change Time On Your Game Not Fe", {
      "Morning | 6:00 AM",
      "Morning | 9:00 AM",
      "Noon | 12:00 PM",
      "Afternoon | 3:00 PM",
      "Evening | 6:00 PM",
      "Night | 9:00 PM",
      "Midnight | 12:00 AM",
      "Midnight | 3:00 AM"
    }, function(r0_1987)
      -- line: [0, 0] id: 1987
      r113_1475 = r0_1987
      TimeChangeOption()
    end)
    local r114_1475 = r100_1475:Section("Server")
    r114_1475:Button("Rejoin(Join Same Server)", "", function()
      -- line: [0, 0] id: 1674
      game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end)
    r114_1475:Button("ServerHop", "", function()
      -- line: [0, 0] id: 1980
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Rejoin"))()
    end)
    r114_1475:Button("Rejoin Button", "Make you able to rejoin if you get disconnected", function()
      -- line: [0, 0] id: 1809
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts-2/main/rejoin%20button%20for%20kick%20message.lua", true))()
    end)
    r115_1475 = r100_1475:Section("Other")
    r115_1475:Button("Backdoor.exe", "Backdoor Executor", function()
      -- line: [0, 0] id: 1561
      loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua"))()
    end)
    r115_1475:Button("Break Camera Script", "Break Your Camera", function()
      -- line: [0, 0] id: 1680
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r115_1475:Button("Bt Tools", "Admin Tools", function()
      -- line: [0, 0] id: 1795
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bt%20Tools"))()
    end)
    r115_1475:Button("Camera Spy", "Credits to Owner", function()
      -- line: [0, 0] id: 1681
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/CameraSpy/main/Script", true))()
    end)
    r115_1475:Button("Chat Spam", "Credits to Owner", function()
      -- line: [0, 0] id: 1937
      loadstring(game:HttpGet("https://pastebin.com/raw/8Htx56Ab"))()
    end)
    r115_1475:Button("Dex 2.0", "Better Than Dex 4 If Your In Mobile", function()
      -- line: [0, 0] id: 1661
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    r115_1475:Button("Dex 4", "Dark Mode I Guess", function()
      -- line: [0, 0] id: 1909
      loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/dexV4/main/main.lua"))()
    end)
    r115_1475:Button("F3x", "Backdoor Executor", function()
      -- line: [0, 0] id: 2026
      loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)
    r115_1475:Button("Fog Spawner", "Fog", function()
      -- line: [0, 0] id: 2030
      loadstring(game:HttpGet("https://pastebin.com/raw/bxgUc8BX"))()
    end)
    r115_1475:Button("FraktureSS", "Backdoor Executor", function()
      -- line: [0, 0] id: 2021
      loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/source.lua", true))()
    end)
    r115_1475:Button("Free Cam | Best", "Like Minecraft But In Roblox", function()
      -- line: [0, 0] id: 1534
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    r115_1475:Button("Free Cam", "Like Minecraft But In Roblox", function()
      -- line: [0, 0] id: 1509
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r115_1475:Button("Freeze Camera Script", "Freeze Yor Camera", function()
      -- line: [0, 0] id: 1800
      loadstring(game:HttpGet("https://pastebin.com/raw/T0S0RPTW"))()
    end)
    r115_1475:Button("GreenScreen Gui", "Not Fe But Perfect For Videos", function()
      -- line: [0, 0] id: 1580
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Green%20Screen"))()
    end)
    r115_1475:Button("Keyboard", "Keyboard Gui", function()
      -- line: [0, 0] id: 1983
      loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    r115_1475:Button("Keyboard v3", "Keyboard Gui", function()
      -- line: [0, 0] id: 1607
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/mobkeyboardv3"))()
    end)
    r115_1475:Button("Keystrokes Gui v2", "Keyboard Script", function()
      -- line: [0, 0] id: 1915
      loadstring(game:HttpGet("https://pastefy.app/Te4dwSw2/raw", true))()
    end)
    r115_1475:Button("Mouse Cursor V2", "Mouse Cursor I Guess ", function()
      -- line: [0, 0] id: 1582
      loadstring(game:HttpGet("https://pastefy.ga/58d8d52G/raw", true))()
    end)
    r115_1475:Button("Multi Tools", "Gives You Cool Tools To Use", function()
      -- line: [0, 0] id: 2033
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/MultiToolsV1/main/script"))()
    end)
    r115_1475:Button("Platform", "Platform", function()
      -- line: [0, 0] id: 1845
      local r0_1845 = Instance.new("Part", workspace)
      local r1_1845 = game:GetService("TweenService")
      r0_1845.Anchored = true
      r0_1845.CanCollide = true
      r0_1845.Size = Vector3.new(5.246, 0.271, 4.852)
      _G.e = true
      while _G.e == true do
        wait()
        r1_1845:Create(r0_1845, TweenInfo.new(0.2), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0),
        }):Play()
      end
    end)
    r115_1475:Button("Rainbow Map", "Make You Game Rainbow", function()
      -- line: [0, 0] id: 1559
      -- notice: unreachable block#5
      while true do
        for r3_1559, r4_1559 in ipairs(workspace:GetDescendants()) do
          if r4_1559:IsA("BasePart") then
            r4_1559.BrickColor = BrickColor.new(Color3.new(math.random(), math.random(), math.random()))
          end
        end
        wait(0.5)
      end
    end)
    r115_1475:Button("Realistic First Person", "First Person", function()
      -- line: [0, 0] id: 1672
      local r1_1672 = "Pastefy"
      local r2_1672 = "bwTjFg4P"
      local r3_1672 = "7wTjFg4P"
      local r4_1672 = "kTjGhS9L"
      local r5_1672 = "d2RcPf6T"
      local r6_1672 = "7nWrEg5Q"
      local r7_1672 = "p9JhTd4B"
      local r8_1672 = "r8CjQf3N"
      local r9_1672 = "s2CkRd6W"
      local r10_1672 = "v5PhZg8L"
      local r11_1672 = "3sQjRf5T"
      local r13_1672 = "o7KjXg4L"
      local r14_1672 = "t9GnQd1R"
      local r15_1672 = "y6LmSf2N"
      local r16_1672 = "x3QjDg6P"
      local r17_1672 = "c4VmLb8N"
      local r18_1672 = "z2PkTf5J"
      local r19_1672 = "e8LcGh9E"
      local r20_1672 = "k5RfPd2W"
      local r21_1672 = "2qFdRg7M"
      local r22_1672 = "i2QbLh8S"
      local r23_1672 = "g6ScTd3N"
      local r24_1672 = "w9LbRf5G"
      local r25_1672 = "b4NjDc7M"
      loadstring(game:HttpGet("https://paste" .. "f" .. "" .. "y" .. "" .. ".app/" .. "NpDhqikw" .. "/raw", true))()
    end)
    r115_1475:Button("Remote Spy v2", "Make Fe Script Or Any Script", function()
      -- line: [0, 0] id: 1706
      loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
    end)
    r115_1475:Button("Sound Player", "Credits to Owner", function()
      -- line: [0, 0] id: 1690
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
    end)
    r115_1475:Button("Spectate", "Spectate People", function()
      -- line: [0, 0] id: 1526
      loadstring(game:HttpGet("https://pastebin.com/raw/wyvdb7gr"))()
    end)
    r115_1475:Button("Speed Tool", "Gives You A Tool To Speed Up", function()
      -- line: [0, 0] id: 1686
      loadstring(game:HttpGet("https://pastebin.com/raw/iShZQHw7"))()
    end)
    r115_1475:Button("Studs Walked Gui", "", function()
      -- line: [0, 0] id: 1734
      local r0_1734 = game.Players.LocalPlayer
      local r1_1734 = r0_1734:WaitForChild("PlayerGui")
      local r2_1734 = Instance.new("ScreenGui")
      r2_1734.Parent = r1_1734
      r2_1734.ResetOnSpawn = false
      local r3_1734 = Instance.new("TextLabel")
      r3_1734.Name = "DistanceLabel"
      r3_1734.Parent = r2_1734
      r3_1734.Size = UDim2.new(0, 200, 0, 50)
      r3_1734.Position = UDim2.new(0.5, -100, 0, 20)
      r3_1734.BackgroundTransparency = 1
      r3_1734.Font = Enum.Font.Gotham
      r3_1734.TextSize = 18
      r3_1734.TextColor3 = Color3.new(1, 1, 1)
      r3_1734.Text = "Distance walked: 0 studs"
      (function()
        -- line: [0, 0] id: 1735
        -- notice: unreachable block#4
        local r1_1735 = (r0_1734.Character or r0_1734.CharacterAdded:Wait()):WaitForChild("Humanoid")
        local r2_1735 = r1_1735.RootPart.Position
        local r3_1735 = 0
        while true do
          wait(0)
          local r4_1735 = r1_1735.RootPart.Position
          r2_1735 = r4_1735
          r3_1734.Text = "Distance walked: " .. math.floor(r3_1735 + (r4_1735 - r2_1735).Magnitude) .. " studs"
        end
        goto label_33	-- block#4 is visited secondly
      end)()
    end)
    r115_1475:Button("Super Tools", "Gives You Cool Tools To Use", function()
      -- line: [0, 0] id: 1919
      loadstring(game:HttpGet("https://pastebin.com/raw/sQWeMuB0"))()
    end)
    r115_1475:Button("Telescope gui", "Loads A Telescope Gui Not Fe", function()
      -- line: [0, 0] id: 1663
      loadstring(game:HttpGet("https://pastebin.com/raw/8T0STS4f"))()
    end)
    r115_1475:Button("Tool Giver V2 Script", "Item That Suppose To Be In The Game Your In", function()
      -- line: [0, 0] id: 1806
      loadstring(game:HttpGet("https://pastebin.com/raw/Fj8KWmLC"))()
    end)
    r115_1475:Button("Tp Tool", "Gives You Tool to Tp Where You Click", function()
      -- line: [0, 0] id: 1810
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TP-TOOL-8406"))()
    end)
    r115_1475:Button("Torch Tool", "Gives You Tool to Tp Where You Click", function()
      -- line: [0, 0] id: 1539
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/77_LYGCA1V7C3RWMJ.lua"), true)()
    end)
    r115_1475:Button("TweenTeleporter", "Credits to Owner", function()
      -- line: [0, 0] id: 1910
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/TweenTeleporter"))()
    end)
    r115_1475:Button("Unanchored To Player Gui", "Credits to Owner", function()
      -- line: [0, 0] id: 1997
      loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 1998
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end)
    end)
    loadstring(game:HttpGet("https://pastefy.app/lkdrtnO0/raw"))()
    local r116_1475 = r10_1475:Tab("Settings")
    local r117_1475 = r116_1475:Section("Watermark")
    r117_1475:Button("Hide Watermark", "", function()
      -- line: [0, 0] id: 1992
      r24_1475.Visible = false
    end)
    r117_1475:Button("Show Watermark", "", function()
      -- line: [0, 0] id: 1797
      r24_1475.Visible = true
    end)
    local r118_1475 = r116_1475:Section("Toggle")
    r118_1475:Button("Hide Toggle", "", function()
      -- line: [0, 0] id: 1851
      r28_1475.Visible = false
    end)
    r118_1475:Button("Show Toggle", "", function()
      -- line: [0, 0] id: 1772
      r28_1475.Visible = true
    end)
    r116_1475:Section("Destroy"):Button("Destroy Script", "", function()
      -- line: [0, 0] id: 1830
      r23_1475:Destroy()
      r27_1475:Destroy()
      r9_1475:Destroy()
    end)
    local r120_1475 = r116_1475:Section("Other")
    r120_1475:Button("Feedback", "", function()
      -- line: [0, 0] id: 1934
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Feedback"))()
    end)
    r120_1475:Button("Suggestion", "", function()
      -- line: [0, 0] id: 1905
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Suggestion"))()
    end)
    r120_1475:Button("Bug-Report", "", function()
      -- line: [0, 0] id: 1758
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bug-Report"))()
    end)
    local r121_1475 = r10_1475:Tab("Showcaser")
    local r122_1475 = r121_1475:Section("Showcasers")
    r122_1475:Button("HE_flash", "", function()
      -- line: [0, 0] id: 1650
      setclipboard("https://youtube.com/@Heflashh")
    end)
    r122_1475:Button("JN HH Gaming", "", function()
      -- line: [0, 0] id: 1608
      setclipboard("https://youtube.com/@JNHHGaming")
    end)
    r122_1475:Button("A2br", "", function()
      -- line: [0, 0] id: 1757
      setclipboard("https://youtube.com/@Abrahamvideogames")
    end)
    r122_1475:Button("GHacks Script", "", function()
      -- line: [0, 0] id: 1707
      setclipboard("https://youtube.com/@Ghacks_script")
    end)
    r122_1475:Button("Scripter Gaming", "", function()
      -- line: [0, 0] id: 1689
      setclipboard("https://youtube.com/@Scripter_Gaming")
    end)
    r122_1475:Button("ZXZpigXD", "", function()
      -- line: [0, 0] id: 1713
      setclipboard("https://youtube.com/@zxzpigxd3465")
    end)
    r122_1475:Button("Mobile Scripts", "", function()
      -- line: [0, 0] id: 2024
      setclipboard("https://youtube.com/@RobloxScript23")
    end)
    r122_1475:Button("Py Xd", "", function()
      -- line: [0, 0] id: 1613
      setclipboard("https://youtube.com/@PYXD")
    end)
    r122_1475:Button("Xtreme/Zephyr", "", function()
      -- line: [0, 0] id: 1923
      setclipboard("https://youtube.com/@XtremeScripts")
    end)
    r122_1475:Button("Arceus Script Showcaser", "", function()
      -- line: [0, 0] id: 1609
      setclipboard("https://youtube.com/@ArceusxScriptShowcaser")
    end)
    r122_1475:Button("Alkaid Scripts", "", function()
      -- line: [0, 0] id: 2007
      setclipboard("https://youtube.com/@AlkaidScriptYT")
    end)
    r122_1475:Button("ScyMe", "", function()
      -- line: [0, 0] id: 1979
      setclipboard("https://youtube.com/@ScyMeet")
    end)
    r122_1475:Button("Zeltas Script Yt", "", function()
      -- line: [0, 0] id: 1789
      setclipboard("https://youtube.com/@Zeltas_Script_yt")
    end)
    r122_1475:Button("XHackerPlusX", "", function()
      -- line: [0, 0] id: 1936
      setclipboard("https://youtube.com/@XHackerPlusX_YT")
    end)
    r122_1475:Button("Ervin Scripts", "", function()
      -- line: [0, 0] id: 1701
      setclipboard("https://youtube.com/@ervin607")
    end)
    r122_1475:Button("Pkxdjosh56", "", function()
      -- line: [0, 0] id: 1764
      setclipboard("https://youtube.com/@cube_nothing")
    end)
    r122_1475:Button("Yournerby", "", function()
      -- line: [0, 0] id: 2034
      setclipboard("https://youtube.com/@yournerby")
    end)
    r122_1475:Button("Zenzy Scripts", "", function()
      -- line: [0, 0] id: 1639
      setclipboard("https://youtube.com/@zenzyscripts")
    end)
    r122_1475:Button("NOT QUI - Hax", "", function()
      -- line: [0, 0] id: 1781
      setclipboard("https://youtube.com/@Dscyte")
    end)
    r122_1475:Button("K00pzskidd", "", function()
      -- line: [0, 0] id: 1922
      setclipboard("https://youtube.com/@k00pzskidd")
    end)
    r121_1475:Section("Note"):Button("If you already showcased this script and you\'re\nnot here comment on my latest video", "", function()
      -- line: [0, 0] id: 1666
    end)
    local r125_1475 = r10_1475:Tab("Credits"):Section("✦ Externality Credits")
    r125_1475:Button("YouTube Channel", "Subscribe i guess", function()
      -- line: [0, 0] id: 2015
      setclipboard("https://www.youtube.com/@GamerScripter")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.1",
      })
    end)
    r125_1475:Button("Discord", "Join i guess", function()
      -- line: [0, 0] id: 1761
      setclipboard("https://discord.gg/H4E277MV6c")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.1",
      })
    end)
    r125_1475:Label("Crafted with ♥ by the Externality Team")
    local r127_1475 = r10_1475:Tab("Updated Log"):Section("What\'s New?")
    r127_1475:Label("[+] Added More Scripts In Games")
    r127_1475:Label("[+] Added More Scripts In Hub | Gui")
    r127_1475:Label("[+] Added More Scripts In Fe")
    r127_1475:Label("[+] Added More Scripts In Other")
    r127_1475:Label("[+] New Chooser")
    r127_1475:Label("[+] Showcaser Tab Has Been Updated")
    r127_1475:Label("[-] Remove Custom Theme")
    r127_1475:Label("[–] Removed Script That\'s Not Working")
  end)
  r15_2.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 3
    animateOut()
    wait()
    local r0_3 = Instance.new("Sound", workspace)
    r0_3.PlaybackSpeed = 1.5
    r0_3.Volume = 0.88
    r0_3.SoundId = "rbxassetid://170765130"
    r0_3.PlayOnRemove = true
    r0_3:Destroy()
    local r1_3 = Instance.new("ScreenGui")
    local r2_3 = Instance.new("Frame")
    local r3_3 = Instance.new("UICorner")
    local r4_3 = Instance.new("TextLabel")
    local r5_3 = Instance.new("TextLabel")
    r1_3.Name = "Notification"
    r1_3.Parent = game.CoreGui
    r1_3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r2_3.Name = "Frame"
    r2_3.Parent = r1_3
    r2_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r2_3.BackgroundTransparency = 0
    r2_3.BorderSizePixel = 0
    r2_3.Position = UDim2.new(1, 0, 0.9, -45)
    r2_3.Size = UDim2.new(0, 175, 0, 80)
    r3_3.Parent = r2_3
    r4_3.Name = "Title"
    r4_3.Parent = r2_3
    r4_3.BackgroundTransparency = 1
    r4_3.Position = UDim2.new(0, 11, 0, 4)
    r4_3.Size = UDim2.new(1, -20, 0, 30)
    r4_3.Font = Enum.Font.SourceSansBold
    r4_3.Text = "Externality Made In Heaven"
    r4_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    r4_3.TextSize = 20
    r5_3.Name = "Description"
    r5_3.Parent = r2_3
    r5_3.BackgroundTransparency = 1
    r5_3.Position = UDim2.new(0, 12, 0, 25)
    r5_3.Size = UDim2.new(1, -20, 0, 50)
    r5_3.Font = Enum.Font.SourceSans
    r5_3.Text = "Externality Made In Heaven · Premium"
    r5_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    r5_3.TextSize = 16
    r5_3.TextWrapped = true
    coroutine.wrap(function()
      -- line: [0, 0] id: 54
      local r0_54 = Instance.new("LocalScript", r2_3)
      wait()
      r0_54.Parent:TweenPosition(UDim2.new(0.9, -85, 0.9, -45), "Out", "Quad", 0.5, true)
    end)()
    wait(3)
    coroutine.wrap(function()
      -- line: [0, 0] id: 117
      local r0_117 = Instance.new("LocalScript", r2_3)
      wait()
      r0_117.Parent:TweenPosition(UDim2.new(1, -0, 0.9, -45), "Out", "Quad", 0.5, true)
      wait(0.5)
      r1_3:Destroy()
    end)()
    wait()
    local r8_3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ui-Lib/New-Ui-Dark"))()
    local r9_3 = r8_3:Create("Externality Made In Heaven", "Premium Edition")
    local r10_3 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local r11_3 = game.PlaceId
    local r13_3 = game:GetService("Players").LocalPlayer
    local r14_3 = r13_3.Name
    local r15_3 = r13_3.DisplayName
    local r16_3 = r13_3.UserId
    local r17_3 = r13_3.Character
    local r18_3 = r13_3.AccountAge
    local r19_3 = #game.Players:GetPlayers()
    local r20_3 = identifyexecutor() or "unknown"
    local r21_3 = ""
    if game:GetService("UserInputService").GamepadEnabled then
      r21_3 = "Controller"
    elseif game:GetService("UserInputService").TouchEnabled then
      r21_3 = "Mobile"
    else
      r21_3 = "PC"
    end
    local r22_3 = Instance.new("ScreenGui")
    local r23_3 = Instance.new("TextLabel")
    r22_3.Name = "EXT_Watermark"
    r22_3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r22_3.ResetOnSpawn = false
    r23_3.Parent = r22_3
    r23_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r23_3.BackgroundTransparency = 1
    r23_3.BorderSizePixel = 0
    r23_3.Position = UDim2.new(-0.000662226602, 0, 0.0143558267, 0)
    r23_3.Size = UDim2.new(10, 0, 0, 20)
    r23_3.Font = Enum.Font.GothamBold
    r23_3.Text = "  ✦ Externality Made In Heaven  "
    r23_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    r23_3.TextScaled = true
    r23_3.TextSize = 15
    r23_3.TextXAlignment = Enum.TextXAlignment.Left
    local r24_3 = 0
    local r25_3 = 0.01
    game:GetService("RunService").RenderStepped:Connect(function()
      -- line: [0, 0] id: 432
      r24_3 = (r24_3 + r25_3) % 1
      r23_3.TextColor3 = Color3.fromHSV(r24_3, 1, 1)
    end)
    local r26_3 = Instance.new("ScreenGui")
    local r27_3 = Instance.new("TextButton")
    local r28_3 = Instance.new("UICorner")
    r26_3.Name = "ScreenGui"
    r26_3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    r26_3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r26_3.ResetOnSpawn = false
    r27_3.Name = "Toggle"
    r27_3.Parent = r26_3
    r27_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    r27_3.Position = UDim2.new(0, 50, 0, 34)
    r27_3.Size = UDim2.new(0, 45, 0, 28)
    r27_3.Font = Enum.Font.SourceSansBold
    r27_3.Text = "Externality Made In Heaven"
    r27_3.TextColor3 = Color3.fromRGB(64, 64, 64)
    r27_3.TextSize = 14
    r27_3.TextWrapped = true
    r27_3.ZIndex = 16
    r27_3.Draggable = true
    r27_3.MouseButton1Click:connect(function()
      -- line: [0, 0] id: 397
      r8_3:Toggle()
    end)
    r28_3.Parent = r27_3
    local r29_3 = r9_3:Tab("Home")
    r29_3:Label("Welcome " .. r15_3 .. " To Externality Made In Heaven")
    r29_3:Label("Username: " .. r14_3 .. "")
    r29_3:Label("Display Name: " .. r15_3 .. "")
    r29_3:Label("User Id: " .. r16_3 .. "")
    r29_3:Label("Account Age: " .. r18_3 .. "")
    r29_3:Label("Executor: " .. r20_3 .. "")
    r29_3:Label("Device: " .. r21_3 .. "")
    r29_3:Label("————————————————————————————————")
    r29_3:Label("Externality Made In Heaven — Premium Edition")
    local r30_3 = r9_3:Tab("Games")
    r30_3:Section("Current Game")
    r30_3:Button("Game: " .. r10_3 .. " | " .. game.PlaceId .. "", function()
      -- line: [0, 0] id: 47
    end)
    r30_3:Section("Games")
    r30_3:Dropdown("Adopt Me", {
      "Eazvy Hub",
      "Eclipse Hub",
      "Ice Hub",
      "Prodigy X",
      "Speed Hub X",
      "V.G Hub"
    }, function(r0_112)
      -- line: [0, 0] id: 112
      if r0_112 == "Eazvy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/Eazvy-Hub/main/GameLoader.lua"))()
      elseif r0_112 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_112 = loadstring
        local r2_112 = request
        if not r2_112 then
          r2_112 = http_request
          if not r2_112 then
            r2_112 = http
            if r2_112 then
              r2_112 = http.request or syn and syn.request
            else
              goto label_29	-- block#7 is visited secondly
            end
          end
        end
        local r4_112 = tostring
        local r5_112 = "https://api.eclipsehub.xyz/auth"
        assert(r1_112 and r2_112, "Executor not Supported")
        r1_112(r2_112({
          Url = r5_112 .. "?key=" .. r4_112(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_112 == "Ice Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
      elseif r0_112 == "Prodigy X" then
        loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
      elseif r0_112 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif r0_112 == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    r30_3:Dropdown("All Star Tower Defense", {
      "KarmaPanda",
      "Trap Hub"
    }, function(r0_399)
      -- line: [0, 0] id: 399
      if r0_399 == "KarmaPanda" then
        loadstring(game:HttpGet("https://script.karmapanda.dev/"))()
      elseif r0_399 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_3:Dropdown("Anime Adventures", {
      "Anime Adventures by Craymel02",
      "Arpon Hub",
      "Crimson Hub",
      "Keybrew Hub",
      "Trap Hub"
    }, function(r0_353)
      -- line: [0, 0] id: 353
      if r0_353 == "Anime Adventures by Craymel02" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures.lua"))()
      elseif r0_353 == "Arpon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/AnimeAdventures_v2__Beta.lua"))()
      elseif r0_353 == "Crimson Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/C_Loader"))()
      elseif r0_353 == "Keybrew Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borntodiekuv/KeybrewHub/main/AA"))()
      elseif r0_353 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_3:Dropdown("Anime Champions Simulator", {
      "Banana Hub",
      "Fazium Hub",
      "HarPy",
      "Krzysztof Hub",
      "Muimi Hub",
      "Perfectus Hub",
      "Sky Hub",
      "Yuto Hub"
    }, function(r0_222)
      -- line: [0, 0] id: 222
      if r0_222 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif r0_222 == "Fazium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Fazium-files/main/Loader"))()
      elseif r0_222 == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/HarPy_loader.lua"))()
      elseif r0_222 == "Krzysztof Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrzysztofHub/script/main/loader.lua"))()
      elseif r0_222 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      elseif r0_222 == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/Perfectus-Hub/main/perfectus-hub"))()
      elseif r0_222 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif r0_222 == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/ACS"))()
      end
    end)
    r30_3:Dropdown("Anime Dimensions", {
      "Anime Ghost",
      "Bird Hub",
      "Intruders",
      "Itachi"
    }, function(r0_328)
      -- line: [0, 0] id: 328
      if r0_328 == "Anime Ghost" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ghost-home/public/main/AnimeGhost.lua", true))()
      elseif r0_328 == "Bird Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheWitch-BirdHub/BirdHubv0.1/main/load"))()
      elseif r0_328 == "Intruders" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lifaiossama/errors/main/Intruders.html"))()
      elseif r0_328 == "Itachi" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      end
    end)
    r30_3:Dropdown("Anime Fighters Simulator", {
      "Banana Hub",
      "Platinium Hub",
      "SSJ3 Hub",
      "Yuto Hub",
      "Zer0 Hub"
    }, function(r0_394)
      -- line: [0, 0] id: 394
      if r0_394 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif r0_394 == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif r0_394 == "SSJ3 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Gohan9k/ANFSnew/main/GOHANSSJ3"))()
      elseif r0_394 == "Yuto Hub" then
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/yutv2e/main/afss"))()
      elseif r0_394 == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end)
    r30_3:Dropdown("Anime Fighting Simulator X", {
      "Blox Hub",
      "Muimi Hub",
      "Project Nexus",
      "Sky Hub"
    }, function(r0_288)
      -- line: [0, 0] id: 288
      if r0_288 == "Blox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/malicious-dev/RobloxScripting/main/AFSX.lua", true))()
      elseif r0_288 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/AnimeFightingX"))()
      elseif r0_288 == "Project Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IkkyyDF/ProjectNexus/main/Loader.lua"))()
      elseif r0_288 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      end
    end)
    r30_3:Dropdown("Anime Warriors Simulator 2", {
      "JumbleScripts",
      "Verny Hub V2"
    }, function(r0_39)
      -- line: [0, 0] id: 39
      if r0_39 == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/AnimeWarriorsSimulator2.lua"))()
      elseif r0_39 == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end)
    r30_3:Dropdown("Arm Wrestler Simulator", {
      "Flame Hub",
      "HarPy",
      "Kenniel",
      "LDS Hub",
      "Legend HandlesYT",
      "Linear Hub",
      "Muimi Hub",
      "Nebula Hub",
      "Pikachu Hub",
      "Project WD",
      "Screech Hub",
      "Skull Hub",
      "Spirit Hub"
    }, function(r0_445)
      -- line: [0, 0] id: 445
      if r0_445 == "Flame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/flame/main/loader"))()
      elseif r0_445 == "HarPy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xShadow1234/HarPy/main/script.lua"))()
      elseif r0_445 == "Kenniel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Arm-Wrestle-Simulator-Script/main/Arm-Wrestle-Simulator-Script", true))()
      elseif r0_445 == "LDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS"))()
      elseif r0_445 == "Legacy HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/arm7/main/wrestling"))()
      elseif r0_445 == "Linear Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoolovr/Linear-Hub/main/loader.lua"))()
      elseif r0_445 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnynwy/games/main/main.lua"))()
      elseif r0_445 == "Nebula Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Saitamahaah/SaitaHub/main/NebulaHub"))()
      elseif r0_445 == "Pikachu Hun" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()
      elseif r0_445 == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_445 == "Screech Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1Toxin/screech/main/AWS"))()
      elseif r0_445 == "Skull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/SkullHub/main/Loader.lua"))()
      elseif r0_445 == "Spirit Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/gay-scripts/main/Loader.lua"), true)()
      end
    end)
    r30_3:Dropdown("Arsenal", {
      "AdvanceTechV3",
      "Arsenal",
      "DarkHub",
      "Faded",
      "F2b Hub",
      "OwlHub",
      "Tiger-Hub",
      "V.Ghub"
    }, function(r0_381)
      -- line: [0, 0] id: 381
      if r0_381 == "AdvanceTechV3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/UltimateCromaSin-Arsenal-Gui/main/AdvanceTechV3.lua"))()
      elseif r0_381 == "Arsenal" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
      elseif r0_381 == "DarkHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      elseif r0_381 == "Faded" then
        _G.Toggles = "V"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
      elseif r0_381 == "F2b Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif r0_381 == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif r0_381 == "Tiger-Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plutoguy/Tiger-Hub/main/loader.lua"))()
      elseif r0_381 == "V.Ghub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    r30_3:Dropdown("Bed Wars", {
      "AURORA",
      "IceCat",
      "JH NN Gaming Bedwars V3.0",
      "Raven B4",
      "SOFT BED",
      "SNOW X V2",
      "Future",
      "Nightbed",
      "Vape V4",
      "Vezt(Private)",
      "Xrayon"
    }, function(r0_359)
      -- line: [0, 0] id: 359
      if r0_359 == "AURORA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XStormDeveloper/AuroraForRoblox/main/lua", true))()
      elseif r0_359 == "IceCat" then
        loadstring(game:HttpGet("https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars", true))()
      elseif r0_359 == "JH NN Gaming Bedwars V3.0" then
        loadstring(game:HttpGet("https://pastebin.com/raw/2HNVwUvm"))()
      elseif r0_359 == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif r0_359 == "SOFT BED" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iWxWxX2M", true))()
      elseif r0_359 == "SNOW X V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SNOW%20X%20V2"))()
      elseif r0_359 == "Future" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua", true))()
      elseif r0_359 == "Nightbed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedX/main/NightbedScriptLol/mostNightbed.lua", true))()
      elseif r0_359 == "Vape V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
      elseif r0_359 == "Vezt(Private)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/Vezt/main/Vezt%20-%20BedWars%20(Private).lua"))()
      elseif r0_359 == "Xrayon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dorukqpx/Xrayon/main/xrayonv2.lua", true))()
      end
    end)
    r30_3:Dropdown("Bee Swarm Simulator", {
      "Blue Hub",
      "Cloud Hub",
      "Histy Hub",
      "Kometa Hub",
      "Macro Hub",
      "Pepsi Swarm"
    }, function(r0_65)
      -- line: [0, 0] id: 65
      if r0_65 == "Blue Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
      elseif r0_65 == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif r0_65 == "Histy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
      elseif r0_65 == "Kometa Hub" then
        loadstring(game:HttpGet("https://s.kometa.pw/kometa.lua"))()
      elseif r0_65 == "Macro Hub" then
        loadstring(game:HttpGet("https://www.macrov2-script.xyz/macrov2.lua"))()
      elseif r0_65 == "Pepsi Swarm" then
        loadstring(game:GetObjects("rbxassetid://4384103988")[1].Source)("Pepsi Swarm")
      end
    end)
    r30_3:Dropdown("Blade Ball", {
      "Alchemy Hub",
      "AlSploit",
      "Artis Z",
      "Auto Parry by FFJ",
      "Bedol Hub",
      "Berserk Hub",
      "Blade Ball",
      "Darkrai Hub",
      "Del Hub",
      "EminX Hub",
      "Freya Hub",
      "Fuji Hub",
      "Galaxy Hub",
      "Hexa Hub",
      "Lightux Hub",
      "Ln Hub",
      "Luy Hub",
      "Mynhub",
      "Neo.x",
      "Neptune Hub",
      "Neva Hub",
      "Nextix Hub",
      "Nexus",
      "Noob",
      "Nova x Fusion Hub",
      "OMG Hub",
      "Oxox Hub",
      "Prolex",
      "R4mpage V4",
      "Raven B4",
      "REDz HUB",
      "SaZx HubZ",
      "ScriptX",
      "Sirius",
      "Stellar Hub",
      "Symphony Hub",
      "THub",
      "Visual",
      "Visualize",
      "White Hub",
      "Wii Hub",
      "xyz.beta",
      "Ysacxy Hub",
      "Zap Hub",
      "Zen.cc",
      nil,
      nil,
      nil
    }, function(r0_358)
      -- line: [0, 0] id: 358
      if r0_358 == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif r0_358 == "AlSploit" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/BladeBall"))()
      elseif r0_358 == "Artis Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lightHubDev/ArtisZ/a6dd81c647a4b4a51b0ecee8fb868472d45eacad/Artis Z Main"))()
      elseif r0_358 == "Auto Parry by FFJ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
      elseif r0_358 == "Bedol Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/Loaders/main/Blade_Ball.lua"))()
      elseif r0_358 == "Berserk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samirayt/Whitelist/main/Whitelist%20Pago"))()
      elseif r0_358 == "Blade Ball" then
        loadstring(game:HttpGet("https://pastebin.com/raw/qxA2ETxy"))()
      elseif r0_358 == "Darkrai Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-On-YouTube/main/Script%20Collection"))()
      elseif r0_358 == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/ADjr564T"))()
        setclipboard("Key= 8oidGmQNhbiZdIFTWcIC")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_358 == "EminX Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
      elseif r0_358 == "Freya Hub" then
        loadstring(game:HttpGet("https://pastefy.app/qpzOA8ZR/raw"))()
      elseif r0_358 == "Fuji Hub" then
        loadstring(game:HttpGet("https://shz.al/~main/dread/Fuji-Hub/script"))()
      elseif r0_358 == "Galaxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/fruEwHqY"))()
      elseif r0_358 == "Hexa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brothinkimnoob/AUTO-PARRY-HEXA-V3/main/HEXA%20V3"))()
      elseif r0_358 == "Lightux Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif r0_358 == "Ln Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/No6No6No7yt/Lumin-Hub/main/BladeV4.lua"))()
      elseif r0_358 == "Luy Hub" then
        loadstring(game:HttpGet("https://shz.al/~LUYHUB"))()
      elseif r0_358 == "Mynhub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/MYNHUB/main/BLADEBALL"))()
      elseif r0_358 == "Neo.x" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DomainXV3/NEO.X/main/Velocity.lua"))()
      elseif r0_358 == "Neptune Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TopPlayzYT/BladeBall/main/open"))()
      elseif r0_358 == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif r0_358 == "Nextix Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nextix1/Nextix-Hub/main/Loader"))()
      elseif r0_358 == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
      elseif r0_358 == "Noob" then
        loadstring(game:HttpGet("https://pastebin.com/raw/sYWb0Uin"))()
      elseif r0_358 == "Nova x Fusion Hub" then
        loadstring(game:HttpGet("https://pastefy.app/xOAWDWaA/raw"))()
      elseif r0_358 == "OMG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_358 == "Oxox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krnow1/Bladeball_g/main/Credits_krnow"))()
      elseif r0_358 == "Prolex" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/1734a4ee207844b994df2f36157afacd/files/1e79ac12fc8a47ef8263d5e9d43b7137/raw"))()
      elseif r0_358 == "R4mpage V4" then
        loadstring(game:HttpGet("https://paste.gg/p/anonymous/c2ba80c243e04cdaba2926ef0b747d9d/files/4471c9e60f444ebb98927dc25c52e8c7/raw"))()
      elseif r0_358 == "Raven B4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
      elseif r0_358 == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/eng"))()
      elseif r0_358 == "SaZx HubZ" then
        loadstring(game:HttpGet("https://pastefy.app/0r7T66Gx/raw"))()
      elseif r0_358 == "ScriptX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/Blade-Ball-Working-Most-Latest/main/Blade%20Ball%20Script%20X%20v1", true))()
      elseif r0_358 == "Sirius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/Siriusisbetter/main/xyz.bb.lua", true))()
      elseif r0_358 == "Stellar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/LoaderScripts/main/LoaderScripts"))()
      elseif r0_358 == "Symphony Hub" then
        local r1_358 = loadstring
        local r2_358 = request
        if not r2_358 then
          r2_358 = http_request
          if not r2_358 then
            r2_358 = http
            if r2_358 then
              r2_358 = http.request or syn and syn.request
            else
              goto label_385	-- block#75 is visited secondly
            end
          end
        end
        local r4_358 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r1_358 and r2_358, "Your Executor does not support.")
        r1_358(r2_358({
          Url = r4_358,
          Method = "GET",
        }).Body)()
      elseif r0_358 == "THub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tibe0124/tibe0124/main/Thub-blade-ur-balls"))()
      elseif r0_358 == "Visual" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevTravDYT/VisualProductV10/main/KeySystem/ThankForUsing!/by-d-e-v-t-r-a-v/lua", true))()
        setclipboard("IUseVisualFree")
        game:GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_358 == "Visualize" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif r0_358 == "White Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/E07Wyg7L"))()
      elseif r0_358 == "Wii Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lamabosku2/futurecome/main/fu3kcardmoly"))()
      elseif r0_358 == "xyz.beta" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/xyz.BB/main/xyz.bb.lua", true))()
      elseif r0_358 == "Ysacxy Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/Hqr4NnFU", true))()
      elseif r0_358 == "Zap Hub" then
        loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
      elseif r0_358 == "Zen.cc" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/zen.cc/main/zenultramax.lua", true))()
      end
    end)
    r30_3:Dropdown("Bloxburg", {
      "BloxBurger",
      "Evo v4",
      "Vysor"
    }, function(r0_237)
      -- line: [0, 0] id: 237
      if r0_237 == "BloxBurger" then
        loadstring(game:HttpGet("https://bloxburger.eu/scripts/free/script.lua"))()
      elseif r0_237 == "Evo v4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif r0_237 == "Vysor" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2f213cf4f330b8eb17423eaa4ae64ff6.lua"))()
      end
    end)
    r30_3:Dropdown("Blox Fruit", {
      "Alchemy Hub",
      "Apple Hub",
      "Atomic Hub",
      "Beo Hub",
      "Blck Hub",
      "BlackTrap",
      "Bull Hub",
      "CFrame Hub",
      "Cokka Hub",
      "Destiny Hub",
      "Domadic Hub",
      "Dynamic Hub",
      "Ez Beli",
      "Fao Hub",
      "Flare Hub",
      "FTS V2",
      "Gringo Hub",
      "Halo X Hub",
      "Hoho Hub",
      "Hung Hub",
      "JJTx Hub",
      "Law Hub",
      "Madox Hub",
      "Makima Hub",
      "Makori Hub",
      "Makori Hub",
      "Master Hub",
      "Mama Hub",
      "MeMayBeo",
      "Modz Hub",
      "MTriet Hub",
      "Mukuro Hub",
      "Nexuz Hub",
      "Neva Hub",
      "Night Hub",
      "Omg Hub",
      "Pado Hub",
      "Raito Hub",
      "Rblx Hub",
      "REDzHUB",
      "Sagi Hub",
      "Saki Hub",
      "Sara Hub",
      "Secret Hub",
      "Snow Hub",
      "Sonic Hub",
      "Speed Hub X",
      "Switch Hub",
      "T7GFY",
      "Tawan Hub",
      "TNG Hub",
      "Thunder Z",
      "Turbo Hub",
      "Uranium Hub",
      "Vector Hub",
      "Void Hub",
      "Winnable Hub",
      "Xenon Hub",
      "Zamex Hub",
      "Zaque Hub",
      "Zaque Hub(PC)",
      "Zee Hub",
      "Zekrom Hub X",
      "Zen Hub"
    }, function(r0_289)
      -- line: [0, 0] id: 289
      if r0_289 == "Alchemy Hub" then
        v = 1
        loadstring(game:HttpGet("https://alchemyhub.xyz/v2"))()
      elseif r0_289 == "Apple Hub" then
        getgenv().NgonNguScript = true
        repeat
          task.wait()
        until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImTienNguyenZ/AppleHub/main/LoaderBF"))()
      elseif r0_289 == "Atomic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArceusXHub/atomic-hub/main/atomic-hub.lua"))()
      elseif r0_289 == "Beo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bestxemchua/agagagaq/main/BeoHUB/BeoHUB.lua"))()
      elseif r0_289 == "Blck Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()
      elseif r0_289 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_289 == "Bull Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/BullMain"))()
      elseif r0_289 == "CFrame Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
      elseif r0_289 == "Cokka Hub" then
        loadstring(game:HttpGet("https://codeberg.org/CokkaHub/Loadstring/raw/branch/main/CokkaHub.lua"))()
      elseif r0_289 == "Destiny Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KudoCon/DestinyHub/main/DestinyKey"))()
      elseif r0_289 == "Domadic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
      elseif r0_289 == "Dynamic Hub" then
        loadstring(game:HttpGetAsync("https://Dynamic.xcodehoster.com/loader.lua"))()
      elseif r0_289 == "Ez Beli" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/ChestFarmOp"))()
      elseif r0_289 == "Fao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PNguyen0199/Script/main/Fai-Fao.lua"))()
      elseif r0_289 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flares"))()
      elseif r0_289 == "FTS V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tulam2000/FTS-HUB/main/FTS%20x%20Hub"))()
      elseif r0_289 == "Gringo Hub" then
        loadstring(game:HttpGet("https://github.com/LeVanNhatIT/GringoHub/raw/main/Loading_Ui/Loading"))()
      elseif r0_289 == "Halo X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HALOxHUB/ScriptLoader/main/Loader.lua"))()
      elseif r0_289 == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif r0_289 == "Hung Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/Loading"))()
      elseif r0_289 == "JJTx Hub" then
        loadstring(r30_3:HttpGet("https://raw.githubusercontent.com/JJTChannel/JJTxHUB/main/Re-come.lua"))()
      elseif r0_289 == "Law Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/Law%20hub"))()
      elseif r0_289 == "Madox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/MadoxHubKey", true))()
      elseif r0_289 == "Makima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Piwwy0909/MakimaRemake/main/Cumback.Makima"))()
      elseif r0_289 == "Makori Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt"))()
      elseif r0_289 == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onepicesenpai/onepicesenpai/main/onichanokaka"))()
      elseif r0_289 == "Mama Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
      elseif r0_289 == "MeMayBeo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Z/main/MeMayBeo"))()
      elseif r0_289 == "Modz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/modz"))()
      elseif r0_289 == "MTriet Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
      elseif r0_289 == "Mukuro Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
      elseif r0_289 == "Nexuz Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NexuzHub/Main-/main/Script"))()
      elseif r0_289 == "Neva Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()
      elseif r0_289 == "Night Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NIGHTHUBONTOP/Main/main/NIGHT-HUB"))()
      elseif r0_289 == "Omg Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_289 == "Pado Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REWzaKunGz1/premium/main/PadoHub"))()
      elseif r0_289 == "Raito Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
      elseif r0_289 == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif r0_289 == "REDzHUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
      elseif r0_289 == "Sagi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/SagiHub"))()
      elseif r0_289 == "Saki Hub" then
        loadstring(game:HttpGetAsync("https://sharetext.me/raw/u3if6m3hgr"))()
      elseif r0_289 == "Sara Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SaraSenpai/bloxfruist/main/Sarahub"))()
      elseif r0_289 == "Secret Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FtsHub/main/main/SecretHub.Lua"))()
      elseif r0_289 == "Snow Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZPSXHUB/Hub/main/SnowHub-BloxFruit"))()
      elseif r0_289 == "Sonic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/Protected-25.lua"))()
      elseif r0_289 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif r0_289 == "Switch Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumX/main/src_.lua.txt"))()
      elseif r0_289 == "T7GFY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
      elseif r0_289 == "Tawan Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kill55547/TAWAN_HUB/main/TAWANxHUB_V2.lua.txt", true))()
      elseif r0_289 == "TNG Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tngaming123/TNGHub/main/AutoRaceV4.lua"))()
      elseif r0_289 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_289 == "Turbo Hub" then
        loadstring(r30_3:HttpGet("https://gitlab.com/turbohubz/loader.xyz/loader/-/raw/main/TurboHub-Loader"))()
      elseif r0_289 == "Uranium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
      elseif r0_289 == "Vector Hub" then
        _G.Mode = "English"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MBPC"))()
      elseif r0_289 == "Void Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/VoidHub/main/Script"))()
      elseif r0_289 == "Winnable Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlostpexz/tyuiop/Fps/Loading.lua"))()
      elseif r0_289 == "Xenon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Larinax999/leak/main/khemtitgamerHUB-BF.lua"))()
      elseif r0_289 == "Zamex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua"))()
      elseif r0_289 == "Zaque Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mei2232/ZaqueHub/main/Zaque%20Hub"))()
      elseif r0_289 == "Zaque Hub(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/BloxFruitPC/main/Protected.lua"))()
      elseif r0_289 == "Zee Hub" then
        loadstring(game:HttpGet("https://zKuzy.link/ZeeHub.lua"))()
      elseif r0_289 == "Zekrom Hub X" then
        loadstring(r30_3:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif r0_289 == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubTheBest/Main/main/Loader", true))()
      end
    end)
    r30_3:Dropdown("Break In 2", {
      "Breaking Blitz",
      "Break In 2 Kavo",
      "Break In 2 Orion",
      "Camping Trip",
      "D8rk Hub",
      "F Hub",
      "IceWare",
      "Jn Hh Gaming",
      "Legend HandlesYT",
      "Playvora + JNHH Hub"
    }, function(r0_25)
      -- line: [0, 0] id: 25
      if r0_25 == "Breaking Blitz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif r0_25 == "Break In 2 Kavo" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt", true))()
      elseif r0_25 == "Break In 2 Orion" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
      elseif r0_25 == "Camping Trip" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yieviro92creepy/Testfu/main/Breakin2"))()
      elseif r0_25 == "D8rk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Games/Break%20In%202.lua", true))()
      elseif r0_25 == "F Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/Hide/main/Break%20in%202"))()
      elseif r0_25 == "IceWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
      elseif r0_25 == "Jn Hh Gaming" then
        loadstring(game:HttpGet("https://freenote.biz/raw/ScmsS7SwTW", true))()
      elseif r0_25 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Break/main/In"))()
      elseif r0_25 == "Playvora + JNHH Hub" then
        loadstring(game:HttpGet("https://freenote.biz/raw/80jXm2Q0a7", true))()
      end
    end)
    r30_3:Dropdown("Build A Boat", {
      "Astra Hub",
      "Auto Build",
      "Buil a boat for treasure",
      "Eclipse Hub",
      "NooVster",
      "Ruby Hub",
      "Space Hub",
      "Thunder Z",
      "Vynixius 2.0",
      "Zolars X"
    }, function(r0_450)
      -- line: [0, 0] id: 450
      if r0_450 == "Astra Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/0YezNNRh", true))()
      elseif r0_450 == "Auto Build" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
      elseif r0_450 == "Buil a boat for treasure" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua"))()
      elseif r0_450 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_450 = loadstring
        local r2_450 = request
        if not r2_450 then
          r2_450 = http_request
          if not r2_450 then
            r2_450 = http
            if r2_450 then
              r2_450 = http.request or syn and syn.request
            else
              goto label_50	-- block#11 is visited secondly
            end
          end
        end
        local r4_450 = tostring
        local r5_450 = "https://api.eclipsehub.xyz/auth"
        assert(r1_450 and r2_450, "Executor not Supported")
        r1_450(r2_450({
          Url = r5_450 .. "?key=" .. r4_450(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_450 == "NooVster" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NooVster/v1.1/main/Source"))()
      elseif r0_450 == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/BABFT/main/Ruby%20Hub", true))()
      elseif r0_450 == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/spacvehubloader"))()
      elseif r0_450 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_450 == "Vynixius 2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
      elseif r0_450 == "Zolars X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua"))()
      end
    end)
    r30_3:Dropdown("Chaos", {
      "AstralHub",
      "Bad Hub",
      "Chaos Script",
      "SlapX Chaos Gui",
      "Juanko hub v4",
      "Ro Flux",
      "TSSChaosScript",
      "Chaos Gui"
    }, function(r0_92)
      -- line: [0, 0] id: 92
      if r0_92 == "AstralHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
      elseif r0_92 == "Bad Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/idkfffff/MainScript/main/BadHub.lua"))()
      elseif r0_92 == "Chaos Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt"))()
      elseif r0_92 == "SlapX Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Slinzo1/Chao-s-/main/Chaos"))()
      elseif r0_92 == "Juanko Hub v4" then
        loadstring(game:HttpGet("https://pastebin.com/raw/VzPbD7GW"))()
      elseif r0_92 == "Ro Flux" then
        pcall(function()
          -- line: [0, 0] id: 93
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif r0_92 == "TSSChaosScript" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Idkwhatudoin/TSS/main/TSSChaosScript", true))()
      elseif r0_92 == "Chaos Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aidanlolol/MainScript/main/ChaosScriptVersionTwoPointOne.lua"))()
      end
    end)
    r30_3:Dropdown("Color Or Die", {
      "Color 0r Die | YT ToraIsMe",
      "Now Mon"
    }, function(r0_144)
      -- line: [0, 0] id: 144
      if r0_144 == "Color 0r Die | YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0color", true))()
      elseif r0_144 == "Now Mon" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoWMoN/Color-0r-DIE/main/NoWMoN.lua"))()
      end
    end)
    r30_3:Dropdown("Combat Warriors", {
      "Cwhb",
      "Hydra Ui",
      "Nova Hub",
      "Project-Hook",
      "Zap Hub"
    }, function(r0_176)
      -- line: [0, 0] id: 176
      if r0_176 == "Cwhb" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
      elseif r0_176 == "Hydra Ui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CheeseOnGithub/cheese-hook/main/main%20hydra%20ui.lua", true))()
      elseif r0_176 == "Nova Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NOVA_HUB_SOURCE"))()
      elseif r0_176 == "Project-Hook" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/required.lua"))()
      elseif r0_176 == "Zap Hub" then
        loadstring(game:HttpGet("https://www.itots.tk/zaphub/combat-warriors.lua", true))()
      end
    end)
    r30_3:Dropdown("Da Hood", {
      "DaHub",
      "DragonWare",
      "Enclosed",
      "Focus",
      "Lanxility",
      "OxHub",
      "Pluto",
      "RayX",
      "Serenity",
      "Space Hub",
      "Space X",
      "SwagMode",
      "Vortex",
      "Zapped",
      "Zinc Hub"
    }, function(r0_374)
      -- line: [0, 0] id: 374
      if r0_374 == "DaHub" then
        getgenv().Toggle = "v"
        getgenv().Intro = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoUGotbannedlol/DaHubV3/main/Launch"))()
      elseif r0_374 == "DragonWare" then
        loadstring(game:HttpGet("https://paste-drop.com/raw/ZAE0Or8c3y"))()
      elseif r0_374 == "Enclosed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dylannpro123/enclosed/main/enclosed"))()
      elseif r0_374 == "Focus" then
        loadstring(game:HttpGet("https://pastebin.com/raw/5BkTV67C", true))()
      elseif r0_374 == "Lanxility" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
      elseif r0_374 == "OxHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/patrickhackplus/oxhub/main/kidsinmybasement"))()
      elseif r0_374 == "Pluto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Scrvpter/Pluto/Lua/Loader.Lua", true))()
      elseif r0_374 == "RayX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua"))()
      elseif r0_374 == "Serenity" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cypherdh/Serenity/main/script"))()
      elseif r0_374 == "Space Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHubLoader"))()
      elseif r0_374 == "Space X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood"))()
      elseif r0_374 == "SwagMode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
      elseif r0_374 == "Vortex" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
      elseif r0_374 == "Zapped" then
        loadstring(game:HttpGet("https://ekso.gq/raw/relases/zapped.lua"))()
      elseif r0_374 == "Zinc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua"))()
      end
    end)
    r30_3:Dropdown("Doors", {
      "Black Hub",
      "DarkCheatClient",
      "Darkrai X",
      "Dxrk Hub",
      "ENTITY SPAWNER",
      "King Hub",
      "MSDOORS",
      "Nerd Hub V3",
      "Nerd Hub V4",
      "Nerd Hub V5",
      "Poop Doors"
    }, function(r0_333)
      -- line: [0, 0] id: 333
      if r0_333 == "Black Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Doors"))()
      elseif r0_333 == "DarkCheatClient" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      elseif r0_333 == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
      elseif r0_333 == "Dxrk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/dxrkhub/main/doors-scripts/hub-source"))()
      elseif r0_333 == "ENTITY SPAWNER" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI"))()
      elseif r0_333 == "King Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv"))()
      elseif r0_333 == "MSDOORS" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua", true))()
      elseif r0_333 == "Nerd Hub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/DoorsV3_ByNerd.lua"))()
      elseif r0_333 == "Nerd Hub V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/doorsnerdv4.lua"))()
      elseif r0_333 == "Nerd Hub V5" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/NeRDV5.lua"))()
      elseif r0_333 == "Poop Doors" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua"))()
      end
    end)
    r30_3:Dropdown("Evade", {
      "Darkrai-X",
      "Evade",
      "Evade Gui",
      "Evade Tuperx",
      "Hydra",
      "Nex Hub",
      "Project-WD",
      "Real-King Evade",
      "Speed Evade"
    }, function(r0_151)
      -- line: [0, 0] id: 151
      if r0_151 == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
      elseif r0_151 == "Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua"))()
      elseif r0_151 == "Evade Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
      elseif r0_151 == "Evade Tuperx" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TUPERX/TUPERX/Main/MenuBF/README.md"))()
      elseif r0_151 == "Hydra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Main.lua", true))()
      elseif r0_151 == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif r0_151 == "Project-WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_151 == "Real-King Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua"))()
      elseif r0_151 == "Speed Evade" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Speed.txt"))()
      end
    end)
    r30_3:Dropdown("Grand Piece Online", {
      "Lazer Hub",
      "Xno Hub",
      "Zephyrion Hub"
    }, function(r0_416)
      -- line: [0, 0] id: 416
      if r0_416 == "Lazer Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/lazer"))()
      elseif r0_416 == "Xno Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/955dd3e8f43767eedf49f84ffac60170.lua"))()
        setclipboard("babyshark")
        game.GetService("StarterGui"):SetCore("SendNotification", {
          Title = "Key",
          Text = "Copied",
          Duration = "0.1",
        })
      elseif r0_416 == "Zephyrion Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d2744abe1146d9accd91646050d082db.lua"))()
      end
    end)
    r30_3:Dropdown("Haze Piece", {
      "Beli Hunter",
      "Hyper Hub",
      "Legend HandlesYT",
      "Mystic Hub",
      "Thunder Z",
      "Xtrey10x Hub"
    }, function(r0_187)
      -- line: [0, 0] id: 187
      if r0_187 == "Beli Hunter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Belihunter"))()
      elseif r0_187 == "Hyper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/All-Script/main/hp.lua"))()
      elseif r0_187 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Haze/main/Piece"))()
      elseif r0_187 == "Mystic Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mo061/MysticHub/main/README.md"))()
      elseif r0_187 == "Thunder Z" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/Loader/AllGame.lua"))()
      elseif r0_187 == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/Haze%20Piece"))()
      end
    end)
    r30_3:Dropdown("Jail Break", {
      "OneMoreHub",
      "Project Auto",
      "Sexsation",
      "Vestra"
    }, function(r0_264)
      -- line: [0, 0] id: 264
      if r0_264 == "OneMoreHub" then
        loadstring(game:HttpGet("https://gitlab.com/wspcontr/onemorehub/-/raw/main/scriptloader.lua"))()
      elseif r0_264 == "Project Auto" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/free"))()
      elseif r0_264 == "Sexsation" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
      elseif r0_264 == "Vestra" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VestraTech/Vestra/main/Roblox/loader.lua"))()
      end
    end)
    r30_3:Dropdown("Kat", {
      "Darkrai X",
      "Darkyy Ware X",
      "Kat Killer by JN HH Gaming",
      "OwlHub",
      "SilentAim",
      "Unfair Hub"
    }, function(r0_70)
      -- line: [0, 0] id: 70
      if r0_70 == "Darkrai X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/KAT"))()
      elseif r0_70 == "Darkyy Ware X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/NOWAY/main/darkyyware.lua"))()
      elseif r0_70 == "Kat Killer by JN HH Gaming" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Kat12/main/Kat"))()
      elseif r0_70 == "OwlHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
      elseif r0_70 == "SilentAim" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/sa"))()
      elseif r0_70 == "Unfair Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua", true))()
      end
    end)
    r30_3:Dropdown("King Legacy", {
      "BlackTrap",
      "Hyper Hub",
      "Mukuro X Quartyz",
      "One X Hub",
      "Reaper Hub",
      "Speed Hub X",
      "ThunderZ",
      "Zen Hub"
    }, function(r0_367)
      -- line: [0, 0] id: 367
      if r0_367 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_367 == "Hyper Hub" then
        pcall(function()
          -- line: [0, 0] id: 368
          repeat
            wait()
          until game:IsLoaded()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
        end)
      elseif r0_367 == "Mukuro X Quartyz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
      elseif r0_367 == "One X Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xOne2/King-Legacy/main/README.md"))()
      elseif r0_367 == "Reaper Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
      elseif r0_367 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif r0_367 == "ThunderZ" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      elseif r0_367 == "Zen Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
      end
    end)
    r30_3:Dropdown("Legends Of Speed", {
      "Arch",
      "Code Hub",
      "Cryo Hub",
      "Legends Of Speed 1",
      "Legends Of Speed 2",
      "Legends Of Speed 3",
      "Legends Of Speed Rayfield",
      "Legends Of Speed by Waza80",
      "Pog Hub No Carte",
      "Project L",
      "Project Meow",
      "Project Omega",
      "Proxima Hub",
      "Pss Hub",
      "Sky Hub",
      "Speed Hub X",
      "SuPray",
      "Tbao Hub",
      "Uciha Hub",
      "Vynixius",
      "Weinz",
      nil
    }, function(r0_171)
      -- line: [0, 0] id: 171
      if r0_171 == "Arch" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lux933/Arch/main/Utilities/loader.lua"))()
      elseif r0_171 == "Code Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/coder382/CodeHub/main/Loader.lua"))()
      elseif r0_171 == "Cryo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryoScript/Scripts.lua/main/Legends%20of%20Speed.lua", true))()
      elseif r0_171 == "Legends Of Speed 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhackyCode/SPEEDDEVIL/main/legendsofspeed.lua"))()
      elseif r0_171 == "Legends Of Speed 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YukiTM/Roblox/main/Legends", true))()
      elseif r0_171 == "Legends Of Speed 3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Legenos%20of%20speedos"))()
      elseif r0_171 == "Legends Of Speed Rayfield" then
        loadstring(game:HttpGet("https://pastebin.com/raw/wGjDdXNX"))()
      elseif r0_171 == "Legends Of Speed by Waza80" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/los"))()
      elseif r0_171 == "Pog Hub No Carte" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/Loader/main/Loader.lua"))()
      elseif r0_171 == "Project L" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IsThisMe01/Project-L/main/LegendsOfSpeed.lua"))()
      elseif r0_171 == "Project Meow" then
        loadstring(game:HttpGet("https://scriptblox.com/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
      elseif r0_171 == "Project Omega" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptPirate/ProjectOmega/main/ProjectOmegaLoader.lua"))()
      elseif r0_171 == "Proxima Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
      elseif r0_171 == "Pss Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/psswaldo/psshub/main/main.lua"))()
      elseif r0_171 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arlists/Sky-Hub/main/Main", true))()
      elseif r0_171 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      elseif r0_171 == "SuPray" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/SuPray/main/Speed-of-Legends.lua"))()
      elseif r0_171 == "Tbao Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
      elseif r0_171 == "Uciha Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fareljr1/Hub/main/Loader"))()
      elseif r0_171 == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
      elseif r0_171 == "Weinz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/weiny-ez/w-main/main/loader.lua"))()
      end
    end)
    r30_3:Dropdown("Mad City", {
      "ProBacon Hub",
      "Ruby Hub Free",
      "Ruby Hub v2.0"
    }, function(r0_223)
      -- line: [0, 0] id: 223
      if r0_223 == "ProBacon Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aymarko/ProBaconHub/main/probacon1234/aymarko/MadCity/GUI/Beta"))()
      elseif r0_223 == "Ruby Hub Free" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20Chapter%202", true))()
      elseif r0_223 == "Ruby Hub v2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/madcity/main/Ruby%20Hub%20v1.1", true))()
      end
    end)
    r30_3:Dropdown("Murder Mystery 2", {
      "Auto Coin",
      "Dreadz Hub",
      "Eclipse Hub",
      "Ghost Hub",
      "Highlight Hub",
      "Jayy Hub",
      "Kidachi Hub",
      "Lunar Hub",
      "Murder Mystery 2",
      "Murder Mystery 2 by:ScriptX Version X",
      "Nexus Hub",
      "R3th Priv",
      "Ski Hub",
      "Symphony Hub"
    }, function(r0_186)
      -- line: [0, 0] id: 186
      if r0_186 == "Auto Coin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tvgueimer84/tvgueimerr23232/main/mmm2"))()
      elseif r0_186 == "Dreadz Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DreadzHub2/DreadzHub-Scripts-FR/main/Loader"))()
      elseif r0_186 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_186 = loadstring
        local r2_186 = request
        if not r2_186 then
          r2_186 = http_request
          if not r2_186 then
            r2_186 = http
            if r2_186 then
              r2_186 = http.request or syn and syn.request
            else
              goto label_39	-- block#9 is visited secondly
            end
          end
        end
        local r4_186 = tostring
        local r5_186 = "https://api.eclipsehub.xyz/auth"
        assert(r1_186 and r2_186, "Executor not Supported")
        r1_186(r2_186({
          Url = r5_186 .. "?key=" .. r4_186(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_186 == "Ghost Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
      elseif r0_186 == "Highlight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Free"))()
      elseif r0_186 == "Jayy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reed192512/jayyhubcloud/main/MainLoadstring", true))()
      elseif r0_186 == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/MM2_V2"))()
      elseif r0_186 == "Lunar Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
      elseif r0_186 == "Murder Mystery 2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/mm2", true))()
      elseif r0_186 == "Murder Mystery 2 by:ScriptX Version X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/SORIX-Hub/main/Murder%20Mystery%202%20Version%20X"))()
      elseif r0_186 == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring"))()
      elseif r0_186 == "R3th Priv" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3TH-PRIV/main/LOAD.lua"))()
      elseif r0_186 == "Ski Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/203DBjLx", true))()
      elseif r0_186 == "Symphony Hub" then
        local r1_186 = loadstring
        local r2_186 = request
        if not r2_186 then
          r2_186 = http_request
          if not r2_186 then
            r2_186 = http
            if r2_186 then
              r2_186 = http.request or syn and syn.request
            else
              goto label_190	-- block#39 is visited secondly
            end
          end
        end
        local r4_186 = "https://itsjidy.github.io/SymphonyHub/Loader.html"
        assert(r1_186 and r2_186, "Your Executor does not support.")
        r1_186(r2_186({
          Url = r4_186,
          Method = "GET",
        }).Body)()
      end
    end)
    r30_3:Dropdown("Murderers Vs Sheriffs", {
      "Bebo Scripts",
      "Emptyness Hub",
      "Kenniel Script",
      "Legend HandlesYT",
      "Muderer Vs Sheriff",
      "Oasis Hub",
      "Ranxware",
      "Ro Flux Hub",
      "Ruby Hub"
    }, function(r0_16)
      -- line: [0, 0] id: 16
      if r0_16 == "Bebo Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
      elseif r0_16 == "Emptyness Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/EmptynessNoBlur"))()
      elseif r0_16 == "Kenniel Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Murderers-VS-Sheriffs-Duels-script/main/Murderers%20VS%20Sheriffs%20Duels%20script", true))()
      elseif r0_16 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Duels7/main/Sheriffs56"))()
      elseif r0_16 == "Muderer Vs Sheriff" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/mvs"))()
      elseif r0_16 == "Oasis Hub" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/bruvzz/oasishub/main/script"))()
      elseif r0_16 == "Ranxware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AsteriskCodes/Ranxware-V2-Restored/main/source.lua"))()
      elseif r0_16 == "Ro Flux Hub" then
        _G.Key = "FreeKey2023"
        pcall(function()
          -- line: [0, 0] id: 17
          loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
      elseif r0_16 == "Ruby Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
      end
    end)
    r30_3:Dropdown("My Restaurant", {
      "Milk Up",
      "My Restaurant",
      "Project Lightning",
      "Project WD",
      "Rafa Hub",
      "Wyn\'s Script"
    }, function(r0_170)
      -- line: [0, 0] id: 170
      if r0_170 == "Milk Up" then
        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
      elseif r0_170 == "My Restaurant" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/MyRestaurant"))()
      elseif r0_170 == "Project Lightning" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectLightningDev/Project-Lightning-Loader/main/Loader.Lua"))()
      elseif r0_170 == "Project WD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_170 == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
      elseif r0_170 == "Wyn\'s Script" then
        loadstring(game:HttpGet("https://system-exodus.com/scripts/MyRestaurant/MyRestaurant.lua", true))()
      end
    end)
    r30_3:Dropdown("Natural Disaster Survival", {
      "Binary Hub",
      "CH Hub",
      "Dark Ware",
      "Eclipse Hub",
      "Natural Disaster Hub",
      "Natural Disaster Survival",
      "Natural Disaster Survival By:RIP",
      "NDS_A\'X",
      "NDS Hub",
      "NDS GUI",
      "One Protocol",
      "Rawnder",
      "Six Hub",
      "Zeerox Hub"
    }, function(r0_46)
      -- line: [0, 0] id: 46
      if r0_46 == "Binary Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BinaryHubOfficial/binaryhub/main/init.lua"))()
      elseif r0_46 == "CH Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
      elseif r0_46 == "Dark Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yarik312/DarkWare/main/MainLoader", true))()
      elseif r0_46 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_46 = loadstring
        local r2_46 = request
        if not r2_46 then
          r2_46 = http_request
          if not r2_46 then
            r2_46 = http
            if r2_46 then
              r2_46 = http.request or syn and syn.request
            else
              goto label_50	-- block#11 is visited secondly
            end
          end
        end
        local r4_46 = tostring
        local r5_46 = "https://api.eclipsehub.xyz/auth"
        assert(r1_46 and r2_46, "Executor not Supported")
        r1_46(r2_46({
          Url = r5_46 .. "?key=" .. r4_46(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_46 == "Natural Disaster Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hussain1323232234/My-Scripts/main/Natural%20Disaster"))()
      elseif r0_46 == "Natural Disaster Survival" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()
      elseif r0_46 == "Natural Disaster Survival By:RIP" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/NaturalDisasterSurvival.lua"))()
      elseif r0_46 == "NDS_A\'X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/NDS_A%5EX"))()
      elseif r0_46 == "NDS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main"))()
      elseif r0_46 == "NDS GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
      elseif r0_46 == "One Protocol" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneProtocol/Project/main/Loader", true))()
      elseif r0_46 == "Rawnder" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster"))()
      elseif r0_46 == "Six Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE"))()
      elseif r0_46 == "Zeerox Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
      end
    end)
    r30_3:Dropdown("Nico NextBot", {
      "Darkrai-X",
      "Hp Hub",
      "NexHub",
      "Nico NextBot",
      "WercT"
    }, function(r0_102)
      -- line: [0, 0] id: 102
      if r0_102 == "Darkrai-X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/NicoNextBots", true))()
      elseif r0_102 == "Hp Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/HPHub/main/HPHub.lua"))()
      elseif r0_102 == "NexHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader"))()
      elseif r0_102 == "Nico NextBot" then
        loadstring(game:HttpGet("https://pastebin.com/raw/DFfKb4i9"))()
      elseif r0_102 == "WercT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dropouut/Shindai/main/wercT.lua"))()
      end
    end)
    r30_3:Dropdown("Pet Catchers", {
      "Banana Hub",
      "GatoHub",
      "Huge Games",
      "IdiotHub",
      "Lenut Hub",
      "Nexus Hub",
      "Pet Catchers"
    }, function(r0_235)
      -- line: [0, 0] id: 235
      if r0_235 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif r0_235 == "GatoHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchers"))()
      elseif r0_235 == "Huge Games" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f38c17c4a5e9f38a7dac14ce0940688d.lua"))()
      elseif r0_235 == "IdiotHub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main"))()
      elseif r0_235 == "Lenut Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lenutjr/pc/main/petcatchers"))()
      elseif r0_235 == "Nexus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyHub123/NexusHubMain/main/Main.lua"))()
      elseif r0_235 == "Pet Catchers" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/PET%20CATCHERS", true))()
      end
    end)
    r30_3:Dropdown("Pet Simulator 99", {
      "Auto Stairway To Heaven",
      "Banana Hub",
      "Huge Games",
      "Idiot Hub",
      "Legend HandlesYT",
      "REDz HUB",
      "Sky Hub",
      "Syrex Hub",
      "Zekrom Hub X",
      "Zer0 Hub"
    }, function(r0_299)
      -- line: [0, 0] id: 299
      if r0_299 == "Auto Stairway To Heaven" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fissurectomy/woah/main/ps99_stairway.lua"))()
      elseif r0_299 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/newMainKeySytem.lua"))()
      elseif r0_299 == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/ps99"))()
      elseif r0_299 == "Idiot Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Somerandomidiot/Lua/main/PS99_Protected.txt"))()
      elseif r0_299 == "Legend HandlesYT" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Sim2/main/Pet99"))()
      elseif r0_299 == "REDz HUB" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
      elseif r0_299 == "Sky Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
      elseif r0_299 == "Syrex Hub" then
        loadstring(game:HttpGet("https://syrexhub.netlify.app/raw/petsimulator99/syrexhub"))()
      elseif r0_299 == "Zekrom Hub X" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Zekrom-Hub-X/main/Zekrom-Hub-X-exe"))()
      elseif r0_299 == "Zer0 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
      end
    end)
    r30_3:Dropdown("Pet Simulator X", {
      "BlackTrap",
      "Catalyst",
      "Cloud Hub",
      "Extreme Hub",
      "EVO V4",
      "Huge Games",
      "Milk Up",
      "Project WD",
      "Rafa Hub",
      "Rblx Hub",
      "ThunderZ(PC)"
    }, function(r0_9)
      -- line: [0, 0] id: 9
      if r0_9 == "BlackTrap" then
        loadstring(game:HttpGetAsync("https://blacktrap.org/blacktrap/users/checkpoint/Auth.txt"))()
      elseif r0_9 == "Catalyst" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/catalyst/itachi/main.lua"))()
      elseif r0_9 == "Cloud Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadScripters/CloudHub/main/hub"))()
      elseif r0_9 == "Extreme Hub" then
        _G.ExtremeHUBLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/All-Scripts-Obfuscated.lua"))()
      elseif r0_9 == "EVO V4" then
        loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))()
      elseif r0_9 == "Huge Games" then
        loadstring(game:HttpGet("https://hugegames.io/psx"))()
      elseif r0_9 == "Milk Up" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2a31571481d9db7f3be01903493bfc9a.lua"))()
      elseif r0_9 == "Project WD" then
        getgenv().boothsnipe = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
      elseif r0_9 == "Rafa Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/psx.lua"))()
      elseif r0_9 == "Rblx Hub" then
        loadstring(game:HttpGet("https://paste.xyzo.space/rblxhub/all.lua"))()
      elseif r0_9 == "ThunderZ(PC)" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
      end
    end)
    r30_3:Dropdown("Prison Life", {
      "Astral Hub",
      "Del Hub",
      "Fe Btools",
      "Fe Disabled Tool Gui",
      "Juanko",
      "Moonlight",
      "Tiger Admin",
      "Vynixius"
    }, function(r0_266)
      -- line: [0, 0] id: 266
      if r0_266 == "Astral Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Games/PrisonLife/main.lua"))()
      elseif r0_266 == "Del Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/QY07DaJS"))()
      elseif r0_266 == "Fe Btools" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-btools-script-for-prison-life-9706"))()
      elseif r0_266 == "Fe Disabled Tool Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
      elseif r0_266 == "Juanko" then
        loadstring(game:HttpGet("https://pastebin.com/raw/rfAULQ83"))()
      elseif r0_266 == "Moonlight" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Prison-life/main/Moonlight%20Client%20Prison%20Life", true))()
      elseif r0_266 == "Tiger Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script"))()
      elseif r0_266 == "Vynixius" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Prison%20Life"))()
      end
    end)
    r30_3:Dropdown("Project Mugetsu", {
      "JumbleScripts",
      "Pm",
      "Purple Hub",
      "Valynium",
      "Verny Hub V2"
    }, function(r0_158)
      -- line: [0, 0] id: 158
      if r0_158 == "JumbleScripts" then
        loadstring(game:HttpGet("https://jumblescripts.com/ProjectMugetsu.lua"))()
      elseif r0_158 == "Pm" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrickyAH/Scripts/main/loader.lua"))()
      elseif r0_158 == "Purple Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheyCallMeVox/scripts/main/PM"))()
      elseif r0_158 == "Valynium" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XO-3S-CL-VCK-jf-3HDM/Products/main/Project-Mugetsu.lua"))()
      elseif r0_158 == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end)
    r30_3:Dropdown("Project Slayer", {
      "Nuke Hub",
      "Oni Hub",
      "Shark Hub",
      "Skeered Hub",
      "Sylveon Hub",
      "Versaware Hub",
      "Zyrc Hub"
    }, function(r0_36)
      -- line: [0, 0] id: 36
      if r0_36 == "Nuke Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2023/main/projslayerthingy", true))()
      elseif r0_36 == "Oni Hub" then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/01471f12f9adfd4537f4cc0b3b7bba14.lua"))()
      elseif r0_36 == "Shark Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/TcbS1i6E"))()
      elseif r0_36 == "Skeered Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skeereddo/name/main/krnl", true))()
      elseif r0_36 == "Sylveon Hub" then
        local r1_36 = "https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/Mobile.lua"
        repeat
          wait()
        until game:IsLoaded()
        loadstring(game:HttpGet(r1_36))()
      elseif r0_36 == "Versaware Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware_free/main/VersawareFree.lua", true))()
      elseif r0_36 == "Zyrc Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/mugentr"))()
      end
    end)
    r30_3:Dropdown("Punch Simulator", {
      "Angeel Hub",
      "Blue GUI",
      "Perfectus Hub",
      "Tora Hub"
    }, function(r0_339)
      -- line: [0, 0] id: 339
      if r0_339 == "Angeel Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Angeelvxg/PunchSimulator/main/PunchSimulator.lua", true))()
      elseif r0_339 == "Blue GUI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
      elseif r0_339 == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/dbevo/main/asfasfasfasf"))()
      elseif r0_339 == "Tora Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0PUNCH"))()
      end
    end)
    r30_3:Dropdown("Punch Wall Simulator", {
      "Codexus Trial",
      "ImperorLegend Hub",
      "Nexus",
      "Platinium Hub",
      "Punch Wall Simulator",
      "Punch Wall Simulator YT ToraIsMe",
      "Yoto Hub"
    }, function(r0_437)
      -- line: [0, 0] id: 437
      if r0_437 == "Codexus Trial" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/PunchWallSim.lua"))()
      elseif r0_437 == "ImperorLegend Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImperorLegend/Orig-PWSim-Script/main/Script"))()
      elseif r0_437 == "Nexus" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/F2B-HUB/F2B/main/HUB"))()
      elseif r0_437 == "Platinium Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
      elseif r0_437 == "Punch Wall Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/momentBr/game-script/main/Punch%20Wall%20Simulator"))()
      elseif r0_437 == "Punch Wall Simulator YT ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0punch"))()
      elseif r0_437 == "Yoto Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Binintrozza/GUI-SCRIPT/main/Main"))()
      end
    end)
    r30_3:Dropdown("Rainbow Friends(Chapter 2)", {
      "BorkWare",
      "Frightened Hub",
      "Rainbow Friends KEPA",
      "Rainbow Friends",
      "ToraIsMe",
      "Voidz"
    }, function(r0_336)
      -- line: [0, 0] id: 336
      if r0_336 == "BorkWare" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/" .. game.GameId .. ".lua"))(" Watermelon ? ")
      elseif r0_336 == "Frightened Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/FrightenedHub/main/Loader.lua", true))()
      elseif r0_336 == "Rainbow Friends KEPA" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Keparetiolpxe/rbxscript/main/RainbowFriendsKEPA"))()
      elseif r0_336 == "Rainbow Friends" then
        loadstring(game:HttpGet("https://pastebin.com/raw/yVhAwibN"))()
      elseif r0_336 == "ToraIsMe" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow"))()
      elseif r0_336 == "Voidz" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
      end
    end)
    r30_3:Dropdown("Shadow Boxing", {
      "Flare Hub",
      "Trey\'s Hub"
    }, function(r0_366)
      -- line: [0, 0] id: 366
      if r0_366 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/ShadowBoxing"))()
      elseif r0_366 == "Trey\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/shadow"))()
      end
    end)
    r30_3:Dropdown("Slap Battles", {
      "CherryUI\'s Hub",
      "Dizzy Hub",
      "Hub That Exists",
      "Infinite Ware",
      "Purple R20 Hub",
      "Slap Battle Gui",
      "R20-Exploiter",
      "Vantra Hub",
      "Whopper"
    }, function(r0_330)
      -- line: [0, 0] id: 330
      if r0_330 == "CherryUI\'s Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
      elseif r0_330 == "Dizzy Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/dizzy_hub/scripts/slap_battles.lua"))()
      elseif r0_330 == "Hub That Exists" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
      elseif r0_330 == "Infinite Ware" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackie-coke/InfiniteWare/main/KS.lua", true))()
      elseif r0_330 == "Purple R20 Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/anakinn"))()
      elseif r0_330 == "Slap Battle Gui" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
      elseif r0_330 == "R20-Exploiter" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua"))()
      elseif r0_330 == "Vantra Hub" then
        loadstring(game:HttpGet("https://vantra.cc/api/script/get?placeid=MainLoader"))()
      elseif r0_330 == "Whopper" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/whopper.lua"))()
      end
    end)
    r30_3:Dropdown("Sol\'s RNG", {
      "HoHo Hub",
      "Legend Handless Hub",
      "Sol\'s RNG",
      "Sol\'s RNG Panel"
    }, function(r0_29)
      -- line: [0, 0] id: 29
      if r0_29 == "HoHo Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      elseif r0_29 == "Legend Handless Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/upd/main/rng"))()
      elseif r0_29 == "Sol\'s RNG" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Toilet71/Games-Sol-s/main/Sol\'s%20Script"))()
      elseif r0_29 == "Sols RNG Panel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
      end
    end)
    r30_3:Dropdown("Sonic Speed Simulator", {
      "Cheater Soul",
      "Master Hub",
      "Skays",
      "Sonic Speed Simulator"
    }, function(r0_265)
      -- line: [0, 0] id: 265
      if r0_265 == "Cheater Soul" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luciquad/credit/main/sonicspeedsimulator.lua"))()
      elseif r0_265 == "Master Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      elseif r0_265 == "Skays" then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SkaysGG-2095"))()
      elseif r0_265 == "Sonic Speed Simulator" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kkeyy-hash/roblox/main/SonicSpeedSimulator2.lua"))()
      end
    end)
    r30_3:Dropdown("The Strongest Battlegrounds", {
      "Hawk Hub",
      "Nex Hub",
      "Nicuse Hub",
      "LOLking123456",
      "Xtrey10x Hub"
    }, function(r0_203)
      -- line: [0, 0] id: 203
      if r0_203 == "Hawk Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHanki/Hawk/main/Loader", true))()
      elseif r0_203 == "Nex Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CopyReal/NexHub/main/NexHubLoader", true))()
      elseif r0_203 == "Nicuse Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
      elseif r0_203 == "LOLking123456" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/battleground1/main/Saitama41"))()
      elseif r0_203 == "Xtrey10x Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/saitama"))()
      end
    end)
    r30_3:Dropdown("Tower Of Hell", {
      "Admin",
      "Eclipse Hub",
      "Floater Scripts",
      "Garfield Hub",
      "LighTux",
      "Tower Of Hell Gui",
      "Tower Of Hell Gui by:The Mystery O_O"
    }, function(r0_38)
      -- line: [0, 0] id: 38
      if r0_38 == "Admin" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TwomadJR/nto/main/admiin"))()
      elseif r0_38 == "Eclipse Hub" then
        getgenv().mainKey = "nil"
        local r1_38 = loadstring
        local r2_38 = request
        if not r2_38 then
          r2_38 = http_request
          if not r2_38 then
            r2_38 = http
            if r2_38 then
              r2_38 = http.request or syn and syn.request
            else
              goto label_29	-- block#7 is visited secondly
            end
          end
        end
        local r4_38 = tostring
        local r5_38 = "https://api.eclipsehub.xyz/auth"
        assert(r1_38 and r2_38, "Executor not Supported")
        r1_38(r2_38({
          Url = r5_38 .. "?key=" .. r4_38(mainKey),
          Headers = {
            ["User-Agent"] = "Eclipse",
          },
        }).Body)()
      elseif r0_38 == "Floater Scripts" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iiProductionz/Floater-Scripts/main/WaifuEdition/Tower%20Of%20Hell"))()
      elseif r0_38 == "Garfield Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
      elseif r0_38 == "LighTux" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
      elseif r0_38 == "Tower Of Hell Gui" then
        loadstring(game:HttpGet("https://gist.githubusercontent.com/BloxiYT/85f97364b6367baac677e109488c9905/raw/c2972a2b892c4193509ddb2fe1ba3061435e1a8a/gistfile1.txt"))()
      elseif r0_38 == "Tower Of Hell Gui by:The Mystery O_O" then
        loadstring(game:HttpGet("https://pastebin.com/raw/BbVHjH56"))()
      end
    end)
    r30_3:Dropdown("UnderGround War", {
      "Multi Hub",
      "Unique Hub",
      "UnderGround War Gui",
      "UnderGround War 1"
    }, function(r0_446)
      -- line: [0, 0] id: 446
      if r0_446 == "Multi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jj123llol/multi-hub/main/Multi", true))()
      elseif r0_446 == "Unique Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jynzl/UniqueHub/main/UniqueHubv2Intro", true))()
      elseif r0_446 == "UnderGround War Gui" then
        loadstring(game:HttpGet("https://pastebin.com/raw/iuqYjEAX"))()
      elseif r0_446 == "UnderGround War 1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War%203"))()
      end
    end)
    r30_3:Dropdown("Wisteria 2", {
      "Flare Hub",
      "Jumble Hub",
      "Kidachi Hub"
    }, function(r0_271)
      -- line: [0, 0] id: 271
      if r0_271 == "Flare Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/wisteria2script"))()
      elseif r0_271 == "Jumble Hub" then
        loadstring(game:HttpGet("https://jumblescripts.com/JumbleHub.lua"))()
      elseif r0_271 == "Kidachi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/Wisteria", true))()
      end
    end)
    r30_3:Dropdown("Your Bizarre Adventure", {
      "CuHub V3",
      "Green Gui B-Boy",
      "Gui by Death",
      "Midnight Hub"
    }, function(r0_77)
      -- line: [0, 0] id: 77
      if r0_77 == "CuHub V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ItachiPvPUchiha/CuHub/main/yba.lua"))()
      elseif r0_77 == "Green Gui B-Boy" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
      elseif r0_77 == "Gui by Death" then
        _G.Options = {
          ToggleKey = "Delete",
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGaster/Scripts/main/" .. tostring(game.PlaceId), true))()
      elseif r0_77 == "Midnight Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheFarowHywolf/YBA-Midnight-script/master/YBA.lua"))()
      end
    end)
    r30_3:Dropdown("3008", {
      "CheatX",
      "God Mode",
      "V.G Hub"
    }, function(r0_213)
      -- line: [0, 0] id: 213
      if r0_213 == "CheatX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/nothing/main/3008"))()
      elseif r0_213 == "God Mode" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CHnamedata/WhatDaHeck/main/3008GodMode.lua"))()
      elseif r0_213 == "V.G Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
      end
    end)
    -- ── New Entries Added by Externality Integration ──────────────────────────
    r30_3:Dropdown("Type Soul", {
      "Type Soul Hub",
      "Dark Hub",
      "Verny Hub V2"
    }, function(r0_ext1)
      if r0_ext1 == "Type Soul Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/TypeSoul", true))()
      elseif r0_ext1 == "Dark Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      elseif r0_ext1 == "Verny Hub V2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/666dasdlolok/VernyHubV2/main/Main"))()
      end
    end)
    r30_3:Dropdown("Fisch", {
      "Fisch Script",
      "Auto Fisher",
      "Hoho Hub"
    }, function(r0_ext2)
      if r0_ext2 == "Fisch Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fisch", true))()
      elseif r0_ext2 == "Auto Fisher" then
        loadstring(game:HttpGet("https://pastebin.com/raw/FischAutoFish"))()
      elseif r0_ext2 == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      end
    end)
    r30_3:Dropdown("Anime Vanguards", {
      "Vanguards Hub",
      "Trap Hub",
      "Muimi Hub"
    }, function(r0_ext3)
      if r0_ext3 == "Vanguards Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/AnimeVanguards", true))()
      elseif r0_ext3 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      elseif r0_ext3 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      end
    end)
    r30_3:Dropdown("Blue Lock: Rivals", {
      "Blue Lock Hub",
      "Speed Hub X",
      "Dark Hub"
    }, function(r0_ext4)
      if r0_ext4 == "Blue Lock Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/BlueLock", true))()
      elseif r0_ext4 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      elseif r0_ext4 == "Dark Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
      end
    end)
    r30_3:Dropdown("Anime Last Stand", {
      "ALS Hub",
      "Banana Hub",
      "Trap Hub"
    }, function(r0_ext5)
      if r0_ext5 == "ALS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/AnimeLastStand", true))()
      elseif r0_ext5 == "Banana Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
      elseif r0_ext5 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_3:Dropdown("Grow A Garden", {
      "Auto Farm",
      "Garden Hub",
      "Hoho Hub"
    }, function(r0_ext6)
      if r0_ext6 == "Auto Farm" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/GrowAGarden", true))()
      elseif r0_ext6 == "Garden Hub" then
        loadstring(game:HttpGet("https://pastebin.com/raw/GardenHubScript"))()
      elseif r0_ext6 == "Hoho Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
      end
    end)
    r30_3:Dropdown("Toilet Tower Defense", {
      "TTD Hub",
      "Muimi Hub",
      "Trap Hub"
    }, function(r0_ext7)
      if r0_ext7 == "TTD Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/ToiletTD", true))()
      elseif r0_ext7 == "Muimi Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bunny42312/script/main/acs"))()
      elseif r0_ext7 == "Trap Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/TrapHub.lua"))()
      end
    end)
    r30_3:Dropdown("Strongest Punch Simulator", {
      "SPS Hub",
      "Perfectus Hub",
      "Speed Hub X"
    }, function(r0_ext8)
      if r0_ext8 == "SPS Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/StrongestPunch", true))()
      elseif r0_ext8 == "Perfectus Hub" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerfectusMim/Perfectus-Hub/main/perfectus-hub"))()
      elseif r0_ext8 == "Speed Hub X" then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
      end
    end)
    -- ── End of Externality-Added Entries ──────────────────────────────────────
    r30_3:Dropdown("More Next Update", {
      "Next Update"
    }, function()
      -- line: [0, 0] id: 40
    end)
    local r31_3 = r9_3:Tab("Hub | Gui")
    r31_3:Section("Executor")
    local r34_3 = "Textbox"
    r34_3 = "Script Executer"
    r31_3:[r34_3](r34_3, "Executor", function(r0_182)
      -- line: [0, 0] id: 182
      loadstring(r0_182)()
    end)
    r31_3:Button("Arceus X v3", function()
      -- line: [0, 0] id: 291
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end)
    r31_3:Button("Fluxus Coral", function()
      -- line: [0, 0] id: 209
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
    end)
    r31_3:Button("Delta Fan Made", function()
      -- line: [0, 0] id: 412
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Delta-Executor-J-O-K-E-7664"))()
    end)
    r31_3:Button("Krnl Gui", function()
      -- line: [0, 0] id: 178
      loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
    end)
    r31_3:Button("Synapse X Gui", function()
      -- line: [0, 0] id: 389
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
    end)
    r31_3:Button("NotePad", function()
      -- line: [0, 0] id: 57
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAScripts/Favorable/main/NotePad.lua"))()
    end)
    r31_3:Button("NoCom Executor", function()
      -- line: [0, 0] id: 128
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/NoCom-Executor/main/NoCom"))()
    end)
    r31_3:Button("Executor Gui By AZY#0348", function()
      -- line: [0, 0] id: 59
      loadstring(game:HttpGet("https://pastebin.com/raw/yGxeT8zC", true))()
    end)
    r31_3:Button("Shadow X Executor", function()
      -- line: [0, 0] id: 230
      loadstring(game:HttpGet("https://pastebin.com/raw/1fAnGAA0"))()
    end)
    r31_3:Button("Neptune Executor", function()
      -- line: [0, 0] id: 73
      loadstring(game:HttpGet("https://pastebin.com/raw/y3jhxS5r"))()
    end)
    r31_3:Button("ECCS•AI Executor", function()
      -- line: [0, 0] id: 101
      loadstring(game:HttpGet("https://pastebin.com/raw/7nAMYduv"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_3:Button("ECCS•ID Executor", function()
      -- line: [0, 0] id: 329
      loadstring(game:HttpGet("https://pastebin.com/raw/hFkBRgxb"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_3:Button("NewExec V1", function()
      -- line: [0, 0] id: 370
      loadstring(game:HttpGet("https://pastebin.com/raw/6sp92FDj", true))()
    end)
    r31_3:Button("Bad Ware", function()
      -- line: [0, 0] id: 372
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sluucker/badware/main/loader", true))()
    end)
    r31_3:Button("Stigma", function()
      -- line: [0, 0] id: 404
      loadstring(game:HttpGet("https://pastebin.com/raw/mG8XGpmD", true))()
    end)
    r31_3:Button("Luigi Executor", function()
      -- line: [0, 0] id: 285
      loadstring(game:HttpGet("https://pastebin.com/raw/UaTjPQMP"))()
    end)
    r31_3:Button("Rc7 Executor", function()
      -- line: [0, 0] id: 354
      loadstring(game:HttpGet("https://gist.githubusercontent.com/jointeamck/40a11b97bfb6881a72dba218cce85e2a/raw/02ca8af7ef7904182abd4208064d9a22df0010b5/rc7"))()
    end)
    r31_3:Button("ShitSploit", function()
      -- line: [0, 0] id: 82
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shitsploit-9386"))()
    end)
    r31_3:Button("Mario", function()
      -- line: [0, 0] id: 334
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-by-c00lkidd-9388"))()
    end)
    r31_3:Button("Mario Premium", function()
      -- line: [0, 0] id: 280
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-premium-9389"))()
    end)
    r31_3:Button("Sexy Hamood (Premium)", function()
      -- line: [0, 0] id: 146
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hamoot-script-9408"))()
    end)
    r31_3:Button("C00lsploit Executor", function()
      -- line: [0, 0] id: 395
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lsploit-9391"))()
    end)
    r31_3:Button("Serverside Executor Gui", function()
      -- line: [0, 0] id: 201
      loadstring(game:HttpGet("https://pastebin.com/raw/PXAdj6ED"))()
    end)
    r31_3:Section("Admin")
    r31_3:Button("Infinite Yield", function()
      -- line: [0, 0] id: 69
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    r31_3:Button("Iv Admin", function()
      -- line: [0, 0] id: 251
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodyBurns/Hex/main/Iv%20Admin%20v3.lua"))()
    end)
    r31_3:Button("Cmd-X", function()
      -- line: [0, 0] id: 189
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
    r31_3:Button("Fates Admin", function()
      -- line: [0, 0] id: 305
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end)
    r31_3:Button("GrimEx Admin", function()
      -- line: [0, 0] id: 164
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JoeScriptHub/GrimEx-Admin/main/GrimEx%20Admin"))()
    end)
    r31_3:Button("Gx Admin", function()
      -- line: [0, 0] id: 390
      loadstring(game:HttpGet("https://pastebin.com/raw/v6E9BmFK", true))()
    end)
    r31_3:Button("Leg Admin v2", function()
      -- line: [0, 0] id: 242
      loadstring(game:HttpGet("https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua"))()
    end)
    r31_3:Button("Nameless Admin | Working", function()
      -- line: [0, 0] id: 228
      loadstring(game:HttpGet("https://gist.github.com/inuk84/ca841931f45f242c945405298b26bd71/raw/af364e5d4ea5b0d2eac404a5376d83c84a23cbe4/na.lua"))()
    end)
    r31_3:Button("Nameless Admin | Discontinued", function()
      -- line: [0, 0] id: 314
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end)
    r31_3:Button("Admin Script", function()
      -- line: [0, 0] id: 106
      loadstring("loadstring(game:HttpGet((\'https://pastefy.ga/fGYa4i7t/raw\'),true))()\n")()
    end)
    r31_3:Button("Reviz Admin", function()
      -- line: [0, 0] id: 218
      loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
    end)
    r31_3:Button("Simple Admin", function()
      -- line: [0, 0] id: 202
      loadstring(game:HttpGet("https://pastebin.com/raw/3hDQcTaD"))()
    end)
    r31_3:Button("Property Admin", function()
      -- line: [0, 0] id: 253
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Copinface/MainSource/main/PropertyAdmin"))()
    end)
    r31_3:Button("Vortex Admin", function()
      -- line: [0, 0] id: 322
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/Fe-Vortex-admin-V2/main/VortexCompany/C4/Discord.lua"))()
    end)
    r31_3:Section("Best Gui Script")
    r31_3:Button("Script Searcher", function()
      -- line: [0, 0] id: 316
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end)
    r31_3:Button("ECCS•Searcher", function()
      -- line: [0, 0] id: 363
      loadstring(game:HttpGet("https://pastebin.com/raw/zhQ9gfJm"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_3:Button("Games Hub", function()
      -- line: [0, 0] id: 449
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    end)
    r31_3:Button("Vex Hub", function()
      -- line: [0, 0] id: 402
      loadstring(game:HttpGet("https://raw.githubusercontent.com/V31nc/On-Discord/Created/VexHub"))()
    end)
    r31_3:Button("Sirius Hub", function()
      -- line: [0, 0] id: 387
      loadstring(game:HttpGet("https://sirius.menu/script"))()
    end)
    r31_3:Button("Moon Ui", function()
      -- line: [0, 0] id: 258
      loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
    end)
    r31_3:Button("HarshTech v7.6", function()
      -- line: [0, 0] id: 13
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YellowGreg/Loadstring/main/HarshTechV7.6-Pc-Or-Mobile.lua"))()
    end)
    r31_3:Button("Multi Scripter X", function()
      -- line: [0, 0] id: 284
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader"))()
    end)
    r31_3:Button("Mocha Hub", function()
      -- line: [0, 0] id: 248
      loadstring(game:HttpGet("https://pastebin.com/raw/0MriWAjK"))()
    end)
    r31_3:Button("Fathom Hub", function()
      -- line: [0, 0] id: 297
      loadstring(game:HttpGet("https://pastebin.com/raw/Y4AGJALY"))()
    end)
    r31_3:Button("Gigachad Hub", function()
      -- line: [0, 0] id: 352
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua", true))()
    end)
    r31_3:Button("Astrolynx", function()
      -- line: [0, 0] id: 383
      loadstring(game:HttpGet("https://freenote.biz/raw/vBfN3NeVYN", true))()
    end)
    r31_3:Button("Alysse", function()
      -- line: [0, 0] id: 356
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/loader.lua"))()
    end)
    r31_3:Button("GHub", function()
      -- line: [0, 0] id: 420
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/GHUBV13S/main/GHUBv13S.txt"))()
    end)
    r31_3:Button("British Hub", function()
      -- line: [0, 0] id: 6
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat7888/BH/main/Protected_6274400031599569.lua%20(1).txt"))()
    end)
    r31_3:Section("Good Gui Script")
    r31_3:Button("123 Gui", function()
      -- line: [0, 0] id: 145
      loadstring(game:HttpGet("https://pastebin.com/raw/qCBVxR3e", true))()
    end)
    r31_3:Button("Acrylix v2.0", function()
      -- line: [0, 0] id: 87
      loadstring(game:HttpGet("https://raw.githubusercontent.com/HubbyScripts/FE-Trolling-Hub/main/source"))()
    end)
    r31_3:Button("ADSKer Hub", function()
      -- line: [0, 0] id: 19
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ADSKerHub/main/ADSKExe"))()
    end)
    r31_3:Button("Alex Universal", function()
      -- line: [0, 0] id: 216
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexScripts1/AlexUniversalV4/main/Release"))()
    end)
    r31_3:Button("All Obby Bido Skins", function()
      -- line: [0, 0] id: 427
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/All%20obby%20Bido%20Skins%20V1.0"))()
    end)
    r31_3:Button("All Tycoons v3", function()
      -- line: [0, 0] id: 196
      loadstring(game:HttpGet("https://freenote.biz/raw/SkG1nrBqE8", true))()
    end)
    r31_3:Button("Aloneo Hub", function()
      -- line: [0, 0] id: 55
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YogaProjectRblx/AloneUniversal/main/README.md"))()
    end)
    r31_3:Button("Artillery Hub", function()
      -- line: [0, 0] id: 307
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LynchHHU/ArtilleryHub/main/GameHub/LynchYT"))()
    end)
    r31_3:Button("Astral Hub", function()
      -- line: [0, 0] id: 276
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua", true))()
    end)
    r31_3:Button("Astrava", function()
      -- line: [0, 0] id: 272
      loadstring(game:GetObjects("rbxassetid://1468845733")[1].Source)()
    end)
    r31_3:Button("Auratus X", function()
      -- line: [0, 0] id: 147
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RealMrQuacks/AuratusX/master/Load"))()
    end)
    r31_3:Button("Autput", function()
      -- line: [0, 0] id: 148
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Autput/main/Autputus"))()
    end)
    r31_3:Button("Bendy And Ink Machine", function()
      -- line: [0, 0] id: 51
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
    end)
    r31_3:Button("B Genesis", function()
      -- line: [0, 0] id: 293
      loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis"))()
    end)
    r31_3:Button("Bido Skins v1.9", function()
      -- line: [0, 0] id: 173
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9"))()
    end)
    r31_3:Button("British Hub Pvp", function()
      -- line: [0, 0] id: 401
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RedCoat33/Britishhub/main/Protected_4290863539999994.lua.txt"))()
    end)
    r31_3:Button("Butif Hub", function()
      -- line: [0, 0] id: 84
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/Butif%20Hub"))()
    end)
    r31_3:Button("Chaddest Cat Hub", function()
      -- line: [0, 0] id: 313
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Yopapa699/Key-System/main/Loader.lua"))()
    end)
    r31_3:Button("Chat Hub", function()
      -- line: [0, 0] id: 327
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20Chat%20Hub"))()
    end)
    r31_3:Button("Chiezzy Hub", function()
      -- line: [0, 0] id: 341
      loadstring(game:HttpGet("https://raw.githubusercontent.com/chiepz/aslbnmnkhby7e/main/crqhryvjahdjwysrnegsf%5Csgd"))()
    end)
    r31_3:Button("Comsal Hub", function()
      -- line: [0, 0] id: 274
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Comsal-Hub/main/main"))()
    end)
    r31_3:Button("Coolgui", function()
      -- line: [0, 0] id: 89
      loadstring(game:GetObjects("rbxassetid://9827584846")[1].Source)()
    end)
    r31_3:Button("Cosmos Hub", function()
      -- line: [0, 0] id: 310
      loadstring(game:HttpGet("https://pastebin.com/raw/tFivBbmb"))()
    end)
    r31_3:Button("Davi Hub v1", function()
      -- line: [0, 0] id: 44
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua", true))()
    end)
    r31_3:Button("Davi Hub v2", function()
      -- line: [0, 0] id: 431
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davigui/main/DaviguiV2prealphaloader.lua", true))()
    end)
    r31_3:Button("Davi Hub v2.3", function()
      -- line: [0, 0] id: 239
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davicoderliner/davi-hub-V2.3/main/davi.lua", true))()
    end)
    r31_3:Button("Delux Hub", function()
      -- line: [0, 0] id: 304
      loadstring(game:HttpGet("https://raw.githubusercontent.com/UniversalXploits/f/master/DeluxHub.txt", true))()
    end)
    r31_3:Button("Dynamic Hub", function()
      -- line: [0, 0] id: 185
      loadstring(game:HttpGet("https://pastebin.com/raw/bzySVjhX"))()
    end)
    r31_3:Button("ECCS•GearGiver", function()
      -- line: [0, 0] id: 22
      loadstring(game:HttpGet("https://pastebin.com/raw/Dhgnt7hi"))("Copyright ERROR_CODE ECCS Co")
    end)
    r31_3:Button("Eminence Hub", function()
      -- line: [0, 0] id: 298
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ChainGotStucked/a55af82d82574/main/Eminence%20Hub%20V1.6"))()
    end)
    r31_3:Button("Equinox Hub", function()
      -- line: [0, 0] id: 137
      loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
    end)
    r31_3:Button("Executor Hub", function()
      -- line: [0, 0] id: 212
      loadstring(game:HttpGet("https://pastebin.com/raw/WxS2CFBX"))()
    end)
    r31_3:Button("Exploitz Hub", function()
      -- line: [0, 0] id: 424
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBloxYT/ExploitzHub-Games.lua/main/ExploitzHub%20Universal%20(v.3.0%20.)"))()
      setclipboard("ia3i38")
    end)
    r31_3:Button("Extreme Hub", function()
      -- line: [0, 0] id: 377
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/Exhub/main/Key.lua", true))()
    end)
    r31_3:Button("Ez Hub", function()
      -- line: [0, 0] id: 220
      loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
    end)
    r31_3:Button("F3x Hub", function()
      -- line: [0, 0] id: 198
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/f3xhub/main/f3xhub"))()
    end)
    r31_3:Button("FeliciaXxxHub", function()
      -- line: [0, 0] id: 72
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDMJakey/Obfc/main/Protected_7979642737588973.lua", true))()
    end)
    r31_3:Button("Feyz Hub", function()
      -- line: [0, 0] id: 163
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FeyzRBLX/FeyzHub/main/Feyz%20Hub%20V2"))()
    end)
    r31_3:Button("FireHubV1", function()
      -- line: [0, 0] id: 267
      loadstring(game:HttpGet("https://pastebin.com/raw/REuMknBd", True))()
    end)
    r31_3:Button("Fun Hub", function()
      -- line: [0, 0] id: 41
      loadstring(game:HttpGet("https://pastebin.com/raw/3xqzxtYN"))()
    end)
    r31_3:Button("Game Hub by:tomm_xx", function()
      -- line: [0, 0] id: 241
      loadstring(game:HttpGet("https://pastebin.com/raw/18ji1xzk"))()
    end)
    r31_3:Button("Game Hub/Script Hub By HN BLOX", function()
      -- line: [0, 0] id: 360
      loadstring(game:HttpGet("https://pastebin.com/raw/brWwrinf", true))()
    end)
    r31_3:Button("Ghost Hub", function()
      -- line: [0, 0] id: 406
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end)
    r31_3:Button("Googol", function()
      -- line: [0, 0] id: 400
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Scripts/main/Googol", true))()
    end)
    r31_3:Button("Gravity Hub", function()
      -- line: [0, 0] id: 26
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XDMODZ1040/LUA-DEVSCRIPT/main/GRAVITY%20HUB"))()
    end)
    r31_3:Button("Gucci Ui", function()
      -- line: [0, 0] id: 332
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BeStHaXYT/Gucci/main/BeStHaXYT"))()
    end)
    r31_3:Button("Gx Hub", function()
      -- line: [0, 0] id: 410
      loadstring(game:HttpGet("https://pastebin.com/raw/qWqrZVyt"))()
    end)
    r31_3:Button("Hat Hub", function()
      -- line: [0, 0] id: 197
      loadstring(game:HttpGet("https://pastebin.com/raw/6tshcUd2"))()
    end)
    r31_3:Button("Harked Reborn", function()
      -- line: [0, 0] id: 160
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
    end)
    r31_3:Button("Haxker Hub", function()
      -- line: [0, 0] id: 86
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/Script-Hub/Version-3.3"))()
    end)
    r31_3:Button("Holf Hub", function()
      -- line: [0, 0] id: 433
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r31_3:Button("Hydro Hub", function()
      -- line: [0, 0] id: 52
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
    end)
    r31_3:Button("Hyperlib Hub", function()
      -- line: [0, 0] id: 261
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"))()
    end)
    r31_3:Button("Juanko Hub", function()
      -- line: [0, 0] id: 78
      loadstring(game:HttpGet("https://pastebin.com/raw/d5BS5qiX"))()
    end)
    r31_3:Button("Juice Hub", function()
      -- line: [0, 0] id: 373
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WeAreCrews/Juice-Hub/main/Juice%20Hub"))()
    end)
    r31_3:Button("Juqua Hub", function()
      -- line: [0, 0] id: 429
      loadstring(game:HttpGet("https://pastebin.com/raw/GTL1CCdg"))()
    end)
    r31_3:Button("Killer Hub", function()
      -- line: [0, 0] id: 76
      loadstring(game:HttpGet("https://pastebin.com/raw/7MDajezY"))()
    end)
    r31_3:Button("Lego Hub", function()
      -- line: [0, 0] id: 345
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DaGuyComensal/Lego-Hub/main/main"))()
    end)
    r31_3:Button("Legon X Hub", function()
      -- line: [0, 0] id: 111
      loadstring(game:HttpGet("https://pastebin.com/raw/Lmaz8vF7", true))()
    end)
    r31_3:Button("LHYT UNIVERSAL", function()
      -- line: [0, 0] id: 12
      loadstring(game:HttpGet("https://pastefy.app/upAOsiaJ/raw", true))()
    end)
    r31_3:Button("Lightning Hub", function()
      -- line: [0, 0] id: 140
      loadstring(game:HttpGet("https://pastebin.com/raw/CSC0Ky7Z", true))()
    end)
    r31_3:Button("Lightzone v2", function()
      -- line: [0, 0] id: 53
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Idjrf5/main/Protected_3590052699937668.lua.txt"))()
    end)
    r31_3:Button("Link To Loadstring", function()
      -- line: [0, 0] id: 338
      loadstring(game:HttpGet("https://pastebin.com/raw/tsYdcZPJ"))()
    end)
    r31_3:Button("LittHub", function()
      -- line: [0, 0] id: 192
      loadstring(game:HttpGet("https://pastebin.com/raw/v4nf9WVz"))()
    end)
    r31_3:Button("Lollypop Hub", function()
      -- line: [0, 0] id: 347
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rrixh/lollypop-hub/main/v6.5%40lulaslollipop", true))()
    end)
    r31_3:Button("MegaHub", function()
      -- line: [0, 0] id: 61
      loadstring(game:HttpGet("https://raw.githubusercontent.com/WholeF00ds/Mega/main/Obfuscated%20Loader", true))()
    end)
    r31_3:Button("Mini Hub", function()
      -- line: [0, 0] id: 311
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB", true))()
    end)
    r31_3:Button("Mil Hub", function()
      -- line: [0, 0] id: 157
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/MilHub/main/V3"))()
    end)
    r31_3:Button("Music Hub", function()
      -- line: [0, 0] id: 229
      loadstring(game:HttpGet("https://pastebin.com/raw/UmuK3sGL"))()
    end)
    r31_3:Button("Multi Hub v3", function()
      -- line: [0, 0] id: 418
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/Multi-Hub-V3/main/Multi%20Hub%20V3"))()
    end)
    r31_3:Button("Multi Script Hub X", function()
      -- line: [0, 0] id: 184
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0n1kidd/Multi-Script-Hub-X/main/Protected.lua_1.txt"))()
    end)
    r31_3:Button("NukeVsCity", function()
      -- line: [0, 0] id: 48
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))()
    end)
    r31_3:Button("OpFinality", function()
      -- line: [0, 0] id: 252
      loadstring(game:HttpGet("https://pastebin.com/raw/3axt0ia1"))()
    end)
    r31_3:Button("Orange X", function()
      -- line: [0, 0] id: 342
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ImJosh66/Ab2rW/main/ORANGEX%20V5%20RELEASED%20ORANGEX%20ON%20TOP%20.txt"))()
    end)
    r31_3:Button("Orca", function()
      -- line: [0, 0] id: 20
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end)
    r31_3:Button("Pirutun Hub", function()
      -- line: [0, 0] id: 194
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Catserverrr/pirutunHubRbx/main/Protected_2932223426116900.lua.txt"))()
    end)
    r31_3:Button("Pissware", function()
      -- line: [0, 0] id: 452
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/Pissware/main/Main/MobileMain.lua"))()
    end)
    r31_3:Button("PritishHub V1", function()
      -- line: [0, 0] id: 385
      loadstring(game:HttpGet("https://cdn.discordapp.com/attachments/996659065096765502/996659173213343804/out.lua", true))()
    end)
    r31_3:Button("Psy Hub", function()
      -- line: [0, 0] id: 319
      loadstring(game:HttpGet("https://pastebin.com/raw/SCwrB1ws"))()
    end)
    r31_3:Button("Rambo Hub", function()
      -- line: [0, 0] id: 423
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Anaszaxo555/Rambo-hub-1.6/main/Rambo%20hub%201.6"))()
    end)
    r31_3:Button("Rayfield Hub", function()
      -- line: [0, 0] id: 413
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Essinity/Rayfield-Hub/main/Script", true))()
    end)
    r31_3:Button("Rebranded Official Hub", function()
      -- line: [0, 0] id: 11
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Cerbiale/Rebranded/main/RebrandedHubLoader.lua"))()
    end)
    r31_3:Button("Red Coat", function()
      -- line: [0, 0] id: 132
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/RedCoat8102-obfuscated.lua"))()
    end)
    r31_3:Button("RemX", function()
      -- line: [0, 0] id: 335
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Henry887/RemX-Script-Hub/main/main.lua", true))()
    end)
    r31_3:Button("ReVP Hub", function()
      -- line: [0, 0] id: 155
      loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/Protected%20"))()
    end)
    r31_3:Button("Rose Hub", function()
      -- line: [0, 0] id: 301
      loadstring(game:HttpGet("https://pastebin.com/raw/9q2nraUs", true))()
    end)
    r31_3:Button("Rolf Hub", function()
      -- line: [0, 0] id: 64
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)
    r31_3:Button("Salakitos Hub", function()
      -- line: [0, 0] id: 321
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SAKALITOS/Salakitoshub/main/scriptSK"))()
    end)
    r31_3:Button("Scripter Hub", function()
      -- line: [0, 0] id: 208
      loadstring(game:HttpGet("https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/SCRIPTERV3/main/SCRIPTER%20HUB%20V5"))()
    end)
    r31_3:Button("Script Hub", function()
      -- line: [0, 0] id: 238
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
    end)
    r31_3:Button("Script Hub V2", function()
      -- line: [0, 0] id: 403
      loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV2/main/SCRIPTHUBV2", true))()
    end)
    r31_3:Button("Secret Service Panel", function()
      -- line: [0, 0] id: 308
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
    end)
    r31_3:Button("Shadows Scripts HUB", function()
      -- line: [0, 0] id: 49
      loadstring(game:HttpGet("https://pastebin.com/raw/tuDMk1pr", true))()
    end)
    r31_3:Button("Shakars Hub", function()
      -- line: [0, 0] id: 290
      loadstring(game:HttpGet("https://raw.githubusercontent.com/shakar60/USH.P/main/rotected", true))()
    end)
    r31_3:Button("Shizzuru Hub", function()
      -- line: [0, 0] id: 34
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ggshizuru/myScriptHub/main/ShizzuruHub.1.lua", true))()
    end)
    r31_3:Button("Sigma Hub", function()
      -- line: [0, 0] id: 249
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrixCoding/SigmaHubV2/main/SigmaHubV2"))()
    end)
    r31_3:Button("Simple Hub", function()
      -- line: [0, 0] id: 279
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GearV4/Simple-Hub-X-Gear-SSX.lua/main/Gear%20SSX%20X%20Simple%20Hub"))()
    end)
    r31_3:Button("SlapX v1", function()
      -- line: [0, 0] id: 425
      loadstring(r30_3:HttpGet("https://raw.githubusercontent.com/Slinzo1/Hh/main/Hh"))()
    end)
    r31_3:Button("SlapX v2", function()
      -- line: [0, 0] id: 376
      loadstring(r30_3:HttpGet("https://raw.githubusercontent.com/Slinzo1/SlapX-v2-hub/main/SlapX%20Hub%20v2"))()
    end)
    r31_3:Button("SnapDragon", function()
      -- line: [0, 0] id: 167
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ruszelds/Snap/main/Dragon", true))()
      setclipboard("SnapDragon")
    end)
    r31_3:Button("SoninhaHub", function()
      -- line: [0, 0] id: 234
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SoninhaHub/Universal/main/Source.Lua"))()
    end)
    r31_3:Button("Superior Vortex", function()
      -- line: [0, 0] id: 105
      loadstring(game:HttpGet("https://raw.githubusercontent.com/SmartModBoy/VortexAblity/main/SV"))()
    end)
    r31_3:Button("Sushi X", function()
      -- line: [0, 0] id: 150
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/sushi/main/X", true))()
    end)
    r31_3:Button("SH_V11", function()
      -- line: [0, 0] id: 91
      loadstring(game:HttpGet("https://pastebin.com/raw/J1MfBXv6", true))()
    end)
    r31_3:Button("Sxrge Script Hub", function()
      -- line: [0, 0] id: 294
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sxrge3k/sxrge_ssh_hub/main/sxrge_script_hub"))()
    end)
    r31_3:Button("Syntax", function()
      -- line: [0, 0] id: 296
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Memeboiyot/SyntaxRebornOfficial/main/SyntaxReborn", true))()
    end)
    r31_3:Button("System Hub", function()
      -- line: [0, 0] id: 42
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AHMEDPLPL/System-hub/main/System%20hub"))()
    end)
    r31_3:Button("The Hub", function()
      -- line: [0, 0] id: 79
      loadstring(game:HttpGet("https://raw.githubusercontent.com/hassantheking123321/TheHub/main/The%20hub%20v3%20test"))()
    end)
    r31_3:Button("THEPERFECT", function()
      -- line: [0, 0] id: 396
      loadstring(game:HttpGet("https://raw.githubusercontent.com/theperfectexploiter2024/THE-PERFECT-HUB-v1/main/THE%20PERFECT%20HUB%20v1.txt"))()
    end)
    r31_3:Button("Thunder Hub", function()
      -- line: [0, 0] id: 318
      loadstring(game:HttpGet("https://pastebin.com/raw/DFjY4nMy"))()
    end)
    r31_3:Button("Tiger X Hub", function()
      -- line: [0, 0] id: 125
      loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back"))()
    end)
    r31_3:Button("TOPK3K REMAKE", function()
      -- line: [0, 0] id: 33
      loadstring(game:HttpGet("https://pastebin.com/raw/ecfcBQNr", true))()
    end)
    r31_3:Button("Universe Hub", function()
      -- line: [0, 0] id: 98
      loadstring(game:HttpGet("https://pastebin.com/raw/ApcKYREY", true))()
    end)
    r31_3:Button("Version Hub", function()
      -- line: [0, 0] id: 83
      loadstring(game:HttpGet("https://pastebin.com/raw/wKc5r6CM"))()
    end)
    r31_3:Button("VcskV Public", function()
      -- line: [0, 0] id: 215
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Hub/main.lua", true))()
    end)
    r31_3:Button("Void Hub", function()
      -- line: [0, 0] id: 447
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Voidhub.lua/main/VoidHub.lua"))()
    end)
    r31_3:Button("Yarhm", function()
      -- line: [0, 0] id: 277
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm-dev.lua"))()
    end)
    r31_3:Button("YourMom", function()
      -- line: [0, 0] id: 315
      loadstring(game:GetObjects("rbxassetid://289110135")[1].Source)()
    end)
    r31_3:Button("YT Hub", function()
      -- line: [0, 0] id: 324
      loadstring(game:HttpGet("https://raw.githubusercontent.com/OWJBWKQLAISH/Yt-Hub/main/YouTuber%20Hub"))()
    end)
    r31_3:Button("Zars Gui", function()
      -- line: [0, 0] id: 378
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BumbleBeeSaga/BumbleBeeSaga/main/ZarsGUI1.0", true))()
    end)
    r31_3:Button("Zaza Sploit", function()
      -- line: [0, 0] id: 113
      loadstring(game:HttpGet("https://pastebin.com/raw/DE8Ltg6j"))()
    end)
    r31_3:Button("Zxykerz Devil\'s Hub v2", function()
      -- line: [0, 0] id: 408
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ZxkGamingOfficial/Zxykerz-Devil-s-Hub-V2-New/main/Zxykerz%20Devil\'s%20Hub%20V2"))()
    end)
    r31_3:Section("Other Gui Script")
    r31_3:Button("Hitbox Expander", function()
      -- line: [0, 0] id: 95
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end)
    r31_3:Button("Hitbox Expander | CheatX", function()
      -- line: [0, 0] id: 260
      loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/shit%20script%20pack/CheatX"))()
    end)
    r31_3:Button("Chat Filter Bypass", function()
      -- line: [0, 0] id: 21
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRobloxSS/zetra/main/ZetPanel", true))()
    end)
    r31_3:Button("Reach Gui v3", function()
      -- line: [0, 0] id: 24
      loadstring(game:HttpGet("https://pastebin.com/raw/iKn1rhZv"))()
    end)
    r31_3:Button("Ultimate Trolling Gui v1.5", function()
      -- line: [0, 0] id: 388
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/9abbc0733af7c9113a5ecbaf4bb2ed5013a4e693/Ultimate%20Trolling%20GUI%20v1.5"))()
    end)
    r31_3:Button("Ultimate Trolling Gui v2", function()
      -- line: [0, 0] id: 451
      loadstring(game:HttpGet("https://github.com/AkilExploitz/AkilBlox14-s-Script-Hub-v1.1/raw/main/Akil\'s%20UTG%20v2.0%20full"))()
    end)
    r31_3:Button("Chanzo Trolling Gui", function()
      -- line: [0, 0] id: 81
      loadstring(game:HttpGet("https://pastebin.com/raw/y94Ejz3B", true))()
    end)
    r31_3:Button("Chat hack Gui", function()
      -- line: [0, 0] id: 118
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r31_3:Button("1X1X1X1 GUI", function()
      -- line: [0, 0] id: 323
      loadstring(game:HttpGet("https://pastebin.com/raw/CYye6uA4"))()
    end)
    r31_3:Button("c00lgui", function()
      -- line: [0, 0] id: 183
      loadstring(game:HttpGet("https://pastebin.com/raw/HkE93XjW"))()
    end)
    r31_3:Button("c00lgui2", function()
      -- line: [0, 0] id: 96
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
    end)
    r31_3:Button("c00lkidd2", function()
      -- line: [0, 0] id: 257
      loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
    end)
    r31_3:Button("cOOlkidd Gui", function()
      -- line: [0, 0] id: 357
      loadstring(game:HttpGet("https://pastebin.com/raw/UPZCQ31W"))()
    end)
    r31_3:Button("K00pgui", function()
      -- line: [0, 0] id: 62
      loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/K00pgui/a50a7131568adf4337053c428733c2eaf308ac6a/K00pgui"))()
    end)
    local r32_3 = r9_3:Tab("Fe")
    r32_3:Section("Fe Gui")
    r32_3:Button("B4krs Chat Bypasser", function()
      -- line: [0, 0] id: 355
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/v4lsB4krscbR/main/Loadstring%20version%20chat%20bypasser"))()
    end)
    r32_3:Button("Comet", function()
      -- line: [0, 0] id: 428
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/Comet"))()
    end)
    r32_3:Button("Epix\'s Fe Gui", function()
      -- line: [0, 0] id: 153
      loadstring(game:HttpGet("https://pastebin.com/raw/jMAwjKcb"))()
    end)
    r32_3:Button("Energize [R6]", function()
      -- line: [0, 0] id: 177
      loadstring(game:HttpGet("https://pastebin.com/raw/1p6xnBNf", true))()
    end)
    r32_3:Button("Fex", function()
      -- line: [0, 0] id: 312
      loadstring(game:HttpGet("https://pastebin.com/raw/ES6xMCn7", true))()
    end)
    r32_3:Button("Free gamepasses gui", function()
      -- line: [0, 0] id: 166
      loadstring(game:HttpGet("https://pastebin.com/raw/QtQ4YnVR"))()
    end)
    r32_3:Button("Free Gamepass Gui(dark modz)", function()
      -- line: [0, 0] id: 200
      loadstring(game:HttpGet("https://pastebin.com/raw/53yY1S39"))()
    end)
    r32_3:Button("Nulware v3", function()
      -- line: [0, 0] id: 245
      local r0_245 = game:GetService("Players").LocalPlayer
      game:GetService("RunService").Heartbeat:Connect(function()
        -- line: [0, 0] id: 246
        r0_245.MaximumSimulationRadius = math.huge
        sethiddenproperty(r0_245, "SimulationRadius", math.huge)
      end)
      getgenv().Theme = "Blue"
      loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn?identifier=" .. (function()
        -- line: [0, 0] id: 247
        -- notice: unreachable block#8
        local r0_247 = ""
        for r4_247 = 1, 256, 1 do
          local r5_247 = math.random(1, 3)
          local r6_247 = r0_247
          local r7_247 = string.char
          local r8_247 = nil	-- notice: implicit variable refs by block#[9]
          if r5_247 == 1 then
            r8_247 = math.random(48, 57)
            if not r8_247 then
              ::label_22::
              if r5_247 == 2 then
                r8_247 = math.random(97, 122)
                if not r8_247 then
                  ::label_31::
                  if r5_247 == 3 then
                    r8_247 = math.random(65, 90)
                  else
                    r8_247 = false
                  end
                end
              else
                goto label_31	-- block#5 is visited secondly
              end
            end
          else
            goto label_22	-- block#3 is visited secondly
          end
          r0_247 = r6_247 .. r7_247(r8_247)
        end
        return r0_247
      end)()))()
    end)
    r32_3:Button("Player Orbit", function()
      -- line: [0, 0] id: 268
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
    end)
    r32_3:Button("Tool Giver", function()
      -- line: [0, 0] id: 240
      loadstring(game:HttpGet("https://pastebin.com/raw/Ctqjmtkv", true))()
    end)
    r32_3:Button("Troll GUI", function()
      -- line: [0, 0] id: 127
      loadstring(game:HttpGet("https://pastebin.com/raw/nwGzXh1V", true))()
    end)
    r32_3:Button("Trolling Gui", function()
      -- line: [0, 0] id: 181
      loadstring(game:HttpGet("https://pastefy.app/ic5m4aJG/raw", true))()
    end)
    r32_3:Button("Xuctry FE Gui", function()
      -- line: [0, 0] id: 409
      loadstring(game:HttpGet("https://pastebin.com/raw/Zz4YDvLb", true))()
    end)
    r32_3:Section("Fe Script")
    r32_3:Button("Fe Anti Afk", function()
      -- line: [0, 0] id: 126
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Huubb/main/Mobile%20Scripting"))()
    end)
    r32_3:Button("Fe Anti Fall", function()
      -- line: [0, 0] id: 405
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/AntiFall/main/Script"))()
    end)
    r32_3:Button("Fe Chat Bypasser", function()
      -- line: [0, 0] id: 217
      loadstring(game:HttpGet("https://raw.githubusercontent.com/bedra45/chetbypasser/main/chetbypass"))()
    end)
    r32_3:Button("Fe Chat Executor", function()
      -- line: [0, 0] id: 30
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor", true))()
    end)
    r32_3:Button("Fe Chat Hack", function()
      -- line: [0, 0] id: 80
      loadstring(game:HttpGet("https://pastebin.com/raw/MBpnp3yS"))()
    end)
    r32_3:Button("Fe Chat Hax", function()
      -- line: [0, 0] id: 417
      loadstring(game:HttpGet("https://pastebin.com/raw/XFdQEjzx", true))()
    end)
    r32_3:Button("Fe Clone", function()
      -- line: [0, 0] id: 43
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end)
    r32_3:Button("Fe Collision", function()
      -- line: [0, 0] id: 108
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt", true))()
    end)
    r32_3:Button("Fe Control Npc", function()
      -- line: [0, 0] id: 306
      loadstring(game:HttpGet("https://pastefy.app/x8nWWq0M/raw", true))()
    end)
    r32_3:Button("Fe Crawl Gui", function()
      -- line: [0, 0] id: 349
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))()
    end)
    r32_3:Button("Fe Death Note", function()
      -- line: [0, 0] id: 270
      loadstring(game:HttpGet("https://pastefy.app/GoKxYBkU/raw", true))()
    end)
    r32_3:Button("Fe Dino Fling", function()
      -- line: [0, 0] id: 161
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_K2n31uc6t2wY5A8786eR4K15sgbUF0vdQ80a0LzgvLRkSNYd89H1AS3124gMR6SM.lua.txt", true))()
    end)
    r32_3:Button("Fe Fling", function()
      -- line: [0, 0] id: 262
      loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end)
    r32_3:Button("Fe Fling Gui", function()
      -- line: [0, 0] id: 129
      loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/Fe-Fling-GUI-For-roblox/main/Main.lua", true))()
    end)
    r32_3:Button("Fe Flinger By GGH52Lan", function()
      -- line: [0, 0] id: 438
      loadstring(game:HttpGet("https://pastebin.com/raw/xu3C3TSU"))()
    end)
    r32_3:Button("Fe Free Gamepass Tools Giver(Obby Only)", function()
      -- line: [0, 0] id: 430
      for r3_430, r4_430 in pairs(game:GetDescendants()) do
        if r4_430.ClassName == "RemoteEvent" and (r4_430.Parent.Name == "WeaponsRemotes" or r4_430.Parent.Name == "VipRemotes" or r4_430.Parent.Name == "Remotes") then
          r4_430:FireServer()
        end
      end
    end)
    r32_3:Button("Fe Freeze", function()
      -- line: [0, 0] id: 205
      loadstring(game:HttpGet("https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source"))()
    end)
    r32_3:Button("Fe Gamepass Tool Giver v4", function()
      -- line: [0, 0] id: 130
      loadstring(game:HttpGet("https://pastefy.app/VYIAk3o1/raw", true))()
    end)
    r32_3:Button("Fe Ghost", function()
      -- line: [0, 0] id: 152
      loadstring(game:HttpGet("https://pastebin.com/raw/uUtRsAX5"))()
    end)
    r32_3:Button("Fe God Mode | Obby", function()
      -- line: [0, 0] id: 392
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main", true))()
    end)
    r32_3:Button("Fe Grab Parts", function()
      -- line: [0, 0] id: 364
      loadstring(game:HttpGet("https://pastefy.app/BbXuvVkK/raw", true))()
    end)
    r32_3:Button("Fe Hat Spin", function()
      -- line: [0, 0] id: 344
      loadstring(game:HttpGet("https://pastebin.com/raw/32PbiWw1", true))()
    end)
    r32_3:Button("Fe Invisible Boat", function()
      -- line: [0, 0] id: 362
      loadstring(game:HttpGet("https://pastefy.app/0CS5vmly/raw", true))()
    end)
    r32_3:Button("Fe Ink Monster", function()
      -- line: [0, 0] id: 221
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_f4i3ntKS5B8tK9zpCAnr31Dp7RNSYOo20gpln1fs1h2U4yjXNdNk6lFqZvN1Ft2p.lua.txt"))()
    end)
    r32_3:Button("Fe Invisible Script", function()
      -- line: [0, 0] id: 135
      loadstring(game:HttpGet("https://pastebin.com/raw/HrbT6bNK", true))()
    end)
    r32_3:Button("Fe Invisibility Tool", function()
      -- line: [0, 0] id: 204
      loadstring(game:HttpGet("https://pastebin.com/raw/bdBWidBC"))()
    end)
    r32_3:Button("Fe Lag Switch", function()
      -- line: [0, 0] id: 172
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt", true))()
    end)
    r32_3:Button("Fe Lift Player Up", function()
      -- line: [0, 0] id: 119
      player = game:GetService("Players").LocalPlayer
      mouse = player:GetMouse()
      camera = workspace.CurrentCamera
      ts = game:GetService("TweenService")
      function createtween(r0_121, r1_121, r2_121)
        -- line: [0, 0] id: 121
        tween = ts:Create(r0_121, TweenInfo.new(r2_121), {
          CFrame = r1_121,
        })
        tween:Play()
        tween.Completed:Wait()
      end
      outline = Instance.new("Highlight")
      target = nil
      mouse.Button1Up:Connect(function()
        -- line: [0, 0] id: 120
        if mouse.Target then
          local r0_120 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_120 and r0_120:FindFirstChild("Humanoid") then
            camera.CameraSubject = r0_120.Humanoid
            target = r0_120
          else
            outline.Parent = nil
          end
        end
      end)
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 122
        if player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
          if target and target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.CFrame.Y + 20 < player.Character.HumanoidRootPart.CFrame.Y then
            tween:Cancel()
          end
        end
        if mouse.Target then
          local r0_122 = mouse.Target:FindFirstAncestorOfClass("Model")
          if r0_122 and r0_122:FindFirstChild("Humanoid") then
            outline.Parent = r0_122
          else
            outline.Parent = nil
          end
        end
      end)
      while task.wait() do
        local r0_119 = target
        if r0_119 ~= nil then
          r0_119 = target:FindFirstAncestorOfClass("Workspace")
          if r0_119 then
            r0_119 = target
            if r0_119 ~= player.Character then
              r0_119 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_119 then
                r0_119 = target:FindFirstChild("HumanoidRootPart")
                if r0_119 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  r0_119 = hrp
                  r0_119.CFrame = thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * -10
                end
              end
            end
          end
        end
        r0_119 = target
        if r0_119 ~= nil then
          r0_119 = target:FindFirstAncestorOfClass("Workspace")
          if r0_119 then
            r0_119 = target
            if r0_119 ~= player.Character then
              r0_119 = player.Character:FindFirstChild("HumanoidRootPart")
              if r0_119 then
                r0_119 = target:FindFirstChild("HumanoidRootPart")
                if r0_119 then
                  character = player.Character
                  hrp = character.HumanoidRootPart
                  thrp = target.HumanoidRootPart
                  rot = thrp.CFrame * CFrame.Angles(math.rad(25), math.rad(25), math.rad(25))
                  createtween(hrp, thrp.CFrame * CFrame.Angles(math.rad(90), 0, 0) + thrp.CFrame.UpVector * 1000000, 100000)
                end
              end
            end
          end
        end
      end
    end)
    r32_3:Button("Fe Parts Mover", function()
      -- line: [0, 0] id: 350
      loadstring(game:HttpGet("https://pastefy.app/Vcuyg09O/raw", true))()
    end)
    r32_3:Button("Fe Punch", function()
      -- line: [0, 0] id: 380
      loadstring(game:HttpGet("https://pastefy.ga/GvnHVjT5/raw", true))()
    end)
    r32_3:Button("Fe R15 to R6", function()
      -- line: [0, 0] id: 331
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua", true))()
    end)
    r32_3:Button("Fe Roll Ball", function()
      -- line: [0, 0] id: 442
      loadstring(game:HttpGet("https://pastebin.com/raw/BZr9bGDy", true))()
    end)
    r32_3:Button("Fe SCP 173", function()
      -- line: [0, 0] id: 188
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_nN0N66DHV2BjPwzYN59M17qSSlvJryM201CSC1sg07czxnZf48h9GHOFGd87G6Hh.lua.txt", true))()
    end)
    r32_3:Button("Fe Spy", function()
      -- line: [0, 0] id: 193
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))()
    end)
    r32_3:Button("Fe Sword Kill All", function()
      -- line: [0, 0] id: 340
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script"))()
    end)
    r32_3:Button("Fe Touch Fling", function()
      -- line: [0, 0] id: 361
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
    end)
    r32_3:Button("Fe Tp Place Gui", function()
      -- line: [0, 0] id: 7
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Tp%20Place%20GUI", true))()
    end)
    r32_3:Button("FE Yeet", function()
      -- line: [0, 0] id: 174
      loadstring(game:HttpGet("https://pastebin.com/raw/saMtiek2", true))()
    end)
    r32_3:Button("Fe Zero Gravity Parts", function()
      -- line: [0, 0] id: 422
      loadstring(game:HttpGet("https://pastebin.com/raw/aXgyQyKY"))()
    end)
    r32_3:Button("Fe Zombie Fling", function()
      -- line: [0, 0] id: 281
      loadstring(game:HttpGet("https://pastefy.app/w7KnPY70/raw", true))()
    end)
    r32_3:Section("Not Sure Fe")
    r32_3:Button("Among Us", function()
      -- line: [0, 0] id: 287
      loadstring(game:HttpGet("https://pastebin.com/raw/vNiNzr34"))()
    end)
    r32_3:Button("Backflip", function()
      -- line: [0, 0] id: 169
      loadstring(game:HttpGet("https://pastebin.com/raw/n2gUwjc4"))()
    end)
    r32_3:Button("Bloody Knife", function()
      -- line: [0, 0] id: 325
      loadstring(game:HttpGet("https://pastebin.com/raw/25P2tVPD"))()
    end)
    r32_3:Button("Coolkid Gui", function()
      -- line: [0, 0] id: 302
      loadstring(game:HttpGet("https://pastebin.com/raw/YsVaUfYQ", true))()
    end)
    r32_3:Button("Gale Fighter", function()
      -- line: [0, 0] id: 179
      loadstring(game:HttpGet("https://pastebin.com/raw/YCH5P19e"))()
    end)
    r32_3:Button("Psychopath", function()
      -- line: [0, 0] id: 391
      loadstring(game:HttpGet("https://pastebin.com/raw/9Lharw50"))()
    end)
    r32_3:Button("Slasher", function()
      -- line: [0, 0] id: 27
      loadstring(game:HttpGet("https://pastebin.com/raw/sVEn1Tza"))()
    end)
    r32_3:Button("Snake", function()
      -- line: [0, 0] id: 103
      loadstring(game:HttpGet("https://pastebin.com/raw/naRUdxrc", true))()
    end)
    r32_3:Button("Spider", function()
      -- line: [0, 0] id: 141
      loadstring(game:HttpGet("https://pastebin.com/raw/txsk1LJg"))()
    end)
    r32_3:Section("Useful")
    r32_3:Button("Animation Gui", function()
      -- line: [0, 0] id: 18
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end)
    r32_3:Button("Emotes Gui | Best", function()
      -- line: [0, 0] id: 384
      loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()
    end)
    r32_3:Button("Emotes Gui", function()
      -- line: [0, 0] id: 219
      loadstring(game:HttpGet("https://pastebin.com/raw/fitjHU5J"))()
    end)
    r32_3:Section("Sus Script")
    r32_3:Button("Pendulum Hub", function()
      -- line: [0, 0] id: 31
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
    end)
    r32_3:Button("Sussy hub", function()
      -- line: [0, 0] id: 351
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub"))()
    end)
    local r33_3 = r9_3:Tab("Other")
    r33_3:Section("Player")
    r34_3 = 16
    local r35_3 = false
    local r38_3 = "Textbox"
    r38_3 = "Walk Speed"
    r33_3:[r38_3](r38_3, "Set Walk Speed", function(r0_4)
      -- line: [0, 0] id: 4
      r34_3 = r0_4
      pcall(function()
        -- line: [0, 0] id: 5
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r0_4
      end)
    end)
    r33_3:Toggle("Loop Walk Speed", function(r0_439)
      -- line: [0, 0] id: 439
      r35_3 = r0_439
      if r0_439 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 440
          if r35_3 then
            pcall(function()
              -- line: [0, 0] id: 441
              game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = r34_3
            end)
          end
        end)
      end
    end)
    local r36_3 = 50
    local r37_3 = false
    local r40_3 = "Textbox"
    r40_3 = "Jump Power"
    r33_3:[r40_3](r40_3, "Set Jump Power", function(r0_243)
      -- line: [0, 0] id: 243
      r36_3 = r0_243
      pcall(function()
        -- line: [0, 0] id: 244
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r0_243
      end)
    end)
    r33_3:Toggle("Loop Jump Power", function(r0_225)
      -- line: [0, 0] id: 225
      r37_3 = r0_225
      if r0_225 then
        game:GetService("RunService").Heartbeat:Connect(function()
          -- line: [0, 0] id: 226
          if r37_3 then
            pcall(function()
              -- line: [0, 0] id: 227
              game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = r36_3
            end)
          end
        end)
      end
    end)
    r40_3 = "Textbox"
    r40_3 = "Gravity"
    r33_3:[r40_3](r40_3, "Set Gravity", function(r0_309)
      -- line: [0, 0] id: 309
      game.Workspace.Gravity = r0_309
    end)
    r40_3 = "Textbox"
    r40_3 = "Zoom Distance"
    r33_3:[r40_3](r40_3, "Set Zoom Distance", function(r0_97)
      -- line: [0, 0] id: 97
      game.Players.LocalPlayer.CameraMaxZoomDistance = r0_97
    end)
    r33_3:Button("Endless Zoom", function()
      -- line: [0, 0] id: 74
      local r0_74 = game.Players.LocalPlayer
      r0_74.CameraMaxZoomDistance = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      r0_74.CameraMinZoomDistance = 0
    end)
    r33_3:Button("Reset", function()
      -- line: [0, 0] id: 448
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      game.Workspace.Gravity = 196.2
      game.Players.LocalPlayer.CameraMaxZoomDistance = 200
    end)
    r33_3:Toggle("Infinite Jump", function(r0_232)
      -- line: [0, 0] id: 232
      getgenv().InfiniteJumpEnabled = r0_232
      game:GetService("UserInputService").JumpRequest:connect(function()
        -- line: [0, 0] id: 233
        if InfiniteJumpEnabled == true then
          game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
      end)
    end)
    r33_3:Toggle("Auto jump", function(r0_109)
      -- line: [0, 0] id: 109
      J = r0_109
      spawn(function()
        -- line: [0, 0] id: 110
        while wait() do
          local r0_110 = J
          if r0_110 then
            r0_110 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            r0_110.Jump = true
          else
            break
          end
        end
      end)
    end)
    r33_3:Toggle("Fov", function(r0_295)
      -- line: [0, 0] id: 295
      if r0_295 then
        game.Workspace.CurrentCamera.FieldOfView = 120
      else
        game.Workspace.CurrentCamera.FieldOfView = 70
      end
    end)
    r33_3:Button("Reset Character", function()
      -- line: [0, 0] id: 254
      game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)
    r33_3:Toggle("Noclip [Beta]", function(r0_66)
      -- line: [0, 0] id: 66
      getgenv().noclipEnabled = r0_66
      game:GetService("RunService").Stepped:connect(function()
        -- line: [0, 0] id: 67
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(noclip)
        if noclipEnabled == true then
          local r0_67 = true
          local r1_67 = game.Players.LocalPlayer
          for r6_67, r7_67 in pairs((r1_67.Character or r1_67.CharacterAdded:Wait()):GetDescendants()) do
            pcall(function()
              -- line: [0, 0] id: 68
              if r7_67:IsA("BasePart") then
                r7_67.CanCollide = false
              end
            end)
            -- close: r6_67
          end
        end
        game:GetService("RunService").Stepped:wait()
      end)
    end)
    r33_3:Button("No Clip | Press E To Use", function()
      -- line: [0, 0] id: 275
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/No%20Clip"))()
    end)
    r33_3:Button("Shift Lock", function()
      -- line: [0, 0] id: 99
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Shiftlock"))()
    end)
    r33_3:Button("Console Button", function()
      -- line: [0, 0] id: 14
      local r0_14 = Instance.new("ScreenGui")
      r0_14.Name = "console"
      r0_14.Parent = game.CoreGui
      local r1_14 = Instance.new("TextButton")
      r1_14.Name = "button"
      r1_14.Parent = r0_14
      r1_14.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      r1_14.BackgroundTransparency = 0.5
      r1_14.Position = UDim2.new(0, 105, 0, -32)
      r1_14.Size = UDim2.new(0, 32, 0, 32)
      r1_14.Text = "< >"
      r1_14.TextColor3 = Color3.fromRGB(200, 200, 200)
      r1_14.Font = "Code"
      r1_14.TextSize = 15
      local r2_14 = Instance.new("UICorner")
      r2_14.CornerRadius = UDim.new(0, 8)
      r2_14.Parent = r1_14
      r1_14.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 15
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9", false, game)
      end)
    end)
    r33_3:Button("Fly | Pc", function()
      -- line: [0, 0] id: 283
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script"))()
    end)
    r33_3:Button("Fps Booster", function()
      -- line: [0, 0] id: 159
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/FpsBooster"))()
    end)
    r33_3:Button("Ping Counter", function()
      -- line: [0, 0] id: 421
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Ping"))()
    end)
    r33_3:Button("Fps Counter", function()
      -- line: [0, 0] id: 436
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fps"))()
    end)
    r33_3:Button("Anti Afk", function()
      -- line: [0, 0] id: 37
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Anti-Afk-Remastered-Script-or-Diffrent-Cool-UI-2097"))()
    end)
    r33_3:Button("Anti Fling", function()
      -- line: [0, 0] id: 443
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Anti%20Fling", true))()
    end)
    r33_3:Button("Fling With No Collision", function()
      -- line: [0, 0] id: 214
      loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/544f7efbe88235666b5b7add65b7344d/raw/f20804bb85542dcc3bc938982e1f05b7ff05cded/FE%2520Hat%2520Fling"))()
    end)
    r33_3:Button("Guardian", function()
      -- line: [0, 0] id: 273
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
    end)
    r33_3:Section("Guis")
    r33_3:Button("Walk Speed Gui", function()
      -- line: [0, 0] id: 32
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Walk-Speed-Gui"))()
    end)
    r33_3:Button("Jump Power Gui", function()
      -- line: [0, 0] id: 263
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Jump-Power-Gui"))()
    end)
    r33_3:Button("Gravity Gui", function()
      -- line: [0, 0] id: 23
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Gravity-Gui"))()
    end)
    r33_3:Button("Fov Gui", function()
      -- line: [0, 0] id: 138
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fov-Gui"))()
    end)
    r33_3:Button("Fly Gui | Mobile", function()
      -- line: [0, 0] id: 369
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Fly-New"))()
    end)
    r33_3:Button("VFly", function()
      -- line: [0, 0] id: 444
      loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end)
    r33_3:Button("No Clip Gui", function()
      -- line: [0, 0] id: 133
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/NoClip_Gui"))()
    end)
    r33_3:Section("Esp/Hitbox")
    r38_3 = workspace.CurrentCamera
    local r39_3 = false
    r40_3 = game:GetService("RunService")
    function lookAt(r0_343, r1_343)
      -- line: [0, 0] id: 343
      r38_3.CFrame = CFrame.new(r0_343, r1_343)
    end
    function getClosestPlayerToCursor(r0_346)
      -- line: [0, 0] id: 346
      local r2_346 = math.huge
      local r1_346 = nil	-- notice: implicit variable refs by block#[10]
      for r6_346, r7_346 in ipairs(game.Players:GetPlayers()) do
        if r7_346 ~= game.Players.LocalPlayer and r7_346.Character and r7_346.Character:FindFirstChild(r0_346) then
          local r9_346, r10_346 = r38_3:WorldToViewportPoint(r7_346.Character[r0_346].Position)
          local r13_346 = (Vector2.new(r9_346.x, r9_346.y) - Vector2.new(r38_3.ViewportSize.x / 2, r38_3.ViewportSize.y / 2)).magnitude
          if r13_346 < r2_346 and r10_346 and r39_3 and r13_346 < 400 then
            r2_346 = r13_346
            r1_346 = r7_346
          end
        end
      end
      return r1_346
    end
    r40_3.RenderStepped:Connect(function()
      -- line: [0, 0] id: 116
      local r0_116 = getClosestPlayerToCursor("Head")
      if r39_3 and r0_116 and r0_116.Character:FindFirstChild("Head") and r0_116.TeamColor ~= game.Players.LocalPlayer.TeamColor and 0 < r0_116.Character.Humanoid.Health and 99 < r0_116.Character.HumanoidRootPart.Position.Y then
        lookAt(r38_3.CFrame.p, r0_116.Character.Head.Position + Vector3.new(0, -((game.Players.LocalPlayer.Character.Head.Position - r0_116.Character.Head.Position)).magnitude / 4.2, 0))
      end
    end)
    r33_3:Toggle("Aimbot [Beta]", function(r0_100)
      -- line: [0, 0] id: 100
      r39_3 = r0_100
    end)
    r33_3:Button("Aimbot/SilentAim", function()
      -- line: [0, 0] id: 195
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Aimbot_SilentAim"))()
    end)
    r33_3:Button("Esp Box", function()
      -- line: [0, 0] id: 393
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp%20Box"))()
    end)
    r33_3:Button("Tracers", function()
      -- line: [0, 0] id: 142
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Tracers"))()
    end)
    r33_3:Button("Esp", function()
      -- line: [0, 0] id: 371
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Esp"))()
    end)
    r33_3:Button("Hitbox", function()
      -- line: [0, 0] id: 90
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/HitBox"))()
    end)
    r33_3:Section("Shader")
    r33_3:Button("Realistic Shader", function()
      -- line: [0, 0] id: 337
      loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
    end)
    r33_3:Button("P Rtx", function()
      -- line: [0, 0] id: 382
      loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))()
    end)
    r33_3:Button("Pshade", function()
      -- line: [0, 0] id: 71
      loadstring(game:HttpGet("https://pastebin.com/raw/Cd76B8Lh"))()
    end)
    r33_3:Button("Chillz\'s Enhancer v0.2", function()
      -- line: [0, 0] id: 386
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/enhancer.txt"))()
    end)
    r33_3:Section("Time Changer")
    r33_3:Button("Day | Night Cycle [Beta]", function()
      -- line: [0, 0] id: 10
      loadstring(game:HttpGet("https://pastebin.com/raw/hiZMgnkc"))()
    end)
    local r43_3 = "Textbox"
    r43_3 = "Time Set"
    r33_3:[r43_3](r43_3, "Set Game Time", function(r0_407)
      -- line: [0, 0] id: 407
      game.Lighting.TimeOfDay = r0_407
    end)
    r33_3:Dropdown("Game Time", {
      "Morning | 6:00 AM",
      "Morning | 9:00 AM",
      "Noon | 12:00 PM",
      "Afternoon | 3:00 PM",
      "Evening | 6:00 PM",
      "Night | 9:00 PM",
      "Midnight | 12:00 AM",
      "Midnight | 3:00 AM"
    }, function(r0_236)
      -- line: [0, 0] id: 236
      if r0_236 == "Morning | 6:00 AM" then
        game.Lighting.TimeOfDay = 6
      elseif r0_236 == "Morning | 9:00 AM" then
        game.Lighting.TimeOfDay = 9
      elseif r0_236 == "Noon | 12:00 PM" then
        game.Lighting.TimeOfDay = 12
      elseif r0_236 == "Afternoon | 3:00 PM" then
        game.Lighting.TimeOfDay = 15
      elseif r0_236 == "Evening | 6:00 PM" then
        game.Lighting.TimeOfDay = 18
      elseif r0_236 == "Night | 9:00 PM" then
        game.Lighting.TimeOfDay = 21
      elseif r0_236 == "Midnight | 12:00 AM" then
        game.Lighting.TimeOfDay = 24
      elseif r0_236 == "Midnight | 3:00 AM" then
        game.Lighting.TimeOfDay = 3
      end
    end)
    r33_3:Section("Server")
    r33_3:Button("Rejoin(Join Same Server)", function()
      -- line: [0, 0] id: 190
      game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end)
    r33_3:Button("ServerHop", function()
      -- line: [0, 0] id: 45
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Rejoin"))()
    end)
    r33_3:Button("Rejoin Button", function()
      -- line: [0, 0] id: 207
      loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts-2/main/rejoin%20button%20for%20kick%20message.lua", true))()
    end)
    r33_3:Section("Other")
    r33_3:Button("Backdoor.exe", function()
      -- line: [0, 0] id: 250
      loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua"))()
    end)
    r33_3:Button("Break Camera Script", function()
      -- line: [0, 0] id: 114
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r33_3:Button("Bt Tools", function()
      -- line: [0, 0] id: 303
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bt%20Tools"))()
    end)
    r33_3:Button("Camera Spy", function()
      -- line: [0, 0] id: 28
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/CameraSpy/main/Script", true))()
    end)
    r33_3:Button("Chat Spam", function()
      -- line: [0, 0] id: 210
      loadstring(game:HttpGet("https://pastebin.com/raw/8Htx56Ab"))()
    end)
    r33_3:Button("Dex 2.0", function()
      -- line: [0, 0] id: 149
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    r33_3:Button("Dex 4", function()
      -- line: [0, 0] id: 56
      loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/dexV4/main/main.lua"))()
    end)
    r33_3:Button("F3x", function()
      -- line: [0, 0] id: 398
      loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)
    r33_3:Button("Fog Spawner", function()
      -- line: [0, 0] id: 63
      loadstring(game:HttpGet("https://pastebin.com/raw/bxgUc8BX"))()
    end)
    r33_3:Button("FraktureSS", function()
      -- line: [0, 0] id: 206
      loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/source.lua", true))()
    end)
    r33_3:Button("Free Cam | Best", function()
      -- line: [0, 0] id: 104
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    r33_3:Button("Free Cam", function()
      -- line: [0, 0] id: 131
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera"))()
    end)
    r33_3:Button("Freeze Camera Script", function()
      -- line: [0, 0] id: 231
      loadstring(game:HttpGet("https://pastebin.com/raw/T0S0RPTW"))()
    end)
    r33_3:Button("GreenScreen Gui", function()
      -- line: [0, 0] id: 139
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Green%20Screen"))()
    end)
    r33_3:Button("Keyboard", function()
      -- line: [0, 0] id: 136
      loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    r33_3:Button("Keyboard v3", function()
      -- line: [0, 0] id: 259
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/mobkeyboardv3"))()
    end)
    r33_3:Button("Keystrokes Gui v2", function()
      -- line: [0, 0] id: 175
      loadstring(game:HttpGet("https://pastefy.app/Te4dwSw2/raw", true))()
    end)
    r33_3:Button("Mouse Cursor V2", function()
      -- line: [0, 0] id: 282
      loadstring(game:HttpGet("https://pastefy.ga/58d8d52G/raw", true))()
    end)
    r33_3:Button("Multi Tools", function()
      -- line: [0, 0] id: 411
      loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/MultiToolsV1/main/script"))()
    end)
    r33_3:Button("Platform", "Platform", function()
      -- line: [0, 0] id: 320
      local r0_320 = Instance.new("Part", workspace)
      local r1_320 = game:GetService("TweenService")
      r0_320.Anchored = true
      r0_320.CanCollide = true
      r0_320.Size = Vector3.new(5.246, 0.271, 4.852)
      _G.e = true
      while _G.e == true do
        wait()
        r1_320:Create(r0_320, TweenInfo.new(0.2), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0),
        }):Play()
      end
    end)
    r33_3:Button("Rainbow Map", function()
      -- line: [0, 0] id: 453
      -- notice: unreachable block#5
      while true do
        for r3_453, r4_453 in ipairs(workspace:GetDescendants()) do
          if r4_453:IsA("BasePart") then
            r4_453.BrickColor = BrickColor.new(Color3.new(math.random(), math.random(), math.random()))
          end
        end
        wait(0.5)
      end
    end)
    r33_3:Button("Realistic First Person", function()
      -- line: [0, 0] id: 199
      local r1_199 = "Pastefy"
      local r2_199 = "bwTjFg4P"
      local r3_199 = "7wTjFg4P"
      local r4_199 = "kTjGhS9L"
      local r5_199 = "d2RcPf6T"
      local r6_199 = "7nWrEg5Q"
      local r7_199 = "p9JhTd4B"
      local r8_199 = "r8CjQf3N"
      local r9_199 = "s2CkRd6W"
      local r10_199 = "v5PhZg8L"
      local r11_199 = "3sQjRf5T"
      local r13_199 = "o7KjXg4L"
      local r14_199 = "t9GnQd1R"
      local r15_199 = "y6LmSf2N"
      local r16_199 = "x3QjDg6P"
      local r17_199 = "c4VmLb8N"
      local r18_199 = "z2PkTf5J"
      local r19_199 = "e8LcGh9E"
      local r20_199 = "k5RfPd2W"
      local r21_199 = "2qFdRg7M"
      local r22_199 = "i2QbLh8S"
      local r23_199 = "g6ScTd3N"
      local r24_199 = "w9LbRf5G"
      local r25_199 = "b4NjDc7M"
      loadstring(game:HttpGet("https://paste" .. "f" .. "" .. "y" .. "" .. ".app/" .. "NpDhqikw" .. "/raw", true))()
    end)
    r33_3:Button("Remote Spy v2", function()
      -- line: [0, 0] id: 75
      loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
    end)
    r33_3:Button("Sound Player", function()
      -- line: [0, 0] id: 317
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
    end)
    r33_3:Button("Spectate", function()
      -- line: [0, 0] id: 154
      loadstring(game:HttpGet("https://pastebin.com/raw/wyvdb7gr"))()
    end)
    r33_3:Button("Speed Tool", function()
      -- line: [0, 0] id: 168
      loadstring(game:HttpGet("https://pastebin.com/raw/iShZQHw7"))()
    end)
    r33_3:Button("Studs Walked Gui", function()
      -- line: [0, 0] id: 414
      local r0_414 = game.Players.LocalPlayer
      local r1_414 = r0_414:WaitForChild("PlayerGui")
      local r2_414 = Instance.new("ScreenGui")
      r2_414.Parent = r1_414
      r2_414.ResetOnSpawn = false
      local r3_414 = Instance.new("TextLabel")
      r3_414.Name = "DistanceLabel"
      r3_414.Parent = r2_414
      r3_414.Size = UDim2.new(0, 200, 0, 50)
      r3_414.Position = UDim2.new(0.5, -100, 0, 20)
      r3_414.BackgroundTransparency = 1
      r3_414.Font = Enum.Font.Gotham
      r3_414.TextSize = 18
      r3_414.TextColor3 = Color3.new(1, 1, 1)
      r3_414.Text = "Distance walked: 0 studs"
      (function()
        -- line: [0, 0] id: 415
        -- notice: unreachable block#4
        local r1_415 = (r0_414.Character or r0_414.CharacterAdded:Wait()):WaitForChild("Humanoid")
        local r2_415 = r1_415.RootPart.Position
        local r3_415 = 0
        while true do
          wait(0)
          local r4_415 = r1_415.RootPart.Position
          r2_415 = r4_415
          r3_414.Text = "Distance walked: " .. math.floor(r3_415 + (r4_415 - r2_415).Magnitude) .. " studs"
        end
        goto label_33	-- block#4 is visited secondly
      end)()
    end)
    r33_3:Button("Super Tools", function()
      -- line: [0, 0] id: 85
      loadstring(game:HttpGet("https://pastebin.com/raw/sQWeMuB0"))()
    end)
    r33_3:Button("Telescope gui", function()
      -- line: [0, 0] id: 191
      loadstring(game:HttpGet("https://pastebin.com/raw/8T0STS4f"))()
    end)
    r33_3:Button("Tool Giver V2 Script", function()
      -- line: [0, 0] id: 35
      loadstring(game:HttpGet("https://pastebin.com/raw/Fj8KWmLC"))()
    end)
    r33_3:Button("Tp Tool", function()
      -- line: [0, 0] id: 94
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TP-TOOL-8406"))()
    end)
    r33_3:Button("Torch Tool", function()
      -- line: [0, 0] id: 143
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/77_LYGCA1V7C3RWMJ.lua"), true)()
    end)
    r33_3:Button("TweenTeleporter", function()
      -- line: [0, 0] id: 419
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/TweenTeleporter"))()
    end)
    r33_3:Button("Unanchored To Player Gui", function()
      -- line: [0, 0] id: 255
      loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
      game:GetService("RunService").RenderStepped:Connect(function()
        -- line: [0, 0] id: 256
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end)
    end)
    loadstring(game:HttpGet("https://pastefy.app/HpJRVxig/raw"))()
    local r41_3 = r9_3:Tab("Settings")
    r41_3:Section("Settings")
    r41_3:Toggle("Hide/Show Watermark", function(r0_379)
      -- line: [0, 0] id: 379
      if r0_379 then
        r23_3.Visible = false
      else
        r23_3.Visible = true
      end
    end)
    r41_3:Toggle("Hide/Show Toggle", function(r0_107)
      -- line: [0, 0] id: 107
      if r0_107 then
        r27_3.Visible = false
      else
        r27_3.Visible = true
      end
    end)
    r41_3:Button("Destroy Script", function()
      -- line: [0, 0] id: 58
      r22_3:Destroy()
      r26_3:Destroy()
      r8_3:Destroy()
    end)
    r41_3:Section("Other")
    r41_3:Button("Feedback", function()
      -- line: [0, 0] id: 326
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Feedback"))()
    end)
    r41_3:Button("Suggestion", function()
      -- line: [0, 0] id: 365
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Suggestion"))()
    end)
    r41_3:Button("Bug-Report", function()
      -- line: [0, 0] id: 60
      loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/Bug-Report"))()
    end)
    local r42_3 = r9_3:Tab("Showcaser")
    r42_3:Section("Showcasers")
    r42_3:Button("HE_flash", function()
      -- line: [0, 0] id: 50
      setclipboard("https://youtube.com/@Heflashh")
    end)
    r42_3:Button("JN HH Gaming", function()
      -- line: [0, 0] id: 134
      setclipboard("https://youtube.com/@JNHHGaming")
    end)
    r42_3:Button("A2br", function()
      -- line: [0, 0] id: 300
      setclipboard("https://youtube.com/@Abrahamvideogames")
    end)
    r42_3:Button("GHacks Script", function()
      -- line: [0, 0] id: 292
      setclipboard("https://youtube.com/@Ghacks_script")
    end)
    r42_3:Button("Scripter Gaming", function()
      -- line: [0, 0] id: 426
      setclipboard("https://youtube.com/@Scripter_Gaming")
    end)
    r42_3:Button("ZXZpigXD", function()
      -- line: [0, 0] id: 269
      setclipboard("https://youtube.com/@zxzpigxd3465")
    end)
    r42_3:Button("Mobile Scripts", function()
      -- line: [0, 0] id: 286
      setclipboard("https://youtube.com/@RobloxScript23")
    end)
    r42_3:Button("Py Xd", function()
      -- line: [0, 0] id: 434
      setclipboard("https://youtube.com/@PYXD")
    end)
    r42_3:Button("Xtreme/Zephyr", function()
      -- line: [0, 0] id: 211
      setclipboard("https://youtube.com/@XtremeScripts")
    end)
    r42_3:Button("Arceus Script Showcaser", function()
      -- line: [0, 0] id: 162
      setclipboard("https://youtube.com/@ArceusxScriptShowcaser")
    end)
    r42_3:Button("Alkaid Scripts", function()
      -- line: [0, 0] id: 224
      setclipboard("https://youtube.com/@AlkaidScriptYT")
    end)
    r42_3:Button("ScyMe", function()
      -- line: [0, 0] id: 348
      setclipboard("https://youtube.com/@ScyMeet")
    end)
    r42_3:Button("Zeltas Script Yt", function()
      -- line: [0, 0] id: 88
      setclipboard("https://youtube.com/@Zeltas_Script_yt")
    end)
    r42_3:Button("XHackerPlusX", function()
      -- line: [0, 0] id: 115
      setclipboard("https://youtube.com/@XHackerPlusX_YT")
    end)
    r42_3:Button("Ervin Scripts", function()
      -- line: [0, 0] id: 435
      setclipboard("https://youtube.com/@ervin607")
    end)
    r42_3:Button("Pkxdjosh56", function()
      -- line: [0, 0] id: 278
      setclipboard("https://youtube.com/@cube_nothing")
    end)
    r42_3:Button("Yournerby", function()
      -- line: [0, 0] id: 8
      setclipboard("https://youtube.com/@yournerby")
    end)
    r42_3:Button("Zenzy Scripts", function()
      -- line: [0, 0] id: 180
      setclipboard("https://youtube.com/@zenzyscripts")
    end)
    r42_3:Button("NOT QUI - Hax", function()
      -- line: [0, 0] id: 156
      setclipboard("https://youtube.com/@Dscyte")
    end)
    r42_3:Button("K00pzskidd", function()
      -- line: [0, 0] id: 165
      setclipboard("https://youtube.com/@k00pzskidd")
    end)
    r42_3:Section("Note")
    r42_3:Button("If you already showcased this script and you\'re not\nhere comment on my latest video", function()
      -- line: [0, 0] id: 123
    end)
    r43_3 = r9_3:Tab("Credits")
    r43_3:Label("✦ Externality Made In Heaven")
    r43_3:Button("YouTube Channel", function()
      -- line: [0, 0] id: 124
      setclipboard("https://www.youtube.com/@GamerScripter")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r43_3:Button("Discord", function()
      -- line: [0, 0] id: 375
      setclipboard("https://discord.gg/H4E277MV6c")
      game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ Copied",
        Text = "",
        Duration = "0.2",
      })
    end)
    r43_3:Label("Crafted with ♥ by the Externality Team")
    local r44_3 = r9_3:Tab("Update Log")
    r44_3:Label("[+] Added More Scripts In Games")
    r44_3:Label("[+] Added More Scripts In Hub | Gui")
    r44_3:Label("[+] Added More Scripts In Fe")
    r44_3:Label("[+] Added More Scripts In Other")
    r44_3:Label("[+] New Chooser")
    r44_3:Label("[+] Showcaser Tab Has Been Updated")
    r44_3:Label("[–] Removed Script That\'s Not Working")
  end)
  local r24_2 = game:GetService("TweenService")
  function dragify(r0_1018)
    -- line: [0, 0] id: 1018
    local r1_1018 = nil	-- notice: implicit variable refs by block#[0]
    dragToggle = r1_1018
    r1_1018 = 0.25
    dragInput = nil
    dragStart = nil
    local r2_1018 = nil
    function updateInput(r0_1020)
      -- line: [0, 0] id: 1020
      local r1_1020 = r0_1020.Position - dragStart
      r24_2:Create(r0_1018, TweenInfo.new(0.25), {
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + r1_1020.X, startPos.Y.Scale, startPos.Y.Offset + r1_1020.Y),
      }):Play()
    end
    r0_1018.InputBegan:Connect(function(r0_1021)
      -- line: [0, 0] id: 1021
      if r0_1021.UserInputType == Enum.UserInputType.MouseButton1 or r0_1021.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true
        dragStart = r0_1021.Position
        startPos = r0_1018.Position
        r0_1021.Changed:Connect(function()
          -- line: [0, 0] id: 1022
          if r0_1021.UserInputState == Enum.UserInputState.End then
            dragToggle = false
          end
        end)
      end
    end)
    r0_1018.InputChanged:Connect(function(r0_1019)
      -- line: [0, 0] id: 1019
      if r0_1019.UserInputType == Enum.UserInputType.MouseMovement or r0_1019.UserInputType == Enum.UserInputType.Touch then
        dragInput = r0_1019
      end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(r0_1023)
      -- line: [0, 0] id: 1023
      if r0_1023 == dragInput and dragToggle then
        updateInput(r0_1023)
      end
    end)
  end
  dragify(r2_2)
  animateIn()
end)()
-- close: r0_0
