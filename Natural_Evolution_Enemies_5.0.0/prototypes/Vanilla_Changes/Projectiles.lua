data:extend(
{

--- Infected Projectile
  {
    type = "projectile",
    name = "Infected-Projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                volume = 0.8
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "Infected-Poison-Cloud"
          },
		  {
            type = "damage",
            damage = {amount = 5, type = "explosion"}
          },
          {
            type = "damage",
            damage = {amount = 12, type = "poison"}
          }
        }
      }
    },
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/acid-projectile-yellow.png",
      line_length = 5,
      width = 16,
      height = 18,
      frame_count = 33,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      shift = {-0.09, 0.395}
    },
    rotatable = false
  },

  --- Mutated Projectile
  {
    type = "projectile",
    name = "Mutated-Projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                volume = 0.8
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "acid-splash-purple"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 2,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
					type = "damage",
					damage = {amount = 5, type = "explosion"}
				  },
				  {
                    type = "damage",
                    damage = {amount = 14, type = "acid"}
                  },
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/acid-projectile-red.png",
      line_length = 5,
      width = 16,
      height = 18,
      frame_count = 33,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      shift = {-0.09, 0.395}
    },
    rotatable = false
  },

  --- Infected Poison Cloud
  {
    type = "smoke",
    name = "Infected-Poison-Cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      priority = "low",
      width = 256,
      height = 256,
      frame_count = 45,
      animation_speed = 3,
      line_length = 7,
      scale = 1,
    },
    slow_down_factor = 0,
    wind_speed_factor = 0,
    cyclic = true,
    duration = 60 * 10,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    color = { r = 0.2, g = 0.9, b = 0.2 },
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
            perimeter = 3,
            entity_flags = {"breaths-air", "player-creation", "placeable-neutral", "placeable-player", "placeable-enemy"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 6, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
}
)
