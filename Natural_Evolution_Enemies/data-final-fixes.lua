if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end
NE_Enemies.Settings.NE_Adjust_Vanilla_Worms = settings.startup["NE_Adjust_Vanilla_Worms"].value


--- Update Vanilla Worm Stuff -- Medium worm will become fire worm and big worm will be come unit launcher worm
if NE_Enemies.Settings.NE_Adjust_Vanilla_Worms then

	require ("prototypes.NE_Units.New_Units.Worm_Changes")

end

require("prototypes.NE_Units.New_Units.Update_Immunities")
