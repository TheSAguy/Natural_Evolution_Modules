if not NE_Buildings then NE_Buildings = {} end
if not NE_Buildings.Settings then NE_Buildings.Settings = {} end

NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value

inv_extension2 =
{
	    filename = "__Natural_Evolution_Buildings__/graphics/entities/Alien_Control_Station/AlienControlStation_128.png",
		priority = "high",
		width = 128,
		height = 128,
		direction_count = 1,
		frame_count = 1,
		axially_symmetrical = false,		
		shift = {0.225, -0.3}
		

}




data:extend({

 
	---- Alien Control Station Area Overlay


	{
		type = "ammo-turret",
		name = "AlienControlStation_Area",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/AlienControlStation.png",
		icon_size = 32,
		flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },	
		max_health = 150,
		corpse = "small-remnants",
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		collision_mask = { "object-layer", "not-colliding-with-itself" },
		order = "b[AlienControlStation]-a[AlienControlStation]",
		automated_ammo_count = 1,
		resistances = {},	
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 2,
			range = NE_Buildings.Settings.Search_Distance,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,

		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.run_mode = "backward"
                          return res
                       end)(),
		call_for_help_radius = 1			   

	},

	---- Alien Control Station
	{
    type = "radar",
    name = "AlienControlStation",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/AlienControlStation.png",
	icon_size = 32,
    flags = {"placeable-player", "player-creation", "not-blueprintable"},   
	minable = {hardness = 0.8, mining_time = 1.5, results = {{type="item", name="Building_Materials", amount=5},}},
	--- NOTE, when mined, you will lose the Alien artifacts! ----
    max_health = 250,
    corpse = "big-remnants",
	dying_explosion = "medium-explosion",
    resistances = 
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	order = "b[AlienControlStation]-a[AlienControlStation]",
    energy_per_sector = "15MJ",
    max_distance_of_nearby_sector_revealed = 5,
    max_distance_of_sector_revealed = 15,
    energy_per_nearby_scan = "250kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "500kW",
	pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/Alien_Control_Station/AlienControlStation.png",
		priority = "high",
		width = 128,
		height = 128,
		axially_symmetrical = false,
		apply_projection = false,
		direction_count = 16,
		line_length = 4,
	  shift = {0.225, -0.3},
    },
  },

})
