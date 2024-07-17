-- Initialize config
local Config = Config or {}

-- Server event to handle gavel sounds
RegisterNetEvent('zogavel:play_gavel_sound', function(soundType)
    local SoundFile
    if soundType == "one" then
        SoundFile = Config.SoundFileOne
    elseif soundType == "three" then
        SoundFile = Config.SoundFileThree
    end

    for key, value in ipairs(NearbyPlayers(nearbyPlayers)) do
        TriggerClientEvent('zogavel:play_gavel_sound', value.id, SoundFile, Config.SoundVolume)
    end
    
end)

function NearbyPlayers()
    local nearbyPlayers = lib.getNearbyPlayers(Config.GavelLocation, Config.MaxDistance) -- Example distance
    return nearbyPlayers
end