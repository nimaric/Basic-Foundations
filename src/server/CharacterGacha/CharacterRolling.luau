local characterBanner = require(game.ServerScriptService.Server.CharacterGacha.CharacterBanner)

-- CharacterRolling Constants
local HIGHEST_ROLL = 200
local FIVE_STAR_ROLL = 160
local FOUR_STAR_ROLL = 140

local FEATURED_FIVE_STAR_CHARACTER_CHANCE = 25
local RANDOM_FIVE_STAR_CHARACTER_CHANCE = 75

local FOUR_STAR_PITY_NEEDED_FOR_GAURANTEE = 20 -- This is the amount of pity needed for a GAURANTEED SUPPLEMENTARY four star
local FEATURED_FOUR_STAR_CHARACTER_CHANCE = 25 -- This is the chance to get a featured 4-star character

local GuaranteedFourStar = false -- This is set to true when the 4-star pity counter reaches 20
local FeaturedFiveStarCharacterChance = 25
local RandomFiveStarCharacterChance = 75

-- This module is responsible for managing character rolling in the gacha system.
local characterRolling = {}

-- Load all the banner neccesities
local banner = characterBanner.featuredbanner
local featuredCharacter = banner.featuredcharacter
local supplementarycharacters = banner.supplementarycharacters

local BASE_CHARACTER_DATA = require(game.ServerStorage.Storage.characters.BaseCharacterData) -- Get the Character List
local BASE_WEAPON_DATA = require(game.ServerStorage.Storage.Records.WeaponData) -- Get the Weapon List

-- Get all characters with a 5 star rating (NOT INCLUDING THE FEATURED CHARACTER ITSELF)
function characterRolling.checkCountCharacterFiveRating()
	local five_count = 0
	local FIVE_RATING_CHARACTER = {}
	for name, charData in pairs(BASE_CHARACTER_DATA) do
		if charData.rating == 5 then
			if charData.name ~= featuredCharacter then
				five_count = five_count + 1
				table.insert(FIVE_RATING_CHARACTER, charData)
			end
		end
	end
	return FIVE_RATING_CHARACTER
end

-- Get all characters AND WEAPONS with a 4 star rating (NOT INCLUDING SUPPLEMENTARY CHARACTER)
function characterRolling.checkCountFourRating()
	local four_count = 0
	local FOUR_RATING = {}
	for name, charData in pairs(BASE_CHARACTER_DATA) do
		if charData.rating == 4 then
			four_count = four_count + 1
			table.insert(FOUR_RATING, charData)
		end
	end
	--for name, weapon in pairs(weaponData) do
	--	if weapon.rating == 4 then
	--		four_count = four_count + 1
	--		table.insert(FOUR_RATING, weapon)
	--	end
	--end
	return FOUR_RATING
end

function characterRolling.pityCounter(pity)
	pity = pity + 1
	if pity >= 100 then
		print("Pity count reached 90, Gauranteee Featured Character.")
		pity = 0 -- Reset pity counter if it reaches 90
		FeaturedFiveStarCharacterChance = 100 -- Set featured character chance to 100%
		RandomFiveStarCharacterChance = 0
	elseif pity >= 80 then
		print("Pity count reached 80, setting 50/50.")
		FeaturedFiveStarCharacterChance = 50
		RandomFiveStarCharacterChance = 50
	elseif pity >= 50 then
		print("Pity count reached 50, setting 25/75.")
		FeaturedFiveStarCharacterChance = 25
		RandomFiveStarCharacterChance = 75
	end
	return pity
end

function characterRolling.fourStarFeaturedPityCounter(fourStarFeaturedPity)
	fourStarFeaturedPity = fourStarFeaturedPity + 1
	if fourStarFeaturedPity == FOUR_STAR_PITY_NEEDED_FOR_GAURANTEE then
		print("4-Star Pity count reached 20")
		GuaranteedFourStar = true -- Set guaranteed SUPPLEMENTARY 4-star character
	end
	return fourStarFeaturedPity
end

