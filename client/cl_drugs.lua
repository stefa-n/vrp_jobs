
Citizen.CreateThread(function()
    FreezeEntityPosition(PlayerPedId(), false)

    while true do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1956.9615478516,5180.1826171875,48.060333251953, true) < 10 then
            Citizen.Wait(1)

            local dstM = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closestMarkerx, closestMarkery, closestMarkerz, true)
            if dstM < 3 then
                DrawMarker(27, closestMarkerx, closestMarkery, closestMarkerz, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.5, 255, 255, 255, 130, 0, 0, 2, 0, 0, 0, 0)
            end

            if dstM < 1 then
                if IsControlJustPressed(0, 38) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    TriggerServerEvent('vrp_drugs:primesteitem')
                    _G.isDoingCox = true
                    exports.rprogress:Start("Faci cox", 15000)
                    _G.isDoingCox = false
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            end

            local dstL = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1958.439453125,5179.3461914062,47.983776092529, true)
            if dstL < 3 then
                DrawMarker(0, 1958.439453125,5179.3461914062,47.983776092529, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.5, 255, 255, 255, 130, 0, 0, 2, 0, 0, 0, 0)
            end

            if dstL < 1 then
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('vrp_drugs:startDelivery')
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1956.9615478516,5180.1826171875,48.060333251953, true) < 10 or isDoingCox == false then
            Citizen.Wait(1)

            local dst0 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1955.3061523438, 5180.81640625, 47.98380279541, true)
            local dst1 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1955.3176269531,5179.0815429688,47.983779907227, true)
            local dst2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1952.8154296875,5179.111328125,47.983779907227, true)
            local dst3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1953.1820068359,5180.935546875,47.98380279541, true)
            local dst4 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1951.1079101562,5180.8955078125,47.98380279541, true)
            local dst5 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1951.1798095703,5179.0346679688,47.983798980713, true)

            if dst0 < dst1 then
                if dst0 < dst2 then
                    if dst0 < dst3 then
                        if dst0 < dst4 then
                            if dst0 < dst5 then
                                _G.closestMarkerx = 1955.3061523438
                                _G.closestMarkery = 5180.81640625
                                _G.closestMarkerz = 47.98380279541
                            end
                        end
                    end
                end
            end

            if dst1 < dst0 then
                if dst1 < dst2 then
                    if dst1 < dst3 then
                        if dst1 < dst4 then
                            if dst1 < dst5 then
                                _G.closestMarkerx = 1955.3176269531
                                _G.closestMarkery = 5179.0815429688
                                _G.closestMarkerz = 47.983779907227
                            end
                        end
                    end
                end
            end

            if dst2 < dst0 then
                if dst2 < dst1 then
                    if dst2 < dst3 then
                        if dst2 < dst4 then
                            if dst2 < dst5 then
                                _G.closestMarkerx = 1952.8154296875
                                _G.closestMarkery = 5179.111328125
                                _G.closestMarkerz = 47.983779907227
                            end
                        end
                    end
                end
            end

            if dst3 < dst0 then
                if dst3 < dst1 then
                    if dst3 < dst2 then
                        if dst3 < dst4 then
                            if dst3 < dst5 then
                                _G.closestMarkerx = 1953.1820068359
                                _G.closestMarkery = 5180.935546875
                                _G.closestMarkerz = 47.98380279541
                            end
                        end
                    end
                end
            end

            if dst4 < dst0 then
                if dst4 < dst1 then
                    if dst4 < dst2 then
                        if dst4 < dst3 then
                            if dst4 < dst5 then
                                _G.closestMarkerx = 1951.1079101562
                                _G.closestMarkery = 5180.8955078125
                                _G.closestMarkerz = 47.98380279541
                            end
                        end
                    end
                end
            end

            if dst5 < dst0 then
                if dst5 < dst1 then
                    if dst5 < dst2 then
                        if dst5 < dst3 then
                            if dst5 < dst4 then
                                _G.closestMarkerx = 1951.1798095703
                                _G.closestMarkery = 5179.0346679688
                                _G.closestMarkerz = 47.983798980713
                            end
                        end
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if isdelivering then
            Citizen.Wait(1)
            local dst = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1055.0625,-1952.7730712891,32.094917297363, true)
            if dst < 3 then
                DrawMarker(0, 1055.0625,-1952.7730712891,32.094917297363, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.5, 255, 255, 255, 130, 0, 0, 2, 0, 0, 0, 0)
            end

            if dst < 1 then
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('vrp_drugs:endDelivery')
                end
            end
        end
        if isdeliveringCox then
            Citizen.Wait(1)
            local dst = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2352.5034179688,2523.3696289062,47.689403533936, true)
            if dst < 3 then
                DrawMarker(0, 2352.5034179688,2523.3696289062,47.689403533936, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.5, 255, 255, 255, 130, 0, 0, 2, 0, 0, 0, 0)
            end

            if dst < 1 then
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('vrp_drugs:endDelivery2')
                end
            end
        end

        if not isdeliveringCox and not isdelivering then
            Citizen.Wait(1000)
        end
    end
end)

function IsInVehicle()
    local ply = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ply) then
        return true
    else
        return false
    end
end

RegisterNetEvent('vrp_drugs:giveDelivery')
AddEventHandler('vrp_drugs:giveDelivery', function()
    FreezeEntityPosition(PlayerPedId(), true)
    exports.rprogress:Start("Cauti pe cineva care vinde cox", 30000)

	Citizen.Wait(0)
    
    _G.deliveryblip = (AddBlipForCoord(1055.0625,-1952.7730712891,32.094917297363))
	SetBlipSprite(deliveryblip, 280)
	SetNewWaypoint(1055.0625,-1952.7730712891)
    FreezeEntityPosition(PlayerPedId(), false)

    _G.isdelivering = true
end)

RegisterNetEvent('vrp_drugs:endDeliveryClient')
AddEventHandler('vrp_drugs:endDeliveryClient', function()
    RemoveBlip(deliveryblip)

    if _G.isdelivering then
        _G.isdelivering = false
    else
        _G.isdeliveringCox = false
    end
end)

RegisterNetEvent('vrp_drugs:giveDelivery2')
AddEventHandler('vrp_drugs:giveDelivery2', function()
    FreezeEntityPosition(PlayerPedId(), true)
    exports.rprogress:Start("Cauti pe cineva care cumpara cox", 10000)

    Citizen.Wait(0)
    
    deliveryblip = (AddBlipForCoord(2352.5034179688,2523.3696289062,47.689403533936))
    SetBlipSprite(deliveryblip, 280)
    SetNewWaypoint(2352.5034179688,2523.3696289062)
    FreezeEntityPosition(PlayerPedId(), false)

    _G.isdeliveringCox = true
end)