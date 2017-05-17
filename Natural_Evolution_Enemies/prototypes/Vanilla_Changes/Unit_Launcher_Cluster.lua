if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value



--------- Used for Unit Launcher - Thanks Supercheese for this code :)
-- The result in the right column is the enemy that appears when the enemy in the left column dies. So if a behemoth spitter dies, medium spitters will appear.
-- For spawners, the current evolution factor rounded down to the nearest 10% (though 99% is rounded up to 100%) is used to look up which enemy appears.

subEnemyNameTable = {}

subEnemyNameTable["unit-cluster"] = {}
subEnemyNameTable["unit-cluster"][0] = 			"small-biter"
subEnemyNameTable["unit-cluster"][1] = 			"small-biter"
subEnemyNameTable["unit-cluster"][2] = 			"small-biter-Mk2"
subEnemyNameTable["unit-cluster"][3] = 			"small-biter-Mk3"
subEnemyNameTable["unit-cluster"][4] = 			"medium-biter"
subEnemyNameTable["unit-cluster"][5] = 			"medium-biter-Mk2"
subEnemyNameTable["unit-cluster"][6] = 			"medium-biter-Mk3"
subEnemyNameTable["unit-cluster"][7] = 			"big-biter"
subEnemyNameTable["unit-cluster"][8] = 			"big-biter-Mk2"
subEnemyNameTable["unit-cluster"][9] = 			"big-biter-Mk3"
subEnemyNameTable["unit-cluster"][10] =			"behemoth-biter"


-- NUMBERS
-- The result in the right column is the number of enemies that appear when the enemy in the left column dies.
-- The current evolution factor rounded down to the nearest 10% is also used to look up which enemy appears.
subEnemyNumberTable = {}

if settings.startup["rampant-useNEUnitLaunchers"] and settings.startup["rampant-useNEUnitLaunchers"].value then

	subEnemyNumberTable["unit-cluster"] = {}
	subEnemyNumberTable["unit-cluster"][0] = 			math.floor( 1 * NE_Enemies.Settings.NE_Difficulty / 2 )   --small
	subEnemyNumberTable["unit-cluster"][1] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --small
	subEnemyNumberTable["unit-cluster"][2] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --small
	subEnemyNumberTable["unit-cluster"][3] = 			math.floor( 3 * NE_Enemies.Settings.NE_Difficulty / 2 )    --small
	subEnemyNumberTable["unit-cluster"][4] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --medium
	subEnemyNumberTable["unit-cluster"][5] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --medium
	subEnemyNumberTable["unit-cluster"][6] = 			math.floor( 3 * NE_Enemies.Settings.NE_Difficulty / 2 )    --medium
	subEnemyNumberTable["unit-cluster"][7] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --big
	subEnemyNumberTable["unit-cluster"][8] = 			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --big
	subEnemyNumberTable["unit-cluster"][9] = 			math.floor( 3 * NE_Enemies.Settings.NE_Difficulty / 2 )    --big
	subEnemyNumberTable["unit-cluster"][10] =			math.floor( 2 * NE_Enemies.Settings.NE_Difficulty / 2 )    --behemoth
else

	subEnemyNumberTable["unit-cluster"] = {}
	subEnemyNumberTable["unit-cluster"][0] = 			1 * NE_Enemies.Settings.NE_Difficulty    --small
	subEnemyNumberTable["unit-cluster"][1] = 			2 * NE_Enemies.Settings.NE_Difficulty    --small
	subEnemyNumberTable["unit-cluster"][2] = 			2 * NE_Enemies.Settings.NE_Difficulty    --small
	subEnemyNumberTable["unit-cluster"][3] = 			3 * NE_Enemies.Settings.NE_Difficulty    --small
	subEnemyNumberTable["unit-cluster"][4] = 			2 * NE_Enemies.Settings.NE_Difficulty    --medium
	subEnemyNumberTable["unit-cluster"][5] = 			2 * NE_Enemies.Settings.NE_Difficulty    --medium
	subEnemyNumberTable["unit-cluster"][6] = 			3 * NE_Enemies.Settings.NE_Difficulty    --medium
	subEnemyNumberTable["unit-cluster"][7] = 			2 * NE_Enemies.Settings.NE_Difficulty    --big
	subEnemyNumberTable["unit-cluster"][8] = 			2 * NE_Enemies.Settings.NE_Difficulty    --big
	subEnemyNumberTable["unit-cluster"][9] = 			3 * NE_Enemies.Settings.NE_Difficulty    --big
	subEnemyNumberTable["unit-cluster"][10] =			2 * NE_Enemies.Settings.NE_Difficulty    --behemoth

end

