local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_jafammo")

RegisterServerEvent('vrp_jafarme:daiteme1')
AddEventHandler('vrp_jafarme:daiteme1', function()
    local player = source
    local user_id = vRP.getUserId({player})
    
    if user_id ~= nil then
        vRP.giveInventoryItem({user_id,"wbody|WEAPON_STUNGUN",1})
    end
end)