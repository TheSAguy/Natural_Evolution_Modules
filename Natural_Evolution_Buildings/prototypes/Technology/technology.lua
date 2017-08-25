
data:extend({
	
	--- Alien Understanding 1
    {
		type = "technology",
		name = "AlienUnderstanding",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/AlienUnderstanding.png",
		effects =
		{
			{
				type = 'unlock-recipe', 
				recipe='Building_Materials'
			},
			{
				type = 'unlock-recipe', 
				recipe='Artifact-collector'
			},
			{
				type = 'unlock-recipe', 
				recipe='ne-combat-inserter'
			},
			{
				type = "unlock-recipe",
				recipe = "Alien-Stimulant"
			},
			
			{
				type = "unlock-recipe",
				recipe = "basic_dart_magazine_c"
			},
			{
				type = "unlock-recipe",
				recipe = "enhanced_dart_magazine_c"
			},
			{
				type = "unlock-recipe",
				recipe = "copper_bullets_c"
			},
			{
				type = "unlock-recipe",
				recipe = "firearm_magazine_c"
			},
			{
				type = "unlock-recipe",
				recipe = "piercing_rounds_magazine_c"
			},

			
		},
		prerequisites = {"advanced-electronics"},
		unit =
		{
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1}
		  },
		  time = 50
		},
		order = "a-h-a",
	},
	
	--- Alien Understanding 2
    {
		type = "technology",
		name = "AlienUnderstanding-2",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/AlienUnderstanding.png",
		effects =
		{
			{
				type = 'unlock-recipe', 
				recipe='Thumper'
			},
			{
				type = 'unlock-recipe', 
				recipe='decelerate_concrete'
			},
			{
				type = 'unlock-recipe', 
				recipe='Biological-bullet-magazine'
			},
			{
				type = 'unlock-recipe', 
				recipe='bio_land_mine'
			},
			{
				type = "unlock-recipe",
				recipe = "uranium_rounds_magazine_c"
			},
			{
				type = "unlock-recipe",
				recipe = "Biological_bullet_magazine_c"
			},	
		},
		prerequisites = {"AlienUnderstanding"},
		unit =
		{
		  count = 150,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-b",
	},
	
	--- Alien Understanding 3
	{
		type = "technology",
		name = "AlienUnderstanding-3",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/AlienUnderstanding.png",
		prerequisites = {"AlienUnderstanding-2"},
		unit =
		{
		  count = 250,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-c",
	},

	--- Terraforming Station 		
	{
		type = "technology",
		name = "TerraformingStation",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/TerraformingStation.png",
		effects =
		{
		  {
				type = "unlock-recipe",
				recipe = "TerraformingStation"
		  },

		},
		prerequisites = {"AlienUnderstanding"},
		unit =
		{
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1}
		  },
		  time = 50
		},
		order = "a-i-a",
	},

	
	{
		type = "technology",
		name = "TerraformingStation-2",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/TerraformingStation.png",
		effects =
		{
		  {
				type = "unlock-recipe",
				recipe = "TerraformingStation"
		  }
		},
		prerequisites = {"AlienUnderstanding-2","TerraformingStation"},
		unit =
		{
		  count = 4000,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-i-b",
	},
	
	
	{
		type = "technology",
		name = "TerraformingStation-3",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/TerraformingStation.png",
		effects =
		{
		  {
				type = "unlock-recipe",
				recipe = "TerraformingStation"
		  }
		},
		prerequisites = {"AlienUnderstanding-3","TerraformingStation-2"},
		unit =
		{
		  count = 5000,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"high-tech-science-pack", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-i-c",
	},
	
	
	--- Alien Control Station
    {
		type = "technology",
		name = "AlienControlStation",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/AlienControlStation.png",
		effects =
		{
		  {
			  type = "unlock-recipe", 
			  recipe = "AlienControlStation"
		  }
		},
		prerequisites = {"AlienUnderstanding-2", "effect-transmission"},
		unit =
		{
		  count = 200,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},
		
	--- Alien Training  		
	{
		type = "technology",
		name = "Alien_Training",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/Alien_Training.png",
		effects = 
		{
			{
				type = 'unlock-recipe', 
				recipe='attractor-on'
			}, 
				
			{
				type = 'unlock-recipe', 
				recipe='attractor-off'
			},
			
		},
		prerequisites = {"AlienUnderstanding-2"},
		unit =
		{
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},
	
		--- Spawners
	{
		type = "technology",
		name = "Biter_Spawners",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/biter_spawner.png",
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='Natural_Evolution_Biter-Spawner'
			},
			{
				type = 'unlock-recipe',
				recipe='Natural_Evolution_Biter-Spawner-refresh'
			}
		},
		prerequisites = {"AlienUnderstanding-3"},
		unit =
		{
		  count = 250,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},
	
	
	{
		type = "technology",
		name = "Spitter_Spawners",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/spitter_spawner.png",
				effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='Natural_Evolution_Spitter-Spawner'
			},
			{
				type = 'unlock-recipe',
				recipe='Natural_Evolution_Spitter-Spawner-refresh'
			}
		},
		prerequisites = {"AlienUnderstanding-3"},
		unit =
		{
		  count = 350,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},

	-- Biter & Spitters Breeding
	{
		type = "technology",
		name = "Breeding",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/small-biter.png",
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='small-biter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='small-spitter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='small-worm-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='small-worm-hatching-refresh'
			},

		},
		prerequisites = {"Alien_Hatchery"},
		unit =
		{
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-a",
	},
	{
		type = "technology",
		name = "Breeding-2",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/medium-biter.png",
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='medium-biter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='medium-spitter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='medium-worm-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='medium-worm-hatching-refresh'
			}
		},
		prerequisites = {"Breeding"},
		unit =
		{
		  count = 200,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-b",
	},
	{
		type = "technology",
		name = "Breeding-3",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/big-biter.png",
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='big-biter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='big-spitter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='big-worm-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='big-worm-hatching-refresh'
			}
		},
		prerequisites = {"Breeding-2"},
		unit =
		{
		  count = 300,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-c",
	},
	{
		type = "technology",
		name = "Breeding-4",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/behemoth-biter.png",
		
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='behemoth-biter-hatching'
			},
			{
				type = 'unlock-recipe',
				recipe='behemoth-spitter-hatching'
			}
		},
		prerequisites = {"Breeding-3"},
		unit =
		{
		  count = 400,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1}
		  },
		  time = 50
		},
		upgrade = true,
		order = "a-h-d",
	},

	--- Alien Hatchery
	{
		type = "technology",
		name = "Alien_Hatchery",
		icon_size = 128,
		icon = "__Natural_Evolution_Buildings__/graphics/technology/Alien_Hatchery.png",
		effects = 
		{
			{
				type = 'unlock-recipe',
				recipe='Alien_Hatchery'
			},
			{
				type = 'unlock-recipe',
				recipe='NE_basic-alien-nutrientant'
			},
			{
				type = 'unlock-recipe',
				recipe='NE_alien-revitalization'
			},
			{
				type = 'unlock-recipe',
				recipe='NE_enhanced-alien-nutrientant'
			},
			{
				type = 'unlock-recipe',
				recipe='ne-living-wall'
			},		
			{
				type = 'unlock-recipe',
				recipe='ne-living-wall-refresh'
			},	

		},
		prerequisites = {"AlienUnderstanding-2"},
		unit =
		{
		  count = 150,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},
	
})
