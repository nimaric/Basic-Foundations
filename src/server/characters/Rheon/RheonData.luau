local Rheon

Rheon = {
	-- Name of the character
	name = "Rheon",

	-- Description of the character
	desc = "A warrior with a strong sense of justice.",

	-- Character's stats
	stats = {
		level = 1,
		title = "Savior",
		health = 1000,
		strength = 50,
		dexterity = 30,
		intelligence = 20,
	},

	-- Character's equipment

	-- Character's abilities
	normal_abilities = {
		slash = {
			damage = 15,
			cooldown = 5,
		},
	},

	special_abilities = {
		light_salvo = {
			damage = 50,
			cooldown = 20,
		},
		onslaught_of_light = {
			damage = 50,
			cooldown = 20,
		},
	},
}
