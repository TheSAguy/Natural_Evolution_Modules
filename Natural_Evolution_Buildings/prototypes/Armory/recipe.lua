data:extend({

	--- Basic Dart
	{
		type = "recipe",
		name = "basic_dart_magazine",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 8,
		},
	}, 	
	
	--- Enhanced Dart
	{
		type = "recipe",
		name = "enhanced_dart_magazine",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 8,
		},
	}, 	
  

	--- Copper Ammo
	{
		type = "recipe",
		name = "copper_bullets",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine.png",
		normal =
		{
			enabled = false,
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
			enabled = false,
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

	
	---------------- Conversion ------------------------------------------------

	--- Conversion Basic Dart
	{
		type = "recipe",
		name = "basic_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"basic-dart-magazine", 1},

				
			},
		  result = "basic-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"basic-dart-magazine", 1},
			},
		  result = "basic-dart-magazine_c",
		  result_count = 1,
		},
	}, 	
	
	--- Enhanced Dart
	{
		type = "recipe",
		name = "enhanced_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"enhanced-dart-magazine", 1},
			},
		  result = "enhanced-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"enhanced-dart-magazine", 1},
			},
		  result = "enhanced-dart-magazine_c",
		  result_count = 1,
		},
	}, 	
  		
	 --- Conversion Ammo Copper
	{
		type = "recipe",
		name = "copper_bullets_c",
		--icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		--order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = false,
			energy_required = 3,
			ingredients = 
			{
			  {"Alien-Stimulant", 1},
			  {"copper-bullet-magazine", 1},
			},
		  result = "copper-bullet-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"Alien-Stimulant", 2},
			  {"copper-bullet-magazine", 1},
			},
		  result = "copper-bullet-magazine_c",
		  result_count = 1,
		},
	}, 	
	
	---- Conversion firearm-magazine
	{
		type = "recipe",
		name = "firearm_magazine_c",
		--icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		--order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = false,
			energy_required = 3,
			ingredients = 
			{
			  {"Alien-Stimulant", 1},
			  {"firearm-magazine", 1},
			},
		  result = "firearm-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"Alien-Stimulant", 2},
			  {"firearm-magazine", 1},
			},
		  result = "firearm-magazine_c",
		  result_count = 1,
		},
	
  },
	
---- Conversion piercing-rounds-magazine
  {
		type = "recipe",
		name = "piercing_rounds_magazine_c",
		--icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		--order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = false,
			energy_required = 3,
			ingredients = 
			{
			  {"Alien-Stimulant", 1},
			  {"piercing-rounds-magazine", 1},
			},
		  result = "piercing-rounds-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"Alien-Stimulant", 2},
			  {"piercing-rounds-magazine", 1},
			},
		  result = "piercing-rounds-magazine_c",
		  result_count = 1,
		},
	
	
	
  },
  
  ---- Conversion uranium-rounds-magazine
  {
		type = "recipe",
		name = "uranium_rounds_magazine_c",
		--icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		--order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
			  {"Alien-Stimulant", 1},
			  {"uranium-rounds-magazine", 1},
			},
		  result = "uranium-rounds-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 6,
			ingredients = 
			{
			  {"Alien-Stimulant", 2},
			  {"uranium-rounds-magazine", 1},
			},
		  result = "uranium-rounds-magazine_c",
		  result_count = 1,
		},
	
	
  },
   
	--- Conversion Biological-bullet-magazine
	{
		type = "recipe",
		name = "Biological_bullet_magazine_c",
		--icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		--order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"Biological-bullet-magazine", 1},
			},
		  result = "Biological-bullet-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 6,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"Biological-bullet-magazine", 1},
			},
		  result = "Biological-bullet-magazine_c",
		  result_count = 1,
		},
	}, 	
  
  
  
----------------------------------------------------------------
	
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
	
----------------------------------------------------------------	

  
	--- Dart Turret
  {
    type = "recipe",
    name = "bio_turret",
    	
	normal =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
			  {"iron-gear-wheel", 5},
			  {"raw-wood", 20},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = true,
			energy_required = 16,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"raw-wood", 25},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	

  },
	
	
	--- Long Range Turret
  {
    type = "recipe",
    name = "NE_gun_turret",
    	
	normal =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
			  {"electronic-circuit", 10},
			  {"gun-turret", 1},
			  {"steel-plate", 10}
			},
		  result = "NE-gun-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = false,
			energy_required = 16,
			ingredients = 
			{
			  {"electronic-circuit", 10},
			  {"gun-turret", 2},
			  {"steel-plate", 10}
			},
		  result = "NE-gun-turret",
		  result_count = 1,
		},
	

  },

  
  	--- Rocket Turret
  {
    type = "recipe",
    name = "NE_rocket_turret",
    	
	normal =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
			  {"electronic-circuit", 10},
			  {"NE-gun-turret", 1},
			  {"steel-plate", 10}
			},
		  result = "NE-rocket-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = false,
			energy_required = 16,
			ingredients = 
			{
			  {"electronic-circuit", 10},
			  {"NE-gun-turret", 2},
			  {"steel-plate", 10}
			},
		  result = "NE-rocket-turret",
		  result_count = 1,
		},
	

  },


	
	
})