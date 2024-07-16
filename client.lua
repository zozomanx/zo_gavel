-- Coords to the Gavel
local Gavel = vec3(206.6300, -407.0976, 48.8915) -- CHANGE TO PROPER COORDS / DESK IN COURTROOM

-- Client event for gavel_one
RegisterNetEvent('zogavel:gavel_one')
AddEventHandler('zogavel:gavel_one', function(MaxDistance, SoundFileOne, SoundVolume)
    if(CalcDistance() <= MaxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = SoundFileOne,
            transactionVolume   = SoundVolume
        })
    end
end)

-- Client event for gavel_one
RegisterNetEvent('zogavel:gavel_three')
AddEventHandler('zogavel:gavel_three', function(MaxDistance, SoundFileThree, SoundVolume)
    if(CalcDistance() <= MaxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = SoundFileThree,
            transactionVolume   = SoundVolume
        })
    end
end)

-- Calculate the distance from the Gavel and the player
function CalcDistance()
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = Gavel
    local DistIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)

    return DistIs
end


-- Set ox_target BoxZone
exports.ox_target:addBoxZone(
    {
        coords = vec3(Gavel), 
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = false,
        options = {
            {
                name = "Gavel",
                event = "zogavel:gavel_one_server",
                icon = "fa-solid fa-gavel",
                label = "Gavel - once" --,
                -- groups = "judge" -- ADD PROPER JOB NAME
            },
            {
                name = "Gavel",
                event = "zogavel:gavel_three_server",
                icon = "fa-solid fa-gavel",
                label = "Gavel - three" --,
                -- groups = "judge" -- ADD PROPER JOB NAME
            }
        }
    }
)

-- EventHandler for clicking inside of the BoxZone for gavel_one
AddEventHandler(
    "zogavel:gavel_one_server",
    function()
        TriggerServerEvent('zogavel:gavel_one', GetPlayerServerId(PlayerId()))
    end
)

-- EventHandler for clicking inside of the BoxZone for gavel_three
AddEventHandler(
    "zogavel:gavel_three_server",
    function()
        TriggerServerEvent('zogavel:gavel_three', GetPlayerServerId(PlayerId()))
    end
)