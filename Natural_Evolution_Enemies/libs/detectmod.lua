-----------------------
--Cross Mod Detection--
-----------------------
if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end

-----------------------


--Detect Bob's Enemies
if data.raw["unit"]["bob-big-piercing-biter"] ~= nil and data.raw["unit"]["bob-big-electric-spitter"] ~= nil then
	NE_Enemies_Config.mod.BobEnemies=true
else 
	NE_Enemies_Config.mod.BobEnemies=false
end

--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	NE_Enemies_Config.mod.SupremeWarfare=true
else 
	NE_Enemies_Config.mod.SupremeWarfare=false
end


--Detect N.E. Buildings
if data.raw["radar"]["AlienControlStation"] ~= nil and data.raw["assembling-machine"]["Alien_Hatchery"] ~= nil then
	NE_Enemies_Config.mod.NEBuildings=true
else 
	NE_Enemies_Config.mod.NEBuildings=false
end
