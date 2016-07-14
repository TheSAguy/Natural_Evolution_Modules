if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end

if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end

require ("config")
require ("libs.detectmod") --Detect supported Mods, Bob's Enemies and others
require ("libs.NE_Functions")
require("prototypes.Technology.technology")
require("prototypes.Item-Groups.item-groups")

require ("libs.legacy") -- From Bob's Libary 
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("libs.functions") -- From Bob's Libary 

---------------------------------------------------------------


	--- Artifact Collector

require("prototypes.Artifact_Collector.entity")
require("prototypes.Artifact_Collector.item")
require("prototypes.Artifact_Collector.recipe")
---------------------------------------------------------------


    --- Other - Building Materials, Biological Damage & Ammo

require("prototypes.Other.item")
require("prototypes.Other.recipe")
require("prototypes.Other.damage-type")

---------------------------------------------------------------

