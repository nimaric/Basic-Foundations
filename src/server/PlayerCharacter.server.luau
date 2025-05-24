local playerData = require(game.ServerStorage.Storage.PlayerData) :: any
print(playerData)

print("Trying to switch to a locked character...")
playerData:switchCharacter("Stristya")

playerData:unlockCharacter("Stristya")

playerData:switchCharacter("Stristya")

local associated_data = playerData:getPlayerCharacterData()

print(playerData.currentCharacter .. " Associated data: ", associated_data)
