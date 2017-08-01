data:extend({
  

	--- Bio Ammo
	{
		type = "recipe",
		name = "Biological-bullet-magazine",
		category = "crafting-with-fluid",
		
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"piercing-rounds-magazine", 10},
				{type="fluid", name="NE_alien_toxin", amount=10}
			},
		  result = "Biological-bullet-magazine",
		  result_count = 5,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"piercing-rounds-magazine", 12},
				{type="fluid", name="NE_alien_toxin", amount=15}
			},
		  result = "Biological-bullet-magazine",
		  result_count = 4,
		},
	}, 	
	
		--- Copper Ammo
	{
		type = "recipe",
		name = "copper_bullets",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine.png",
		normal =
		{
			enabled = true,
			energy_required = 1,
			ingredients = 
			{
				{"copper-plate", 8},

			},
		  result = "copper-bullet-magazine",
		  result_count = 1,
		},
		expensive =
		{
			enabled = true,
			energy_required = 2,
			ingredients = 
			{
				{"copper-plate", 10},
			},
		  result = "copper-bullet-magazine",
		  result_count = 1,
		},
	}, 	
	
			--- piercing-rounds-magazine from Copper Ammo
	{
		type = "recipe",
		name = "piercing_magazine_copper",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/piercing_magazine_copper.png",
		order = "a[basic-clips]-b1[piercing-rounds-magazine]",
		normal =
		{
			enabled = false,
			energy_required = 3,
			ingredients = 
			{
			  {"copper-bullet-magazine", 1},
			  {"steel-plate", 1},
			  {"copper-plate", 8}
			},
		  result = "piercing-rounds-magazine",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"copper-bullet-magazine", 1},
			  {"steel-plate", 1},
			  {"copper-plate", 10}
			},
		  result = "piercing-rounds-magazine",
		  result_count = 1,
		},
	}, 	
	---- Bio Land Mine
	{
		type = "recipe",
		name = "bio_land_mine",
		category = "crafting-with-fluid",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"land-mine", 5},
				{type="fluid", name="NE_alien_toxin", amount=15}
			},
		  result = "bio_land_mine",
		  result_count = 5,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"land-mine", 5},
				{type="fluid", name="NE_alien_toxin", amount=20}
			},
		  result = "bio_land_mine",
		  result_count = 4,
		},
	}, 	
	

})