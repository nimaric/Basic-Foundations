local systemQuest = {}

systemQuest.quests = {
	{
		id = 1,
		title = "Collect",
		desc = "One must collect.",
		objectives = {
			{
				{ target = "Oak Logs", total = 25, collected = 0, completed = false },
				{ target = "Iron", total = 10, collected = 0, completed = false },
				{ target = "Stone", total = 10, collected = 0, completed = false },
			},
			{
				{ target = "Raw Beef", total = 15, collected = 0, completed = false },
				{ target = "Raw Chicken", total = 10, collected = 0, completed = false },
			},
			{
				{ target = "Hoarder Sigils", total = 10, collected = 0, completed = false },
				{ target = "Slime Residue", total = 5, collected = 0, completed = false },
			},
		},
		reward = {
			experience = 100,
			items = { "Gold Coin", "Health Potion" },
		},
		objectiveType = "Story Quest",
	},
	{
		id = 2,
		title = "Collect",
		desc = "One must collect.",
		objectives = {
			{ target = "Robidium", total = 15, collected = 0, completed = false },
			{ target = "Clorninite", total = 10, collected = 0, completed = false },
			{ target = "Rough Diamondite", total = 5, collected = 0, completed = false },
		},
		objectiveType = "Side Quest",
	},
}

return systemQuest
