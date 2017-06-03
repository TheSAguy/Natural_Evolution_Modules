
data:extend({


 {
    type = "electric-pole",
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
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 0.5}},

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
	maximum_wire_distance = 0,
    supply_area_distance = 0,
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
	
	connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        }
      },
	},

	
    radius_visualisation_picture =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/icons/empty.png",
      width = 0,
      height = 0,
      priority = "low"
    },
  },
  
--[[
  {
    type = "simple-entity",
    name = "battle_marker_hidden",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/Battle_Marker_1_32.png",
    flags = {"not-on-map", "player-creation"},
    max_health = 1,
    render_layer = "object",
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{0, 0}, {0, 0}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 0.0 },
    pictures =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/icons/empty.png",
      width = 1,
      height = 1,
      shift = {0, 0}
    }
  },
]]

 {
    type = "electric-pole",
    name = "battle_marker_hidden",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/Battle_Marker_1_32.png",
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    max_health = 1,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-0, -0}, {0, 0}},
	drawing_box = {{0, 0}, {0, 0}},
	collision_mask = { "resource-layer" },
    maximum_wire_distance = 0,
    supply_area_distance = 0,
	pictures =
	{
      filename = "__Natural_Evolution_Buildings__/graphics/icons/empty-electric-pole.png",
      line_length = 1,
      width = 123,
      height = 124,
      direction_count = 1,
      shift = {0, 0}
    },	
	
	connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        }
      },
	},

	
    radius_visualisation_picture =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/icons/empty.png",
      width = 0,
      height = 0,
      priority = "low"
    },
  },


  
})
