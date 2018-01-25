

---- Evolution Modifications ----------------------------------
if settings.startup["NE_Evolution_Factor_Tweak"].value then

	-- cause pollution to spread farther
	data.raw["map-settings"]["map-settings"].pollution.diffusion_ratio = data.raw["map-settings"]["map-settings"].pollution.diffusion_ratio * 2.0
	data.raw["map-settings"]["map-settings"].pollution.min_to_diffuse = data.raw["map-settings"]["map-settings"].pollution.min_to_diffuse  * 2.0
	

	-- TIME: Only 50% of vanilla
	-- percentual increase in the evolve factor for every second (60 ticks). Default = 0.000004																						 
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor * 0.5

	-- POLLUTION: 1.5x times the vanilla Pollution Evolution, so don't pollute!
	-- percentual increase in the evolve factor for 1000 PU. Default = 0.000015          
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor * 1.5

	-- KILLING EMENY SPAWNERS: 10% of vanilla. You are going to kill a lot more bases...
	-- percentual increase in the evolve factor for every destroyed spawner. Default = 0.002
	data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor = data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor * 0.1

end
---- END Evolution Modifications ----------------------------------


