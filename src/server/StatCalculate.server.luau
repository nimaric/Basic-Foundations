local ServerStorage = game:GetService("ServerStorage")

local systemRecords = require(ServerStorage.Storage.SystemRecords)

for _, stat in pairs(systemRecords.systemStatInfo) do
	if stat.name == "Strength" then
		return stat.value
	end
end
