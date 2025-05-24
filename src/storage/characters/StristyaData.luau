-- Define Stristya stats
local StristyaData = {
	-- Name of the character
	name = "Stristya",

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
			electro = 1,
			cyro = 0,
			darkness = 1,
			chaos = 0,
		},
	},

	-- Min Character's stats
	min_stats = {
		level = 1,
		infusion = 0,
		health = 950,
		attack = 200,
		defense = 120,
		mana_points = 80,
	},

	-- Max Character's stats
	max_stats = {
		level = 100,
		infusion = 6,
		health = 30000,
		attack = 4000,
		defense = 1300,
		mana_points = 750,
	},

	-- Character's abilities
	normal_abilities = {
		lightning_arrow_strike = { -- Right Click, Basic attack
			damage = 20,
			active_time = 5,
			cooldown = 5,
		},
		lightning_pillar = { -- E, Main ability
			damage = 50,
			active_time = 5,
			constant_damage = 0,
			cooldown_seconds = 10,
		},
		down_with_the_prince = { -- Q, Ultimate ability
			damage = 50,
			active_time = 5,
			constant_damage = 0,
			cooldown_seconds = 10,
		},
	},

	special_abilities = { -- Boss Abilities
		electro_pillar = {
			damage = 50,
			active_time = 5,
			cooldown = 20,
		},
		pillar_rain = {
			damage = 50,
			active_time = 5,
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

	-- Soul Counter Stats
	soul_counter_stats = {
		abyss_soul_gain = 0,
		max_abyss_soul = 10,
	},
}

--StristyaData.stats.level = StristyaData.stats.level + 10
--StristyaData:levelUp()

--print("StristyaData loaded successfully.")
--print(StristyaData.stats)

return StristyaData
