local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local systemQuest = require(ServerStorage.Storage.SystemQuest)
local getStatValueFunction = ReplicatedStorage:WaitForChild("GetQuestDataFunction")
getStatValueFunction.OnServerInvoke = function(requestId)
	for _, quests in pairs(systemQuest.quests) do
		if quests.id == tonumber(requestId) then
			return quests
		end
	end
	print("Quest not found for ID:", requestId)
	return nil
end

print("Test")
