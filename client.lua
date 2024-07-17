-- Initialize Config
local Config = Config or {}

local hasPlayerLoaded = false
CreateThread(function()
	Wait(10000)
	hasPlayerLoaded = true
end)

-- Client event to handle gavel sounds
RegisterNetEvent('zogavel:play_gavel_sound', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = soundFile,
            transactionVolume = soundVolume
        })
    end
end)

-- Set ox_target BoxZone
exports.ox_target:addBoxZone({
    coords = Config.gavelLocation, 
    size = vec3(1, 1, 1),
    rotation = 45,
    debug = false,
    options = {
        {
            -- groups = "judge", -- ADD PROPER JOB NAME
            name = "Gavel",
            event = "zogavel:play_gavel_sound_server",
            icon = "fa-solid fa-gavel",
            label = "Gavel - one time",
            soundType = "one"
        },
        {
            -- groups = "judge", -- ADD PROPER JOB NAME
            name = "Gavel",
            event = "zogavel:play_gavel_sound_server",
            icon = "fa-solid fa-gavel",
            label = "Gavel - three times",
            soundType = "three"
        }
    }
})

-- EventHandler for clicking inside of the BoxZone
AddEventHandler("zogavel:play_gavel_sound_server", function(targetData)
    TriggerServerEvent('zogavel:play_gavel_sound', targetData.soundType)

end)