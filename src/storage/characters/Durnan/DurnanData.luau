local RheonData = {
	-- Name of the character
	name = "Durnan",

	-- Description of the character
	desc = "",

	-- Character's stats
	stats = {
		level = 1,
		infusion = 0,
		title = "Disiple of the Prince of Darkness",
		rating = 4,

		health = 850,
		attack = 80,
		defense = 220,
		mana_points = 45,

		elements = {
			light = 0,
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
		health = 850,
		attack = 80,
		defense = 220,
		mana_points = 45,
	},

	-- Max Character's stats
	max_stats = {
		maxlevel = 100,
		maxinfusion = 6,
		health = 26540,
		attack = 1800,
		defense = 3600,
		mana_points = 400,
	},

	-- Character's abilities
	normal_abilities = {},
}

function RheonData:levelup()
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

--print("Loading RheonData...")

--RheonData.stats.level = RheonData.stats.level + 99
--RheonData:levelup()

--print("RheonData loaded successfully.")
--print("RheonData: ", RheonData)
