data:extend({
	

	--- Decelerate_concrete
  {
    type = "item",
    name = "decelerate_concrete",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/decelerate_concrete.png",
	icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "terrain",
    order = "b[concrete]-x[plain]",
    stack_size = 400,
    place_as_tile =
    {
      result = "decelerate_concrete",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },

})
