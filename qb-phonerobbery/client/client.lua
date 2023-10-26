local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = 0
local smashing = false

function PoliceCall()
    local chance = 75
    if GetClockHours() >= 0 and GetClockHours() <= 6 then
        chance = 50
    end
    if math.random(1, 100) <= chance then
    --     TriggerServerEvent('police:server:policeAlert', Lang:t("phonerobbery.police_notification"))
    end
end

local function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
		RequestNamedPtfxAsset("scr_jewelheist")
    end
end    

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Event para roubar vitrines
RegisterNetEvent('qb-phonerobbery:client:startStealing')
AddEventHandler("qb-phonerobbery:client:startStealing", function(vitrineKey, entity)
    local pos = GetEntityCoords(PlayerPedId())
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
    QBCore.Functions.TriggerCallback("qb-phonerobbery:CooldownVitrines", function(cooldown)
        if not cooldown and CurrentCops >= Config.requiredCopsCount then
            smashing = true
            CreateThread(function()
                while smashing do
                    loadAnimDict("missheist_jewel")
                    TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
                    Wait(500)
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
                    loadParticle()
                    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                    Wait(2500)
                end
            end)
        QBCore.Functions.Progressbar("vitrine", Lang:t("phonerobbery.animation_searching"), Config.searchTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {}, {}, {}, function() 
            local playerPed = PlayerPedId()
            local success = exports['qb-lock']:StartLockPickCircle(5,13)
            if success then
                PoliceCall()
                smashing = false
                TriggerServerEvent("qb-phonerobbery:server:getVitrineItems", vitrineKey)
                exports['ps-dispatch']:PhoneStoreRobbery()
                TriggerServerEvent('qb-phonerobbery:Server:CooldownVitrines', vitrineKey)
                StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
                ClearPedTasks(playerPed)
            else
                smashing = false
                QBCore.Functions.Notify(Lang:t("phonerobbery.error_failed"), "error")
                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                ClearPedTasks(playerPed)
            end
        end)
        elseif cooldown then
            QBCore.Functions.Notify(Lang:t("phonerobbery.error_cooldown"))
        else
            QBCore.Functions.Notify(Lang:t("phonerobbery.error_no_police"))
        end
    end, vitrineKey)
end)
