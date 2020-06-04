local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({


	--- Basic Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_basic_dart_magazine",		
		normal =
		{
			enabled = true,
			energy_required = 4,
			ingredients = 
			{
				{"wood", 10},
			},
		  result = "bi-basic-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 6,
			ingredients = 
			{
				{"wood", 10},
			},
		  result = "bi-basic-dart-magazine",
		  result_count = 8,
		},
	}, 	

	
	--- Standard Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_standard_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"bi-basic-dart-magazine", 10},
				{"copper-plate", 5},
			},
		  result = "bi-standard-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"bi-basic-dart-magazine", 8},
				{"copper-plate", 5},
			},
		  result = "bi-standard-dart-magazine",
		  result_count = 8,
		},
	}, 	

	
	--- Enhanced Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_enhanced_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 6,
			ingredients = 
			{
				{"bi-standard-dart-magazine", 10},
				{"plastic-bar", 5},
			},
		  result = "bi-enhanced-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 9,
			ingredients = 
			{
				{"bi-standard-dart-magazine", 8},
				{"plastic-bar", 5},
			},
		  result = "bi-enhanced-dart-magazine",
		  result_count = 8,
		},
	}, 	

	--- Poison Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_poison_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"bi-enhanced-dart-magazine", 10},
				{"poison-capsule", 5},
			},
		  result = "bi-poison-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 12,
			ingredients = 
			{
				{"bi-enhanced-dart-magazine", 8},
				{"poison-capsule", 5},
			},
		  result = "bi-poison-dart-magazine",
		  result_count = 8,
		},
	}, 	

	--- Copper Ammo
	{
		type = "recipe",
		name = "copper_bullets",
		icon = ICONPATH .. "copper_magazine.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "copper_magazine.png",
				icon_size = 64,
			}
		},
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
		icon = ICONPATH .. "piercing_magazine_copper.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "piercing_magazine_copper.png",
				icon_size = 64,
			}
		},
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
		name = "bi-basic_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"bi-basic-dart-magazine", 1},

				
			},
		  result = "bi-basic-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"bi-basic-dart-magazine", 1},
			},
		  result = "bi-basic-dart-magazine_c",
		  result_count = 1,
		},
	}, 	

	--- Standard Dart
	{
		type = "recipe",
		name = "bi-standard_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"bi-standard-dart-magazine", 1},
			},
		  result = "bi-standard-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"bi-standard-dart-magazine", 1},
			},
		  result = "bi-standard-dart-magazine_c",
		  result_count = 1,
		},
	}, 	
 
 
	--- Enhanced Dart
	{
		type = "recipe",
		name = "bi-enhanced_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"bi-enhanced-dart-magazine", 1},
			},
		  result = "bi-enhanced-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"bi-enhanced-dart-magazine", 1},
			},
		  result = "bi-enhanced-dart-magazine_c",
		  result_count = 1,
		},
	}, 	
 
  
	--- Poison Dart
	{
		type = "recipe",
		name = "bi-poison_dart_magazine_c",
		
		normal =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"Alien-Stimulant", 1},
				{"bi-poison-dart-magazine", 1},
			},
		  result = "bi-poison-dart-magazine_c",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 4,
			ingredients = 
			{
				{"Alien-Stimulant", 2},
				{"bi-poison-dart-magazine", 1},
			},
		  result = "bi-poison-dart-magazine_c",
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
    name = "bi_recipe_dart_turret",
    	
	normal =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
			  {"iron-gear-wheel", 5},
			  {"wood", 20},
			},
		  result = "bi-dart-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = true,
			energy_required = 16,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"wood", 25},
			},
		  result = "bi-dart-turret",
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

	
--- Dart Rifle
  {
    type = "recipe",
    name = "bi_recipe_bi_dart_rifle",
    	
	normal =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
			  {"copper-plate", 5},
			  {"wood", 15},
			},
		  result = "bi-dart-rifle",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = true,
			energy_required = 16,
			ingredients = 
			{
			  {"copper-plate", 10},
			  {"wood", 25},
			},
		  result = "bi-dart-rifle",
		  result_count = 1,
		},
	

  },
	
	
})