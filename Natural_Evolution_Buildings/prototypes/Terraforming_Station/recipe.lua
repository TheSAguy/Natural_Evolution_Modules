data:extend({
    --- Terraforming Station
	{
        type = "recipe",
        name = "TerraformingStation",
		normal =
		{
			enabled = false,
			energy_required = 35,
			ingredients = 
			{
				{"Building_Materials", 15},
				{"alien-artifact", 20},
			},
		  result = "TerraformingStation",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
				{"Building_Materials", 20},
				{"alien-artifact", 40},
			},
		  result = "TerraformingStation",
		  result_count = 1,
		},

    },
	
	{
		type = "recipe",
		name = "Alien-Stimulant",	
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"alien-artifact", 5},
			},
		  result = "Alien-Stimulant",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"alien-artifact", 5},
			},
		  result = "Alien-Stimulant",
		  result_count = 8,
		},
	}, 	
	
	
	
})