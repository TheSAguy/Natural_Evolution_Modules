local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"
local EPC_Tint = {r = 128/255, g = 128/255, b = 128/255, a = 0}

data:extend({

	--- Pheromone Concrete
 
    {
      type = "tile",
      name = "pheromone_concrete",
      needs_correction = false,
      minable = {mining_time = 0.75, result = "exhausted_pheromone_concrete"}, -- You only get Exhausted Pheromone Concrete back when you mine it...
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      collision_mask = {"ground-tile", "layer-12"},
	  walking_speed_modifier = 1.5,
	  vehicle_friction_modifier = 0.8,
      layer = 61,
      decorative_removal_probability = 1,
      variants =
      {
        main =
        {
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete1.png",
            count = 16,
            size = 1
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete2.png",
            count = 4,
            size = 2,
            probability = 0.39,
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete4.png",
            count = 4,
            size = 4,
            probability = 1,
          },
        },
        inner_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete-inner-corner.png",
          count = 32
        },
        outer_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete-outer-corner.png",
          count = 16
        },
        side =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete-side.png",
          count = 16
        },
        u_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete-u.png",
          count = 16
        },
        o_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/concrete-o.png",
          count = 1
        }
      },
      walking_sound =
      {
        {
          filename = "__base__/sound/walking/concrete-01.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=100, g=100, b=100},
      pollution_absorption_per_second=0,
      
    },

 
	--- Exhausted Pheromone Concrete
     {
      type = "tile",
      name = "exhausted_pheromone_concrete",
      needs_correction = false,
      minable = {mining_time = 0.5, result = "exhausted_pheromone_concrete"}, 
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      collision_mask = {"ground-tile", "layer-12"},
	  walking_speed_modifier = 1.5,
	  vehicle_friction_modifier = 0.8,
      layer = 61,
      decorative_removal_probability = 1,
      variants =
      {
        main =
        {
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete1.png",
            count = 16,
            size = 1,
			tint = EPC_Tint,
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete2.png",
            count = 4,
            size = 2,
            probability = 0.39,
			tint = EPC_Tint,
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete4.png",
            count = 4,
            size = 4,
            probability = 1,
			tint = EPC_Tint,
          },
        },
        inner_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete-inner-corner.png",
          count = 32,
		  tint = EPC_Tint,
        },
        outer_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete-outer-corner.png",
          count = 16,
		  tint = EPC_Tint,
        },
        side =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete-side.png",
          count = 16,
		  tint = EPC_Tint,
        },
        u_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete-u.png",
          count = 16,
		  tint = EPC_Tint,
        },
        o_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/pheromone_concrete/exhausted_concrete-o.png",
          count = 1,
		  tint = EPC_Tint,
        }
      },
      walking_sound =
      {
        {
          filename = "__base__/sound/walking/concrete-01.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=100, g=100, b=100},
      pollution_absorption_per_second = 0,
      
    },


	
})
