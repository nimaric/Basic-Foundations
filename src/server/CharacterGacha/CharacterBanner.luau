local characterBanner = {}

-- Rheon is a unique character (6-star) not available in the standard gacha system.
characterBanner.Rheon = {
	featuredcharacter = "Rheon",
	supplementarycharacters = {},
}

-- Stristya is the first banner character (5-star)
characterBanner.Stristya = {
	featuredcharacter = "Stristya",
	supplementarycharacters = {
		"Durnan",
		"Chestnut",
		"Chista",
	},
	supplementaryWeapon = {
		"Void Peircer",
	},
}

characterBanner.Placeholdia = {
	featuredcharacter = "Placeholdia",
	supplementarycharacters = {
		"Brosh",
		"Noria",
		"Eon",
	},
}

characterBanner.Salvier = {
	featuredcharacter = "Salvier",
	supplementarycharacters = {
		"Hilcary",
		"Dilla",
		"Jon",
	},
}

characterBanner.standard = {
	featuredcharacter = "",
	supplementarycharacters = {
		"Hilcary",
		"Dilla",
		"Jon",
	},
}

-- Set the featured banner character
characterBanner.featuredbanner = characterBanner.Stristya

return characterBanner
-- This module is responsible for managing character banners in the gacha system.
