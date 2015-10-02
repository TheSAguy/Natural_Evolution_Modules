NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others



---- Evolution Modifications ----------------------------------
if NEConfig.EvolutionFactor then
 	if NEConfig.mod.DyTechWar and NEConfig.DyTechWar_Evo_override then
		-- TIME: Only 75% of vanilla
		-- percentual increase in the evolve factor for every second (60 ticks). Default = 0.000004
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].time_factor = 0.000003

		-- POLLUTION: Four times the vanilla Pollution Evolution, so don't pollute!
		-- percentual increase in the evolve factor for 1000 PU. Default = 0.000015          
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].pollution_factor = 0.00006

		-- KILLING EMENY SPAWNERS: 10% of vanilla. You are going to kill a lot more bases...
		-- percentual increase in the evolve factor for every destroyed spawner. Default = 0.002
		data.raw["map-settings"]["map-settings"]["enemy_evolution"].destroy_factor = 0.0002

	end
end
---- END Evolution Modifications ----------------------------------

