data:extend({
  
		
		---- Building Materials
	{
		type = "recipe",
		name = "Building_Materials",
		normal =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"advanced-circuit", 15},
				{"stone-brick", 50},       
				{"steel-plate", 10}, 
			},
		  result = "Building_Materials",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"advanced-circuit", 20},
				{"stone-brick", 50},       
				{"steel-plate", 15}, 
			},
		  result = "Building_Materials",
		  result_count = 1,
		},
		
	},
	
	--- Attractor ON
	{
		type = "recipe",
		name = "attractor-on",
		enabled = false,
		ingredients =
		{
		  {"attractor-off", 1},
		},
		result = "attractor-on",
		energy_required = 0.5,
	},
  
  --- Attractor OFF
	{
		type = "recipe",
		name = "attractor-off",
		enabled = false,
		ingredients =
		{
		  {"attractor-on", 1},
		},
		result = "attractor-off",
		energy_required = 0.5,
	},

--[[	
	---- Battle Marker
	{
		type = "recipe",
		name = "battle_marker",
		enabled = false,
		ingredients = 
		{
			
			{"stone", 10},       
			
		},
		result = "battle_marker",
		energy_required= 0.5,
	},
	
]]	
})