-----------------------
--Cross Mod Detection--
-----------------------

if not NE_Expansion_Config then NE_Expansion_Config = {} end
if not NE_Expansion_Config.mod then NE_Expansion_Config.mod = {} end

-----------------------



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