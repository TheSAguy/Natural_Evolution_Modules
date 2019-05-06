
if not mods["Unit_Control"] then

	data:extend({
			
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
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1},
			  },
			  time = 50
			},
			order = "a-h-c",
		},
		
	})

end