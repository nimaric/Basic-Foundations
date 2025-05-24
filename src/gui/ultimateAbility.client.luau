local UserInputService = game:GetService("UserInputService")

-- Define the key you want to use
local keyToActivate = Enum.KeyCode.Q

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == keyToActivate and not gameProcessed then
		if game.Players.LocalPlayer.Character then
			-- Check if the character has the ultimate ability
			local character = game.Players.LocalPlayer.Character
			local ultimateAbility = character:FindFirstChild("UltimateAbility")
			if ultimateAbility then
				-- Activate the ultimate ability
				ultimateAbility:Activate()
			else
				print("Ultimate Ability not found")
			end
		else
			print("Character not found")
		end
	end
end)
