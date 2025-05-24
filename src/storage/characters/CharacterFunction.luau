local CharacterFunction = {}
function CharacterFunction:levelUp(character)
	local level = character.stats.level
	local max_level = character.max_stats.maxlevel

	-- Base and max values
	local base_health, max_health = character.min_stats.health, character.max_stats.health
	local base_attack, max_attack = character.min_stats.attack, character.max_stats.attack
	local base_defense, max_defense = character.min_stats.defense, character.min_stats.attack
	local base_mp, max_mp = character.min_stats.mana_points, character.max_stats.mana_points

	-- Linear interpolation formula
	local function lerp(base, max)
		return math.floor(base + (level - 1) * (max - base) / (max_level - 1))
	end

	character.stats.health = lerp(base_health, max_health)
	character.stats.attack = lerp(base_attack, max_attack)
	character.stats.defense = lerp(base_defense, max_defense)
	character.stats.mana_points = lerp(base_mp, max_mp)
end

return CharacterFunction
-- Note: This code is a part of a larger system and may require additional context to function correctly.
