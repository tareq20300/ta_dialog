fx_version 'cerulean'

game "gta5"

author "ta"
version '1.0.0'
description 'ta Ped Dialog.'

use_experimental_fxv2_oal 'yes'
lua54 'yes'

ui_page 'build/index.html'


client_script {
    'data/config.lua',
    'client/utils.lua',
    'client/camera.lua',
    'client/client.lua',
}

files {
    'build/**',
}
--حقوق:  https://discord.gg/xHENuFcd45
