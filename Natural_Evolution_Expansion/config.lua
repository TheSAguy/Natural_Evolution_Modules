local NE = NE_Expansion_Config
--[[---------------------------------------------------------------------------
------------------------------------- Credits ---------------------------------
-------------------------------------------------------------------------------

L0771 - For his help given to me to start this MOD.
AlyxDeLunar - For his MOD Dynamic Expansion that I’ve used in my MOD.
Albatrosv13 - For his MOD Alien Temple that I’ve used in my MOD.
FreeER - For his MOD Mind Control that I’ve used in my MOD.
Darkshadow1809  - For his Evolution MOD .
Bonesbro - His tweaks to improve the mod.
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


NE.Single_Player_Only = true
--- Some people have reported lag and crashes with MP. So if you do, set this to false if you're playing a MP and hopefully that should work.
--- You will not have any EVO_GUI info if set to false.
--- AGAIN MP should be fixed now, but if you do have problems, try setting this to false.

NE.Expansion = true 
-- Kinda defeats the purpose of this mod if you turn this off...
-- Do you want this mod to manage biter/spitter expansion. 
-- A tiered approach that gets a lot more difficult at higher evolution rates.



NE.LongReach = false
--- Long Reach
--- Do you want double the vanilla reach


NE.EvolutionFactor = true -- Changing this will only affect new games, not existing games
-- Do you want to use the new Evolution rate settings of:
-- TIME: Only 87.5% of vanilla. From 0.000004 to 0.0000035
-- POLLUTION: Double the vanilla Pollution Evolution, so don't pollute! From 0.000015 to 0.00003
-- KILLING EMENY SPAWNERS: 10% of Vanilla for killing Enemy Spawners. From 0.002 to 0.0002


NE.HarderEndGame = true 
-- Gets a lot harder once you build a rocket silo. Expect enemies trying to destroy the rocket silo.
-- Cost of Rocket parts doubled.

NE.ScienceCost = true 
-- Doubles the cost of Science Bottles, so you need to go look for some more resources...




--------- If you want to tweak the Expansion Phase settings, you can adjust the below. AT YOUR OWN RISK :)

NE.Reduce_Evo_on_Phase_Change = true --- A small deduction in the Evolution factor after aeach Phase.
	
NE.Evolution_Timer = 5       -- Time Per Phase in Min. At 0% Evo, Each Phase will be 5Min at 100% Evo Each Phase will be 15Min. Formula: Natural_Evolution_Timer = (evolution_Timer + (game.evolution_factor * evolution_Timer) * 2) 
							 							 
NE.Settler_Group_Size = 1.0      -- Multiplier to the number of biters that are sent to build each new expansion.
                                 -- Larger values are probably harder, I guess?


NE.Enemy_Speedup = 1.4           -- Adjustment to the speed of enemies when they've fallen behind the group they're following.  Default is 40% speed up (same as stock).
NE.Enemy_Speedup_Endgame = 2     -- Adjustment to the speed of enemies when they've fallen behind the group they're following.  100% speed up during armageddon!


----------------------------- END -------------------------------------------

NE.QCCode = false
-- Used for QC
-- Displays messages used for checking my code



