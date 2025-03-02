
local player, gui = owner, Instance.new("ScreenGui")
local playerGui = player.PlayerGui

if not playerGui then return end

-- Create GUI elements
local screenGui = gui
screenGui.Parent = owner.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "TerminalFox"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -60)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scrollFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
scrollFrame.BorderSizePixel = 0
scrollFrame.Parent = frame

local output = Instance.new("TextLabel")
output.Size = UDim2.new(1, -10, 1, 0)
output.Position = UDim2.new(0, 5, 0, 0)
output.BackgroundTransparency = 1
output.TextColor3 = Color3.fromRGB(0, 255, 0)
output.Font = Enum.Font.Code
output.TextSize = 16
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top
output.TextWrapped = true
output.Text = ">> Welcome to TerminalFox\n>> Type 'help' for commands 'Exit' to close gui\n"
output.Parent = scrollFrame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 400, 0,30)
inputBox.Position = UDim2.new(0, 0, 1, -30)
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Font = Enum.Font.Code
inputBox.TextSize = 16
inputBox.ClearTextOnFocus = false
inputBox.PlaceholderText = "Enter command..."
inputBox.Parent = frame
inputBox.Text = ""

-- Function to print output
local function printToTerminal(text)
    output.Text = output.Text .. "\n>> " .. text
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, output.TextBounds.Y + 10)
end
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 30)
button.Position = UDim2.new(0, 400, 0, 270)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.Code
button.TextSize = 16
button.Parent = frame
button.Text = "Enter"
-- Command Handling
button.MouseButton1Click:Connect(function(enterPressed)
    if true then
        local args = inputBox.Text:split(" ")
        local command = args[1]

        if command == "help" then
            printToTerminal("Available commands:\n- help\n- clear\n- speed\n sets player speed\n speed [Number]\n-jump\n sets jump Height\n jump [meters: number]")
        elseif command == "clear" then
            output.Text = ""
        elseif command == "speed" then
            player.Character.Humanoid.WalkSpeed = tonumber(args[2])
        elseif command == "jump" then
            player.Character.Humanoid.JumpHeight = tonumber(args[2])
        elseif command == "Exit" then
           screenGui:Destroy()
        elseif command == "health" then
           player.Character.Humanoid.MaxHealth = tonumber(args[2])
            elseif command == "insert" then
                ns[[
                local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")
local assetId = tonumber(args[2])
local model = InsertService:LoadAsset(assetId)
        model.Parent = workspace
                ]], game.Workspace)
        elseif command == "god" then
            NS([[
            player = script.parent
           player.Character.Humanoid.MaxHealth = 99999999999999999
            player.Character.Humanoid.HealthChanged:Connect(function(health)
    humanoid.Health = 99999999999999999
end)]], player)
        elseif command == "kill" then
           player.Character.Humanoid.Health = 0
        elseif command == "lua" then
                -- Put this in StarterGui inside a ScreenGui as a LocalScript.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create GUI Elements
local Exec = gui
Exec.ResetOnSpawn = true -- Keeps the GUI around even after resetting

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.6, 0, 0.6, 0)
Frame.Position = UDim2.new(0.2, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Draggable = true
Frame.Active = true
Frame.Parent = Exec

-- Collapse Button
local CollapseButton = Instance.new("TextButton")
CollapseButton.Size = UDim2.new(0.15, 0, 0.1, 0)
CollapseButton.Position = UDim2.new(0.025, 0, 0.025, 0)
CollapseButton.Text = "-"
CollapseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CollapseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CollapseButton.Font = Enum.Font.GothamBold
CollapseButton.TextScaled = true
CollapseButton.Parent = Frame

-- Code Container (holds TextBox + Run Button, so we can hide both easily)
local CodeContainer = Instance.new("Frame")
CodeContainer.Size = UDim2.new(1, 0, 0.85, 0)
CodeContainer.Position = UDim2.new(0, 0, 0.15, 0)
CodeContainer.BackgroundTransparency = 1
CodeContainer.Parent = Frame

-- TextBox
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.9, 0, 0.7, 0)
TextBox.Position = UDim2.new(0.05, 0, 0.05, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Code
TextBox.TextWrapped = true
TextBox.MultiLine = true
TextBox.Text = "-- Type Lua code here"
TextBox.Parent = CodeContainer

-- Run Button
local RunButton = Instance.new("TextButton")
RunButton.Size = UDim2.new(0.4, 0, 0.15, 0)
RunButton.Position = UDim2.new(0.3, 0, 0.8, 0)
RunButton.Text = "Run Code"
RunButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.Font = Enum.Font.GothamBold
RunButton.TextScaled = true
RunButton.Parent = CodeContainer

-- Collapse/Expand Logic
local isCollapsed = false
local originalSize = Frame.Size

CollapseButton.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed
    
    if isCollapsed then
        Frame.Size = UDim2.new(originalSize.X.Scale, 0, 0.1, 0)
        CollapseButton.Text = "+"
        CodeContainer.Visible = false
    else
        Frame.Size = originalSize
        CollapseButton.Text = "-"
        CodeContainer.Visible = true
    end
end)

-- Run Button Functionality
RunButton.MouseButton1Click:Connect(function()
    local code = TextBox.Text

    local func, err = loadstring(code)
    if func then
        local success, runtimeErr = pcall(func)
        if not success then
            warn("Runtime error: " .. tostring(runtimeErr))
        end
    else
        warn("Compile error: " .. tostring(err))
    end
end)
        else
            printToTerminal("Unknown command: " .. command)
        end
        inputBox.Text = ""
    end
end)

