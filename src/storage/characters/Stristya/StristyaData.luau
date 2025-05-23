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
		minlevel = 1,
		mininfusion = 0,
		health = 950,
		attack = 200,
		defense = 120,
		mana_points = 80,
	},

	-- Max Character's stats
	max_stats = {
		maxlevel = 100,
		maxinfusion = 6,
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
			cooldown = 10,
		},
		down_with_the_prince = { -- Q, Ultimate ability
			damage = 50,
			active_time = 5,
      constant_damage = 0,
			cooldown = 10,
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

	-- Special Stats
	special_stats = {
		abyss_soul_gain = 0,
		max_abyss_soul = 10,
	},
}

function StristyaData:levelup()
	local level = self.stats.level
	local max_level = self.max_stats.maxlevel

	-- Base and max values
	local base_health, max_health = self.min_stats.health, self.max_stats.health
	local base_attack, max_attack = self.min_stats.attack, self.max_stats.attack
	local base_defense, max_defense = self.min_stats.defense, self.min_stats.attack
	local base_mp, max_mp = self.min_stats.mana_points, self.max_stats.mana_points

	-- Linear interpolation formula
	local function lerp(base, max)
		return math.floor(base + (level - 1) * (max - base) / (max_level - 1))
	end

	self.stats.health = lerp(base_health, max_health)
	self.stats.attack = lerp(base_attack, max_attack)
	self.stats.defense = lerp(base_defense, max_defense)
	self.stats.mana_points = lerp(base_mp, max_mp)
end

function StristyaData:InfusionLevel()
	local infusion = self.stats.infusion
	local max_inf = self.max_stats.maxinfusion

	if infusion < 0 then
		infusion = 0
	elseif infusion > max_inf then
		infusion = max_inf
	end

	self.stats.infusion = infusion

	return infusion
end

function StristyaData:Infusion()
	local base_attack = self.min_stats.attack
	local max_abyss_soul = self.special_stats.max_abyss_soul

	local infusion = self.stats.infusion

	if infusion == 0 then
		-- No infusion, no special effects
		self.special_stats.abyss_soul_gain = 0
	elseif infusion == 1 then
		self.special_stats.abyss_soul_gain = 1
	elseif infusion == 2 then
		self.normal_abilities.lightning_pillar = {
			constant_damage = base_attack * 1.5, -- 150% of base attack
		}
		self.normal_abilities.down_with_the_prince = {
			constant_damage = base_attack * 1.5, -- 150% of base attack
		}
	elseif infusion == 3 then
		self.special_stats.max_abyss_soul = max_abyss_soul + 5
	elseif infusion == 4 then
		print("StristyaData: Infusion 4")
		-- Update SystemRecords flight speed
		-- Flight Speed Increase by 5$
	elseif infusion == 5 then
		print("StristyaData: Infusion 5")
		-- Update Skill (Q) Down with the Prince
		-- Absorbs strength of enemies reducing their atk, and gain atk (Enemy loss 20%, gain 10%) during ultimate skill. Lasts for 5 seconds.
	elseif infusion == 6 then
		print("StristyaData: Infusion 6")
		-- Update Skill (Q) Down with the Prince
		-- Ultimate lasts for +2 seconds, Pillars become semi homing to help with accuracy, and replaces all arrows with lightning bolts (enhances pillars). (Homing only works if aim is 1m away, anything further will only increase damage slightly)
		down_with_the_prince = {
			constant_damage = base_attack * 1.5, -- 150% of base attack
		}
	end
end

--StristyaData.stats.level = StristyaData.stats.level + 10
--StristyaData:levelup()

--print("StristyaData loaded successfully.")
--print(StristyaData)
