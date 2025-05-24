local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local createPlayerData = require(game.ServerStorage.Storage.PlayerData)

local playerDataStore = {}
local playerDataStoreDS = DataStoreService:GetDataStore("PlayerDataStore") -- Name your DataStore

Players.PlayerAdded:Connect(function(player)
	-- Try to load data from DataStore
	local data
	local success, err = pcall(function()
		data = playerDataStoreDS:GetAsync(tostring(player.UserId))
	end)
	if success and data then
		-- MIGRATION: Add any new characters to existing player data
		local CharacterData = require(game.ServerStorage.Storage.characters.CharacterData)
		data.playerCharacter = data.playerCharacter or {}
		local existingNames = {}
		for _, char in ipairs(data.playerCharacter) do
			existingNames[char.name] = true
		end
		for name, charData in pairs(CharacterData) do
			if not existingNames[name] then
				table.insert(data.playerCharacter, {
					name = name,
					unlocked = false,
					weapon_equipped = charData.default_weapon,
					associated_data = nil, -- You can set this up as needed
				})
				print("Added new character to player data:", name)
			end
		end
		playerDataStore[player.UserId] = data
		print("Loaded data for", player.Name)
	else
		playerDataStore[player.UserId] = createPlayerData()
		print("Created new data for", player.Name)
	end
end)

Players.PlayerRemoving:Connect(function(player)
	local data = playerDataStore[player.UserId]
	if data then
		local success, err = pcall(function()
			playerDataStoreDS:SetAsync(tostring(player.UserId), data)
		end)
		if success then
			print("Saved data for", player.Name, "serializableData: ", data)
		else
			warn("Failed to save data for", player.Name, err)
		end
		playerDataStore[player.UserId] = nil
	end
end)

local SessionData = {}

function SessionData:GetPlayerData(userId)
	return playerDataStore[userId]
end

return SessionData
