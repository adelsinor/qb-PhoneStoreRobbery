# qb-phonerobbery

QBCore phone Robbery using qb-target and qb-lock

# install

# ps-dispatch

# 1 ps-dispatch\shared\config.lua
    ['PhoneStoreRobbery'] = {
        radius = 0,
        sprite = 817,
        color = 60,
        scale = 1.5,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'GTAO_FM_Events_Soundset',
        offset = false,
        flash = false
    },
    
# 2 ps-dispatch\client\alerts.lua

local function PhoneStoreRobbery()
    local coords = GetEntityCoords(cache.ped)

    local dispatchData = {
        message = locale('PhoneStoreRobbery'),
        codeName = 'PhoneStoreRobbery',
        code = '10-10',
        icon = 'fab fa-artstation',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        jobs = { 'leo'}
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('PhoneStoreRobbery', PhoneStoreRobbery)

# map install

- jest change the vector3 in config.lua you can use any map you want , am using UncleJust degital map 

# items 

- items already are in qbcore , if you want to add or remove its on you.

# Dependencies:
qb-core: https://github.com/QBCore-framework/qb-core

qb-target: https://github.com/BerkieBb/qb-target

qb-lock: https://github.com/M-Middy/qb-lock


# Discord
https://discord.gg/yXmaPDTS
