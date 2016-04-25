NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others

--- Got tierd of reaching limits...
if data.raw.player.player.build_distance < 220 then
	data.raw.player.player.build_distance = 220
	data.raw.player.player.reach_distance = 200
	data.raw.player.player.reach_resource_distance = 200
	data.raw.player.player.drop_item_distance = 200	
end 

-- Make it so that you can mine spawners, since you are able to convert them, you can now remove them. You will lose them though and get some artifacts.
data.raw["unit-spawner"]["biter-spawner"].minable = {hardness = 0.8, mining_time = 1.6, results = {{type="item", name="alien-artifact", amount=5},}}
data.raw["unit-spawner"]["spitter-spawner"].minable = {hardness = 0.8, mining_time = 1.6, results = {{type="item", name="alien-artifact", amount=5},}}

if NEConfig.mod.BobEnemies then
	data.raw["unit-spawner"]["bob-biter-spawner"].minable = {hardness = 0.8, mining_time = 1.6, results = {{type="item", name="alien-artifact", amount=5},}}
	data.raw["unit-spawner"]["bob-spitter-spawner"].minable = {hardness = 0.8, mining_time = 1.6, results = {{type="item", name="alien-artifact", amount=5},}}
end


if NEConfig.ScienceCost then

	function ChangeRecipe(Name, Ingredient1, Ingredient2, Amount)
		for k, v in pairs(data.raw["recipe"][Name].ingredients) do
			if v[1] == Ingredient1 then table.remove(data.raw["recipe"][Name].ingredients, k) end
		end
	table.insert(data.raw["recipe"][Name].ingredients,{Ingredient2, Amount})
	end

	if NEConfig.mod.DyTechCore then
		ChangeRecipe("science-pack-1", "stone-gear-wheel", "stone-gear-wheel", 2)
	end
	if not NEConfig.mod.DyTechCore then
		ChangeRecipe("science-pack-1", "iron-gear-wheel", "iron-gear-wheel", 2)
	end
	
	ChangeRecipe("science-pack-1", "copper-plate", "copper-plate", 2)
	ChangeRecipe("science-pack-2", "basic-transport-belt", "basic-transport-belt", 2)
	ChangeRecipe("science-pack-2", "basic-inserter", "basic-inserter", 2)
	ChangeRecipe("science-pack-3", "advanced-circuit", "advanced-circuit", 2)
	ChangeRecipe("science-pack-3", "smart-inserter", "smart-inserter", 2)
	ChangeRecipe("science-pack-3", "battery", "battery", 2)
	ChangeRecipe("science-pack-3", "steel-plate", "steel-plate", 2)
	ChangeRecipe("alien-science-pack", "alien-artifact", "alien-artifact", 2)


end


--- Adjust N.E. to DyTech War
if NEConfig.mod.DyTechWar then

	-- Natural Evolution Biter Spawner Adjustment to DyTech War
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_cooldown = data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_health = data.raw["unit-spawner"]["biter-spawner"].max_health
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_radius = data.raw["unit-spawner"]["biter-spawner"].spawning_radius
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_spacing = data.raw["unit-spawner"]["biter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_spawn_shift = data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute


	-- Natural Evolution Spitter Spawner Adjustment to DyTech
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

if NEConfig.mod.NEEnemies then
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

	add_technology_recipe ("AlienUnderstanding", "Artifact-collector")
	add_technology_recipe ("AlienUnderstanding-2", "Biological-bullet-magazine")
	
end



