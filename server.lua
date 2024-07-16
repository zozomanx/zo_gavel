local MaxDistance = 25
local SoundVolume = 1
local SoundFileOne = 'gavel_one'
local SoundFileThree = 'gavel_three'

RegisterNetEvent('zogavel:gavel_one')
AddEventHandler('zogavel:gavel_one', function()
    -- Debug
    --[[print('Got client request for zogavel:gavel_one')
    print('Max distance '.. MaxDistance)
    print('soundFile ' .. SoundFileOne)
    print('soundVolume ' .. SoundVolume)
    print ('source ' .. source) ]]
    TriggerClientEvent('zogavel:gavel_one', -1, MaxDistance, SoundFileOne, SoundVolume)
end)

RegisterNetEvent('zogavel:gavel_three')
AddEventHandler('zogavel:gavel_three', function()
    -- Debug
    --[[print('Got client request for zogavel:gavel_three')
    print('Max distance '.. MaxDistance)
    print('soundFile ' .. SoundFileThree)
    print('soundVolume ' .. SoundVolume)
    print ('source ' .. source) ]]
    TriggerClientEvent('zogavel:gavel_three', -1, MaxDistance, SoundFileThree, SoundVolume)
end)