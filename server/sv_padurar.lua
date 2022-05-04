local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_padurar")

RegisterServerEvent('vrp_padurar:primestebani')
AddEventHandler('vrp_padurar:primestebani', function()
    local player = source
    local user_id = vRP.getUserId({player})

    if user_id ~= nil then
        vRP.giveMoney({user_id, 5})
    end
end)