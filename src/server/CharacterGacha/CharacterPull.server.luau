local characterRolling = require(game.ServerScriptService.Server.CharacterGacha.CharacterRolling)
local gachaSystemPull = game.ReplicatedStorage.GachaSystemPull
local SessionData = require(game.ServerScriptService.Server.SessionData)
-- gachaSystemPull is a RemoteFunction

local pity = 0 -- Current pity count
local fourStarFeaturedPity = 0 -- Current 4-star pity count

-- Function to pull a character from the gacha system
function pullCharacter(rollcount)
	-- Perform the character rolling logic ONCE
	local pulledBatch, newPity, newFourStarFeaturedPity =
		characterRolling.rollCharacter(rollcount, pity, fourStarFeaturedPity)
	pity = newPity
	fourStarFeaturedPity = newFourStarFeaturedPity

	return pulledBatch
end

gachaSystemPull.OnServerInvoke = function(player, rollcount)
	local pulledCharacters = pullCharacter(rollcount)
	local playerData = SessionData:GetPlayerData(player.UserId)
	if not playerData then
		warn("No player data found for", player.Name)
		return
	end

	for _, pulled in ipairs(pulledCharacters) do
		for _, char in ipairs(playerData.playerCharacter) do
			if char.name == pulled then
				if not char.unlocked then
					char.unlocked = true
					char.infusion = 0
					print(player.Name .. " unlocked " .. pulled)
				else
					char.infusion = (char.infusion or 0) + 1
					print(player.Name .. " gained an infusion for " .. pulled .. " (now " .. char.infusion .. ")")
				end
				break
			end
		end
	end

	return pulledCharacters
end
