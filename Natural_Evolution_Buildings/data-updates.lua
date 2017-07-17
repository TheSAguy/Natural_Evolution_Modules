
if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end

if not NE_Buildings_Config then NE_Buildings_Config = {} end
if not NE_Buildings_Config.mod then NE_Buildings_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end


require ("libs.detectmod") --Detect supported Mods, Bob's Enemies and others
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 



----- Update the Alien Atrifact Graphic
data.raw.item["alien-artifact"].icon = "__Natural_Evolution_Buildings__/graphics/icons/alien-artifact.png"


-- Make it so that you can mine spawners & worms, since you are able to convert them, you can now remove them. 
data.raw["unit-spawner"]["biter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
data.raw["unit-spawner"]["spitter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Spitter-Spawner-exhausted", amount=1},}}
data.raw["turret"]["small-worm-turret"].minable = {hardness = 0.5, mining_time = 1.6, results = {{type="item", name="small-worm-hatching-exhausted", amount=1},}}
data.raw["turret"]["medium-worm-turret"].minable = {hardness = 1.0, mining_time = 1.6, results = {{type="item", name="medium-worm-hatching-exhausted", amount=1},}}
data.raw["turret"]["big-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}


if NE_Buildings_Config.mod.BobEnemies then
	data.raw["unit-spawner"]["bob-biter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
	data.raw["unit-spawner"]["bob-spitter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Spitter-Spawner-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-explosive-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-fire-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-poison-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-piercing-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-electric-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-giant-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-behemoth-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	
end


--- Adjust N.E. Building spawners to N.E. Enemy Settings
if NE_Buildings_Config.mod.NEEnemies then

	-- Natural Evolution Biter Spawner Adjustments 
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_cooldown = data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_health = data.raw["unit-spawner"]["biter-spawner"].max_health
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_radius = data.raw["unit-spawner"]["biter-spawner"].spawning_radius
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_spacing = data.raw["unit-spawner"]["biter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_spawn_shift = data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute


	-- Natural Evolution Spitter Spawner Adjustments 
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_cooldown = data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_health = data.raw["unit-spawner"]["spitter-spawner"].max_health
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_radius = data.raw["unit-spawner"]["spitter-spawner"].spawning_radius
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_spacing = data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_spawn_shift = data.raw["unit-spawner"]["spitter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute


end
 
   
if NE_Buildings_Config.mod.NEEnemies then


	----- Adds in Building Materials and Thumper to Tech Tree, since Alien Understanding Tech is in both Buildings and Enemies.
	---- Make sure that the Artifact-collector and Biological-bullet-magazine are present, since the tech is in NE Enemies and NE Buildings.
	thxbob.lib.tech.add_recipe_unlock ("AlienUnderstanding", "Artifact-collector")
	thxbob.lib.tech.add_recipe_unlock ("AlienUnderstanding-2", "Biological-bullet-magazine")
	thxbob.lib.tech.add_recipe_unlock ("AlienUnderstanding-2", "decelerate_concrete")
	
end



thxbob.lib.tech.add_recipe_unlock ("AlienUnderstanding", "ne-combat-inserter")




-- Adds a resitance of all damage types to an entity
for k, v in pairs(data.raw["damage-type"]) do
	local Resist = {type = v.name, percent = 80} -- or you could use k, and not v.name		

	if data.raw.inserter["combat-inserter"].resistances == nil then 
		data.raw.inserter["combat-inserter"].resistances = {}
		table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
	else
		local found = false
		for _, resistance in pairs(data.raw.inserter["combat-inserter"].resistances) do
			if resistance.type == Resist.type and resistance.percent then
				if resistance.percent < Resist.percent then
					resistance.percent = Resist.percent
				end
				found = true
			end            
		end
		
		if not found then
			table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
		end
	end
end


---------- Adds Alient Artifacts back for recipies in NE Buildings
if data.raw["unit-spawner"]["biter-spawner"]  and data.raw.item["alien-artifact"] then
	if data.raw["unit-spawner"]["biter-spawner"].loot == nil then 
		data.raw["unit-spawner"]["biter-spawner"].loot = {}
		
		data.raw["unit-spawner"]["biter-spawner"].loot = {}
		table.insert(data.raw["unit-spawner"]["biter-spawner"].loot, {  item = "alien-artifact",  count_min = 5,  count_max = 10,  probability = 1 } )
		
	end
end

if data.raw["unit-spawner"]["spitter-spawner"] and data.raw.item["alien-artifact"] then
	if data.raw["unit-spawner"]["spitter-spawner"].loot == nil then 
		
		data.raw["unit-spawner"]["spitter-spawner"].loot = {}
		table.insert(data.raw["unit-spawner"]["spitter-spawner"].loot, {  item = "alien-artifact",  count_min = 5,  count_max = 10,  probability = 1 } )
		
	end
end








