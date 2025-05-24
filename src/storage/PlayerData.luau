-- This module handles player data, including character selection and weapon preferences.
-- It provides functions to get character data, switch characters, and unlock new characters.
-- This module handles player data, including character selection and weapon preferences.

local CharacterData = require(game.ServerStorage.Storage.characters.CharacterData) -- Condensed character data module

-- Define the character data for Rheon and Stristya
local function createPlayerData()
	local playerData = {}

	playerData.generalData = {
		flight_speed = 5,
	}

	playerData.currentCharacter = "Rheon" -- Default character

	-- Create a fresh copy for each character for this player
	playerData.playerCharacter = {}
	for name, data in pairs(CharacterData) do
		print("Creating player character data for: ", name)
		table.insert(playerData.playerCharacter, {
			name = name,
			unlocked = (name == "Rheon"), -- Only Rheon unlocked by default
			weapon_equipped = data.default_weapon,
			associated_data = table.clone(data), -- Make a copy for this player
		})
	end

	function playerData:getPlayerCharacterData()
		for _, playerCharacter in ipairs(self.playerCharacter) do
			if playerCharacter.associated_data == nil then
				print("Associated data is nil for character: ", playerCharacter.name)
				return nil -- Associated data is nil
			end
			if playerCharacter.name == self.currentCharacter then
				if not playerCharacter.unlocked then
					print("Character is not unlocked: ", playerCharacter.name)
					return nil -- Character is not unlocked
				end
				print("Returning associated data for character: ", playerCharacter.name)
				return playerCharacter.associated_data
			end
		end
		return nil
	end

	function playerData:switchCharacter(characterName)
		for _, playerCharacter in ipairs(self.playerCharacter) do
			if playerCharacter.name == characterName then
				if not playerCharacter.unlocked then
					return false -- Character is not unlocked
				end
				self.currentCharacter = characterName
				return true
			end
		end
		return false
	end

	function playerData:unlockCharacter(characterName)
		for _, playerCharacter in ipairs(self.playerCharacter) do
			if playerCharacter.name == characterName then
				playerCharacter.unlocked = true
				return true
			end
		end
		return false
	end

	playerData.settings = {
		debugMode = false,
	}

	return playerData
end

return createPlayerData
