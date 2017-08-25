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


  --- Radar
  {
    type = "radar",
    name = "TerraformingStation_r",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    --minable = {hardness = 0.2, mining_time = 0.5, result = "TerraformingStation"},
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
	collision_mask = {},
	order = "b[TerraformingStation]-a[TerraformingStation]",
    energy_per_sector = "14.67MJ",
    max_distance_of_nearby_sector_revealed = 5,
    max_distance_of_sector_revealed = 12,
    energy_per_nearby_scan = "400kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "266.67kW",
    pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/Terraforming_Station/TerraformingStation.png",
      priority = "high",
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
