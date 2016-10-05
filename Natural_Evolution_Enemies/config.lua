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
Bobingabout - Bob's Mods - Learned a lot from looking at your amazing work and am using a lot of your great code!
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
-- WARNING, Hard means HARD...First complete a game on normal before trying hard.


NE.ExtraLoot = true 
--Extra Loot from Aliens (small-alien-artifact) - Used for a lot ot things, so I'd leave this as is :)


NE.LongReach = false
--- Long Reach
--- Do you want double the vanilla reach



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



NE.Artifact_Collector_Radius = 40
-- The radius around the artifact collector that it will grab items.
-- Note: technically it's not a radius, but a square pickup area, but the visual overlay is a circle and not a square.
NE.Artifact_Collector_Item_Count = 8
-- The number of artifacts that will be collected per sweep.


NE.Scorched_Earth = true
-- Turns terrain into desert when you kill an enemy on it. Samll chance of cearting landfill


NE.Burning_Buildings = true
-- When an entity is destroyed, it will catch fire. Makes things a little more difficult.

NE.Tree_Hugger = true
-- When tree hugger is enabled, you may be attacked for cutting down trees

NE.SafeRail = false -- Kinda obsolete... so just leave it alone
-- If true, rail will have 100% immunity to damage.
-- Currently rail auto repairs itself by default with this mod tough.


----------------------------- END -------------------------------------------

NE.QCCode = false
-- Used for QC
-- Displays messages used for checking my code

