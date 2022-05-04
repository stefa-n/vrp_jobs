local closestMarkerx, closestMarkery, closestMarkerz

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_HATCHET"), false) and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -643.75103759766, 5241.9296875, 75.237976074219, true) <= 50 then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -643.75103759766, 5241.9296875, 75.237976074219, true) <= 50 then
                DrawMarker(27, -643.75103759766, 5241.9296875, 75.237976074219, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -663.80554199219,5277.1689453125,74.305671691895, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -646.72546386719,5268.5297851562,74.091217041016, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -605.2099609375,5243.6875,71.425407409668, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -601.19329833984,5240.2353515625,71.55069732666, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -647.88763427734,5278.7177734375,71.631942749023, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -633.98620605469,5274.5771484375,69.424018859863, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
                DrawMarker(27, -628.77325439453,5284.93359375,64.418251037598, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closestMarkerx, closestMarkery, closestMarkerz, true) <= 1 and _G.isMining == false then
                if(IsControlJustPressed(0, 38)) then
                    _G.isMining = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true)

                    _G.numberOfClicks = 14
                    Citizen.Wait(1000)
                end
            end
        else
            Citizen.Wait(1000)
        end

        if IsControlJustPressed(0, 24) and _G.isMining then
            if(_G.numberOfClicks > 0) then
                _G.numberOfClicks = _G.numberOfClicks - 1
                Citizen.Wait(1000)
            else
                SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)

                _G.isMining = false
                TriggerEvent('dp:playEmote', 'phonecall')
                exports.rprogress:Start("Suni la firma de taiat lemne", 10000)

                SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_HATCHET'), true)

                TriggerServerEvent('vrp_padurar:primestebani')

                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('dp:stopEmote') 
            end
        end

    end
end)

Citizen.CreateThread(function()
    while true do
            Citizen.Wait(3000)

            dst0 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -643.75103759766, 5241.9296875, 75.237976074219, true)
            dst1 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -663.80554199219,5277.1689453125,74.305671691895, true)
            dst2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -646.72546386719,5268.5297851562,74.091217041016, true)
            dst3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -605.2099609375,5243.6875,71.425407409668, true)
            dst4 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -601.19329833984,5240.2353515625,71.55069732666, true)
            dst5 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -647.88763427734,5278.7177734375,71.631942749023, true)
            dst6 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -633.98620605469,5274.5771484375,69.424018859863, true)
            dst7 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -628.77325439453,5284.93359375,64.418251037598, true)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -643.75103759766, 5241.9296875, 75.237976074219, true) <= 50 then
            if dst0 < dst1 then
                if dst0 < dst2 then
                    if dst0 < dst3 then
                        if dst0 < dst4 then
                            if dst0 < dst5 then
                                if dst0 < dst6 then
                                    if dst0 < dst7 then
                                        closestMarkerx = -643.75103759766
                                        closestMarkery = 5241.9296875
                                        closestMarkerz = 75.237976074219
                                    end
                                end
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
                                if dst1 < dst6 then
                                    if dst1 < dst7 then
                                        closestMarkerx = -663.80554199219
                                        closestMarkery = 5277.1689453125
                                        closestMarkerz = 74.305671691895
                                    end
                                end
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
                                if dst2 < dst6 then
                                    if dst2 < dst7 then
                                        closestMarkerx = -646.72546386719
                                        closestMarkery = 5268.5297851562
                                        closestMarkerz = 74.091217041016
                                    end
                                end
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
                                if dst3 < dst6 then
                                    if dst3 < dst7 then
                                        closestMarkerx = -605.2099609375
                                        closestMarkery = 5243.6875
                                        closestMarkerz = 71.425407409668
                                    end
                                end
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
                                if dst4 < dst6 then
                                    if dst4 < dst7 then
                                        closestMarkerx = -601.19329833984
                                        closestMarkery = 5240.2353515625
                                        closestMarkerz = 71.55069732666
                                    end
                                end
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
                                if dst5 < dst6 then
                                    if dst5 < dst7 then
                                        closestMarkerx = -647.88763427734
                                        closestMarkery = 5278.7177734375
                                        closestMarkerz = 71.631942749023
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if dst6 < dst0 then
                if dst6 < dst1 then
                    if dst6 < dst2 then
                        if dst6 < dst3 then
                            if dst6 < dst4 then
                                if dst6 < dst5 then
                                    if dst6 < dst7 then
                                        closestMarkerx = -633.98620605469
                                        closestMarkery = 5274.5771484375
                                        closestMarkerz = 69.424018859863
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if dst7 < dst0 then
                if dst7 < dst1 then
                    if dst7 < dst2 then
                        if dst7 < dst3 then
                            if dst7 < dst4 then
                                if dst7 < dst5 then
                                    if dst7 < dst6 then
                                        closestMarkerx = -628.77325439453
                                        closestMarkery = 5284.93359375
                                        closestMarkerz = 64.418251037598
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
