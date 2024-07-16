-- Max distance you can be to hear sound
local MaxDistance = 25

-- How loud the sound will be 0-1
local SoundVolume = 1

-- Sound file names
local SoundFileOne = 'gavel_one'
local SoundFileThree = 'gavel_three'

-- Server event for gavel_one
RegisterNetEvent('zogavel:gavel_one')
AddEventHandler('zogavel:gavel_one', function()
    TriggerClientEvent('zogavel:gavel_one', -1, MaxDistance, SoundFileOne, SoundVolume)
end)

-- Server event for gavel_three
RegisterNetEvent('zogavel:gavel_three')
AddEventHandler('zogavel:gavel_three', function()
    TriggerClientEvent('zogavel:gavel_three', -1, MaxDistance, SoundFileThree, SoundVolume)
end)