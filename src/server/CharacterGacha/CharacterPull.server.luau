local characterRolling = require(game.ServerScriptService.Server.CharacterGacha.CharacterRolling)
local gachaSystemPull = game.ReplicatedStorage.GachaSystemPull
local SessionData = require(game.ServerScriptService.Server.SessionData)
-- gachaSystemPull is a RemoteFunction

gachaSystemPull.OnServerInvoke = function(player, rollcount)
	local playerData = SessionData:GetPlayerData(player.UserId)
	local pity = playerData.pity -- Current pity count
	local fourStarFeaturedPity = playerData.fourStarFeaturedPity -- Current 4-star pity count
	local pulledBatch, newPity, newFourStarFeaturedPity =
		characterRolling.rollCharacter(rollcount, pity, fourStarFeaturedPity)

	playerData.pity = newPity
	playerData.fourStarFeaturedPity = newFourStarFeaturedPity

	if not playerData then
		warn("No player data found for", player.Name)
		return
	end

	for _, pulled in ipairs(pulledBatch) do
		for _, char in ipairs(playerData.playerCharacter) do
			if char.name == pulled then
				if not char.unlocked then
					char.unlocked = true
					char.infusion = 0
					print(player.Name .. " unlocked " .. pulled)
				elseif char.infusion >= 6 then
					char.infusion = 6
					print(pulled, "is already at the highest infusion level!", "( ", char.infusion .. ")")
					-- Compensation for extra copies
				else
					char.infusion = (char.infusion or 0) + 1
					print(player.Name .. " gained an infusion for " .. pulled .. " (now " .. char.infusion .. ")")
				end
			end
		end
	end

	return pulledBatch
end
