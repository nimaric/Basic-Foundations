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

function PlaceholdiaData:LevelUp()
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

function PlaceholdiaData:InfusionLevelUp()
	local infusion_count = self.stats.infusion_count
	local max_inf = self.max_stats.infusion

	if infusion_count < 0 then
		infusion_count = 0
	end

	infusion_count = infusion_count + 1

	if infusion_count > max_inf then
		infusion_count = max_inf
	end

	self.stats.infusion_count = infusion_count
	PlaceholdiaData:Infusion()

	return infusion_count
end

function PlaceholdiaData:Infusion()
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
	end
end

return PlaceholdiaData
