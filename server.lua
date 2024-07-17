-- Initialize Config
local Config = Config or {}

-- Server event to handle gavel sounds
RegisterNetEvent('zogavel:play_gavel_sound', function(soundType)
    local soundFile
    if soundType == "one" then
        soundFile = Config.soundFileOne
    elseif soundType == "three" then
        soundFile = Config.soundFileThree
    end

    for key, value in ipairs(NearbyPlayers()) do
        TriggerClientEvent('zogavel:play_gavel_sound', value.id, soundFile, Config.soundVolume)
    end
end)

function NearbyPlayers()
    local nearbyPlayers = lib.getNearbyPlayers(Config.gavelLocation, Config.maxDistance) -- Example distance
    return nearbyPlayers
end