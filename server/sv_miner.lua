local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_miner")

RegisterServerEvent('vrp_miner:primesteitem')
AddEventHandler('vrp_miner:primesteitem', function()
    local player = source
    local user_id = vRP.getUserId({player})

    -- alege intre praf de pusca, aur, fier, cupru, aluminiu, diamant
    local item = math.random(1,6)

    if item == 1 then
        vRP.giveInventoryItem({user_id,"prafdepusca",1})
    end

    if item == 2 then
        vRP.giveInventoryItem({user_id,"aur",1})
    end    
    
    if item == 3 then
        vRP.giveInventoryItem({user_id,"fier",1})
    end
    
    if item == 4 then
        vRP.giveInventoryItem({user_id,"cupru",1})
    end
    
    if item == 5 then
        vRP.giveInventoryItem({user_id,"aluminiu",1})
    end
    
    if item == 6 then
        vRP.giveInventoryItem({user_id,"diamant",1})
    end
end)

arme = {
	["AK-48"] = {"wbody|WEAPON_ASSAULTRIFLE_MK2", "cupru", "fier", "prafdepusca", "ASSAULTRIFLE_MK2"}
}

RegisterServerEvent('vrp_miner:startCrafting')
AddEventHandler('vrp_miner:startCrafting', function()
    local player = source
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
        local menu_arme = {}
        for k, v in pairs(arme) do
            menu_arme[k] = {function(player, choice)
                if vRP.tryGetInventoryItem({user_id, v[2], 1}) and vRP.tryGetInventoryItem({user_id, v[3], 1}) and vRP.tryGetInventoryItem({user_id, v[4], 1}) then
                    vRP.giveInventoryItem({user_id, v[1], 1})
                    TriggerClientEvent("vrp_miner:startCraftingClient", player, v[5])
                end
                vRP.closeMenu({player})
            end, ""}
        end
        vRP.openMenu({player, menu_arme})
    end
end)