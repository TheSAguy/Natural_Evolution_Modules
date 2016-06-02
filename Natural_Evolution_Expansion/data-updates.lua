
require ("config")
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others


--- Got tierd of reaching limits...
if NE_Expansion_Config.LongReach then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 


function Double_Cost(Input)	
	if data.raw.recipe[Input] ~= nil then
		for _, recipe in pairs({Input}) do
			for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
				if ingredient[2] ~= nil then
					ingredient[2] = ingredient[2] * 2
				elseif ingredient.amount ~= nil then
					ingredient.amount = ingredient.amount * 2
				end   
			end
		end
	end
end	
	

if NE_Expansion_Config.ScienceCost then

	--- Science Pack Cost Tweaks
	Double_Cost("science-pack-1")
	Double_Cost("science-pack-2")
	Double_Cost("science-pack-3")
	Double_Cost("alien-science-pack")

	--- If Bob Tech
	Double_Cost("science-pack-4")	
	
end


	--- Rocket Part Cost Tweaks	
if NE_Expansion_Config.HarderEndGame then
	Double_Cost("low-density-structure")	
	Double_Cost("rocket-fuel")	
	Double_Cost("rocket-control-unit")	
	Double_Cost("rocket-part")	
	Double_Cost("satellite")	
	
end

