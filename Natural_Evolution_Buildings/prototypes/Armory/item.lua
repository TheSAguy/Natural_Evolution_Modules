data:extend({


	---- Bio Land Mine
    {
		type = "item",
		name = "bio_land_mine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_land_mine.png",
		flags = {"goes-to-quickbar"},
		damage_radius = 8,
		subgroup = "gun",
		order = "g[land-mine]",
		place_result = "bio_land_mine",
		stack_size = 100,
		trigger_radius = 1.5
	},
  
  --- Long Range Turret
    {
		type = "item",
		name = "NE-gun-turret",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_turret_icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "defensive-structure",
		order = "a[turret]-x[gun-turret]",
		place_result = "NE-gun-turret",
		stack_size = 50
	},
  
    --- Dart Turret
    {
		type = "item",
		name = "bio-turret",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_turret_icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "defensive-structure",
		order = "a[turret]-x[gun-turret]",
		place_result = "bio-turret",
		stack_size = 50
  },
  
  
})
