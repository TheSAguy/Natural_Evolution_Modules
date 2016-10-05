require ("config")
local NE = NE_Enemies_Config

--------- Used for Unit Launcher - Thanks Supercheese for this code :)
-- The result in the right column is the enemy that appears when the enemy in the left column dies. So if a behemoth spitter dies, medium spitters will appear.
-- For spawners, the current evolution factor rounded down to the nearest 10% (though 99% is rounded up to 100%) is used to look up which enemy appears.

subEnemyNameTable = {}

subEnemyNameTable["unit-cluster"] = {}
subEnemyNameTable["unit-cluster"][0] = 			"small-biter"
subEnemyNameTable["unit-cluster"][1] = 			"small-biter-Mk2"
subEnemyNameTable["unit-cluster"][2] = 			"small-biter-Mk3"
subEnemyNameTable["unit-cluster"][3] = 			"medium-biter"
subEnemyNameTable["unit-cluster"][4] = 			"medium-biter-Mk2"
subEnemyNameTable["unit-cluster"][5] = 			"medium-biter-Mk3"
subEnemyNameTable["unit-cluster"][6] = 			"big-biter"
subEnemyNameTable["unit-cluster"][7] = 			"big-biter-Mk2"
subEnemyNameTable["unit-cluster"][8] = 			"big-biter-Mk3"
subEnemyNameTable["unit-cluster"][9] = 			"behemoth-biter"
subEnemyNameTable["unit-cluster"][10] =			"behemoth-biter"


-- NUMBERS
-- The result in the right column is the number of enemies that appear when the enemy in the left column dies.
-- The current evolution factor rounded down to the nearest 10% is also used to look up which enemy appears.
subEnemyNumberTable = {}

subEnemyNumberTable["unit-cluster"] = {}
subEnemyNumberTable["unit-cluster"][0] = 			2 * NE.Set_Difficulty    --small
subEnemyNumberTable["unit-cluster"][1] = 			3 * NE.Set_Difficulty    --small
subEnemyNumberTable["unit-cluster"][2] = 			4 * NE.Set_Difficulty    --small
subEnemyNumberTable["unit-cluster"][3] = 			2 * NE.Set_Difficulty    --medium
subEnemyNumberTable["unit-cluster"][4] = 			3 * NE.Set_Difficulty    --medium
subEnemyNumberTable["unit-cluster"][5] = 			4 * NE.Set_Difficulty    --medium
subEnemyNumberTable["unit-cluster"][6] = 			2 * NE.Set_Difficulty    --big
subEnemyNumberTable["unit-cluster"][7] = 			3 * NE.Set_Difficulty    --big
subEnemyNumberTable["unit-cluster"][8] = 			4 * NE.Set_Difficulty    --big
subEnemyNumberTable["unit-cluster"][9] = 			2 * NE.Set_Difficulty    --behemoth
subEnemyNumberTable["unit-cluster"][10] =			4 * NE.Set_Difficulty    --behemoth



