local QBCore = exports['qb-core']:GetCoreObject()
local Cooldown = {}

RegisterServerEvent('qb-phonerobbery:server:getVitrineItems', function(vitrineKey) 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local vitrine = Config.phoneVitrines[vitrineKey]
    local itemFound = false
    for i = 1, #vitrine.items do
        local quantity = math.random(vitrine.items[i].minQuantity, vitrine.items[i].maxQuantity)
        if Player.Functions.AddItem(vitrine.items[i].item, quantity) then
            itemFound = true
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[vitrine.items[i].item], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'phonerobbery', 'phone Robbery', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. '**')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("phonerobbery.error_inventory"), 'error')
        end  
    end

    if not itemFound then
        TriggerClientEvent('QBCore:Notify', src, 'This is empty...', 'error')
    end
end)



-- Cooldown
RegisterServerEvent('qb-phonerobbery:Server:CooldownVitrines')
AddEventHandler('qb-phonerobbery:Server:CooldownVitrines', function(vitrineKey)
    if not Cooldown[vitrineKey] then
        Cooldown[vitrineKey] = true
        CreateThread(function()
            Wait(Config.cooldownTimer)
            Cooldown[vitrineKey] = false
        end)
    end
end)

QBCore.Functions.CreateCallback("qb-phonerobbery:CooldownVitrines",function(source, cb, vitrineKey)
    cb(Cooldown[vitrineKey])
end)
