
require ("config")
require ("libs.detectmod") --Detect supported Mods, Bob's Enemies and others
require ("libs.NE_Functions")

--- Got tierd of reaching limits...
if NE_Expansion_Config.LongReach or NE_Expansion_Config.QCCode then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 

-- cause pollution to spread farther
data.raw["map-settings"]["map-settings"].pollution.diffusion_ratio = 0.04
data.raw["map-settings"]["map-settings"].pollution.min_to_diffuse = 25
data.raw["map-settings"]["map-settings"].min_pollution_to_damage_trees = 1500



---- Evolution Modifications ----------------------------------
if NE_Expansion_Config.EvolutionFactor then

	-- TIME: Only 75% of vanilla
	-- percentual increase in the evolve factor for every second (60 ticks). Default = 0.000004																						 
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor * 0.75

	-- POLLUTION: 2x times the vanilla Pollution Evolution, so don't pollute!
	-- percentual increase in the evolve factor for 1000 PU. Default = 0.000015          
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor * 2.0

	-- KILLING EMENY SPAWNERS: 10% of vanilla. You are going to kill a lot more bases...
	-- percentual increase in the evolve factor for every destroyed spawner. Default = 0.002
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor * 0.1

end
---- END Evolution Modifications ----------------------------------



if NE_Expansion_Config.ScienceCost then

	--- Science Pack Cost Tweaks
	NE_Functions.Ingredient_Multiplier("science-pack-1",2)
	NE_Functions.Ingredient_Multiplier("science-pack-2",2)
	NE_Functions.Ingredient_Multiplier("science-pack-3",2)
	NE_Functions.Ingredient_Multiplier("alien-science-pack",2)

	--- If Bob Tech
	NE_Functions.Ingredient_Multiplier("science-pack-4",2)	
	
end


	--- Rocket Part Cost Tweaks	
if NE_Expansion_Config.HarderEndGame then
	NE_Functions.Ingredient_Multiplier("low-density-structure",2)	
	NE_Functions.Ingredient_Multiplier("rocket-fuel",2)	
	NE_Functions.Ingredient_Multiplier("rocket-control-unit",2)	
	NE_Functions.Ingredient_Multiplier("rocket-part",2)	
	NE_Functions.Ingredient_Multiplier("satellite",2)	
	
end

