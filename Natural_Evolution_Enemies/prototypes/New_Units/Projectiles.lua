require("prototypes.New_Units.ne-animations")

if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value


---- Spitter Attack Functions

-- Projectile Spitters
function Spitter_Attack_Projectile(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = data.projectile,
          starting_speed = 1
        }
      }
    },
    sound = make_spitter_roars(0.75),
    animation = ne_spitter_attack_animation(data.scale, data.tint),
  }
end


-- Stream Spitters
function Spitter_Attack_Stream(data)
  return
  {
    type = "stream",
	force = "enemy",
    ammo_category = "flamethrower",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier or 1.0,
    warmup = 15,
	min_range = 6,
    turn_range = 1.0 / 3.0,
	fire_penalty = 15,	
	gun_barrel_length = 2 * data.scale,
	gun_center_shift = {
	    north = {0, -0.65 * data.scale},
	    east = {0, 0},
	    south = {0, 0},
	    west = {0, 0}
	},
    ammo_type =
	    {
        category = "flamethrower",
        action =
		    {
			type = "direct",
			force = "enemy",
			action_delivery =
			    {
				type = "stream",
				force = "enemy",
				stream = "ne-fire-stream",
				duration = 160,
			    }
		    }
	    },
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 0.7
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 0.7
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 0.7
          }
        }
      },
    animation = ne_spitter_attack_animation(data.scale, data.tint),
  }
end



data:extend(
{
---Fire Stream
  {
    type = "stream",
    name = "ne-fire-stream",
	force = "enemy",
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 4},
    ground_light = {intensity = 0.8, size = 4},

    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },
    particle_buffer_size = 90,
    particle_spawn_interval = 2,
    particle_spawn_timeout = 8,
    particle_vertical_acceleration = 0.005 * 0.60,
    particle_horizontal_speed = 0.2* 0.75 * 1.5,
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
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
              type = "create-fire",
			  force = "enemy",
              entity_name = "ne-fire-flame-2"
            }
          }
        }
      },
      {
        type = "area",
		force = "enemy",
        radius = 2.5,
        action_delivery =
        {
          type = "instant",
		  force = "enemy",
          target_effects =
          {
            {
              type = "create-sticker",
			  force = "enemy",
              sticker = "ne-fire-sticker-2"
            },
            {
              type = "damage",
			  force = "enemy",
              damage = { amount = 3, type = "ne_fire", force = "enemy" },
              apply_damage_to_trees = true
            }
          }
        }
      }
    },

    spine_animation =
    {
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
      blend_mode = "additive",
      line_length = 4,
      width = 32,
      height = 18,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      animation_speed = 2,
      shift = {0, 0}
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

    particle =
    {
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      frame_count = 32,
      line_length = 8
    }
  },

--- Mine Projectile
  {
    type = "projectile",
    name = "Mine-Projectile",
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
			entity_name = "land-mine" -- will be replaced with a Spitter mine below.
          },
        }
      }
    },
    animation =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/land_mine_projectile.png",
      line_length = 16,
      width = 16,
      height = 18,
      frame_count = 16,
      priority = "high"
    },
    shadow =
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/land_mine_projectile_shadow.png",
      line_length = 16,
      width = 28,
      height = 16,
      frame_count = 16,
      priority = "high",
	  scale = 0.5,
      shift = {-0.09, 0.395}
    },
    rotatable = false
  },

}
)


--- Spitter Land Mine
local trigger_radius = 1
local damage_radius = 2
local damage_amount = 5


for i = 1, 100 do

local spitter_land_mine = util.table.deepcopy(data.raw["land-mine"]["land-mine"])
spitter_land_mine.name = "ne-spitter-land-mine-"..i
spitter_land_mine.collision_box = {{-0,-0}, {0, 0}}
spitter_land_mine.picture_safe.filename = "__Natural_Evolution_Enemies__/graphics/icons/ne-spitter-land-mine.png"
spitter_land_mine.picture_set.filename = "__Natural_Evolution_Enemies__/graphics/icons/ne-spitter-land-mine-set.png"
spitter_land_mine.picture_set_enemy.filename = "__Natural_Evolution_Enemies__/graphics/icons/ne-spitter-land-mine-set.png"
spitter_land_mine.order = "ne-land-mine-"..i
spitter_land_mine.corpse = "blood-explosion-big"
spitter_land_mine.trigger_radius = trigger_radius
spitter_land_mine.action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = damage_radius,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = damage_amount, type = "explosion", force = "enemy"}
                  },
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = (damage_amount * math.floor(NE_Enemies.Settings.NE_Difficulty/2)), type = "explosion", force = "enemy"}
          }
        }
      }
    }

trigger_radius = trigger_radius + 0.05
damage_radius = damage_radius + 0.06
damage_amount = damage_amount + NE_Enemies.Settings.NE_Difficulty

data:extend({spitter_land_mine})

end

---- Land Mine Projectile


for i = 1, 100 do
	local my_new_mine_projectiles = util.table.deepcopy(data.raw["projectile"]["Mine-Projectile"])
	my_new_mine_projectiles.name = "Mine-Projectile-"..i
	my_new_mine_projectiles.action =
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
				entity_name = "ne-spitter-land-mine-"..i
			  },
			}
		  }
		}

data:extend({my_new_mine_projectiles})

end

--- NE File Flame
local my_new_fire_flame = util.table.deepcopy(data.raw["fire"]["fire-flame"])
my_new_fire_flame.name = "ne-fire-flame-2"
my_new_fire_flame.force = "enemy"
my_new_fire_flame.damage_per_tick = {amount = 5 / 60, type = "ne_fire", force = "enemy"}
my_new_fire_flame.initial_lifetime = 20
my_new_fire_flame.maximum_lifetime = 300
my_new_fire_flame.burnt_patch_lifetime = 200
my_new_fire_flame.emissions_per_tick = 0
my_new_fire_flame.lifetime_increase_by = 50
my_new_fire_flame.smoke = {}


data:extend({my_new_fire_flame})

--- NE Fire Sticker
local my_new_fire_sticker = util.table.deepcopy(data.raw["sticker"]["fire-sticker"])
my_new_fire_sticker.name = "ne-fire-sticker-2"
my_new_fire_sticker.force = "enemy"
my_new_fire_sticker.duration_in_ticks = 15 * 60
my_new_fire_sticker.target_movement_modifier = 0.8
my_new_fire_sticker.damage_per_tick = { amount = 80 / 60, type = "ne_fire",force = "enemy" }
my_new_fire_sticker.spread_fire_entity = "fire-flame-on-tree"
my_new_fire_sticker.fire_spread_cooldown = 30
my_new_fire_sticker.fire_spread_radius = 0.75
	

data:extend({my_new_fire_sticker})


--[[
  {
    type = "land-mine",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 32,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 1, result = "land-mine"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 15,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    ammo_category = "landmine",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = 6,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 300, type = "explosion"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          }
        }
      }
    }
  },
]]
