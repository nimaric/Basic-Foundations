local UserInputService = game:GetService("UserInputService")
local frame = script.Parent -- Reference the frame you want to disappear

-- Define the key you want to use
local keyToHideFrame = Enum.KeyCode.Q -- Change "F" to your desired key

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == keyToHideFrame and not gameProcessed then
		frame.Visible = not frame.Visible -- Toggle visibility
		--print("[FrameController] Frame visibility toggled!")
	end
end)
