
require ("config")
require ("libs.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
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





---- Evolution Modifications ----------------------------------
if NE_Expansion_Config.EvolutionFactor then
	if (not NE_Expansion_Config.mod.DyTechWar) or (NE_Expansion_Config.mod.DyTechWar and NE_Expansion_Config.DyTechWar_Evo_override) then
		-- TIME: Only 75% of vanilla
		-- percentual increase in the evolve factor for every second (60 ticks). Default = 0.000004
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor = 0.000003

		-- POLLUTION: Two times the vanilla Pollution Evolution, so don't pollute!
		-- percentual increase in the evolve factor for 1000 PU. Default = 0.000015          
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor = 0.00003

		-- KILLING EMENY SPAWNERS: 10% of vanilla. You are going to kill a lot more bases...
		-- percentual increase in the evolve factor for every destroyed spawner. Default = 0.002
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor = 0.0002

	end
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

