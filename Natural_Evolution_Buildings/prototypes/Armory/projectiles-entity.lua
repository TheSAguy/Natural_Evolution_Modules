require "util"

if mods["Natural_Evolution_Enemies"] then
	NE_Damage = 2
else
	NE_Damage = 1
end


data:extend({
	--Projectile

 -- Napalm Ammo

   {
    type = "projectile",
    name = "NE-Napalm-Rocket",
    flags = {"not-on-map"},
    acceleration = 0.0005,
	    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "damage",
            damage = {amount = 50 * NE_Damage, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
			{
				type = "area",
				target_entities = false,
				repeat_count = 40,
				perimeter = 10,
				action_delivery =
				{
					type = "projectile",
					projectile = "NE-Napalm-Large",
					starting_speed = 0.5
				},
				{
					type = "damage",
					damage = {amount = 50 * NE_Damage, type = "explosion"}
				},
				{
                    type = "create-entity",
                    entity_name = "explosion"
                },
			},
          }
        }
      }
    },
	light = {intensity = 0.7, size = 6},
       light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, -1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }

  },


  
  ----- Fire Clouds. 
 
  --- medium File Cloud
    {
    type = "smoke-with-trigger",
    name = "medium-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 10,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 10,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 8, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
 

  
  --- Napalm Large
    {
    type = "projectile",
    name = "NE-Napalm-Large",
	flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
			  type = "create-entity",
              entity_name = "fire-flame"
            },
			{
			type = "create-entity",
			entity_name = "medium-fire-cloud",
			},
          }
        }
      },

    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  }
  
  

})