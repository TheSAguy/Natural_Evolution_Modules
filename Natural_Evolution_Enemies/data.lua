if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end

if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end


if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end



require ("libs.detectmod") --Detect supported Mods, Bob's Enemies and others
require ("libs.NE_Functions")
require("prototypes.Technology.technology")


require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("libs.functions") -- From Bob's Libary 

---------------------------------------------------------------


--- Extra Loot - Small Alient Atrifacts

if settings.startup["NE_Alien_Artifacts"].value == true then
	require("prototypes.Extra_Loot.alien-artifact")
	require("prototypes.Extra_Loot.item")
	require("prototypes.Extra_Loot.recipe")
	require("prototypes.Extra_Loot.extra_loot")

	--- Artifact Collector
	require("prototypes.Artifact_Collector.entity")
	require("prototypes.Artifact_Collector.item")
	require("prototypes.Artifact_Collector.recipe")
	thxbob.lib.tech.add_recipe_unlock ("AlienUnderstanding", "Artifact-collector")

end
---------------------------------------------------------------


    --- Other - Building Materials, Biological Damage & Ammo

require("prototypes.Other.item")
require("prototypes.Other.recipe")
require("prototypes.Other.damage-type")

---------------------------------------------------------------

