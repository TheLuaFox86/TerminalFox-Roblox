local player, gui = ...
local a = Instance.new("Frame")
local b = Instance.new("TextBox")
b.Text = "16"
b.FocusLost:Connect(function(EnterPressed)
    if EnterPressed then
      player.Character.Humanoid.WalkSpeed = tonumber(b.Text)
    end
end
a.Parent = gui.body
b.Parent = a
