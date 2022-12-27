ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

Citizen.CreateThread(function()
    while true do
    local entity, Distance = ESX.Game.GetClosestObject(Config.Vuilnisbak)
        if DoesEntityExist(entity) and Distance <= 1.5 then
            local coords = GetEntityCoords(entity)
            ESX.Game.Utils.DrawText3D(coords + vector3(0.0, 0.0, 0.9), "[~g~E~s~] Ga in de prullenbak zitten", 0.7)
            if IsControlJustReleased(0, 38) then
                print(("entity: %s"):format(entityw))
            OpenVuilnisbak()
        end
    end
        Citizen.Wait(0)
    end
end)

function OpenVuilnisbak()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.Wait(5000)
    ESX.ShowNotification("Je zit voor ~b~20~s~ seconden in de prullenbak")
    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.7, -0.90))
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(GetPlayerPed(-1), false, false)
    SetFollowPedCamViewMode(4)
    SetEntityInvincible(GetPlayerPed(), true)
    Citizen.Wait(15000)
    ESX.ShowNotification("Je moet nog ~b~5~s~ seconden in de vuilnisbak blijven zitten")
    Citizen.Wait(1000)
    ESX.ShowNotification("Je moet nog ~b~4~s~ seconden in de vuilnisbak blijven zitten")
    Citizen.Wait(1000)
    ESX.ShowNotification("Je moet nog ~b~3~s~ seconden in de vuilnisbak blijven zitten")
    Citizen.Wait(1000)
    ESX.ShowNotification("Je moet nog ~b~2~s~ seconden in de vuilnisbak blijven zitten")
    Citizen.Wait(500)
    ESX.ShowNotification("Je moet nog 1 seconden in de vuilnisbak blijven zitten")
    Citizen.Wait(1000)
    ESX.ShowNotification("Je bent uit de prullenbak gesprongen!")
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.75))
    SetFollowPedCamViewMode(1)
    SetEntityVisible(GetPlayerPed(-1), true, false)
    SetEntityInvincible(GetPlayerPed(), false)
    Citizen.Wait(500)
    ClearPedTasks(PlayerPedId())
end