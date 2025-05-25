local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local createPlayerData = require(game.ServerStorage.Storage.CreatePlayerData)

local DELETE_DATA_UPON_LEAVING = false -- DEFAULT: false (DANGEROUS)

local playerDataStore = {}
local playerDataStoreDS = DataStoreService:GetDataStore("PlayerDataStore") -- Name your DataStore

playerDataStore.version = "1.0.0" -- Game Version

Players.PlayerAdded:Connect(function(player)
	-- Try to load data from DataStore
	local data
	local success, err = pcall(function()
		data = playerDataStoreDS:GetAsync(tostring(player.UserId))
	end)
	if success and data then
		data.version = tostring(data.version) -- If Version is nil
		print("Loaded data for", player.Name, "Player Data: ", data)
		print("File Version: " .. data.version)
		-- MIGRATION: Add new characters when loading old version
		local BASE_CHARACTER_DATA = require(game.ServerStorage.Storage.characters.BaseCharacterData)
		local existingNames = {}
		for _, char in ipairs(data.playerCharacter or {}) do
			existingNames[char.name] = true
		end
		for name, charData in pairs(BASE_CHARACTER_DATA) do
			if not existingNames[name] then
				table.insert(data.playerCharacter, {
					name = name,
					unlocked = (name == "Rheon"), -- Only Rheon unlocked by default
					level = data.level,
					infusion = data.infusion,
					weapon_equipped = data.weapon_equipped,
					weapon_type = data.weapon_type,
					associated_data = data.associated_data and table.clone(data.associated_data) or nil, -- Make a copy for this player
					rating = data.rating,
				})
				print("Added new character to player data:", name)
			end
		end
		local BASE_GENERAL_DATA = require(game.ServerStorage.Storage.BaseGeneralData)
		data.generalData = data.generalData or {}

		for key, value in pairs(BASE_GENERAL_DATA) do
			if data.generalData[key] == nil then
				data.generalData[key] = value
				print("Added new field to generalData:", key, value)
			end
		end
		if data.version ~= playerDataStore.version then
			print("Previous Version:", playerDataStore.version("New Verion: "), data.version)
		else
			print("Current Verion: ", data.version)
		end

		data.version = playerDataStore.version or nil
		playerDataStore[player.UserId] = data
	else
		playerDataStore[player.UserId] = createPlayerData()
		print("Created new data for", player.Name, "Player Data: ", data)
	end
end)

if DELETE_DATA_UPON_LEAVING == true then
	Players.PlayerRemoving:Connect(function(player)
		local data = playerDataStore[player.UserId]
		if data then
			-- To reset/remove data, use RemoveAsync instead of SetAsync:
			local success, err = pcall(function()
				playerDataStoreDS:RemoveAsync(tostring(player.UserId))
			end)
			if success then
				print("REMOVED DATA FOR", player.Name)
			else
				warn("Failed to REMOVE data for", player.Name, err)
			end
			playerDataStore[player.UserId] = nil
		end
	end)
elseif DELETE_DATA_UPON_LEAVING == false then
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
end

local SessionData = {}

function SessionData:GetPlayerData(userId)
	return playerDataStore[userId]
end

return SessionData
