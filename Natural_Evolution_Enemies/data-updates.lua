NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others

--- Difficulty settings	
	if NE_Difficulty == nil then
      NE_Difficulty = 1
	end

	if NEConfig.Set_Difficulty == 1 then
		NE_Difficulty = 1 -- Normal difficulty
		else NE_Difficulty  = 2 -- Hard difficulty
	end


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


function Add_Physical_Resist(Raw,Percent)
	local Resist = {type = "physical",percent = Percent}
	for i,d in pairs(Raw) do
		if d.resistances ==nil then d.resistances={} end
		table.insert(d.resistances, Resist)
	end
end


function Add_Explosion_Resist(Raw,Percent)
	local Resist = {type = "explosion",percent = Percent}
	for i,d in pairs(Raw) do
		if d.resistances ==nil then d.resistances={} end
		table.insert(d.resistances, Resist)
	end
end



if NEConfig.Spawners then
	--Add resistances to entities.
	Add_Poison_Resist(data.raw["wall"],(25/NE_Difficulty))
	Add_Poison_Resist(data.raw["gate"],(25/NE_Difficulty))
	Add_Poison_Resist(data.raw["car"],(25/NE_Difficulty))
	Add_Poison_Resist(data.raw["electric-pole"],100)
	Add_Poison_Resist(data.raw["turret"],(25/NE_Difficulty))	
	Add_Poison_Resist(data.raw["ammo-turret"],(25/NE_Difficulty))	
	Add_Poison_Resist(data.raw["electric-turret"],(25/NE_Difficulty))	
	Add_Poison_Resist(data.raw["straight-rail"],100)	
	Add_Poison_Resist(data.raw["curved-rail"],100)	
	Add_Poison_Resist(data.raw["transport-belt"],(25/NE_Difficulty))
	
	Add_Acid_Resist(data.raw["wall"],(25/NE_Difficulty))
	Add_Acid_Resist(data.raw["gate"],(25/NE_Difficulty))
	Add_Acid_Resist(data.raw["car"],(25/NE_Difficulty))
	Add_Acid_Resist(data.raw["electric-pole"],100)
	Add_Acid_Resist(data.raw["turret"],(25/NE_Difficulty))	
	Add_Acid_Resist(data.raw["ammo-turret"],(25/NE_Difficulty))	
	Add_Acid_Resist(data.raw["electric-turret"],(25/NE_Difficulty))	
	Add_Acid_Resist(data.raw["straight-rail"],100)	
	Add_Acid_Resist(data.raw["curved-rail"],100)	
	Add_Acid_Resist(data.raw["transport-belt"],(25/NE_Difficulty))

	Add_Physical_Resist(data.raw["straight-rail"],100)	
	Add_Physical_Resist(data.raw["curved-rail"],100)		

	Add_Explosion_Resist(data.raw["straight-rail"],100)	
	Add_Explosion_Resist(data.raw["curved-rail"],100)		
	
	data.raw["straight-rail"]["straight-rail"].flags = {"placeable-neutral", "building-direction-8-way"}
	data.raw["curved-rail"]["curved-rail"].flags = {"placeable-neutral", "building-direction-8-way"}


		
end


