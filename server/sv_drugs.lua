local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_drugs")

RegisterServerEvent('vrp_drugs:primesteitem')
AddEventHandler('vrp_drugs:primesteitem', function()
    local player = source
    local user_id = vRP.getUserId({player})

    if vRP.tryGetInventoryItem({user_id,"cocainan",5}) then
        vRP.giveInventoryItem({user_id,"cocaina",1})
    else
        vRPclient.notify(player,{"~r~Nu ai suficiente cocaina!"})
    end
end)

RegisterServerEvent('vrp_drugs:startDelivery')
AddEventHandler('vrp_drugs:startDelivery', function()
    local player = source
    local user_id = vRP.getUserId({player})

    if vRP.getInventoryItemAmount({user_id,"cocaina"}) >= 1 then
        TriggerClientEvent('vrp_drugs:giveDelivery2', player)
    else
        TriggerClientEvent('vrp_drugs:giveDelivery', player)
    end
end)

RegisterServerEvent('vrp_drugs:endDelivery2')
AddEventHandler('vrp_drugs:endDelivery2', function()
    local player = source
    local user_id = vRP.getUserId({player})

    local amount = vRP.getInventoryItemAmount({user_id,"cocaina"})

    if vRP.tryGetInventoryItem({user_id,"cocaina", amount}) then
        Citizen.Wait(100)
        vRP.giveInventoryItem({user_id,"dirty_money",50 * amount})
    end
end)

RegisterServerEvent('vrp_drugs:endDelivery', player)
AddEventHandler('vrp_drugs:endDelivery', function()
    local player = source
    local user_id = vRP.getUserId({player})

    vRP.giveInventoryItem({user_id, "cocainan", 60})

    TriggerClientEvent('vrp_drugs:endDeliveryClient', player)
end)
