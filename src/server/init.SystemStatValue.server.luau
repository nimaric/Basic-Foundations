local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

-- Reference the SystemRecords module
local systemRecords = require(ServerStorage.Storage.SystemRecords)

-- Create a RemoteFunction (add it in ReplicatedStorage via the Explorer)
local getStatValueFunction = ReplicatedStorage:WaitForChild("GetStatValueFunction")

-- Handle client requests for stats
getStatValueFunction.OnServerInvoke = function(statName)
	for _, stat in pairs(systemRecords.systemStatInfo) do
		if stat.name == statName then
			return stat.value
		end
	end
	return nil -- Return nil if no match is found
end
