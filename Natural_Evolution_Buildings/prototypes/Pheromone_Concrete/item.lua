data:extend({
	

	--- Pheromone Concrete
  {
    type = "item",
    name = "pheromone_concrete",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/pheromone_concrete.png",
	icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-x[plain]",
    stack_size = 400,
    place_as_tile =
    {
      result = "pheromone_concrete",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },

  	--- Exhausted Pheromone Concrete
  {
    type = "item",
    name = "exhausted_pheromone_concrete",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/exhausted_pheromone_concrete.png",
	icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-y[plain]",
    stack_size = 400,
    place_as_tile =
    {
      result = "exhausted_pheromone_concrete",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },
})
