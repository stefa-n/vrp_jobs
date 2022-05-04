fx_version "adamant"
game "gta5"
client_scripts {
   "lib/Tunnel.lua",
   "lib/Proxy.lua", 
   "./client/cl_miner.lua",
   "./client/cl_padurar.lua",
   "./client/cl_jafammo.lua",
   "./client/cl_jafatm.lua",
   "./client/cl_drugs.lua"
}

server_scripts {
   "@vrp/lib/utils.lua", 
   "./server/sv_miner.lua",
   "./server/sv_padurar.lua",
   "./client/sv_jafammo.lua",
   "./client/sv_jafatm.lua",
   "./server/sv_drugs.lua"
}