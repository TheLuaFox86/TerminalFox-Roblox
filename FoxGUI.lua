function SmartGui.CreateThemeSwitcher(parent: Instance?)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ThemeSwitcherGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = parent or player:WaitForChild("PlayerGui")

	local switchButton = Instance.new("TextButton")
	switchButton.Size = UDim2.new(0, 120, 0, 40)
	switchButton.Position = UDim2.new(0, 10, 0, 10) -- Top-left corner
	switchButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	switchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	switchButton.TextSize = 18
	switchButton.Font = Enum.Font.GothamBold
	switchButton.Parent = screenGui

	local function UpdateButtonText()
		switchButton.Text = "Theme: " .. SmartGui.ThemeMode
	end

	-- Initial text
	UpdateButtonText()

	-- When clicked, toggle the theme
	switchButton.MouseButton1Click:Connect(function()
		if SmartGui.ThemeMode == "Dark" then
			SmartGui.ThemeMode = "Light"
		else
			SmartGui.ThemeMode = "Dark"
		end

		UpdateButtonText()
	end)

	return switchButton
end
