local RheonData = {
	-- Name of the character
	name = "Rheon",

	-- Description of the character
	desc = "A warrior with a strong sense of justice.",

	-- Character's stats
	stats = {
		level = 1,
		infusion = 0,
		title = "Savior",
		rating = 4,

		health = 1000,
		attack = 150,
		defense = 150,
		mana_points = 100,

		elements = {
			light = 1,
			pyro = 0,
			hydro = 0,
			geo = 0,
			wind = 0,
			electro = 0,
			cyro = 0,
			darkness = 0,
			chaos = 0,
		},
	},

	-- Min Character's stats
	min_stats = {
		minlevel = 1,
		mininfusion = 0,
		health = 1000,
		attack = 150,
		defense = 150,
		mana_points = 100,
	},

	-- Max Character's stats
	max_stats = {
		maxlevel = 100,
		maxinfusion = 6,
		health = 32000,
		attack = 3000,
		defense = 1800,
		mana_points = 900,
	},

	-- Character's abilities
	normal_abilities = {
		light_salvo = {
			damage = 15,
			cooldown = 5,
		},
		onslaught_of_light = {
			damage = 30,
			cooldown = 10,
		},
	},
}

return RheonData
