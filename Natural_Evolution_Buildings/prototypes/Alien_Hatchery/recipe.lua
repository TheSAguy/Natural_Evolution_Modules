
data:extend({

  ---- Alien Hatchery
	{
    type = "recipe",
    name = "Alien_Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 10,
			ingredients = 
			{
			  {"Building_Materials", 5},    
			},
		  result = "Alien_Hatchery",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 20,
			ingredients = 
			{
			  {"Building_Materials", 10},    
			},
		  result = "Alien_Hatchery",
		  result_count = 1,
		},
	}, 	   



---- Living Wall
    {
    type = "recipe",
    name = "ne-living-wall",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/living_wall.png",
    enabled = false,
	category = "Hatchery",
    ingredients = 
	{
		{"stone-wall", 1},
		{type="fluid", name="NE_alien_toxin", amount=2},
	},
    result = "ne-living-wall",
	energy_required = 10,
    requester_paste_multiplier = 10
  },


    {
    type = "recipe",
    name = "ne-living-wall-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/living_wall-r.png",
    enabled = false,
	category = "Hatchery",
    ingredients = 
	{
      {"ne-living-wall-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=2},
	},
    result = "ne-living-wall",
	energy_required = 6,
    requester_paste_multiplier = 10
  },
  

  

  --- Small Biter Hatching
	{
    type = "recipe",
    name = "small-biter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
			  {"alien-artifact", 2},
			  {type="fluid", name="NE_nutrient-solution", amount=25},  
			},
		  result = "small-biter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 80,
			ingredients = 
			{
			  {"alien-artifact", 4},
			  {type="fluid", name="NE_nutrient-solution", amount=40},  
			},
		  result = "small-biter-hatching",
		  result_count = 1,
		},
	}, 	 



  --- Medium Biter Hatching
	{
    type = "recipe",
    name = "medium-biter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 100,
			ingredients = 
			{
			  {"small-biter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=25},  
			},
		  result = "medium-biter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"small-biter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=40},  
			},
		  result = "medium-biter-hatching",
		  result_count = 1,
		},
	}, 	 

 
	


  --- Big Biter Hatching
	{
    type = "recipe",
    name = "big-biter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"medium-biter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=50},  
			},
		  result = "big-biter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 250,
			ingredients = 
			{
			  {"medium-biter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=75},  
			},
		  result = "big-biter-hatching",
		  result_count = 1,
		},
	}, 	 


  --- Behemoth Biter Hatching
	{
    type = "recipe",
    name = "behemoth-biter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"big-biter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=100},  
			},
		  result = "behemoth-biter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 250,
			ingredients = 
			{
			  {"big-biter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=150},  
			},
		  result = "behemoth-biter-hatching",
		  result_count = 1,
		},
	}, 


  --- Small Spitter Hatching
  {
    type = "recipe",
    name = "small-spitter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
			  {"alien-artifact", 2},
			  {type="fluid", name="NE_nutrient-solution", amount=25},
			},
		  result = "small-spitter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"alien-artifact", 4},
			  {type="fluid", name="NE_nutrient-solution", amount=30},
			},
		  result = "small-spitter-hatching",
		  result_count = 1,
		},
  
	},

  --- Medium Spitter Hatching
  {
    type = "recipe",
    name = "medium-spitter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 100,
			ingredients = 
			{
			  {"small-spitter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=25},
			},
		  result = "medium-spitter-hatching",
		  result_count = 1,
		},
	expensive =
		{
			enabled = false,
			energy_required = 125,
			ingredients = 
			{
			  {"small-spitter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=35},
			},
		  result = "medium-spitter-hatching",
		  result_count = 1,
		},
  
	},

  --- Big Spitter Hatching
  {
    type = "recipe",
    name = "big-spitter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"medium-spitter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=50},
			},
		  result = "big-spitter-hatching",
		  result_count = 1,
		},
	expensive =	
		{
			enabled = false,
			energy_required = 180,
			ingredients = 
			{
			  {"medium-spitter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=75},
			},
		  result = "big-spitter-hatching",
		  result_count = 1,
		},
  
	},


  --- Behemoth Spitter Hatching
  {
    type = "recipe",
    name = "behemoth-spitter-hatching",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 200,
			ingredients = 
			{
			  {"big-spitter-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=100},
			},
		  result = "behemoth-spitter-hatching",
		  result_count = 1,
		},
	expensive =	
		{
			enabled = false,
			energy_required = 250,
			ingredients = 
			{
			  {"big-spitter-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=125},
			},
		  result = "behemoth-spitter-hatching",
		  result_count = 1,
		},
  
	},


  --- Small Worm Hatching
  {
    type = "recipe",
    name = "small-worm-hatching",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/small-worm.png",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
			  {"alien-artifact", 2},
			  {type="fluid", name="NE_nutrient-solution", amount=50},
			},
		  result = "small-worm-hatching",
		  result_count = 1,
		},
	expensive =	
		{
			enabled = false,
			energy_required = 75,
			ingredients = 
			{
			  {"alien-artifact", 4},
			  {type="fluid", name="NE_nutrient-solution", amount=75},
			},
		  result = "small-worm-hatching",
		  result_count = 1,
		},
  
	},

  {
    type = "recipe",
    name = "small-worm-hatching-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/small-worm-r.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"small-worm-hatching-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=10},
    },
    result = "small-worm-hatching",
    energy_required = 25,
  },

  --- Medium Worm Hatching
  {
    type = "recipe",
    name = "medium-worm-hatching",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/medium-worm.png",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
			  {"small-worm-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=50},
			},
		  result = "medium-worm-hatching",
		  result_count = 1,
		},
	expensive =	
		{
			enabled = false,
			energy_required = 80,
			ingredients = 
			{
			  {"small-worm-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=75},
			},
		  result = "medium-worm-hatching",
		  result_count = 1,
		},
  
	},
	


  {
    type = "recipe",
    name = "medium-worm-hatching-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/medium-worm-r.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"medium-worm-hatching-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=20},
    },
    result = "medium-worm-hatching",
    energy_required = 35,
  },

  --- Big Worm Hatching
  {
    type = "recipe",
    name = "big-worm-hatching",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/big-worm.png",
    category = "Hatchery",
	normal =
		{
			enabled = false,
			energy_required = 100,
			ingredients = 
			{
			  {"medium-worm-hatching", 1},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=100},
			},
		  result = "big-worm-hatching",
		  result_count = 1,
		},
	expensive =	
		{
			enabled = false,
			energy_required = 150,
			ingredients = 
			{
			  {"medium-worm-hatching", 2},
			  {type="fluid", name="NE_enhanced-nutrient-solution", amount=150},
			},
		  result = "big-worm-hatching",
		  result_count = 1,
		},
  
	},


  {
    type = "recipe",
    name = "big-worm-hatching-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/big-worm-r.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"big-worm-hatching-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=40},
    },
    result = "big-worm-hatching",
    energy_required = 50,
  },

  --- Spawner Biter
  {
    type = "recipe",
    name = "Natural_Evolution_Biter-Spawner",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/biter-spawner.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"Building_Materials", 4},
      {"alien-artifact", 50},
      {type="fluid", name="NE_enhanced-nutrient-solution", amount=500},
    },
    result = "Natural_Evolution_Biter-Spawner",
    energy_required = 150,
  },

  {
    type = "recipe",
    name = "Natural_Evolution_Biter-Spawner-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/biter-spawner-r.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"Natural_Evolution_Biter-Spawner-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=250},
    },
    result = "Natural_Evolution_Biter-Spawner",
    energy_required = 75,
  },

  --- Spawner Spitter
  {
    type = "recipe",
    name = "Natural_Evolution_Spitter-Spawner",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/spitter-spawner.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"Building_Materials", 4},
      {"alien-artifact", 50},
      {type="fluid", name="NE_enhanced-nutrient-solution", amount=500},
    },
    result = "Natural_Evolution_Spitter-Spawner",
    energy_required = 150,
  },

  {
    type = "recipe",
    name = "Natural_Evolution_Spitter-Spawner-refresh",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/spitter-spawner-r.png",
    category = "Hatchery",
    enabled = false,
    ingredients =
    {
      {"Natural_Evolution_Spitter-Spawner-exhausted", 1},
      {type="fluid", name="NE_revitalization-solution", amount=250},
    },
    result = "Natural_Evolution_Spitter-Spawner",
    energy_required = 75,
  },

})



data:extend({

  ---- special liquids for hatchery operation
  {
    type = "recipe",
    name = "NE_alien-revitalization",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/fluid/enhanced-alien-nutrientant_toxin.png",
    category = "chemistry",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type="item", name="alien-artifact", amount=1},
      {type="fluid", name="water", amount=25}
    },
    results=
    {
      {type="fluid", name="NE_revitalization-solution", amount=10},
	  {type="fluid", name="NE_alien_toxin", amount=5},
    },
    subgroup = "Evolution-fluids"
  },

  {
    type = "recipe",
    name = "NE_basic-alien-nutrientant",
    category = "chemistry",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type="item", name="stone", amount=5},
      {type="fluid", name="sulfuric-acid", amount=10}
    },
    results=
    {
      {type="fluid", name="NE_nutrient-solution", amount=10},
    },
    subgroup = "Evolution-fluids"
  },
  
  {
    type = "recipe",
    name = "NE_enhanced-alien-nutrientant",
    category = "chemistry",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="NE_nutrient-solution", amount=10},
      {type="fluid", name="NE_revitalization-solution", amount=10},
    },
    results=
    {		
		{type="fluid", name="NE_enhanced-nutrient-solution", amount=10},		
    },

    subgroup = "Evolution-fluids"
  },
})