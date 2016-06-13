-----------------------
--Cross Mod Detection--
-----------------------

if not NE_Expansion_Config then NE_Expansion_Config = {} end
if not NE_Expansion_Config.mod then NE_Expansion_Config.mod = {} end

-----------------------

--Detect DyTechWar
if data.raw["unit"]["young-berserk-biter"] ~= nil and data.raw["unit"]["young-berserk-spitter"] ~= nil then
	NE_Expansion_Config.mod.DyTechWar=true
else 
	NE_Expansion_Config.mod.DyTechWar=false
end

--Detect DyTech Core
if data.raw["item"]["stone-gear-wheel"] ~= nil then
	NE_Expansion_Config.mod.DyTechCore=true
else 
	NE_Expansion_Config.mod.DyTechCore=false
end

--Detect Bob's Enemies
if data.raw["unit"]["bob-big-piercing-biter"] ~= nil and data.raw["unit"]["bob-big-electric-spitter"] ~= nil then
	NE_Expansion_Config.mod.BobEnemies=true
else 
	NE_Expansion_Config.mod.BobEnemies=false
end


--Detect Bob's Tech
if data.raw["tool"]["science-pack-4"] ~= nil then
	NE_Expansion_Config.mod.BobTech=true
else 
	NE_Expansion_Config.mod.BobTech=false
end


--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	NE_Expansion_Config.mod.SupremeWarfare=true
else 
	NE_Expansion_Config.mod.SupremeWarfare=false
end