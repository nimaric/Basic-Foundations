-- This module created new playerData for new players.

local BASE_CHARACTER_DATA = require(game.ServerStorage.Storage.characters.BaseCharacterData) -- Condensed character data module
local BASE_GENERAL_DATA = require(game.ServerStorage.Storage.BaseGeneralData)

-- Define the character data for Rheon and Stristya
local function createPlayerData()
	local createdCharacterNames = {} -- Debugging Purposes, condense new characters in one list
	local playerData = BASE_GENERAL_DATA

	playerData.currentCharacter = "Rheon" -- Default character

	-- Create a fresh copy for each character for this player
	playerData.playerCharacter = {}
	for name, data in pairs(BASE_CHARACTER_DATA) do
		createdCharacterNames = table.insert(createdCharacterNames, name)
		if data.associated_data == nil then
			table.insert(playerData.playerCharacter, {
				name = name,
				unlocked = (name == "Rheon"),
				level = data.level,
				infusion = data.infusion,
				weapon_equipped = data.weapon_equipped,
				weapon_type = data.weapon_type,
				associated_data = nil,
				rating = data.rating,
			})
		else
			table.insert(playerData.playerCharacter, {
				name = name,
				unlocked = (name == "Rheon"),
				level = data.level,
				infusion = data.infusion,
				weapon_equipped = data.weapon_equipped,
				weapon_type = data.weapon_type,
				associated_data = table.clone(data.associated_data),
				rating = data.rating,
			})
		end
		return createdCharacterNames
	end
	print("Created player data for all characters: ", createdCharacterNames)
	return playerData
end

return createPlayerData

-- BASE_CHARACTER_DATA Structure, amend as needed
--	Rheon = {
--		name = "Rheon",
--		unlocked = true,
--		level = 1,
--		infusion = 0,
--		weapon_equipped = "Wooden Sword",
--		weapon_type = "sword",
--		associated_data = require(parent.RheonData),
--		rating = 6, -- Unique Character,
--	},
