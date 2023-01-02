local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_miner")
RegisterServerEvent('vrp_miner:primesteitem')
AddEventHandler('vrp_miner:primesteitem', function()
    local player = source
    local user_id = vRP.getUserId({player})
		
    -- Create a table of possible items
    -- Creează o tabelă cu itemi posibili
    local items = {"prafdepusca", "aur", "fier", "cupru", "aluminiu", "diamant"}

    -- Select a random item from the table
    -- Selectează un item aleator din tabelă
    local item = items[math.random(#items)]

    -- Give the player the selected item
    -- Îi dă jucătorului itemul selectat
    vRP.giveInventoryItem({user_id, item, 1})
end)

-- Table that stores information about each weapon that can be crafted.
-- Tabela care stocheaza informatii despre fiecare arma care poate fi fabricata.
arme = {
    ["AK-48"] = {
        -- The name of the item that represents the crafted weapon.
	-- Numele itemului care reprezinta arma fabricata.
        body = "wbody|WEAPON_ASSAULTRIFLE_MK2", 
        -- The names of the items that are required to craft the weapon.
	-- Numele itemurilor care sunt necesare pentru a fabrica arma.
        ingredients = {"cupru", "fier", "prafdepusca"}, 
        -- The display name of the weapon, as it will be shown in the crafting menu.
	-- Numele afisat al armei, asa cum va fi afisat in meniul de fabricare.
        display_name = "ASSAULTRIFLE_MK2"
    }
}

-- Function that checks if a player has the required ingredients to craft a weapon.
-- Returns true if the player has all the ingredients, or false if they are missing any.

-- Functia care verifica daca un jucator are ingredientele necesare pentru a fabrica o arma.
-- Returneaza true daca jucatorul are toate ingredientele, sau false daca lipseste vreunul.
function canCraft(user_id, weapon)
    for _, ingredient in ipairs(weapon.ingredients) do
        -- Check if the player has the current ingredient in their inventory.
        -- If they don't, return false.
	-- Verifica daca jucatorul are ingredientul curent in inventarul sau.
        -- Daca nu, returneaza false.
        if not vRP.tryGetInventoryItem({user_id, ingredient, 1}) then
            return false
        end
    end
    -- If the loop completes, it means the player has all the required ingredients.
    -- Daca bucla se termina, inseamna ca jucatorul are toate ingredientele necesare.
    return true
end

-- Function that crafts a weapon for a player.
-- Removes the required ingredients from the player's inventory and gives them the crafted weapon.
-- Functia care fabrica o arma pentru un jucator.
-- Sterge ingredientele necesare din inventarul jucatorului si ii ofera arma fabricata.
function craftWeapon(player, weapon)
    local user_id = vRP.getUserId({player})
    -- Check if the player is valid and has all the required ingredients.
    -- Verifica daca jucatorul este valid si are toate ingredientele necesare.
    if user_id and canCraft(user_id, weapon) then
        -- Give the player the crafted weapon.
	-- Ofera jucatorului arma fabricata.
        vRP.giveInventoryItem({user_id, weapon.body, 1})
        -- Trigger the client event to start the crafting animation.
	-- Trimite un eveniment client pentru a porni animatia de fabricare.
        TriggerClientEvent("vrp_miner:startCraftingClient", player, weapon.display_name)
    end
    -- Close the crafting menu.
    -- Inchide meniul de fabricare.
    vRP.closeMenu({player})
end

-- Function that opens the crafting menu for a player.
-- Functia care deschide meniul de fabricare pentru un jucator.
function openCraftingMenu(player)
    local menu_arme = {}
    -- Add an entry in the menu for each weapon that can be crafted.
    -- Adauga o intrare in meniu pentru fiecare arma care poate fi fabricata.
    for weapon_name, weapon_info in pairs(arme) do
        menu_arme[weapon_name] = {function(player, choice) craftWeapon(player, weapon_info) end, ""}
    end
    -- Open the menu for the player.
    -- Deschide meniul pentru jucator.
    vRP.openMenu({player, menu_arme})
end

-- Register an event handler for the 'vrp_miner:startCrafting' event.
-- This event is triggered when the player wants to start crafting a weapon.
-- Înregistrați un handler de evenimente pentru evenimentul „vrp_miner:startCrafting”.
-- Acest eveniment este declanșat atunci când jucătorul dorește să înceapă să creeze o armă.
RegisterServerEvent('vrp_miner:startCrafting')
AddEventHandler('vrp_miner:startCrafting', function()
    local player = source
    local user_id = vRP.getUserId({player})
    -- Check if the player is valid.
    -- Verificați dacă playerul este valid.
    if user_id then
        -- Open the crafting menu for the player.
	-- Deschideți meniul de crafting pentru jucător.
        openCraftingMenu(player)
    end
end)
