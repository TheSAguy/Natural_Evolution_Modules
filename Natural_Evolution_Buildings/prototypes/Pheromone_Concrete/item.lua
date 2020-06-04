local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"


data:extend({
	

	--- Pheromone Concrete
  {
    type = "item",
    name = "pheromone_concrete",
	icon = ICONPATH .. "pheromone_concrete.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH .. "pheromone_concrete.png",
			icon_size = 64,
		}
	},
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
	icon = ICONPATH .. "exhausted_pheromone_concrete.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH .. "exhausted_pheromone_concrete.png",
			icon_size = 64,
		}
	},
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
