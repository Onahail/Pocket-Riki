--[[
Pocket Riki
- Aghanim's Upgrade
- Allows Riki to enter allied players inventory
- If riki is in ally inventory, player recieves rikis level of invis and backstab
- Backstab agi multiplier being changed to main hero attribute
- Riki can be sold for death value gold
- Consumed to increase HP and Mana (Kills riki, temp buff while riki is dead)
- On revival all buffs are removed from the player
- If hero dies with Riki, Riki is xferred to closest flying courier, if no courier exists, one is purchased and Riki loses 120 gold, courier then spawns in base with riki in inventory
- Courier holding Riki gains Rikis invis
- Only way to return from item form is consumation or selling
]]--





if PocketRiki == nil then
	_G.PocketRiki = class({})
end


function PocketRiki:Init()

	print("Initiating PocketRiki")
	print("What the fuck have you done")
	
	ListenToGameEvent('dota_item_purchased', Dynamic_Wrap(PocketRiki, 'OnItemCombined'), self)
	
end

function CheckInventory(event)
	local caster = event.caster
	local target = event.target
	if target:GetNumItemsInInventory() == 6 then
		caster:Hold()
	end
end

function TurnToItem(event)
	local caster = event.caster
	local target = event.target
	target:AddItem(CreateItem("item_pocket_riki", target, target)
