local module = {}

-- Table of all weapons
module.weaponInfoList = {
	{
		name = "Iron Sword",
		desc = "A plain starter sword.",
		rating = 2,
		level = 1,
		type = "sword",
		dmg = 10,
		atk_spd = 1,
	},
	{
		name = "Iron Claymore",
		desc = "Powerful but slow.",
		rating = 2,
		level = 1,
		type = "claymore",
		dmg = 20,
		atk_spd = 2,
	},
	{
		name = "Wooden Bow",
		desc = "A normal bow obtained by looting.",
		rating = 1,
		level = 1,
		type = "bow",
		dmg = 5,
		atk_spd = 1,
	},
	{
		name = "Flintstone Dagger",
		desc = "A handmade dagger, common with thiefs.",
		rating = 1,
		level = 1,
		type = "dagger",
		dmg = 3,
		atk_spd = 2,
	},
	{
		name = "Iron Bow",
		desc = "A bow made of iron.",
		rating = 2,
		level = 1,
		type = "bow",
		dmg = 10,
		atk_spd = 1,
	},
	{
		name = "Iron Dagger",
		desc = "A small dagger.",
		rating = 2,
		level = 1,
		type = "dagger",
		dmg = 5,
		atk_spd = 2,
	},
	{
		name = "Iron Spear",
		desc = "A spear with a long reach.",
		rating = 2,
		level = 1,
		type = "spear",
		dmg = 15,
		atk_spd = 1.5,
	},
	-- Stristya's Featured Weapon
	{
		name = "Void Peircer",
		desc = "A bow infused with Darkness, Strange right.",
		rating = 5,
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
	-- Add more weapons as needed
}

return module
