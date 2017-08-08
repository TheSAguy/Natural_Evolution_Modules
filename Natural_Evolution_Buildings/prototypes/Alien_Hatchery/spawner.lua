data:extend(
{
  	--- Spawners
	{
		type = "item",
		name = "Natural_Evolution_Biter-Spawner",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/biter-spawner.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Spawners",
		order = "a[Natural_Evolution_Biter-Spawner]",
		place_result = "Natural_Evolution_Biter-Spawner",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Biter-Spawner-exhausted",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/biter-spawner-exhausted.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Spawners",
		order = "a[Natural_Evolution_Biter-Spawner]",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Spitter-Spawner",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/spitter-spawner.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Spawners",
		order = "b[Natural_Evolution_Biter-Spawner]",
		place_result = "Natural_Evolution_Spitter-Spawner",
		stack_size = 10
	},
	{
		type = "item",
		name = "Natural_Evolution_Spitter-Spawner-exhausted",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/spitter-spawner-exhausted.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Spawners",
		order = "b[Natural_Evolution_Biter-Spawner]",
		stack_size = 10
	},
	
})