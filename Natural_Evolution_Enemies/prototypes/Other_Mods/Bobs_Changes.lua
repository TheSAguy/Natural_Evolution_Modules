
local function call_radius(w_name,radius)
	if data.raw.turret[w_name] then
		data.raw.turret[w_name].call_for_help_radius = radius
	end
end



local function pollution_attack(u_name,amount)
	if data.raw.unit[u_name] then
		data.raw.unit[u_name].pollution_to_join_attack = amount
	end
end

	   

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


	--- Bob's Biter Units
	pollution_attack("bob-big-piercing-biter", 1000)
	pollution_attack("bob-huge-acid-biter", 2000)
	pollution_attack("bob-huge-explosive-biter", 3000)
	pollution_attack("bob-giant-poison-biter", 4000)
	pollution_attack("bob-giant-fire-biter", 5000)
	pollution_attack("bob-titan-biter", 6000)
	pollution_attack("bob-behemoth-biter", 7000)
	pollution_attack("bob-leviathan-biter", 8000)
	
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

	--- Bob's Spitter Units
	pollution_attack("bob-big-electric-spitter", 1500)
	pollution_attack("bob-huge-explosive-spitter", 2500)
	pollution_attack("bob-huge-acid-spitter", 2300)
	pollution_attack("bob-giant-fire-spitter", 4500)
	pollution_attack("bob-giant-poison-spitter", 5500)
	pollution_attack("bob-titan-spitter", 6500)
	pollution_attack("bob-behemoth-spitter", 7500)
	pollution_attack("bob-leviathan-spitter", 8500)
	
end	


		
--- Bob's Worms
 call_radius("bob-big-explosive-worm-turret", 120)
 call_radius("bob-big-fire-worm-turret", 120)
 call_radius("bob-big-poison-worm-turret", 120)
 call_radius("bob-big-piercing-worm-turret", 120)
 call_radius("bob-big-electric-worm-turret", 120)
 call_radius("bob-giant-worm-turret", 200)
 call_radius("bob-behemoth-worm-turret", 300)






