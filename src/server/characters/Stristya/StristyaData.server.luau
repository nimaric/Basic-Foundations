-- Define Stristya stats
local StristyaData = {
	-- Name of the character
	name = "Stristya",

	-- Description of the character
	desc = "",

	-- Character's stats
	stats = {
		level = 1,
		infusion = 0, -- 0 = no infusion
		title = "Disciple of the Prince of Darkness",
		rating = 5, -- 5 Star Character

		health = 950,
		attack = 200,
		defense = 120,
		mana_points = 80,
	},

	-- Character's abilities
	normal_abilities = {
		-- Right Click
		lightning_arrow_strike = {
			damage = 20,
			cooldown = 5,
		},
		-- E
		lightning_pillar = {
			damage = 50,
			cooldown = 10,
		},
		-- Q
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

function StristyaData:levelup()
	local level = self.stats.level
	local max_level = 100

	-- Base and max values
	local base_health, max_health = 950, 30000
	local base_attack, max_attack = 200, 4000
	local base_defense, max_defense = 120, 1300
	local base_mp, max_mp = 80, 750

	-- Linear interpolation formula
	local function lerp(base, max)
		return math.floor(base + (level - 1) * (max - base) / (max_level - 1))
	end

	self.stats.health = lerp(base_health, max_health)
	self.stats.attack = lerp(base_attack, max_attack)
	self.stats.defense = lerp(base_defense, max_defense)
	self.stats.mana_points = lerp(base_mp, max_mp)
end

--StristyaData.stats.level = StristyaData.stats.level + 10
--StristyaData:levelup()

--print("StristyaData loaded successfully.")
--print(StristyaData)
