NEConfig = {}

require "config"
require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require "prototypes.Vanilla_Changes.Settings"

---- Spawner Modifications ----------------------------------------
if NEConfig.Spawners then
	
	-- If you're using DyTech, I will not adjust the values of the Spawners, but use DyTech's values.
	if not NEConfig.mod.DyTechWar then
		
	-- Biter Spawner Adjustments
		data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units = 30
		data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn = 40
		data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown = {300, 150}
		data.raw["unit-spawner"]["biter-spawner"].max_health = 2500
		data.raw["unit-spawner"]["biter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["biter-spawner"].spawning_radius = 25
		data.raw["unit-spawner"]["biter-spawner"].spawning_spacing = 2
		--data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift = 0.65

		-- Spitter Spawner Adjustments
		data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units = 20
		data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn = 30
		data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown = {400, 180}
		data.raw["unit-spawner"]["spitter-spawner"].max_health = 3500
		data.raw["unit-spawner"]["spitter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["spitter-spawner"].spawning_radius = 20
		data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing = 2
		--data.raw["unit-spawner"]["spitter-spawner"].max_spawn_shift = 0.65

	end
	
	-- Bob's Enemies Modifications
	if NEConfig.mod.BobEnemies and NEConfig.mod.DyTechWar then

	-- Bob's Biter Spawner Adjustments
	data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_cooldown = data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["bob-biter-spawner"].max_health = data.raw["unit-spawner"]["biter-spawner"].max_health
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_radius = data.raw["unit-spawner"]["biter-spawner"].spawning_radius
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_spacing = data.raw["unit-spawner"]["biter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["bob-biter-spawner"].max_spawn_shift = data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute


	-- Bob's Spitter Spawner Adjustments
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_cooldown = data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_health = data.raw["unit-spawner"]["spitter-spawner"].max_health
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_radius = data.raw["unit-spawner"]["spitter-spawner"].spawning_radius
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_spacing = data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_spawn_shift = data.raw["unit-spawner"]["spitter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute


	
	
	elseif NEConfig.mod.BobEnemies and not NEConfig.mod.DyTechWar then

	-- Bob's Biter Spawner Adjustments
	data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = 30
	data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = 20
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_cooldown = {300, 150}
	data.raw["unit-spawner"]["bob-biter-spawner"].max_health = 2500
	data.raw["unit-spawner"]["bob-biter-spawner"].resistances = Resistances.Spawner
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_radius = 25
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_spacing = 2
	--data.raw["unit-spawner"]["bob-biter-spawner"].max_spawn_shift = 0.65

	-- Bob's Spitter Spawner Adjustments
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = 20
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = 15
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_cooldown = {400, 180}
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_health = 3500
	data.raw["unit-spawner"]["bob-spitter-spawner"].resistances = Resistances.Spawner
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_radius = 20
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_spacing = 2
	--data.raw["unit-spawner"]["bob-spitter-spawner"].max_spawn_shift = 0.65

	end

end
---- END Spawner Modifications ----------------------------------------



---- Biter & Spitter Modifications --------------------------------
if NEConfig.Spawners then
	

	-- Vanilla Unit Adjustments
	data.raw["unit"]["small-biter"].resistances = Resistances.Small_Biter
	data.raw["unit"]["small-biter"].max_health = Health.Small_Biter
	data.raw["unit"]["small-biter"].ammo_type = Damage.Small_Biter

	data.raw["unit"]["medium-biter"].resistances = Resistances.Medium_Biter
	data.raw["unit"]["medium-biter"].max_health = Health.Medium_Biter
	data.raw["unit"]["medium-biter"].ammo_type = Damage.Medium_Biter
	data.raw["unit"]["medium-biter"].pollution_to_join_attack = 800

	data.raw["unit"]["big-biter"].resistances = Resistances.Big_Biter
	data.raw["unit"]["big-biter"].max_health = Health.Big_Biter
	data.raw["unit"]["big-biter"].ammo_type = Damage.Big_Biter
	data.raw["unit"]["big-biter"].pollution_to_join_attack = 1000

	data.raw["unit"]["behemoth-biter"].resistances = Resistances.Behemoth_Biter
	data.raw["unit"]["behemoth-biter"].max_health = Health.Behemoth_Biter
	data.raw["unit"]["behemoth-biter"].ammo_type = Damage.Behemoth_Biter
	data.raw["unit"]["behemoth-biter"].pollution_to_join_attack = 2500



	data.raw["unit"]["small-spitter"].resistances = Resistances.Small_Spitter
	data.raw["unit"]["small-spitter"].max_health = Health.Small_Spitter

	data.raw["unit"]["medium-spitter"].resistances = Resistances.Medium_Spitter
	data.raw["unit"]["medium-spitter"].max_health = Health.Medium_Spitter

	data.raw["unit"]["big-spitter"].resistances = Resistances.Big_Spitter
	data.raw["unit"]["big-spitter"].max_health = Health.Big_Spitter
	data.raw["unit"]["big-spitter"].pollution_to_join_attack = 1200

	data.raw["unit"]["behemoth-spitter"].resistances = Resistances.Behemoth_Spitter
	data.raw["unit"]["behemoth-spitter"].max_health = Health.Behemoth_Spitter
	data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack = 5000

	-- Worms
	data.raw["turret"]["medium-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Infected-Projectile"
	data.raw["turret"]["big-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Mutated-Projectile"
	

	
	
-- Bob's Enemies Modifications
	if NEConfig.mod.BobEnemies then

		data.raw["unit"]["bob-bigger-biter"].pollution_to_join_attack = 1000
		data.raw["unit"]["bob-biggest-biter"].pollution_to_join_attack = 2500
		data.raw["unit"]["bob-fire-biter"].pollution_to_join_attack = 5000
		data.raw["unit"]["bob-bigger-spitter"].pollution_to_join_attack = 1000
		data.raw["unit"]["bob-biggest-spitter"].pollution_to_join_attack = 2500
		data.raw["unit"]["bob-poison-spitter"].pollution_to_join_attack = 5000

		if NEConfig.Spawners and not NEConfig.mod.DyTechWar then
			require "prototypes.Vanilla_Changes.Bobs_Spawners"				
		end

		
	end


---- END Biter & Spitter Modifications --------------------------------

-------- New Units
	if not NEConfig.mod.DyTechWar then
		require "prototypes.Vanilla_Changes.New_Biter_Units"
		require "prototypes.Vanilla_Changes.Biter_Evolution"
		require "prototypes.Vanilla_Changes.New_Spitter_Units"
		require "prototypes.Vanilla_Changes.Spitter_Evolution"
	
	end
		
end
		
		--- Extra Loot
if NEConfig.ExtraLoot then
	require("prototypes.Extra_Loot.item")
	require("prototypes.Extra_Loot.recipe")
	require("prototypes.Extra_Loot.extra_loot")
end

---------------------------------------------------------------
