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
