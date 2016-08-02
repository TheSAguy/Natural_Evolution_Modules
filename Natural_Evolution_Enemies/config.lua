local NE = NE_Enemies_Config
--[[---------------------------------------------------------------------------
------------------------------------- Credits ---------------------------------
-------------------------------------------------------------------------------

L0771 - For his help given to me to start this MOD.
AlyxDeLunar - For his MOD Dynamic Expansion that I’ve used in my MOD.
Albatrosv13 - For his MOD Alien Temple that I’ve used in my MOD.
FreeER - For his MOD Mind Control that I’ve used in my MOD.
Darkshadow1809  - For his Evolution MOD .
Rsending91, DOSorDIE and SpeedyBrain - Item/Corpse Collector Mod.
Supercheese - Swarm Mod.
Afforess - Misanthrope Mod.
Orzelek - RSO, Coding help and answering questions!
ThaPear, Semvoz,  Billw, Adil, Rseding91, Chlue - Coding help!
DySoch - DyTech, showing me what was possible
Bobingabout - Bob's Mods - Learned a lot from looking at your amazing work. 
YuokiTani - Art!!  Amazing work!


---------------------------------------------------------------------------
---------------------------------------------------------------------------
------------------------ On / Off Toggles ---------------------------------
---------------------------------------------------------------------------
--- true = On / Yes
--- false = Off / No
-- NOTE -- When changing most of the below values, this will only affect new games, not existing games.

---------------------------------------------------------------------------]]


NE.Set_Difficulty = 2
-- Affects difficulty factor
-- Options: 
--			1 = Normal
--			2 = Hard
-- Hard is about a 2x factor on everything


NE.ExtraLoot = true 
--Extra Loot from Aliens (small-alien-artifact)


NE.LongReach = false
--- Long Reach
--- Do you want double the vanilla reach


NE.SafeRail = false -- Changing this will only affect new games, not existing games
-- If true, biters won't attack rail, BUT rail will also not show up on the mini map or be able to add rail to blueprints. 
-- So maybe set to true one you're rail is built :)


NE.Spawners = true 
-- Changes to the games Spawners and Units
-- Do you want tweaks made to the spawners - Mainly more units around the spawners 
-- More units around the spawners 
-- Vanilla Spawners will be higher than currently.
-- Bob's will be higher 
-- Do you want tweaks made to the games biter & spitters
-- Lower Pollution levels before attacking.
-- New Enemy Units and a new worm
-- Adjusted Resistances of units


NE.BioDamage = 15
-- Able to adjust the damage of the Bio Ammo.
-- Some people complained it was too high... Be warned though, the game is very tough at the end. You're going to need this.



NE.Artifact_Collector_Radius = 30
-- The radius around the artifact collector that it will grab items.
-- Note: technically it's not a radius, but a square pickup area, but the visual overlay is a circle and not a square.
NE.Artifact_Collector_Item_Count = 8
-- The number of artifacts that will be collected per sweep.


NE.Scorched_Earth = true
-- Turns terrain into desert when you kill an enemy on it.


NE.Burning_Buildings = true
-- When an entity is destroyed, it will catch fire.


--------- Used for Unit Launcher - Thanks Supercheese for this code :)
-- The result in the right column is the enemy that appears when the enemy in the left column dies. So if a behemoth spitter dies, medium spitters will appear.
-- For spawners, the current evolution factor rounded down to the nearest 10% (though 99% is rounded up to 100%) is used to look up which enemy appears.

subEnemyNameTable = {}

subEnemyNameTable["unit-cluster"] = {}
subEnemyNameTable["unit-cluster"][0] = 			"small-biter"
subEnemyNameTable["unit-cluster"][1] = 			"small-biter-Mk2"
subEnemyNameTable["unit-cluster"][2] = 			"small-biter-Mk3"
subEnemyNameTable["unit-cluster"][3] = 			"medium-biter"
subEnemyNameTable["unit-cluster"][4] = 			"medium-biter-Mk2"
subEnemyNameTable["unit-cluster"][5] = 			"medium-biter-Mk3"
subEnemyNameTable["unit-cluster"][6] = 			"big-biter"
subEnemyNameTable["unit-cluster"][7] = 			"big-biter-Mk2"
subEnemyNameTable["unit-cluster"][8] = 			"big-biter-Mk3"
subEnemyNameTable["unit-cluster"][9] = 			"behemoth-biter"
subEnemyNameTable["unit-cluster"][10] =			"behemoth-biter"


-- NUMBERS
-- The result in the right column is the number of enemies that appear when the enemy in the left column dies.
-- The current evolution factor rounded down to the nearest 10% is also used to look up which enemy appears.
subEnemyNumberTable = {}

subEnemyNumberTable["unit-cluster"] = {}
subEnemyNumberTable["unit-cluster"][0] = 			2    --small
subEnemyNumberTable["unit-cluster"][1] = 			3    --small
subEnemyNumberTable["unit-cluster"][2] = 			4    --small
subEnemyNumberTable["unit-cluster"][3] = 			2    --medium
subEnemyNumberTable["unit-cluster"][4] = 			3    --medium
subEnemyNumberTable["unit-cluster"][5] = 			4    --medium
subEnemyNumberTable["unit-cluster"][6] = 			2    --big
subEnemyNumberTable["unit-cluster"][7] = 			3    --big
subEnemyNumberTable["unit-cluster"][8] = 			4    --big
subEnemyNumberTable["unit-cluster"][9] = 			2    --behemoth
subEnemyNumberTable["unit-cluster"][10] =			4    --behemoth



----------------------------- END -------------------------------------------

NE.QCCode = false
-- Used for QC
-- Displays messages used for checking my code

