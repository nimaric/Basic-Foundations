local systemRecords = {}

systemRecords.playerData = {
	flight_speed = 5,
}
-- Define player stats, including vitality
systemRecords.characters = {
	{
		name = "Rheon",
		level = 1,
		infusion = 0,

    unlock = true
	},
	{
		name = "Stristya",
		level = 1,
		infusion = 0,

		unlocked = true,
	},
	{
		name = "Durnan",
		level = 1,
		infusion = 0,

		unlocked = false,
	},
	{
    
		unlocked = false,
	},
	{
		name = "Durnan",
		level = 1,
		infusion = 0,

		unlocked = false,
	},
	{
		name = "Warsevally",
		level = 1,
		infusion = 0,

		unlocked = false,
	},
	{
		name = "Gaianox",
		level = 1,
		infusion = 0,

		unlocked = false,
	},
}

function systemRecords.switchCharacter(playerData, characterName)
	if playerData.characters[characterName] then
		playerData.currentCharacter = characterName
		return true
	end
	return false
end

function systemRecords.unlockCharacter(playerData, characterName)
	if playerData.characters[characterName] then
		playerData.characters[characterName].unlocked = true
		return true
	end
	return false
end

return systemRecords
