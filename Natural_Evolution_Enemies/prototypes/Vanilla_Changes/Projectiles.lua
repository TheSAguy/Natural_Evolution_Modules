
if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value




require("prototypes.Vanilla_Changes.Explosions")



data:extend(
{
--[[ Vanilla Spitter Projectile 
{
    type = "projectile",
    name = "acid-projectile-purple",
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
            type = "damage",
            damage = {amount = 10, type = "acid"}
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple.png",
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
  }
  --]]
  
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
            damage = {amount = 7*NE_Enemies.Settings.NE_Difficulty, type = "explosion"}
          },
          {
            type = "damage",
            damage = {amount = 14*NE_Enemies.Settings.NE_Difficulty, type = "poison"}
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
            type = "create-entity",
            entity_name = "acid-splash-mutated"
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
					damage = {amount = 7*NE_Enemies.Settings.NE_Difficulty, type = "explosion"}
				  },
				  {
                    type = "damage",
                    damage = {amount = 14*NE_Enemies.Settings.NE_Difficulty, type = "acid"}
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

  ------------------------------------
  ----------- WORM Projectiles -------
  ------------------------------------
  
  --- Infected WORM Projectile
  {
    type = "projectile",
    name = "Infected-Projectile-Worm",
    flags = {"not-on-map"},
    acceleration = 0.05,
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
			entity_name = "unit-cluster",
			trigger_created_entity = "true"
          },
		  {
			type = "create-sticker",
			sticker = "slowdown-sticker"
          },

          {
            type = "create-entity",
            entity_name = "Infected-Poison-Cloud"
          },

		  {
            type = "damage",
            damage = {amount = 12*NE_Enemies.Settings.NE_Difficulty, type = "explosion"}
          },
          {
            type = "damage",
            damage = {amount = 24*NE_Enemies.Settings.NE_Difficulty, type = "poison"}
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

  --- Mutated WORM Projectile
  {
    type = "projectile",
    name = "Mutated-Projectile-Worm",
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
			entity_name = "unit-cluster",
			trigger_created_entity = "true"
          },
		  {
			type = "create-sticker",
			sticker = "slowdown-sticker"
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
					damage = {amount = 10*NE_Enemies.Settings.NE_Difficulty, type = "explosion"}
				  },
				  {
                    type = "damage",
                    damage = {amount = 20*NE_Enemies.Settings.NE_Difficulty, type = "acid"}
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

  --------------------------
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
                damage = { amount = 6*NE_Enemies.Settings.NE_Difficulty, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  

   --- Huge Acid Splash Continue
   {
    type = "explosion",
    name = "NE-Acid-explosion",
    flags = {"not-on-map"},
    acceleration = 0.005,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "acid-explosion-huge"
          },
		  {
            type = "create-entity",
            entity_name = "acid-splash"
          },
          {
            type = "nested-result",
            action =
            {
				{
				type = "area",
				perimeter = 1,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 21, type = "acid" }}}},
				{
				type = "area",
				perimeter = 2,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 11, type = "acid" }}}},
				{
				type = "area",
				perimeter = 3,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 11, type = "acid" }}}},
				{
				type = "area",
				perimeter = 4,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 11, type = "acid" }}}},
				{
				type = "area",
				perimeter = 5,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 5.4, type = "acid" }}}},
				{
				type = "area",
				perimeter = 6,
                entity_flags = {"player-creation", "placeable-player", "placeable-neutral", "pushable"},
				action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 5.4, type = "acid" }}}}
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animations =
    {{
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }}
  },
  
  
  ----- Fire Clouds. 
  ---- Small Fire Cloud
   {
    type = "smoke-with-trigger",
    name = "small-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/fire.png",
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
    duration = 60 * 8,
    fade_away_duration = 2 * 60,
    spread_duration = 8,
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
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 3, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  --- medium File Cloud
    {
    type = "smoke-with-trigger",
    name = "medium-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/fire.png",
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
            perimeter = 4,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 4, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
   --- big File Cloud
    {
    type = "smoke-with-trigger",
    name = "big-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/fire.png",
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
    duration = 60 * 12,
    fade_away_duration = 2 * 60,
    spread_duration = 12,
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
            perimeter = 5,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 5, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  
    {
    type = "explosion",
    name = "acid-splash-mutated",
    flags = {"not-on-map"},
	animations =
    {
      {
        filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
        priority = "extra-high",
        width = 64,
        height = 64,
		scale = 1.4,
		tint = {r=0, g=0.6, b=0.6, a=1},
        frame_count = 64,
        line_length = 8,
		animation_speed = 0.7,
      },
	  {
        filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
        priority = "extra-high",
        width = 64,
        height = 64,
		scale = 1.6,
		tint = {r=0, g=0.7, b=0.5, a=1},
        frame_count = 64,
        line_length = 8,
		animation_speed = 0.7,
      },
	  {
        filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
        priority = "extra-high",
        width = 64,
        height = 64,
		scale = 1.8,
		tint = {r=0.3, g=0.8, b=0.4, a=1},
        frame_count = 64,
        line_length = 8,
		animation_speed = 0.7,
      },
	  {
        filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
        priority = "extra-high",
        width = 64,
        height = 64,
		scale = 2,
		tint = {r=0, g=0.9, b=0.3, a=1},
        frame_count = 64,
        line_length = 8,
		animation_speed = 0.7,
      },
	  {
        filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
        priority = "extra-high",
        width = 64,
        height = 64,
		scale = 2.2,
		tint = {r=0, g=1, b=0.2, a=1},
        frame_count = 64,
        line_length = 8,
		animation_speed = 1,
      },
    },
  },
  
}
)
