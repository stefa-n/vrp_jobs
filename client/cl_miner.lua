local display = false

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

RegisterNetEvent('vrp_miner:startCraftingClient')
AddEventHandler('vrp_miner:startCraftingClient', function(weapon)
    TriggerEvent('dp:playEmote', "mechanic")
    FreezeEntityPosition(GetPlayerPed(-1), true)
    exports.rprogress:Start("Craftezi arma", 60000)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon), 200, false, true)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    TriggerEvent('dp:stopEmote')
end)

Citizen.CreateThread(function()
    _G.isMining = false
    while true do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -543.82257080078,1984.3269042969,127.20787811279, true) <= 50 then
            DrawMarker(27, closestMarkerx, closestMarkery, closestMarkerz, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)
        else
            Citizen.Wait(1000)
        end

        if _G.isMining == false then
            if IsControlJustPressed(0, 38) then
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closestMarkerx, closestMarkery, closestMarkerz, true) <= 1 then
                    _G.isMining = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    TriggerEvent('dp:playEmote', 'hammer')
                    
                    _G.numberOfClicks = 14
                    Citizen.Wait(1000)
                end
            end
        end

        if IsControlJustPressed(0, 24) and _G.isMining then
            if(_G.numberOfClicks > 0) then
                _G.numberOfClicks = _G.numberOfClicks - 1
                Citizen.Wait(1000)
            else
                _G.isMining = false
                TriggerEvent('dp:playEmote', 'pick')
                exports.rprogress:Start("Culegi minereurile", 5000)

                TriggerServerEvent('vrp_miner:primesteitem')

                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('dp:stopEmote') 
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -543.82257080078,1984.3269042969,127.20787811279, true) <= 120 then
            Citizen.Wait(0)
            if _G.numberOfClicks ~= nil and _G.numberOfClicks ~= 0 then
                drawTxt((_G.numberOfClicks+1).." lovituri ramase", 1, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        dst0 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -554.11352539062, 1999.7836914062, 127.11241912842, true)
        dst1 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -473.67568969727, 2088.1311035156, 120.02642059326, true)
        dst2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -425.4856262207, 2065.6687011719, 120.17654418945, true)
        dst3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -485.21200561523, 1896.0941162109, 119.94151306152, true)
        dst4 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -527.95886230469, 1894.8952636719, 119.94499206543, true)
        dst5 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -561.31701660156, 1886.5804443359, 123.03346252441, true)

        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -543.82257080078,1984.3269042969,127.20787811279, true) <= 120 then
            if dst0 < dst1 then
                if dst0 < dst2 then
                    if dst0 < dst3 then
                        if dst0 < dst4 then
                            if dst0 < dst5 then
                                _G.closestMarkerx = -554.11352539062
                                _G.closestMarkery = 1999.7836914062
                                _G.closestMarkerz = 127.11241912842
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
                                _G.closestMarkerx = -473.67568969727
                                _G.closestMarkery = 2088.1311035156
                                _G.closestMarkerz = 120.02642059326
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
                                _G.closestMarkerx = -425.4856262207
                                _G.closestMarkery = 2065.6687011719
                                _G.closestMarkerz = 120.17654418945
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
                                _G.closestMarkerx = -485.21200561523
                                _G.closestMarkery = 1896.0941162109
                                _G.closestMarkerz = 119.94151306152
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
                                _G.closestMarkerx = -527.95886230469
                                _G.closestMarkery = 1894.8952636719
                                _G.closestMarkerz = 119.94499206543
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
                                _G.closestMarkerx = -561.31701660156
                                _G.closestMarkery = 1886.5804443359
                                _G.closestMarkerz = 123.03346252441
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

-- Craft arme
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1123.2381591797, -1997.0447998047, 35.439823150635, true) <= 9) then
            DrawMarker(27, 1123.2381591797,-1997.0447998047,35.439823150635, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)
        else
            Citizen.Wait(1000)
        end

        if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1123.2381591797, -1997.0447998047, 35.439823150635, true) <= 1.5) and IsControlJustPressed(0, 38) then
            TriggerServerEvent('vrp_miner:startCrafting')
        end
    end
end)
