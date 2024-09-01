fx_version 'cerulean'
game 'gta5'
author 'CodeRed🔴 & CodeBlue🔵'
version '1.0.0'
description 'Made with ❤️'

shared_scripts {
    'config.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    '@menuv/menuv.lua',
    'client.lua',
}

dependency 'menuv'

lua54 'yes'