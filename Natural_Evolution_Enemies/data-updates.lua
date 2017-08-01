if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value

require ("libs.detectmod") --Detect supported Mods, Bob's Enemies and others
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("prototypes.Vanilla_Changes.Settings")

-------- New Units
require "prototypes.Vanilla_Changes.New_Biter_Units"
require "prototypes.Vanilla_Changes.Biter_Evolution"
require "prototypes.Vanilla_Changes.New_Spitter_Units"
require "prototypes.Vanilla_Changes.Spitter_Evolution"			


if data.raw.player.player.loot_pickup_distance < 4 then
	data.raw.player.player.loot_pickup_distance = 4 -- default 2
end	

if data.raw.player.player.running_speed < 0.15 then
	data.raw.player.player.running_speed = 0.25 -- default 0.15
end	

data.raw.player.player.healing_per_tick = 0.005   -- default 0.01



--- Bob's Enemies - Update the Small Artifact Recipe.
if NE_Enemies_Config.mod.BobEnemies and settings.startup["NE_Alien_Artifacts"].value and data.raw.item["alien-artifact-from-small"] then

	thxbob.lib.recipe.remove_ingredient ("alien-artifact-from-small", "small-alien-artifact")
	thxbob.lib.recipe.add_new_ingredient ("alien-artifact-from-small", {type="item", name="small-alien-artifact", amount=100})
	
end


