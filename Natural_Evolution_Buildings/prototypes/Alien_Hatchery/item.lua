data:extend({

		
  	---- Alien Hatchery
	 {
		type = "item",
		name = "Alien_Hatchery",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Alien_Hatchery_32.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "Natural-Evolution",
		order = "a[Alien_Hatchery]",
		place_result = "Alien_Hatchery",
		stack_size = 10,
	},

	
	  ---- Living Wall
	{
		type = "item",
		name = "ne-living-wall",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/living_wall.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "defensive-structure",
		order = "a[stone-wall]-a[living-wall]",
		place_result = "ne-living-wall",
		stack_size = 50
	},
  
  	{
		type = "item",
		name = "ne-living-wall-exhausted",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/living_wall_exhausted.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "defensive-structure",
		order = "a[stone-wall]-a[living-wall]",
		stack_size = 50
	},
	
	
})
