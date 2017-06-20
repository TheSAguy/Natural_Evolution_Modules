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
	
})