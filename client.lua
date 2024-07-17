-- Initialize config
local Config = Config or {}

-- Client event to handle gavel sounds
RegisterNetEvent('zogavel:play_gavel_sound', function(SoundFile, SoundVolume)
    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = SoundFile,
        transactionVolume = SoundVolume
    })
end)

-- Set ox_target BoxZone
exports.ox_target:addBoxZone({
    coords = Config.GavelLocation, 
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
            SoundType = "one"
        },
        {
            -- groups = "judge", -- ADD PROPER JOB NAME
            name = "Gavel",
            event = "zogavel:play_gavel_sound_server",
            icon = "fa-solid fa-gavel",
            label = "Gavel - three times",
            SoundType = "three"
        }
    }
})

-- EventHandler for clicking inside of the BoxZone
AddEventHandler("zogavel:play_gavel_sound_server", function(Target_Data)
    TriggerServerEvent('zogavel:play_gavel_sound', Target_Data.SoundType)

end)