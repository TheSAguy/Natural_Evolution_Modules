data:extend({
	
	--- Alien Understanding
    {
		type = "technology",
		name = "AlienUnderstanding",
		icon_size = 128,
		icon = "__Natural_Evolution_Enemies__/graphics/technology/AlienUnderstanding.png",
		effects =
		{
			{
				type = 'unlock-recipe', 
				recipe='Artifact-collector'
			}

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
	

    {
		type = "technology",
		name = "AlienUnderstanding-2",
		icon_size = 128,
		icon = "__Natural_Evolution_Enemies__/graphics/technology/AlienUnderstanding.png",
		effects =
		{
			{
				type = 'unlock-recipe', 
				recipe='Biological-bullet-magazine'
			}
		},
		prerequisites = {"AlienUnderstanding"},
		unit =
		{
		  count = 50,
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
	
})
