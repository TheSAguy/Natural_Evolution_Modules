NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others


if NEConfig.ScienceCost then


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
