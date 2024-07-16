-- Coords to the Gavel
local Gavel = vec3(206.6300, -407.0976, 48.8915) -- CHANGE TO PROPER COORDS / DESK IN COURTROOM

RegisterNetEvent('zogavel:gavel_one')
AddEventHandler('zogavel:gavel_one', function(MaxDistance, SoundFileOne, SoundVolume)
    -- Debug
    --[[     print('Server source ' .. PlayerNetId)
    print('Maxdistance ' .. MaxDistance)
    print('distIs ' .. DistIs)
    print('eCoords ' .. eCoords)
    print('lCoords ' .. lCoords) ]]

    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = Gavel
    local DistIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)

    if(DistIs <= MaxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = SoundFileOne,
            transactionVolume   = SoundVolume
        })
    end
end)

RegisterNetEvent('zogavel:gavel_three')
AddEventHandler('zogavel:gavel_three', function(MaxDistance, SoundFileThree, SoundVolume)
    -- Debug
    --[[     print('Server source ' .. PlayerNetId)
    print('Maxdistance ' .. MaxDistance)
    print('lCoords ' .. lCoords)
    print('eCoords ' .. eCoords)
    print('distIs ' .. DistIs) ]]

    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = Gavel
    local DistIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    
    if(DistIs <= MaxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = SoundFileThree,
            transactionVolume   = SoundVolume
        })
    end
end)


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

-- EventHandler for clicking inside of the BoxZone
AddEventHandler(
    "zogavel:gavel_one_server",
    function()
        TriggerServerEvent('zogavel:gavel_one', GetPlayerServerId(PlayerId()))
    end
)

-- EventHandler for clicking inside of the BoxZone
AddEventHandler(
    "zogavel:gavel_three_server",
    function()
        TriggerServerEvent('zogavel:gavel_three', GetPlayerServerId(PlayerId()))
    end
)