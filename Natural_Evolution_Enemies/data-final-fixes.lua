if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end
NE_Enemies.Settings.NE_Adjust_Vanilla_Worms = settings.startup["NE_Adjust_Vanilla_Worms"].value


--- Update Vanilla Worm Stuff -- Medium worm will become fire worm and big worm will be come unit launcher worm
require ("prototypes.NE_Units.New_Units.Worm_Changes")

--[[
local RAW = data.raw["unit-spawner"]
if mods["Rampant"] then
	if settings.startup["NE_Blue_Spawners"].value then
		RAW["ne-spawner-blue"].autoplace = enemy_spawner_autoplace(0)
	end

	if settings.startup["NE_Red_Spawners"].value then
		RAW["ne-spawner-red"].autoplace = enemy_spawner_autoplace(0)
	end

	if settings.startup["NE_Green_Spawners"].value then
		RAW["ne-spawner-green"].autoplace = enemy_spawner_autoplace(0)
	end

	if settings.startup["NE_Yellow_Spawners"].value then
		RAW["ne-spawner-yellow"].autoplace = enemy_spawner_autoplace(0)
	end

	if settings.startup["NE_Pink_Spawners"].value then
		RAW["ne-spawner-pink"].autoplace = enemy_spawner_autoplace(0)
	end
end
]]

require("prototypes.NE_Units.New_Units.Update_Immunities")
