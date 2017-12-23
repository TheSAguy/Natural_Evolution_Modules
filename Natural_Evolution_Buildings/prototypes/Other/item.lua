data:extend({

  
  	---- Building Materials
	{
		type = "item",
		name = "Building_Materials",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Building_Materials.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		--subgroup = "Materials", -- NE Sub Group
		subgroup = "intermediate-product",
		order = "a[iron-stick]-b[Building_Materials]",
		stack_size = 10
	},
	
		
	--- Attractor
	{
		type = "item",
		name = "attractor-on",
		icon = "__Natural_Evolution_Buildings__/graphics/entities/attractor_on.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "Tools",
		order = "a[attractor-on]",
		stack_size = 1
	},
  	{
		type = "item",
		name = "attractor-off",
		icon = "__Natural_Evolution_Buildings__/graphics/entities/attractor_off.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "Tools",
		order = "b[attractor-off]",
		stack_size = 1
	},
	
	--- Battle Marker
	{
		type = "item",
		name = "battle_marker",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Battle_Marker_1_32.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "defensive-structure",
		order = "x[battle_marker]",
		place_result = "battle_marker",
		stack_size = 50
  },
	
  
})
