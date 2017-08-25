


data:extend({

 
	--- Decelerate_concrete
     {
      type = "tile",
      name = "decelerate_concrete",
      needs_correction = false,
      minable = {hardness = 0.2, mining_time = 0.5, result = "stone-brick"}, -- You only get brick back when you mine it...
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      collision_mask = {"ground-tile"},
      walking_speed_modifier = 0.5,
      layer = 61,
      decorative_removal_probability = 1,
      variants =
      {
        main =
        {
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete1.png",
            count = 16,
            size = 1
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete2.png",
            count = 4,
            size = 2,
            probability = 0.39,
          },
          {
            picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete4.png",
            count = 4,
            size = 4,
            probability = 1,
          },
        },
        inner_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete-inner-corner.png",
          count = 32
        },
        outer_corner =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete-outer-corner.png",
          count = 16
        },
        side =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete-side.png",
          count = 16
        },
        u_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete-u.png",
          count = 16
        },
        o_transition =
        {
          picture = "__Natural_Evolution_Buildings__/graphics/entities/decelerate_concrete/concrete-o.png",
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
      ageing=0,
      vehicle_friction_modifier = 1,
    },

})
