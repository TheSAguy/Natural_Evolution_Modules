


data:extend({

 
	--- Thumper
  {
    type = "radar",
    name = "Thumper",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/Thumper.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},   
	minable = {hardness = 0.8, mining_time = 1, result = "Thumper"},
    max_health = 50,
    corpse = "small-remnants",
	dying_explosion = "medium-explosion",
    resistances = 
    {
      {
        type = "fire",
        percent = 70
      }
    },
	collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_per_sector = "1MJ",
    max_distance_of_nearby_sector_revealed = 1,
    max_distance_of_sector_revealed = 1,
    energy_per_nearby_scan = "25kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "50kW",
	pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/Thumper.png",
		priority = "high",
		width = 60,
		height = 60,
		axially_symmetrical = false,
		apply_projection = false,
		direction_count = 25,
		line_length = 5,
	  shift = {0.225, -0.3},
    },
  },

})
