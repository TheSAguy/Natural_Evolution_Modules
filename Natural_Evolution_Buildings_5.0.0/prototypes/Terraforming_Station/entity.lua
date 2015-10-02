


data:extend({

	---- Terraforming Station
  {
    type = "radar",
    name = "TerraformingStation",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
    flags = {"placeable-neutral", "placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "TerraformingStation"},
	max_health = 300,
    corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.3, -1.7}, {3.0, 1.5}},
    selection_box = {{-1.3, -1.7}, {3.0, 1.5}},
    energy_per_sector = "22MJ",
    max_distance_of_nearby_sector_revealed = 4,
    max_distance_of_sector_revealed = 4,
    energy_per_nearby_scan = "400kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "600kW",
    pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entity/TerraformingStation.png",
      priority = "low",
      width = 153,
      height = 131,
      axially_symmetrical = false,
      apply_projection = false,
      direction_count = 64,
      line_length = 8,
      shift = {0.875, -0.35}
    },
  },
  
	
})
