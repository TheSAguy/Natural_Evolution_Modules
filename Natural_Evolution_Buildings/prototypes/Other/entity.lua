
-- Battle Markers
	data:extend({


	  {
		type = "simple-entity",
		name = "battle_marker",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Battle_Marker_1_32.png",
		flags = {"placeable-neutral", "player-creation", "not-blueprintable", "not-repairable"},
		minable = {hardness = 0.2, mining_time = 0.5, results = {{type="item", name="stone", amount=10},}},
		max_health = 150,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 100
		  },
		  {
			type = "explosion",
			percent = 100
		  },
		  {
			type = "explosion",
			percent = 80
		  },
		},
		collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
		selection_box = {{-1, -1}, {1, 1}},
		drawing_box = {{-1, -3}, {1, 0.5}},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		pictures =
		{
		  filename = "__Natural_Evolution_Buildings__/graphics/entity/Battle_Marker.png",
		  line_length = 1,
		  width = 160,
		  height = 160,
		  direction_count = 1,
		  shift = {0, 0},
		  scale = 0.5,	
		},	
	  },

	})
