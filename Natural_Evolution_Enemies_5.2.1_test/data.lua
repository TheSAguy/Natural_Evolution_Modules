NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies


require("prototypes.Technology.technology")
require("prototypes.Item-Groups.item-groups")

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

--[[
------- Remove Default Worms - FOR TESTING
data.raw.turret["small-worm-turret"].autoplace = {}
data.raw.turret["medium-worm-turret"].autoplace = {}
data.raw.turret["big-worm-turret"].autoplace = {}
]]
