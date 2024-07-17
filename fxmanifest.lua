fx_version 'cerulean'
game        'gta5'
lua54       'yes'
author      'zozoman'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page {
    'nui/sound.html'

}

files {
    'nui/sound.html',
    'nui/sounds/*.ogg'
}