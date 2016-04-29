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


if NEConfig.ScienceCost then

	--- Science Pack Cost Tweaks
	for _, recipe in pairs({"science-pack-1", "science-pack-2", "science-pack-3", "alien-science-pack"}) do
		for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
			ingredient[2] = ingredient[2] * 2
		end
	end

	if NEConfig.mod.BobTech then
		for _, recipe in pairs({"science-pack-4"}) do
			for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
				ingredient[2] = ingredient[2] * 2
			end
		end
	end

end


	--- Rocket Part Cost Tweaks	
if NEConfig.HarderEndGame then
	for _, recipe in pairs({"low-density-structure", "rocket-fuel", "rocket-control-unit", "rocket-part", "satellite"}) do
		for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
			ingredient[2] = ingredient[2] * 2
		end
	end
end

