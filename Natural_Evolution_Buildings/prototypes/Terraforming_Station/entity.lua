

data:extend(
	{

  --- Radar
  {
    type = "radar",
    name = "TerraformingStation_New",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
	flags = {"placeable-player", "placeable-neutral", "player-creation"},
	order = "b[TerraformingStation]-a[TerraformingStation]",
    minable = {hardness = 0.2, mining_time = 0.5, result = "TerraformingStation_New"},
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
	collision_box = {{-1.65, -1.65 }, {1.65, 1.65}},
	selection_box = {{-2, -2 }, {2, 2}},

    energy_per_sector = "12MJ",
    max_distance_of_nearby_sector_revealed = 5,
    max_distance_of_sector_revealed = 12,
    energy_per_nearby_scan = "400kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "260kW",
    pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/Terraforming_Station/TerraformingStation.png",
      priority = "low",
      width = 128,
      height = 128,
      axially_symmetrical = false,
      apply_projection = false,
      direction_count = 64,
      line_length = 8,
      shift = {0, 0},
    },
	
	
  },
  
----- Logistic's container
  {
	type = "logistic-container",
	name = "TerraformingStation_c",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
	flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid"},
    minable = nil, 
	order = "b[TerraformingStation]-a[TerraformingStation]",
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "massive-explosion",
	
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},--A.T.

	fast_replaceable_group = "container",
	inventory_size = 1,
	logistic_mode = "requester",
	picture = {
		filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
		priority = "extra-high",
		width = 38,
		height = 32,
		shift = {0.125, -0.125} ,-- A.T.

	},
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 7.5,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
},
	
	
	})
