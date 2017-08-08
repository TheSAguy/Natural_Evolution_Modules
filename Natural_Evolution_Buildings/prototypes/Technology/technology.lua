
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

		},
		prerequisites = {"advanced-electronics"},
		unit =
		{
		  count = 50,
		  ingredients =
		  {
			{"science-pack-1", 2},
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
			}
		},
		prerequisites = {"AlienUnderstanding"},
		unit =
		{
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
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
		  count = 150,
		  ingredients =
		  {
			{"science-pack-1", 4},
			{"science-pack-2", 3},
			{"science-pack-3", 2},
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
		  {
				type = "unlock-recipe",
				recipe = "Alien-Stimulant"
		  }
		},
		prerequisites = {"AlienUnderstanding"},
		unit =
		{
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 2},
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
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
			{"production-science-pack", 75}
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
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 4},
			{"science-pack-2", 3},
			{"science-pack-3", 2},
			{"high-tech-science-pack", 75}
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
		  count = 50,
		  ingredients =
		  {
			{"science-pack-1", 6},
			{"science-pack-2", 6},
			{"science-pack-3", 2}
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
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 2},
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
		  count = 150,
		  ingredients =
		  {
			{"science-pack-1", 4},
			{"science-pack-2", 3},
			{"science-pack-3", 2},
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
		  count = 250,
		  ingredients =
		  {
			{"science-pack-1", 4},
			{"science-pack-2", 3},
			{"science-pack-3", 2},
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
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
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
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
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
		  count = 150,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
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
		  count = 200,
		  ingredients =
		  {
			{"science-pack-1", 4},
			{"science-pack-2", 3},
			{"science-pack-3", 2},
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
		  count = 75,
		  ingredients =
		  {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
			{"science-pack-3", 1}
		  },
		  time = 50
		},
		order = "a-h-c",
	},
	
})
