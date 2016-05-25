NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others


--- Got tierd of reaching limits...
if NEConfig.LongReach then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 

data.raw.item["alien-artifact"].icon = "__Natural_Evolution_Enemies__/graphics/icons/alien-artifact.png"

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



function Add_Damage_Resists(D_Type,Raw,Percent)
	if data.raw["damage-type"][D_Type] ~= nil then
		local Resist = {type = D_Type,percent = Percent}
		for i,d in pairs(Raw) do
			if d.resistances ==nil then d.resistances={} end
			table.insert(d.resistances, Resist)
		end
	end
end



function Biters_Dont_Attack(Raw)
	for i,d in pairs(Raw) do
		local newflags = {}
		for pos=1,#d.flags do
			if not (d.flags[pos] == "player-creation") then
				table.insert(newflags, d.flags[pos])
			end
		end
		d.flags = newflags
	
	end
end



if NEConfig.Spawners then
	--Add resistances to entities.
	-- poison
	Add_Damage_Resists("poison",data.raw["wall"],(25/NE_Difficulty))
	Add_Damage_Resists("poison",data.raw["gate"],(25/NE_Difficulty))
	Add_Damage_Resists("poison",data.raw["car"],(25/NE_Difficulty))
	Add_Damage_Resists("poison",data.raw["electric-pole"],100)
	Add_Damage_Resists("poison",data.raw["turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("poison",data.raw["ammo-turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("poison",data.raw["electric-turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("poison",data.raw["transport-belt"],(25/NE_Difficulty))
	
	-- Acid
	Add_Damage_Resists("acid",data.raw["wall"],(25/NE_Difficulty))
	Add_Damage_Resists("acid",data.raw["gate"],(25/NE_Difficulty))
	Add_Damage_Resists("acid",data.raw["car"],(25/NE_Difficulty))
	Add_Damage_Resists("acid",data.raw["electric-pole"],100)
	Add_Damage_Resists("acid",data.raw["turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("acid",data.raw["ammo-turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("acid",data.raw["electric-turret"],(25/NE_Difficulty))	
	Add_Damage_Resists("acid",data.raw["transport-belt"],(25/NE_Difficulty))
	
	
	--- Make Rail immune to damage
	Add_Damage_Resists("poison",data.raw["straight-rail"],100)	
	Add_Damage_Resists("poison",data.raw["curved-rail"],100)	
	Add_Damage_Resists("acid",data.raw["straight-rail"],100)	
	Add_Damage_Resists("acid",data.raw["curved-rail"],100)	
	Add_Damage_Resists("physical",data.raw["straight-rail"],100)	
	Add_Damage_Resists("physical",data.raw["curved-rail"],100)		
	Add_Damage_Resists("explosion",data.raw["straight-rail"],100)	
	Add_Damage_Resists("explosion",data.raw["curved-rail"],100)		
	Add_Damage_Resists("laser",data.raw["straight-rail"],100)	
	Add_Damage_Resists("laser",data.raw["curved-rail"],100)		
	Add_Damage_Resists("impact",data.raw["straight-rail"],100)	
	Add_Damage_Resists("impact",data.raw["curved-rail"],100)		
	Add_Damage_Resists("fire",data.raw["straight-rail"],100)	
	Add_Damage_Resists("fire",data.raw["curved-rail"],100)		
	Add_Damage_Resists("electric",data.raw["straight-rail"],100)	
	Add_Damage_Resists("electric",data.raw["curved-rail"],100)		
	Add_Damage_Resists("bob-pierce",data.raw["straight-rail"],100)	
	Add_Damage_Resists("bob-pierce",data.raw["curved-rail"],100)	
	Add_Damage_Resists("Biological",data.raw["straight-rail"],100)	
	Add_Damage_Resists("Biological",data.raw["curved-rail"],100)	

	
	
end

if NEConfig.SafeRail then
	Biters_Dont_Attack(data.raw["curved-rail"])
	Biters_Dont_Attack(data.raw["straight-rail"])
	Biters_Dont_Attack(data.raw["rail-signal"])
	Biters_Dont_Attack(data.raw["rail-chain-signal"])
	Biters_Dont_Attack(data.raw["train-stop"])
end


----- Adds in Building Materials and Thumper to Tech Tree, since Alien Understanding Tech is in both Buildings and Enemies.
if NEConfig.mod.NEBuildings then
	function add_technology_recipe (technology, recipe)
	  if data.raw.technology[technology] and data.raw.recipe[recipe] then
		local addit = true
		if not data.raw.technology[technology].effects then
		  data.raw.technology[technology].effects = {}
		end
		for i, effect in pairs(data.raw.technology[technology].effects) do
		  if effect.type == "unlock-recipe" and effect.recipe == recipe then addit = false end
		end
		if addit then table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe}) end
	  end
	end


	add_technology_recipe ("AlienUnderstanding", "Building_Materials")
	add_technology_recipe ("AlienUnderstanding-2", "Thumper")
	
end

if NEConfig.Spawners then
-------- New Units
	if not NEConfig.mod.DyTechWar then
		require "prototypes.Vanilla_Changes.New_Biter_Units"
		require "prototypes.Vanilla_Changes.Biter_Evolution"
		require "prototypes.Vanilla_Changes.New_Spitter_Units"
		require "prototypes.Vanilla_Changes.Spitter_Evolution"
		--require "prototypes.Vanilla_Changes.New_Worm_Units" -- Adds new worms. Removed, rather added to vanilla worms.
		
	end
		
end


		--- Extra Loot
if NEConfig.ExtraLoot then
	require("prototypes.Extra_Loot.item")
	require("prototypes.Extra_Loot.recipe")
	require("prototypes.Extra_Loot.extra_loot")
end

