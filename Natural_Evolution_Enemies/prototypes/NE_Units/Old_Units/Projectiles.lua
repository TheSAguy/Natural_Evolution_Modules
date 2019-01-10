
if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value


function fire_pic(inputs)
return

		
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/ne_fire.png",
      priority = "low",
      width = 128,
      height = 128,
      frame_count = 12,
      line_length = 4,
	  animation_speed = 1,    
      scale = inputs.scale,
    }
	
end



data:extend(
{
 
--- Infected Projectile
  {
    type = "projectile",
    name = "Infected-Projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {	  
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
			force = "enemy",
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
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
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
			force = "enemy",
            action =
            {
              type = "area",
			  force = "enemy",
              radius = 2,
              action_delivery =
              {
                type = "instant",
				force = "enemy",
                target_effects =
                {
                  {
					type = "damage",
					force = "enemy",
					damage = {amount = 7*NE_Enemies.Settings.NE_Difficulty, type = "explosion"}
				  },
				  {
                    type = "damage",
					force = "enemy",
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

  --------------------------
  --- Infected Poison Cloud
  {
    type = "smoke-with-trigger",
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
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          type = "nested-result",
		  force = "enemy",
          action =
          {
            type = "area",
            radius = 3,
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
  

  ----- Fire Clouds. 
  ---- Small Fire Cloud
   {
    type = "smoke-with-trigger",
    name = "small-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
 
	animation = fire_pic{scale = 0.7},

    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 8,
    fade_away_duration = 2 * 60,
    spread_duration = 8,
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
			force = "enemy",
            radius = 3,
            action_delivery =
            {
              type = "instant",
			  force = "enemy",
              target_effects =
              {
                type = "damage",
				force = "enemy",
                damage = { amount = 3, type = "fire", force = "enemy"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  --- Medium Fire Cloud
    {
    type = "smoke-with-trigger",
    name = "medium-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
	animation = fire_pic{scale = 0.85},

    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 10,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
			force = "enemy",
            radius = 4,
            action_delivery =
            {
              type = "instant",
			  force = "enemy",
              target_effects =
              {
                type = "damage",
				force = "enemy",
                damage = { amount = 4, type = "fire", force = "enemy"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
   --- Big Fire Cloud
    {
    type = "smoke-with-trigger",
    name = "big-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
	animation = fire_pic{scale = 1},

	slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 12,
    fade_away_duration = 2 * 60,
    spread_duration = 12,
	force = "enemy",
    action =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          type = "nested-result",
		  force = "enemy",
          action =
          {
            type = "area",
			force = "enemy",
            radius = 5,
            action_delivery =
            {
              type = "instant",
			  force = "enemy",
              target_effects =
              {
                type = "damage",
				force = "enemy",
                damage = { amount = 5, type = "fire", force = "enemy"}
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



local my_fire_flame = util.table.deepcopy(data.raw["fire"]["fire-flame"])
my_fire_flame.name = "ne-fire-flame"
my_fire_flame.damage_per_tick = {amount = 5 / 60, type = "fire"}
my_fire_flame.initial_lifetime = 20
my_fire_flame.maximum_lifetime = 300
my_fire_flame.burnt_patch_lifetime = 200
my_fire_flame.emissions_per_tick = 0
my_fire_flame.lifetime_increase_by = 50
my_fire_flame.smoke = {}


data:extend({my_fire_flame})


