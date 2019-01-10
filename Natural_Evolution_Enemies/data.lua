if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end

if not NE_Functions then NE_Functions = {} end

if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end


require ("libs.NE_Functions")

---------------------------------------------------------------

----- Achievements

require ("prototypes.Achievements.Achievements")

-------- Old Units
require ("prototypes.NE_Units.Old_Units.Settings")
require ("prototypes.NE_Units.Old_Units.Old_Biter_Units")
require ("prototypes.NE_Units.Old_Units.Old_Spitter_Units")
	

-------- New Units
require ("prototypes.NE_Units.New_Units.damage-types")
require ("prototypes.NE_Units.New_Units.Functions")
require ("prototypes.NE_Units.New_Units.Fire_Stuff")
require ("prototypes.NE_Units.New_Units.New_Biter_Units")
require ("prototypes.NE_Units.New_Units.New_Spitter_Units")
require ("prototypes.NE_Units.New_Units.Megladon_Biter_Unit")
require ("prototypes.NE_Units.New_Units.New_Spawners")


--- Combatibility quick fix for Rampant---
require ("prototypes.Other_Mods.Old_Unit_Cluster_for_Rampant")		

		