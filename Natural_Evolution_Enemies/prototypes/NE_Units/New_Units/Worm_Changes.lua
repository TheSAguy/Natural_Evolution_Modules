-- Worm Adjustments
	
----- Small Worms	
data.raw["turret"]["small-worm-turret"].max_health = 200 + 100 * NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["small-worm-turret"].attack_parameters.range = 11 + NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["small-worm-turret"].resistances = Resistances.Small_Worm

----- Medium Worms
data.raw["turret"]["medium-worm-turret"].attack_parameters = Worm_Attack_Stream(
					{
						range = 20 + NE_Enemies.Settings.NE_Difficulty,
                        cooldown = 25 - NE_Enemies.Settings.NE_Difficulty,
                        damage_modifier = 4,
					})
data.raw["turret"]["medium-worm-turret"].max_health = 200 + 200 * NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["medium-worm-turret"].resistances = Resistances.Medium_Worm
data.raw["turret"]["medium-worm-turret"].call_for_help_radius = 100 + (NE_Enemies.Settings.NE_Difficulty * 2)

----- Big Worms	
data.raw["turret"]["big-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Mutated-Projectile-Worm"
data.raw["turret"]["big-worm-turret"].attack_parameters.range = 25 + NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].attack_parameters.cooldown = 61 - NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].attack_parameters = Worm_Attack_Projectile_NH(
					{
						range = 25 + NE_Enemies.Settings.NE_Difficulty,
                        cooldown = 61 - NE_Enemies.Settings.NE_Difficulty,
                        damage_modifier = 5,
						projectile="Worm-Unit-Projectile"
					})
data.raw["turret"]["big-worm-turret"].max_health = 400 + 200 * NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].resistances = Resistances.Big_Worm
data.raw["turret"]["big-worm-turret"].call_for_help_radius = 150 + (NE_Enemies.Settings.NE_Difficulty * 2)
		
