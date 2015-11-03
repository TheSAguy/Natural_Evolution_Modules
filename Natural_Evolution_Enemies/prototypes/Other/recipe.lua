require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others

data:extend({
  
		
		---- Building Materials
	{
      type = "recipe",
		  name = "Building_Materials",
		  enabled = "false",
		  ingredients = 
		  {
			{"advanced-circuit", 15},
			{"stone-brick", 50},       
			{"steel-plate", 10}, 
		  },
		  result = "Building_Materials"
	},
	

})

data:extend({
	{
		type = "recipe",
		name = "Biological-bullet-magazine",
		enabled = false,
		energy_required = 5,
		ingredients =
		{ 
			{"alien-artifact", 1},
			{"plastic-bar", 5},
			{"piercing-bullet-magazine", 5},
		},
		result = "Biological-bullet-magazine",
		result_count = 5
	},

	
})
