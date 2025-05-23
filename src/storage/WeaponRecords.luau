local module = {}

-- Table of all weapons
module.weaponInfoList = {
	{
		name = "Iron Sword",
		desc = "A plain starter sword.",
		dmg = 10,
		atk_spd = 1,
	},
	{
		name = "Iron Claymore",
		desc = "Powerful but slow.",
		dmg = 20,
		atk_spd = 2,
	},
	{
		name = "Wooden Bow",
		desc = "A normal bow obtained by looting.",
		dmg = 5,
		atk_spd = 1,
		range = 10, -- Specific stat for ranged weapon
	},
	{
		name = "Iron Bow",
		desc = "A bow made of iron.",
		dmg = 10,
		atk_spd = 1,
		range = 15, -- Specific stat for ranged weapon
	},
	{
		name = "Iron Dagger",
		desc = "A small dagger.",
		dmg = 5,
		atk_spd = 2,
	},
	{
		name = "Iron Spear",
		desc = "A spear with a long reach.",
		dmg = 15,
		atk_spd = 1.5,
	},
	-- Stristya's Featured Weapon
	{
		name = "Void Peircer",
		type = "bow",
		level = 1,
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

-- Function to display weapon stats
function module.displayWeaponStats(weaponName)
	for _, weapon in ipairs(module.weaponInfoList) do
		if weapon.name == weaponName then
			print("Weapon Name: " .. weapon.name)
			print("Description: " .. weapon.desc)
			print("Damage: " .. weapon.dmg)
			print("Attack Speed: " .. weapon.atk_spd)
			if weapon.range then
				print("Range: " .. weapon.range) -- Only for ranged weapons like bows
			end
			return -- Exit the loop once the weapon is found
		end
	end
	warn("Weapon '" .. weaponName .. "' not found!")
end

return module
