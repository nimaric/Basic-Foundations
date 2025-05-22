local systemRecords = {}

-- Define player stats, including vitality
systemRecords.systemGeneralInfo = {
	{
		name = "PlayerStatistics",
		level = 1,
		job = "None",
		title = "None",
		systemFullFunction = true,
	},
	{
		name = "Health",
		desc = "Your general wellness",
		max = 100, -- Dummy value
		current = 100, -- Dummy value
	},
	{
		name = "Mana",
		desc = "Used for encantations",
		max = 100, -- Dummy value
		current = 100, -- Dummy value
	},
	{
		name = "Fatigue",
		desc = "How tired a player is",
		max = 100,
		current = 0, -- How tired a player is
	},
}

systemRecords.systemStatInfo = {
	{
		name = "Strength",
		value = 10,
	},
	{
		name = "Agility",
		value = 10,
	},
	{
		name = "Perception",
		value = 10,
	},
	{
		name = "Vitality",
		value = 10,
	},
	{
		name = "Intelligence",
		value = 10,
	},
	{
		name = "Defense",
		value = 10,
	},
	{
		name = "Resistance",
		value = 10,
	},
	{
		name = "Endurance",
		value = 10,
	},
	{
		name = "AvailableAbilityPoints",
		value = 0,
	},
}

systemRecords.systemConstants = { -- IMPORTANT DO NOT CHANGE
	BASE_HEALTH = 1.41171,
	GROWTH_HEALTH_FACTOR = 1.85025,

	BASE_MANA_POINTS = 0.02138,
	GROWTH_MANA_POINTS_FACTOR = 2.669945,
}

return systemRecords
