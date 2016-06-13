
if not bobmods then bobmods = {} end
if not bobmods.lib then bobmods.lib = {} end

if not NE_Buildings_Config then NE_Buildings_Config = {} end
if not NE_Buildings_Config.mod then NE_Buildings_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end

require ("config")
require ("libs.NE_Functions")

require("prototypes.Technology.technology")
require("prototypes.Item-Groups.item-groups")
require("prototypes.Categories.recipe-category")
---------------------------------------------------------------


	--- Alien_Hatchery
	
require("prototypes.Alien_Hatchery.entity")
require("prototypes.Alien_Hatchery.item")
require("prototypes.Alien_Hatchery.fluid")
require("prototypes.Alien_Hatchery.recipe")
require("prototypes.Alien_Hatchery.biters")
require("prototypes.Alien_Hatchery.spawner")
require("prototypes.Alien_Hatchery.spitters")
require("prototypes.Alien_Hatchery.worms")
---------------------------------------------------------------

	--- Alien Control Station

require("prototypes.Alien_Control_Station.entity")
require("prototypes.Alien_Control_Station.item")
require("prototypes.Alien_Control_Station.recipe")
---------------------------------------------------------------

    --- Terraforming Station
	
require("prototypes.Terraforming_Station.entity")
require("prototypes.Terraforming_Station.item")
require("prototypes.Terraforming_Station.recipe")
---------------------------------------------------------------

	--- Thumper

require("prototypes.Thumper.entity")
require("prototypes.Thumper.item")
require("prototypes.Thumper.recipe")
---------------------------------------------------------------


    --- Other - Building Materials, Attractors

require("prototypes.Other.item")
require("prototypes.Other.recipe")
---------------------------------------------------------------




