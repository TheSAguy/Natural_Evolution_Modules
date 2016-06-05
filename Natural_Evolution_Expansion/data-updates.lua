
require ("config")
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.NE_Functions")

--- Got tierd of reaching limits...
if NE_Expansion_Config.LongReach then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 

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