--Add resistances to entities.
-- Poison
NE_Functions.Add_Damage_Resists("poison",data.raw["wall"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("poison",data.raw["gate"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("poison",data.raw["car"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("poison",data.raw["electric-pole"],100)
NE_Functions.Add_Damage_Resists("poison",data.raw["turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("poison",data.raw["ammo-turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("poison",data.raw["electric-turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("poison",data.raw["inserter"],(25/NE_Enemies.Settings.NE_Difficulty))
	
-- Acid
NE_Functions.Add_Damage_Resists("acid",data.raw["wall"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("acid",data.raw["gate"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("acid",data.raw["car"],(25/NE_Enemies.Settings.NE_Difficulty))
NE_Functions.Add_Damage_Resists("acid",data.raw["electric-pole"],100)
NE_Functions.Add_Damage_Resists("acid",data.raw["turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("acid",data.raw["ammo-turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("acid",data.raw["electric-turret"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("acid",data.raw["transport-belt"],(25/NE_Enemies.Settings.NE_Difficulty))	
NE_Functions.Add_Damage_Resists("acid",data.raw["inserter"],(25/NE_Enemies.Settings.NE_Difficulty))
	
NE_Functions.Add_ALL_Damage_Resists(data.raw["electric-pole"],15)

--- Add all resistances.
if data.raw.inserter["combat-inserter"] then
	for k, v in pairs(data.raw["damage-type"]) do
	local Resist = {type = v.name, percent = 80} -- or you could use k, and not v.name		
	
				if data.raw.inserter["combat-inserter"].resistances == nil then 
					data.raw.inserter["combat-inserter"].resistances = {}
					table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
				else
					local found = false
					for _, resistance in pairs(data.raw.inserter["combat-inserter"].resistances) do
						if resistance.type == Resist.type and resistance.percent > Resist.percent then
								found = true
							break
						elseif resistance.type == Resist.type and resistance.percent < Resist.percent then
							found = true
							table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
							break
						end
					end
				
					if not found then
					table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
					end
				
				end
	
	end
end
	


---- Spawner Modifications ----------------------------------------

	
	
-- Biter Spawner Adjustments
data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units = 15 + 15 * NE_Enemies.Settings.NE_Difficulty
data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn = 25 + 15 * NE_Enemies.Settings.NE_Difficulty
data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown = {(200+100/NE_Enemies.Settings.NE_Difficulty), (100+50/NE_Enemies.Settings.NE_Difficulty)}
data.raw["unit-spawner"]["biter-spawner"].max_health = 500 + (500 * NE_Enemies.Settings.NE_Difficulty)
data.raw["unit-spawner"]["biter-spawner"].resistances = Resistances.Spawner
data.raw["unit-spawner"]["biter-spawner"].spawning_radius = 25
data.raw["unit-spawner"]["biter-spawner"].spawning_spacing = 2
data.raw["unit-spawner"]["biter-spawner"].healing_per_tick = 0.01 + (0.002 * NE_Enemies.Settings.NE_Difficulty) -- 0.02
data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute = 15
data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional = 0.005

-- Spitter Spawner Adjustments
data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units = 10 + 10 * NE_Enemies.Settings.NE_Difficulty
data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn = 15 + 15 * NE_Enemies.Settings.NE_Difficulty
data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown = {(300+100/NE_Enemies.Settings.NE_Difficulty), (100+80/NE_Enemies.Settings.NE_Difficulty)}
data.raw["unit-spawner"]["spitter-spawner"].max_health = 1000 + (500 * NE_Enemies.Settings.NE_Difficulty)
data.raw["unit-spawner"]["spitter-spawner"].resistances = Resistances.Spawner
data.raw["unit-spawner"]["spitter-spawner"].spawning_radius = 20
data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing = 2
data.raw["unit-spawner"]["spitter-spawner"].healing_per_tick = 0.01 + (0.002 * NE_Enemies.Settings.NE_Difficulty) -- 0.02
data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute = 15
data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional = 0.005


---- Biter & Spitter Modifications --------------------------------

	
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

		
--- Vanilla Spitter Units
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
--data.raw["turret"]["small-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Infected-Projectile-Worm" -- Testing
data.raw["turret"]["small-worm-turret"].max_health = Health.Small_Worm
data.raw["turret"]["small-worm-turret"].attack_parameters.range = 11 + NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["small-worm-turret"].resistances = Resistances.Small_Worm

data.raw["turret"]["medium-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Infected-Projectile-Worm"
data.raw["turret"]["medium-worm-turret"].max_health = Health.Medium_Worm
data.raw["turret"]["medium-worm-turret"].attack_parameters.range = 17 + NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].attack_parameters.cooldown = 85 - NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["medium-worm-turret"].resistances = Resistances.Medium_Worm
data.raw["turret"]["medium-worm-turret"].call_for_help_radius = 60
		
data.raw["turret"]["big-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Mutated-Projectile-Worm"
data.raw["turret"]["big-worm-turret"].max_health = Health.Big_Worm
data.raw["turret"]["big-worm-turret"].attack_parameters.range = 22 + NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].attack_parameters.cooldown = 95 - NE_Enemies.Settings.NE_Difficulty
data.raw["turret"]["big-worm-turret"].resistances = Resistances.Big_Worm
data.raw["turret"]["big-worm-turret"].call_for_help_radius = 120
		

	
-- Bob's Enemies Modifications
if NE_Enemies_Config.mod.BobEnemies then

	require "prototypes.Vanilla_Changes.Bobs_Spawners"		

	-- Bob's Biter Spawner Adjustments
	data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = 15 + 15 * NE_Enemies.Settings.NE_Difficulty
	data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = 25 + 15 * NE_Enemies.Settings.NE_Difficulty
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_cooldown = {(200+100/NE_Enemies.Settings.NE_Difficulty), (100+50/NE_Enemies.Settings.NE_Difficulty)}
	data.raw["unit-spawner"]["bob-biter-spawner"].max_health = 500 + (500 * NE_Enemies.Settings.NE_Difficulty)
	data.raw["unit-spawner"]["bob-biter-spawner"].resistances = Resistances.Spawner
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_radius = 25
	data.raw["unit-spawner"]["bob-biter-spawner"].spawning_spacing = 2
	data.raw["unit-spawner"]["bob-biter-spawner"].healing_per_tick = 0.01 + (0.002 * NE_Enemies.Settings.NE_Difficulty) -- 0.02
	data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_absolute = 15
	data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_proportional = 0.005
		
			
	-- Bob's Spitter Spawner Adjustments
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = 10 + 10 * NE_Enemies.Settings.NE_Difficulty
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = 15 + 15 * NE_Enemies.Settings.NE_Difficulty
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_cooldown = {(300+100/NE_Enemies.Settings.NE_Difficulty), (100+80/NE_Enemies.Settings.NE_Difficulty)}
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_health = 1000 + (500 * NE_Enemies.Settings.NE_Difficulty)
	data.raw["unit-spawner"]["bob-spitter-spawner"].resistances = Resistances.Spawner
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_radius = 20
	data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_spacing = 2
	data.raw["unit-spawner"]["bob-spitter-spawner"].healing_per_tick = 0.01 + (0.002 * NE_Enemies.Settings.NE_Difficulty) -- 0.02
	data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_absolute = 15
	data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_proportional = 0.005
		
	
	data.raw["unit"]["bob-big-piercing-biter"].pollution_to_join_attack = 1000
	data.raw["unit"]["bob-huge-acid-biter"].pollution_to_join_attack = 2000
	data.raw["unit"]["bob-huge-explosive-biter"].pollution_to_join_attack = 3000
	data.raw["unit"]["bob-giant-poison-biter"].pollution_to_join_attack = 4000
	data.raw["unit"]["bob-giant-fire-biter"].pollution_to_join_attack = 5000
	data.raw["unit"]["bob-titan-biter"].pollution_to_join_attack = 6000
	data.raw["unit"]["bob-behemoth-biter"].pollution_to_join_attack = 7000
	data.raw["unit"]["bob-leviathan-biter"].pollution_to_join_attack = 8000	
		
	data.raw["unit"]["bob-big-electric-spitter"].pollution_to_join_attack = 1500
	data.raw["unit"]["bob-huge-explosive-spitter"].pollution_to_join_attack = 2500
	data.raw["unit"]["bob-huge-acid-spitter"].pollution_to_join_attack = 3500
	data.raw["unit"]["bob-giant-fire-spitter"].pollution_to_join_attack = 4500
	data.raw["unit"]["bob-giant-poison-spitter"].pollution_to_join_attack = 5500
	data.raw["unit"]["bob-titan-spitter"].pollution_to_join_attack = 6500
	data.raw["unit"]["bob-behemoth-spitter"].pollution_to_join_attack = 7500
	data.raw["unit"]["bob-leviathan-spitter"].pollution_to_join_attack = 8500	
		
	--- Bob's Worms
	data.raw["turret"]["bob-big-explosive-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-fire-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-poison-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-piercing-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-electric-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-giant-worm-turret"].call_for_help_radius = 200
	data.raw["turret"]["bob-behemoth-worm-turret"].call_for_help_radius = 300	
	
end


---- END Biter & Spitter Modifications --------------------------------		

