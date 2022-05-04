Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        DrawMarker(27, -330.57797241211,6083.8759765625,31.454772949219, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 200, 0, 0, 0, 0)
        if IsControlJustPressed(0, 38) then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -330.57797241211,6083.8759765625,31.454772949219, true) <= 1 then
                if not HasAnimDictLoaded("missheist_jewel") then
                    RequestAnimDict("missheist_jewel") 
                end
                while not HasAnimDictLoaded("missheist_jewel") do 
                    Citizen.Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 1.0, -1.0,-1,1,0,0, 0,0)
                exports.rprogress:Start("Furi arme", 5990)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('vrp_jafarme:daiteme1')
            end
        end
    end
end)