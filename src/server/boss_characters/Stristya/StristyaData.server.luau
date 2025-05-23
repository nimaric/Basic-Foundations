-- Define Stristya stats
local StristyaData = {
	-- Name of the character
	name = "Stristya",

	-- Description of the character
	desc = "",

	-- Character's stats
	stats = {
		level = 185,
		infusion = 0, -- 0 = no infusion
		title = "Disciple of the Prince of Darkness",
		rating = 5, -- 5 Star Character

		health = 150000000,
		attack = 800,
		defense = 500,
		mana_points = 9999999,
	},

	-- Character's equipment
	weapon = {
		print("Work in progress refference the item records"),
	},

	-- Character's abilities
	normal_abilities = {
		lightning_arrow_strike = {
			damage = 20,
			cooldown = 5,
		},
		lightning_pillar = {
			damage = 50,
			cooldown = 10,
		},
		down_with_the_prince = {
			damage = 50,
			cooldown = 10,
		},
	},

	special_abilities = {
		electro_pillar = {
			damage = 50,
			cooldown = 20,
		},
		onslaught_of_light = {
			damage = 50,
			cooldown = 20,
		},
	},

	passives = {
		motivation_of_the_abyss = {
			description = "For every pillar strike while in combat, gain 1 abyss soul. Atk +5% per abyss soul (max 10 souls). (Resets when outside of combat)",
		},
		she_who_follows_the_night = {
			description = "When bow is enhanced with lightning, Stristya will gain a 22% Def & 11% Atk. If there is another who contains the status of darkness on the team, doubles the effects.",
		},
		she_who_is_the_abyss_lightning = {
			description = "Gain 20% when flying if there is another electro user in the team.",
		},
	},
}

return StristyaData
