NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others


data.raw.item["alien-artifact"].subgroup = "Materials"

--- Bob's Enemies
if NEConfig.mod.BobEnemies and NEConfig.ExtraLoot then
data:extend(
{
	  {
		type = "recipe",
		name = "alien-artifact-from-small",
		result = "alien-artifact",
		ingredients =
		{
		  {"small-alien-artifact", 100}
		},
		energy_required = 5,
		enabled = "true",
		category = "crafting"
	  },
})
end

  --- SupremeWarfare_1.0.5
if NEConfig.mod.SupremeWarfare and NEConfig.ExtraLoot then

data:extend(
{
	{
		type = "recipe",
		name = "alien-artifact",
		result= "alien-artifact",
		ingredients= { {"small-alien-artifact", 100} },
		energy_required= 5,
		enabled= "true",
		category= "crafting"
  },
  
})
end


function Add_Poison_Resist(Raw,Percent)
	local Resist = {type = "poison",percent = Percent}
	for i,d in pairs(Raw) do
		if d.resistances ==nil then d.resistances={} end
		table.insert(d.resistances, Resist)
	end
end

function Add_Acid_Resist(Raw,Percent)
	local Resist = {type = "acid",percent = Percent}
	for i,d in pairs(Raw) do
		if d.resistances ==nil then d.resistances={} end
		table.insert(d.resistances, Resist)
	end
end


if NEConfig.Spawners then
	--Add resistances to entities.
	Add_Poison_Resist(data.raw["wall"],50)
	Add_Poison_Resist(data.raw["gate"],50)
	Add_Poison_Resist(data.raw["car"],50)
	Add_Poison_Resist(data.raw["electric-pole"],50)
	Add_Poison_Resist(data.raw["turret"],50)	
	Add_Poison_Resist(data.raw["ammo-turret"],50)	
	Add_Poison_Resist(data.raw["electric-turret"],50)	
	Add_Poison_Resist(data.raw["rail"],50)	
	Add_Poison_Resist(data.raw["transport-belt"],50)
	
	Add_Acid_Resist(data.raw["wall"],25)
	Add_Acid_Resist(data.raw["gate"],25)
	Add_Acid_Resist(data.raw["car"],25)
	Add_Acid_Resist(data.raw["electric-pole"],25)
	Add_Acid_Resist(data.raw["turret"],25)	
	Add_Acid_Resist(data.raw["ammo-turret"],25)	
	Add_Acid_Resist(data.raw["electric-turret"],25)	
	Add_Acid_Resist(data.raw["rail"],25)	
	Add_Acid_Resist(data.raw["transport-belt"],25)
	
	
end


