-- Define PlaceholdiaData stats
local PlaceholdiaData = {
	-- Name of the character
	name = "Placeholdia",

	-- Character's stats
	stats = {
		level = 1,
		infusion_count = 0, -- 0 = no infusion
		title = "Disciple of the Prince of Darkness",
		rating = 5, -- 5 Star Character

		health = 950,
		attack = 200,
		defense = 120,
		mana_points = 80,

		elements = {
			light = 0,
			pyro = 0,
			hydro = 0,
			geo = 0,
			wind = 0,
			electro = 0,
			cyro = 0,
			darkness = 1,
			chaos = 1,
		},
	},

	-- Min Character's stats
	min_stats = {
		level = 1,
		infusion = 0,
		health = 1000,
		attack = 5,
		defense = 0,
		mana_points = 10,
	},

	-- Max Character's stats
	max_stats = {
		level = 100,
		infusion = 6,
		health = 300000,
		attack = 217,
		defense = 416,
		mana_points = 120,
	},

	-- Character's abilities
	normal_abilities = {
		wound = { -- Basic attaack
			constant_damage = 20,
			active_time_seconds = 5,
			cooldown_seconds = 5,

			-- More effective with blades especially knifes
		},
		wall = { -- Main Ability
			cooldown_seconds = 10,
		},
		regenerate = { -- Ultimate Ability
			constant_heal_amount = 50,
			active_time_seconds = 5,
			cooldown_seconds = 10,
		},
	},

	special_abilities = { -- Boss Abilities
	},

	passives = {
		eternal_punching_bag = {
			description = "For every death, come back stronger. Gain 1 level for every 5 deaths. Increase with unused damage",
		},
	},

	-- Soul Counter Stats
	soul_counter_stats = {
		abyss_soul_gain = 0,
		max_abyss_soul = 10,
	},
}

return PlaceholdiaData
