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
		rating = 6, -- Unique Character

		health = 1000,
		attack = 150,
		defense = 150,
		mana_points = 100,
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

function RheonData:levelup()
	local level = self.stats.level
	local max_level = 100

	-- Base and max values
	local base_health, max_health = 1000, 32000
	local base_attack, max_attack = 150, 3000
	local base_defense, max_defense = 150, 1800
	local base_mp, max_mp = 100, 900

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
