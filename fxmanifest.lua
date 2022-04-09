fx_version 'cerulean'

game 'gta5'

author 'Puntzi'

version '1.0.0'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'configuration/config.lua'
}