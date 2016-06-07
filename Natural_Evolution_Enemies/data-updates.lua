

require ("config")
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 

--- Got tierd of reaching limits...
if NE_Enemies_Config.LongReach then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 

--- Difficulty settings	
	if NE_Difficulty == nil then
      NE_Difficulty = 1
	end

	if NE_Enemies_Config.Set_Difficulty == 1 then
		NE_Difficulty = 1 -- Normal difficulty
		else NE_Difficulty  = 2 -- Hard difficulty
	end

----- Update the Alien Atrifact Graphic
data.raw.item["alien-artifact"].subgroup = "Materials"
data.raw.item["alien-artifact"].icon = "__Natural_Evolution_Enemies__/graphics/icons/alien-artifact.png"

--- Bob's Enemies - Update the Small Artifact Recipe.
if NE_Enemies_Config.mod.BobEnemies and NE_Enemies_Config.ExtraLoot then
<<<<<<< HEAD
=======


	bobmods.lib.remove_recipe_item ("alien-artifact-from-small", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact-from-small", {type="item", name="small-alien-artifact", amount=100})
--[[	
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
]]
end
>>>>>>> origin/master

	bobmods.lib.remove_recipe_item ("alien-artifact-from-small", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact-from-small", {type="item", name="small-alien-artifact", amount=100})

<<<<<<< HEAD
=======
	bobmods.lib.remove_recipe_item ("alien-artifact", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact", {type="item", name="small-alien-artifact", amount=100})
	--[[
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
]]
>>>>>>> origin/master
end

  --- SupremeWarfare_1.0.5 - Update the Small Artifact Recipe.
if NE_Enemies_Config.mod.SupremeWarfare and NE_Enemies_Config.ExtraLoot then

	bobmods.lib.remove_recipe_item ("alien-artifact", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact", {type="item", name="small-alien-artifact", amount=100})

<<<<<<< HEAD
end




if NE_Enemies_Config.Spawners then
	--Add resistances to entities.
	-- Poison
=======

if NE_Enemies_Config.Spawners then
	--Add resistances to entities.
	-- poison
>>>>>>> origin/master
	NE_Functions.Add_Damage_Resists("poison",data.raw["wall"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["gate"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["car"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["electric-pole"],100)
	NE_Functions.Add_Damage_Resists("poison",data.raw["turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["ammo-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["electric-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["transport-belt"],(25/NE_Difficulty))
	
	-- Acid
	NE_Functions.Add_Damage_Resists("acid",data.raw["wall"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["gate"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["car"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["electric-pole"],100)
	NE_Functions.Add_Damage_Resists("acid",data.raw["turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["ammo-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["electric-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["transport-belt"],(25/NE_Difficulty))
	
	
	--- Make Rail immune to damage
	NE_Functions.Add_Damage_Resists("poison",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("poison",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("acid",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("acid",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("physical",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("physical",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("explosion",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("explosion",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("laser",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("laser",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("impact",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("impact",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("fire",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("fire",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("electric",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("electric",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("bob-pierce",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("bob-pierce",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("Biological",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("Biological",data.raw["curved-rail"],100)	

	
	
end

-- Biters don't attack the rail, but it also does not appear on the mini-map or blue-prints.
if NE_Enemies_Config.SafeRail then
	NE_Functions.Biters_Dont_Attack(data.raw["curved-rail"])
	NE_Functions.Biters_Dont_Attack(data.raw["straight-rail"])
	NE_Functions.Biters_Dont_Attack(data.raw["rail-signal"])
	NE_Functions.Biters_Dont_Attack(data.raw["rail-chain-signal"])
	NE_Functions.Biters_Dont_Attack(data.raw["train-stop"])
end



if NE_Enemies_Config.mod.NEBuildings then
	----- Adds in Building Materials and Thumper to Tech Tree, since Alien Understanding Tech is in both Buildings and Enemies.
	---- Make sure that the Artifact-collector and Biological-bullet-magazine are present, since the tech is in NE Enemies and NE Buildings.
	bobmods.lib.add_technology_recipe ("AlienUnderstanding", "Building_Materials")
	bobmods.lib.add_technology_recipe ("AlienUnderstanding-2", "Thumper")

	bobmods.lib.remove_recipe_item ("Biological-bullet-magazine", "alien-artifact")
	bobmods.lib.remove_recipe_item ("Biological-bullet-magazine", "sulfuric-acid")
	bobmods.lib.add_new_recipe_item ("Biological-bullet-magazine", {type="fluid", name="NE_alien_toxin", amount=10})
	
	
end

if NE_Enemies_Config.Spawners then
-------- New Units
	if not NE_Enemies_Config.mod.DyTechWar then
		require "prototypes.Vanilla_Changes.New_Biter_Units"
		require "prototypes.Vanilla_Changes.Biter_Evolution"
		require "prototypes.Vanilla_Changes.New_Spitter_Units"
		require "prototypes.Vanilla_Changes.Spitter_Evolution"
				
	end
		
end


		--- Extra Loot - Small Alient Atrifacts
if NE_Enemies_Config.ExtraLoot then
	require("prototypes.Extra_Loot.item")
	require("prototypes.Extra_Loot.recipe")
	require("prototypes.Extra_Loot.extra_loot")
end

