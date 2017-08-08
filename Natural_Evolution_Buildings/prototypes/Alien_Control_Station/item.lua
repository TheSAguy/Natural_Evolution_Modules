data:extend({
	

	--- Alien Control Station Area
	{
		type = "item",
		name = "AlienControlStation_Area",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/AlienControlStation_32.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Natural-Evolution",
		order = "b[AlienControlStation]-a[AlienControlStation]",
		place_result = "AlienControlStation_Area",
		stack_size = 10
	},

--[[
	--- Alien Control Station
	{
		type = "item",
		name = "AlienControlStation",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/AlienControlStation_32.png",
		flags = {"goes-to-quickbar"},
		subgroup = "Natural-Evolution",
		order = "b[AlienControlStation]-b[AlienControlStation]",
		place_result = "AlienControlStation",
		stack_size = 10
	},
]]
})
