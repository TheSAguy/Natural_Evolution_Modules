if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value

local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

inv_extension2 =
{
	filename = "__Natural_Evolution_Buildings__/graphics/entities/Artifact-chest.png",
	priority = "extra-high",
	scale = 1,
	width = 64,
	height = 64,
	direction_count = 1,
	frame_count = 1,
	axially_symmetrical = false,
	shift = {0, -0}
	--shift = {0.25, 0},
	
}


data:extend(
	{
				
		---- Overlay of Pickup Range of Artifact-Collector
		{
		type = "ammo-turret",
		name = "Artifact-collector-area",
		icon = ICONPATH .. "Artifact-chest-icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Artifact-chest-icon.png",
				icon_size = 64,
			}
		}, 
		flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },	
		max_health = 150,
		corpse = "small-remnants",
		collision_box = {{-1, -0.5}, {1, 0.5}},
		selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
		order = "i[items]-i[Artifact-collector]",	
		automated_ammo_count = 1,
		resistances = {},	
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 2,
			range = NE_Enemies.Settings.Artifact_Collector_Radius,
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

	
	--- Chest used to store picked up items
		
		{
			type = "logistic-container",
			name = "Artifact-collector",
			icon = ICONPATH .. "Artifact-chest-icon.png",
			icon_size = 64,
			icons = {
				{
					icon = ICONPATH .. "Artifact-chest-icon.png",
					icon_size = 64,
				}
			}, 
			flags = {"placeable-player", "placeable-neutral", "player-creation"},
			minable = {mining_time = 0.5, result = "Artifact-collector-area"},
			render_not_in_network_icon = false,
			max_health = 450,
			corpse = "small-remnants",
			dying_explosion = "medium-explosion",
			resistances =
			{
			  {
				type = "fire",
				percent = 100
			  },
			  {
				type = "explosion",
				percent = 30
			  },
			  {
				type = "impact",
				percent = 30
			  }
			},
			collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			order = "i[items]-i[Artifact-collector]",
			subgroup = "storage",
			inventory_size = 30,
			logistic_mode = "passive-provider",
			open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
			close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			picture =
			{
				filename = "__Natural_Evolution_Buildings__/graphics/entities/Artifact-chest_x.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				shift = {0.5, -0.5},
			}
		},

	--- Radar, to scan area for items
  {
    type = "radar",
    name = "Artifact-collector_r",
	icon = ICONPATH .. "Artifact-chest-icon.png",
	icon_size = 64,
	icons = {
		{
				icon = ICONPATH .. "Artifact-chest-icon.png",
				icon_size = 64,
			}
	}, 
	flags = {"placeable-player", "player-creation", "not-deconstructable"},
    minable = nil, 
	max_health = 450,
    corpse = "small-remnants",
	dying_explosion = "medium-explosion",
	resistances =
	{
	  {
		type = "fire",
		percent = 100
	  },
	  {
		type = "explosion",
		percent = 30
	  },
	  {
		type = "impact",
		percent = 30
	  }
	},
	collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	order = "b[TerraformingStation]-a[TerraformingStation]",
    energy_per_sector = "8.00MJ",
	energy_per_nearby_scan = "250kJ",
	max_distance_of_sector_revealed = 4,
    max_distance_of_nearby_sector_revealed = 1.5,   
    energy_source =
    {
      type = "void",
    },
    energy_usage = "200kW",
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 98,
          height = 128,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1, -8),
		  scale = 1/3,
          hr_version = {
            filename = "__base__/graphics/entity/radar/hr-radar.png",
            priority = "low",
            width = 196,
            height = 254,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(1, -8),
			scale = 1/6
          }
        },
      }
    },
	

  },
  
	
})
