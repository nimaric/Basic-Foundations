local SessionData = require(game.ServerScriptService.Server.SessionData) -- Adjust path if needed
local Players = game:GetService("Players")
local systemFunction = game.ReplicatedStorage.SystemFunction

Players.PlayerAdded:Connect(function(player)
	local userId = player.UserId
	print("Player added:", player.Name, "UserId:", userId)

	-- Wait for playerData to be available (with a timeout)
	local playerData
	local tries = 0
	repeat
		playerData = SessionData:GetPlayerData(userId)
		if not playerData then
			tries += 1
			task.wait(0.1)
		end
	until playerData or tries > 50 -- Wait up to 5 seconds

	if not playerData then
		print("No player data found for", player.Name)
	else
		print("Player data loaded for", player.Name)
	end
end)

systemFunction.OnServerInvoke = function(player)
	local userId = player.UserId
	local playerData = SessionData:GetPlayerData(userId)
	return playerData
end
