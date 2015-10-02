data:extend(
	{
		{
			type = "logistic-container",
			--type = "container",
			name = "Artifact-collector",
			icon = "__Natural_Evolution_Enemies__/graphics/icons/Artifact-chest-icon.png",
			flags = {"placeable-player", "placeable-neutral", "player-creation"},
			minable = {mining_time = 0.5, result = "Artifact-collector-area"},
			max_health = 150,
			corpse = "small-remnants",
			resistances = 
			{
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			order = "i[items]-i[Artifact-collector]",
			subgroup = "storage",
			fast_replaceable_group = "container",
			inventory_size = 48,
			logistic_mode = "passive-provider",
			open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
			close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			picture =
			{
				filename = "__Natural_Evolution_Enemies__/graphics/entity/Artifact-chest.png",
				priority = "extra-high",
				width = 60,
				height = 100,
				shift = {0.4, -0.13}
			}
		},
		{
			type = "logistic-container",
			--type = "container",
			name = "Artifact-collector-area",
			icon = "__Natural_Evolution_Enemies__/graphics/icons/Artifact-chest-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 0.5, result = "Artifact-collector-area"},
			max_health = 150,
			corpse = "small-remnants",
			resistances = 
			{
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			order = "i[items]-i[Artifact-collector]",
			subgroup = "storage",
			fast_replaceable_group = "container",
			inventory_size = 48,
			logistic_mode = "passive-provider",
			open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
			close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			picture =
			{
				filename = "__Natural_Evolution_Enemies__/graphics/entity/Artifact-chest-area.png",
				priority = "extra-high",
				width = 1600,
				height = 1600,
				shift = {0.4, -0.13}
			}
		}
	}
)