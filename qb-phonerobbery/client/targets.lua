local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function ()
    for vitrineKey, vitrine in pairs(Config.phoneVitrines) do
        exports['qb-target']:AddBoxZone(vitrine.name, vitrine.coords, vitrine.length, vitrine.width, {
            name = vitrine.name,
            heading = vitrine.heading,
            debugPoly = Config.DebugPoly,
        }, {
            options = {
                {
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent("qb-phonerobbery:client:startStealing", vitrineKey, entity)
                    end,    
                    item = Config.requiredItem,          
                    icon = vitrine.target_icon,
                    label = Lang:t(vitrine.target_label)
                },
            },
            distance = Config.boxDistance
        })
    end
end)
