local NE = NEConfig
--[[---------------------------------------------------------------------------
------------------------------------- Credits ---------------------------------
-------------------------------------------------------------------------------

L0771 - For his help given to me to start this MOD.
AlyxDeLunar - For his MOD Dynamic Expansion that I’ve used in my MOD.
Albatrosv13 - For his MOD Alien Temple that I’ve used in my MOD.
FreeER - For his MOD Mind Control that I’ve used in my MOD.
Darkshadow1809  - For his Evolution MOD .
Rsending91, DOSorDIE and SpeedyBrain - Item/Corpse Collector Mod.
ThaPear, Semvoz,  Billw, Adil, Rseding91, Orzelek & Chlue - Coding help!
DySoch - DyTech and Bobingabout - Bob's Mods - Learned a lot from looking at your amazing work. 
YuokiTani - Art!!  

---------------------------------------------------------------------------
---------------------------------------------------------------------------
------------------------ On / Off Toggles ---------------------------------
---------------------------------------------------------------------------
--- true = On / Yes
--- false = Off / No
---------------------------------------------------------------------------]]



NE.Expansion = true 
-- Kinda defeats the purpose of this mod if you turn this off...
-- Do you want this mod to manage biter/spitter expansion. 
-- A tiered approach that gets a lot more difficult at higher evolution rates.


NE.EvolutionFactor = true 
-- Do you want to use the new Evolution rate settings of:
-- TIME: Only 75% of vanilla. From 0.000004 to 0.000003
-- POLLUTION: Quadruple the vanilla Pollution Evolution, so don't pollute! From 0.00003 to 0.00006
-- KILLING EMENY SPAWNERS: 10% of Vanilla for killing Enemy Spawners. From 0.002 to 0.0002
NE.DyTechWar_Evo_override = false
-- If true, will use DyTech Evolution Factor values and not Natural Evolution's values.
-- DyTech's values are linear, meaning at Difficulty 1 all 3 values are 1/4 of Vanilla and at Difficulty 5 they are 5x higher than vanilla's. 
-- N.E. on the other hand has a higher Pollution penalty, but lower Time and Killing Spawner values.


NE.HarderEndGame = true -- Gets a lot harder once you build a rocket silo


NE.ScienceCost = true -- Doubles the cost of Science Bottles, so you need to go look for some more resources...




----------------------------- END -------------------------------------------

NE.QCCode = false
-- Used for QC
-- Displays messages used for checking my code



