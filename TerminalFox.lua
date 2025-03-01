
local player, gui = ...
local playerGui = player.PlayerGui

if not playerGui then return end

-- Create GUI elements
local screenGui = gui

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
        elseif command == "god" then
           player.Character.Humanoid.MaxHealth = 0
        elseif command == "kill" then
           player.Character.Humanoid.Health = -1
        else
            printToTerminal("Unknown command: " .. command)
        end
        inputBox.Text = ""
    end
end)

