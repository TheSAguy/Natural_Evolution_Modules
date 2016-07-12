local NE = NE_Expansion_Config
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
ThaPear, Semvoz,  Billw, Adil, Rseding91 Chlue - Coding help!
DySoch - DyTech
Bobingabout - Bob's Mods - Learned a lot from looking at your amazing work. 
YuokiTani - Art!!  

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

NE.Expansion = true 
-- Kinda defeats the purpose of this mod if you turn this off...
-- Do you want this mod to manage biter/spitter expansion. 
-- A tiered approach that gets a lot more difficult at higher evolution rates.



NE.LongReach = false
--- Long Reach
--- Do you want double the vanilla reach


NE.EvolutionFactor = true -- Changing this will only affect new games, not existing games
-- Do you want to use the new Evolution rate settings of:
-- TIME: Only 75% of vanilla. From 0.000004 to 0.000003
-- POLLUTION: Double the vanilla Pollution Evolution, so don't pollute! From 0.000015 to 0.00003
-- KILLING EMENY SPAWNERS: 10% of Vanilla for killing Enemy Spawners. From 0.002 to 0.0002

NE.DyTechWar_Evo_override = false
-- If true, will use DyTech Evolution Factor values and not Natural Evolution's values.
-- DyTech's values are linear, meaning at Difficulty 1 all 3 values are 1/4 of Vanilla and at Difficulty 5 they are 5x higher than vanilla's. 
-- N.E. on the other hand has a higher Pollution penalty, but lower Time and Killing Spawner values.

NE.HarderEndGame = true 
-- Gets a lot harder once you build a rocket silo. Expect enemies trying to destroy the rocket silo.
-- Cost of Rocket parts doubled.

NE.ScienceCost = true 
-- Doubles the cost of Science Bottles, so you need to go look for some more resources...


NE.Extra_Peaceful_Time = 0       -- Additional number of minutes to wait in Peaceful phase before checking for an expansion wave.

NE.Evolution_Timer_Min = 0       -- Time added to the number of minutes for the evolution phase
NE.Evolution_Timer_Max = 0       -- Larger values = harder, negative values = shorter aggressive phases.

NE.Min_Base_Spacing = 0          -- Amount added to the number of chunks between each enemy base.
                                 -- Smaller values = harder.

NE.Max_Expansion_Distance = 0    -- Amount added to the number of maximum number of chunks between an enemy base and any new expansion.
                                 -- Smaller values = slower (but denser) spread.


--- the 4 valuse below now replaces "Min_Player_Base_Distance" in 0.13 -- Smaller values = enemy bases are built closer to the player.
--NE.building_coefficient = 0.1
--NE.other_base_coefficient = 2.0
--NE.neighbouring_chunk_coefficient = 0.5
--NE.neighbouring_base_chunk_coefficient = 0.4
								 
								 

NE.Settler_Group_Size = 1.0      -- Multiplier to the number of biters that are sent to build each new expansion.
                                 -- Larger values are probably harder, I guess?

NE.Expansion_Cooldown = 1.0      -- Multiplier to the time in between each expansion attempt.
                                 -- Stock is 5-60 minutes.  NE defaults to around 15-30 seconds depending on the Evolution level.

NE.Enemy_Speedup = 1.4           -- Adjustment to the speed of enemies when they've fallen behind the group they're following.  Default is 40% speed up (same as stock).
NE.Enemy_Speedup_Endgame = 2     -- Adjustment to the speed of enemies when they've fallen behind the group they're following.  100% speed up during armageddon!


----------------------------- END -------------------------------------------

NE.QCCode = false
-- Used for QC
-- Displays messages used for checking my code



