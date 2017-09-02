inv_extension =
{
	filename = "__Natural_Evolution_Buildings__/graphics/entities/Terraforming_Station/TerraformingStation.png",
	priority = "low",
      width = 153,
      height = 131,
	direction_count = 1,
	frame_count = 1,
	axially_symmetrical = false,
	 shift = {0.875, -0.35}
}

inv_extension2 =
{
	{
      filename = "__Natural_Evolution_Buildings__/graphics/entities/Terraforming_Station/TerraformingStation.png",
      priority = "low",
      width = 153,
      height = 131,
      axially_symmetrical = false,
      apply_projection = false,
      direction_count = 64,
      line_length = 8,
      shift = {0.875, -0.35}
    },
}




data:extend({

--[[
  --- Ammo Turret (Inv)
	{
		type = "ammo-turret",
		name = "TerraformingStation",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		 minable = {hardness = 0.2, mining_time = 0.5, result = "TerraformingStation"},
		max_health = 300,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		automated_ammo_count = 10,
		resistances = {},
		collision_box = {{-1.3, -1.7}, {3.0, 1.5}},
		selection_box = {{-1.3, -1.7}, {3.0, 1.5}},
		order = "b[TerraformingStation]-a[TerraformingStation]",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "Terraforming_Station",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
		call_for_help_radius = 1			   
   
	},
]]


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

    energy_per_sector = "12.00MJ",
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
	--flags = {"placeable-player", "player-creation", "not-deconstructable"},
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
