

---- Spawner Unit tables update
data.raw["unit-spawner"]["bob-biter-spawner"].result_units = (function()
                     local res = {}

						res[1] = {"small-biter", 		{{0.00, 0.3}, {0.30, 0.3}, {0.40, 0.0}}}
						res[2] = {"small-biter-Mk2", 	{{0.10, 0.0}, {0.40, 0.3}, {0.50, 0.0}}}
						res[3] = {"small-biter-Mk3", 	{{0.20, 0.0}, {0.50, 0.3}, {0.60, 0.0}}}
						   
						res[4] = {"medium-biter", 		 {{0.30, 0.0}, {0.60, 0.3}, {0.70, 0.0}}}
						res[5] = {"medium-biter-Mk2", 	{{0.40, 0.0}, {0.70, 0.3}, {0.80, 0.0}}}
						res[6] = {"medium-biter-Mk3", 	{{0.50, 0.0}, {0.80, 0.3}, {0.90, 0.0}}}
						   
						res[7] = {"big-biter",	 		 {{0.60, 0.0}, {0.90, 0.3}, {1.00, 0.0}}}
					   
						res[8] = {"bob-big-piercing-biter", {{0.7, 0.0}, {0.8, 0.4}, {0.9, 0.0}}}
						res[9] = {"bob-huge-acid-biter", {{0.7, 0.0}, {0.8, 0.2}}}
						res[10] = {"bob-huge-explosive-biter", {{0.7, 0.0}, {0.8, 0.1}}}
						res[11] = {"bob-giant-poison-biter", {{0.8, 0.0}, {0.9, 0.2}}}
						res[12] = {"bob-giant-fire-biter", {{0.8, 0.0}, {0.9, 0.1}}}
						res[13] = {"bob-titan-biter", {{0.9, 0.0}, {1.0, 0.3}}}
						res[14] = {"bob-behemoth-biter", {{0.99, 0.0}, {1.0, 0.3}}}
						res[15] = {"bob-leviathan-biter", {{0.99, 0.0}, {1.0, 0.05}}}			   			   

                     return res
                   end)()
				   

data.raw["unit-spawner"]["bob-spitter-spawner"].result_units = (function()
                     local res = {}

						res[1] = {"small-biter", 		{{0.00, 0.3}, {0.05, 0.3}, {0.10, 0.0}}}        
					   
						res[2] = {"small-spitter", 		{{0.05, 0.3}, {0.35, 0.3}, {0.45, 0.0}}}
						res[3] = {"small-spitter-Mk2", 	{{0.15, 0.0}, {0.45, 0.3}, {0.55, 0.0}}}
						res[4] = {"small-spitter-Mk3", 	{{0.25, 0.0}, {0.55, 0.3}, {0.65, 0.0}}}
					   
						res[5] = {"medium-spitter", 	 	{{0.35, 0.0}, {0.65, 0.3}, {0.75, 0.0}}}
						res[6] = {"medium-spitter-Mk2", 	{{0.45, 0.0}, {0.75, 0.3}, {0.85, 0.0}}}
						res[7] = {"medium-spitter-Mk3", 	{{0.55, 0.0}, {0.85, 0.3}, {0.95, 0.0}}}
					   
						res[8] = {"big-spitter",	 	 	{{0.65, 0.0}, {0.95, 0.3}, {1.00, 0.0}}}
					   
						res[9] = {"bob-big-electric-spitter", {{0.7, 0.0}, {0.8, 0.4}, {0.9, 0.0}}}
						res[10] = {"bob-huge-explosive-spitter", {{0.7, 0.0}, {0.8, 0.2}}}
						res[11] = {"bob-huge-acid-spitter", {{0.7, 0.0}, {0.8, 0.1}}}
						res[12] = {"bob-giant-fire-spitter", {{0.8, 0.0}, {0.9, 0.2}}}
						res[13] = {"bob-giant-poison-spitter", {{0.8, 0.0}, {0.9, 0.1}}}
						res[14] = {"bob-titan-spitter", {{0.9, 0.0}, {1.0, 0.3}}}
						res[15] = {"bob-behemoth-spitter", {{0.99, 0.0}, {1.0, 0.3}}}
						res[16] = {"bob-leviathan-spitter", {{0.99, 0.0}, {1.0, 0.05}}}		
					   				   
                     return res
                   end)()
				   

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
		
	--- Bob's Units
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
	