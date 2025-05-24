local parent = script.Parent

local CharacterData = {
	Rheon = {
		name = "Rheon",
		unlocked = false,
		weapon_equipped = "Wooden Sword",
		weapon_type = "sword",
		associated_data = require(parent.RheonData),
	},
	Stristya = {
		name = "Stristya",
		unlocked = false,
		weapon_equipped = "Wooden Bow",
		weapon_type = "bow",
		associated_data = require(parent.StristyaData),
	},
	Placeholdia = {
		name = "Placeholdia",
		unlocked = false,
		weapon_equipped = "Wooden Staff",
		weapon_type = "staff",
		associated_data = require(parent.PlaceholdiaData),
	},
	-- Add more characters here as needed
}

return CharacterData
