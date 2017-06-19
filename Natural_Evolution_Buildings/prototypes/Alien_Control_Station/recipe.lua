data:extend({
 

	--- Alien Control Station Area
	{
		type = "recipe",
		name = "AlienControlStation",
		normal =
		{
			enabled = false,
			energy_required = 20,
			ingredients = 
			{
			  {"Building_Materials", 10},    
			  {"alien-artifact", 10},
			},
		  result = "AlienControlStation_Area",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 30,
			ingredients = 
			{
			  {"Building_Materials", 10},    
			  {"alien-artifact", 40},
			},
		  result = "AlienControlStation_Area",
		  result_count = 1,
		},
	}, 	
	
})