-- How many roll are used, the current pity count
function characterRolling.rollCharacter(rollcount, pity, fourStarFeaturedPity)
	pity = tonumber(pity) or 0
	fourStarFeaturedPity = tonumber(fourStarFeaturedPity) or 0
	local pulledBatch = {}
	local AMOUNT_OF_FIVE_STARS = characterRolling.checkCountCharacterFiveRating()
	local AMOUNT_OF_FOUR_STARS = characterRolling.checkCountFourRating()

	print(rollcount .. " Rolls requested.", "PT Counter:", pity, "4PT Counter:", fourStarFeaturedPity)
	if rollcount > 10 then
		print("Invalid roll count: " .. rollcount .. ". Maximum allowed is 10.")
		return pulledBatch, pity, fourStarFeaturedPity
	elseif rollcount <= 0 then
		print("Invalid roll count: " .. rollcount .. ". Minimum allowed is 1.")
		return pulledBatch, pity, fourStarFeaturedPity
	end

	for i = 1, rollcount do
		-- Increase Pity Counter
		pity = characterRolling.pityCounter(pity)
		-- Increase 4-Star Pity Counter
		fourStarFeaturedPity = characterRolling.fourStarFeaturedPityCounter(fourStarFeaturedPity)

		if GuaranteedFourStar == true then
			-- Featured 4-Star Character
			local featuredFourStar = math.random(1, #supplementarycharacters) -- Randomly select a supplementary character
			table.insert(pulledBatch, supplementarycharacters[featuredFourStar])
			fourStarFeaturedPity = fourStarFeaturedPity - FOUR_STAR_PITY_NEEDED_FOR_GAURANTEE -- Remove Pity needed for gaurantee, possible to have more than 20 pity when this is triggered, ensure fairness in pity.
			GuaranteedFourStar = false -- Reset guaranteed 4-star character variable
			print("Pulled FEATURED 4-Star Character: " .. supplementarycharacters[featuredFourStar])
		end

		local rollvalue = math.random(1, HIGHEST_ROLL)
		print("Roll:", i, ", RV: " .. rollvalue .. ", PT: " .. pity .. ", FSP: " .. fourStarFeaturedPity .. ", ")

		if rollvalue == FIVE_STAR_ROLL then
			-- 5-Star Character Pull
			local fiveStarRoll = math.random(1, 100)
			if fiveStarRoll <= FeaturedFiveStarCharacterChance then
				-- Featured Character
				table.insert(pulledBatch, featuredCharacter)
				print("Pity Count: " .. pity)
				pity = 0 -- Reset pity counter after pulling five star character
				print("Pulled FEATURED 5-Star Character: " .. featuredCharacter)
			else
				-- Random 5-Star Character
				local randomFiveStar = AMOUNT_OF_FIVE_STARS[math.random(1, #AMOUNT_OF_FIVE_STARS)]
				table.insert(pulledBatch, randomFiveStar.name)
				print("Pulled RANDOM 5-Star Character: " .. randomFiveStar.name)
			end
		end
		if rollvalue >= FOUR_STAR_ROLL and rollvalue < FIVE_STAR_ROLL then
			-- 4-Star Character Pull
			local fourStarRoll = math.random(1, 100)
			if fourStarRoll <= FEATURED_FOUR_STAR_CHARACTER_CHANCE then
				-- Featured 4-Star Character
				local featuredFourStar = math.random(1, #supplementarycharacters) -- Randomly select a supplementary character
				table.insert(pulledBatch, supplementarycharacters[featuredFourStar])
				fourStarFeaturedPity = fourStarFeaturedPity - FOUR_STAR_PITY_NEEDED_FOR_GAURANTEE
				GuaranteedFourStar = false -- Reset guaranteed 4-star character
				print("Pulled FEATURED 4-Star Character: " .. supplementarycharacters[featuredFourStar])
			else
				-- Random 4-Star Character
				local randomFourStar = AMOUNT_OF_FOUR_STARS[math.random(1, #AMOUNT_OF_FOUR_STARS)]
				table.insert(pulledBatch, randomFourStar.name)
				print("Pulled RANDOM 4-Star Character: " .. randomFourStar.name)
			end
		end
	end
	print("Pulled Batch: ", pulledBatch)

	return pulledBatch, pity, fourStarFeaturedPity
end

return characterRolling
