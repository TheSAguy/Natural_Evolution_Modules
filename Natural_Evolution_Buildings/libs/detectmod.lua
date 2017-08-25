-----------------------
--Cross Mod Detection--
-----------------------

if not NE_Buildings_Config then NE_Buildings_Config = {} end
if not NE_Buildings_Config.mod then NE_Buildings_Config.mod = {} end

-----------------------


--Detect Bob's Enemies
if data.raw["unit"]["bob-big-piercing-biter"] ~= nil and data.raw["unit"]["bob-big-electric-spitter"] ~= nil then
	NE_Buildings_Config.mod.BobEnemies=true
else 
	NE_Buildings_Config.mod.BobEnemies=false
end

--Detect Bob's Warfare
if data.raw["item"]["bob-sniper-turret-1"] ~= nil and data.raw["car"]["bob-tank-2"] ~= nil then
	NE_Buildings_Config.mod.BobWarfare=true
else 
	NE_Buildings_Config.mod.BobWarfare=false
end


--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	NE_Buildings_Config.mod.SupremeWarfare=true
else 
	NE_Buildings_Config.mod.SupremeWarfare=false
end


--Detect N.E. Enemies
if data.raw["unit"]["small-biter-Mk2"] ~= nil or data.raw["unit"]["small-spitter-Mk2"] ~= nil then
	NE_Buildings_Config.mod.NEEnemies=true
else 
	NE_Buildings_Config.mod.NEEnemies=false
end


--Detect Endgame Combat
if data.raw["recipe"]["concussion-turret"] ~= nil or data.raw["item"]["cannon-turret"] ~= nil then
	NE_Buildings_Config.mod.EndgameCombat=true
else 
	NE_Buildings_Config.mod.EndgameCombat=false
end
