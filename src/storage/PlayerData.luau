-- This module handles player data, including character selection and weapon preferences.
-- It provides functions to get character data, switch characters, and unlock new characters.
-- This module handles player data, including character selection and weapon preferences.

-- Define the character data for Rheon and Stristya
local RheonData = require(game.ServerStorage.Storage.characters.Rheon.RheonData)
local StristyaData = require(game.ServerStorage.Storage.characters.Stristya.StristyaData)
local playerData = {}

playerData.generalData = {
	flight_speed = 5,
}

playerData.currentCharacter = "Rheon" -- Default character

playerData.playerCharacter = {
	{
		name = "Rheon",
		unlocked = true,
		weapon_prefference = "sword",
		weapon_equipped = "Iron Sword",
		associated_data = RheonData,
	},
	{
		name = "Stristya",
		unlocked = false,
		weapon_prefference = "bow",
		weapon_equipped = "Wooden Bow",
		associated_data = StristyaData,
	},
}

function playerData:getPlayerCharacterData()
	for _, playerCharacter in ipairs(self.playerCharacter) do
		if playerCharacter.associated_data == nil then
			print("Associated data is nil for character: " .. playerCharacter.name)
			return nil -- Associated data is nil
		end
		if playerCharacter.name == self.currentCharacter then
			if not playerCharacter.unlocked then
				print("Character " .. self.currentCharacter .. " is not unlocked.")
				return nil -- Character is not unlocked
			end

			print("Getting data for character: " .. self.currentCharacter)
			return playerCharacter.associated_data
		end
	end
	return nil
end

function playerData:switchCharacter(characterName)
	for _, playerCharacter in ipairs(self.playerCharacter) do
		if playerCharacter.name == characterName then
			if not playerCharacter.unlocked then
				print("Character " .. characterName .. " is not unlocked.")
				return false -- Character is not unlocked
			end
			print("Switching to character: " .. characterName)
			self.currentCharacter = characterName
			return true
		end
	end
	print("Character " .. characterName .. " not found.")
	return false
end

function playerData:unlockCharacter(characterName)
	for _, playerCharacter in ipairs(self.playerCharacter) do
		if playerCharacter.name == characterName then
			print("Unlocking character: " .. characterName)
			playerCharacter.unlocked = true
			return true
		end
	end
	print("Character " .. characterName .. " not found.")
	return false
end

return playerData
