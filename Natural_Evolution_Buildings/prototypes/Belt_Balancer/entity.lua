--require ("prototypes.belt-balancer-pictures")


data:extend(
	{
		
	  {
		type = "splitter",
		name = "NE-belt-balancer",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/belt-balancer.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "NE-belt-balancer"},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 50
		  }
		},
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/express-transport-belt.ogg",
			volume = 0.4
		  },
		  max_sounds_per_type = 3
		},
		animation_speed_coefficient = 32,
		structure_animation_speed_coefficient = 0.7,
		structure_animation_movement_cooldown = 10,
		belt_horizontal = basic_belt_horizontal,
		belt_vertical = basic_belt_vertical,
		ending_top = basic_belt_ending_top,
		ending_bottom = basic_belt_ending_bottom,
		ending_side = basic_belt_ending_side,
		starting_top = basic_belt_starting_top,
		starting_bottom = basic_belt_starting_bottom,
		starting_side = basic_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "splitter",
		speed = 0.03125,
		structure =
		{
		  north =
		  {
			filename = "__Natural_Evolution_Buildings__/graphics/entity/NE-belt-balancer-north.png",
			frame_count = 4,
			line_length = 4,
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = {0, 0}
		  },
		  east =
		  {
			filename = "__Natural_Evolution_Buildings__/graphics/entity/NE-belt-balancer-east.png",
			frame_count = 4,
			line_length = 4,
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = {0, 0}
		  },
		  south =
		  {
			filename = "__Natural_Evolution_Buildings__/graphics/entity/NE-belt-balancer-south.png",
			frame_count = 4,
			line_length = 4,
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = {0, 0}
		  },
		  west =
		  {
			filename = "__Natural_Evolution_Buildings__/graphics/entity/NE-belt-balancer-west.png",
			frame_count = 4,
			line_length = 4,
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = {0, 0}
		  },
    },
    ending_patch = ending_patch_prototype
		
	  },
 
	}
)