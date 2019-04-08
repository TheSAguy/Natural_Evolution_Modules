data:extend({
 

	--- Decelerate_concrete
  {
    type = "recipe",
    name = "decelerate_concrete",
    energy_required = 6,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"concrete", 5},
      {"alien-artifact", 10},
      {type="fluid", name="water", amount=100}
    },
    result= "decelerate_concrete",
    result_count = 5
  },

	
})