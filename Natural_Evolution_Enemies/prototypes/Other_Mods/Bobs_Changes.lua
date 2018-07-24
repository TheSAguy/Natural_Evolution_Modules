
	   

if data.raw["unit-spawner"]["bob-biter-spawner"] then

	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"small-biter-Mk2", {{0.10, 0.0}, {0.40, 0.3}, {0.50, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"small-biter-Mk3", {{0.20, 0.0}, {0.50, 0.3}, {0.60, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"medium-biter-Mk2", {{0.40, 0.0}, {0.70, 0.3}, {0.80, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"medium-biter-Mk3", {{0.50, 0.0}, {0.80, 0.3}, {0.90, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"big-biter-Mk2",	 {{0.70, 0.0}, {1.00, 0.3}}})
	table.insert(data.raw["unit-spawner"]["bob-biter-spawner"].result_units, {"big-biter-Mk3",	{{0.80, 0.0}, {1.00, 0.3}}})

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


	--- Bob's Units
	data.raw["unit"]["bob-big-piercing-biter"].pollution_to_join_attack = 1000
	data.raw["unit"]["bob-huge-acid-biter"].pollution_to_join_attack = 2000
	data.raw["unit"]["bob-huge-explosive-biter"].pollution_to_join_attack = 3000
	data.raw["unit"]["bob-giant-poison-biter"].pollution_to_join_attack = 4000
	data.raw["unit"]["bob-giant-fire-biter"].pollution_to_join_attack = 5000
	data.raw["unit"]["bob-titan-biter"].pollution_to_join_attack = 6000
	data.raw["unit"]["bob-behemoth-biter"].pollution_to_join_attack = 7000
	data.raw["unit"]["bob-leviathan-biter"].pollution_to_join_attack = 8000	
	
end	  


if data.raw["unit-spawner"]["bob-spitter-spawner"] then

	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"small-spitter-Mk2", 	{{0.15, 0.0}, {0.45, 0.3}, {0.55, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"small-spitter-Mk3", 	{{0.25, 0.0}, {0.55, 0.3}, {0.65, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"medium-spitter-Mk2", 	{{0.45, 0.0}, {0.75, 0.3}, {0.85, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"medium-spitter-Mk3", 	{{0.55, 0.0}, {0.85, 0.3}, {0.95, 0.0}}})
	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"big-spitter-Mk2",	 	{{0.75, 0.0}, {1.00, 0.3}}})
	table.insert(data.raw["unit-spawner"]["bob-spitter-spawner"].result_units, {"big-spitter-Mk3", 	{{0.85, 0.0}, {1.00, 0.3}}})

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

		
	data.raw["unit"]["bob-big-electric-spitter"].pollution_to_join_attack = 1500
	data.raw["unit"]["bob-huge-explosive-spitter"].pollution_to_join_attack = 2500
	data.raw["unit"]["bob-huge-acid-spitter"].pollution_to_join_attack = 3500
	data.raw["unit"]["bob-giant-fire-spitter"].pollution_to_join_attack = 4500
	data.raw["unit"]["bob-giant-poison-spitter"].pollution_to_join_attack = 5500
	data.raw["unit"]["bob-titan-spitter"].pollution_to_join_attack = 6500
	data.raw["unit"]["bob-behemoth-spitter"].pollution_to_join_attack = 7500
	data.raw["unit"]["bob-leviathan-spitter"].pollution_to_join_attack = 8500	
	
end	


if data.raw["turret"]["bob-big-explosive-worm-turret"] then
		
	--- Bob's Worms
	data.raw["turret"]["bob-big-explosive-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-fire-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-poison-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-piercing-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-big-electric-worm-turret"].call_for_help_radius = 120
	data.raw["turret"]["bob-giant-worm-turret"].call_for_help_radius = 200
	data.raw["turret"]["bob-behemoth-worm-turret"].call_for_help_radius = 300	

end