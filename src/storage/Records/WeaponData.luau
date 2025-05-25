local module = {}

-- Table of all weapons
module.weaponInfoList = {
	-- Stristya's Featured Weapon
	{
		name = "Void Peircer",
		desc = "A bow infused with Darkness, Strange right.",
		rating = 5,
		unlocked = false,
		count = 0,
		level = 1,
		type = "bow",
		attack = 150,
		crit_rate = 0.035,

		ability = {
			name = "Destiny of the Dark",
			desc = "A bow infused with Darkness, Strange right.",
			element_bonuses = {
				electro = { crit_damage = 0.6 },
				pyro = { attack_bonus = 0.35 },
				geo = { defense_bonus = 0.3 },
				hydro = { health_bonus = 0.3 },
				cryo = { crit_rate_bonus = 0.1 },
			},
			afflicted_bonuses = {
				darkness = { cooldown_second_reduce = 1 },
			},
		},
	},
	{
		name = "Harbringer of Dusk",
		rating = 4,
		unlocked = false,
		count = 0,
	},
	{
		name = "Juggernut",
		rating = 4,
		unlocked = false,
		count = 0,
	},
	{
		name = "Broaden Horizon",
		rating = 4,
		unlocked = false,
		count = 0,
	},
	-- Add more weapons as needed
}

return module
