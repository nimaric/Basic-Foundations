-- CharacterManager.luau
-- This module allows changing a user's character by copying character data.

local CharacterManager = {}

-- Require character data modules
local StristyaData = require(script.Parent.characters.Stristya.StristyaData)
local RheonData = require(script.Parent.characters.Rheon.RheonData)
local DurnanData = require(script.Parent.characters.Durnan.DurnanData)

-- Add more character data modules as needed
local characterDataMap = {
	Stristya = StristyaData,
	Rheon = RheonData,
	Durnan = DurnanData,

	-- Add more as you create them
}

-- Unlock a character for the player
function CharacterManager.unlockCharacter(playerData, characterName)
	if not playerData.characters then
		playerData.characters = {}
	end
	if not playerData.characters[characterName] then
		playerData.characters[characterName] = { unlocked = true, equippedWeapon = nil }
	else
		playerData.characters[characterName].unlocked = true
	end
end

-- Equip a character (if unlocked)
function CharacterManager.equipCharacter(playerData, characterName)
	if
		playerData.characters
		and playerData.characters[characterName]
		and playerData.characters[characterName].unlocked
	then
		playerData.currentCharacter = characterName
		-- Optionally, copy stats from character data to playerData here
		return true
	end
	return false
end

-- Equip a weapon for a character (if unlocked)
function CharacterManager.equipWeapon(playerData, characterName, weaponName)
	if
		playerData.characters
		and playerData.characters[characterName]
		and playerData.characters[characterName].unlocked
	then
		playerData.characters[characterName].equippedWeapon = weaponName
		return true
	end
	return false
end

-- Get the currently equipped character's data
function CharacterManager.getCurrentCharacterData(playerData)
	local charName = playerData.currentCharacter
	if charName and characterDataMap[charName] then
		return characterDataMap[charName]
	end
	return nil
end

return CharacterManager
