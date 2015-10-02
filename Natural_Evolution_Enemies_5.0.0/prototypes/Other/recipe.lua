data:extend({
  
		
		---- Building Materials
	{
      type = "recipe",
		  name = "Building_Materials",
		  enabled = "false",
		  ingredients = 
		  {
			--{"iron-plate", 1},
			{"advanced-circuit", 15},
			{"stone-brick", 50},       
			{"steel-plate", 10}, 
		  },
		  result = "Building_Materials"
	},
	
	--- Biological Bullet
	{
		type = "recipe",
		name = "Biological-bullet-magazine",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {"alien-artifact", 1},
		  {"plastic-bar", 5},
		  {"piercing-bullet-magazine", 5},
		},
		result = "Biological-bullet-magazine",
		result_count = 5
  },
	
})