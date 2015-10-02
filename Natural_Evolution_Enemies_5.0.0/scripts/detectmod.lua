-----------------------
--Cross Mod Detection--
-----------------------
NEConfig.mod = {}

--Detect DyTechWar
if data.raw["unit"]["young-berserk-biter"] ~= nil and data.raw["unit"]["young-berserk-spitter"] ~= nil then
	NEConfig.mod.DyTechWar=true
else 
	NEConfig.mod.DyTechWar=false
end

--Detect DyTech Core
if data.raw["item"]["stone-gear-wheel"] ~= nil then
	NEConfig.mod.DyTechCore=true
else 
	NEConfig.mod.DyTechCore=false
end

--Detect Bob's Enemies
if data.raw["unit"]["bob-bigger-biter"] ~= nil and data.raw["unit"]["bob-bigger-spitter"] ~= nil then
	NEConfig.mod.BobEnemies=true
else 
	NEConfig.mod.BobEnemies=false
end

--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	NEConfig.mod.SupremeWarfare=true
else 
	NEConfig.mod.SupremeWarfare=false
end