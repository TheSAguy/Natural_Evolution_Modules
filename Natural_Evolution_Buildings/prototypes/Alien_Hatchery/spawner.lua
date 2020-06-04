local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend(
{
  	--- Spawners
	{
		type = "item",
		name = "Natural_Evolution_Biter-Spawner",
		icon = ICONPATH .. "biter-spawner.png",
		icon_size = 64,
		icons = {
		  {
			icon = ICONPATH .. "biter-spawner.png",
			icon_size = 64,
		  }
		}, 
		subgroup = "Spawners",
		order = "a[Natural_Evolution_Biter-Spawner]",
		place_result = "Natural_Evolution_Biter-Spawner",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Biter-Spawner-exhausted",
		icon = ICONPATH .. "biter-spawner-exhausted.png",
		icon_size = 64,
		icons = {
		  {
			icon = ICONPATH .. "biter-spawner-exhausted.png",
			icon_size = 64,
		  }
		},
		subgroup = "Spawners",
		order = "a[Natural_Evolution_Biter-Spawner]",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Spitter-Spawner",
		icon = ICONPATH .. "spitter-spawner.png",
		icon_size = 64,
		icons = {
		  {
			icon = ICONPATH .. "spitter-spawner.png",
			icon_size = 64,
		  }
		}, 
		subgroup = "Spawners",
		order = "b[Natural_Evolution_Biter-Spawner]",
		place_result = "Natural_Evolution_Spitter-Spawner",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Spitter-Spawner-exhausted",
		icon = ICONPATH .. "spitter-spawner-exhausted.png",
		icon_size = 64,
		icons = {
		  {
			icon = ICONPATH .. "spitter-spawner-exhausted.png",
			icon_size = 64,
		  }
		}, 
		subgroup = "Spawners",
		order = "b[Natural_Evolution_Biter-Spawner]",
		stack_size = 10
	},
	
})