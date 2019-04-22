data:extend({
 

	--- Pheromone Concrete
  {
    type = "recipe",
    name = "pheromone_concrete",
    energy_required = 10,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"concrete", 5},
      {"alien-artifact", 10},
      {type="fluid", name="water", amount=100}
    },
    result= "pheromone_concrete",
    result_count = 5
  },

	--- Pheromone Concrete
  {
    type = "recipe",
    name = "rejuvenate_pheromone_concrete",
    energy_required = 4,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"exhausted_pheromone_concrete", 5},
      {"alien-artifact", 10},
      {type="fluid", name="water", amount=50}
    },
    result= "pheromone_concrete",
    result_count = 5
  },

		
})