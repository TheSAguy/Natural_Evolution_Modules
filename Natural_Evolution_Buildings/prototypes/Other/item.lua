data:extend({

  
  	---- Building Materials
	{
		type = "item",
		name = "Building_Materials",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Building_Materials.png",
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
		icon = "__Natural_Evolution_Buildings__/graphics/entity/attractor_on.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Tools",
		order = "a[attractor-on]",
		stack_size = 1
	},
  	{
		type = "item",
		name = "attractor-off",
		icon = "__Natural_Evolution_Buildings__/graphics/entity/attractor_off.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Tools",
		order = "b[attractor-off]",
		stack_size = 1
	},
})
