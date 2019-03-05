-- create worm attack variants with spash damage

--[[
-- http://stackoverflow.com/questions/640642/how-do-you-copy-a-lua-table-by-value
local function deepcopy(o, seen)
  seen = seen or {}
  if o == nil then return nil end
  if seen[o] then return seen[o] end

  local no
  if type(o) == 'table' then
    no = {}
    seen[o] = no

    for k, v in next, o, nil do
      no[deepcopy(k, seen)] = deepcopy(v, seen)
    end
    setmetatable(no, deepcopy(getmetatable(o), seen))
  else -- number, string, boolean, etc
    no = o
  end
  return no
end

local SpashDmg =
{
  type = "nested-result",
  action =
  {
    type = "area",
    radius = 2.5,
    force = "enemy",
    action_delivery =
    {
      type = "instant",
      target_effects =
	  {
          {
            type = "damage",
            damage = { amount = 10 , type = "acid"}
          },
          {
            type = "damage",
            damage = { amount = 10 , type = "explosion"}
          }
      }
    }
  }
}


local AcidProjectileSmallSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileSmallSpash.name = "acid-projectile-purple-smallSplash"
local SmallSplash = deepcopy(SpashDmg)
SmallSplash.action.radius = 2
table.insert(AcidProjectileSmallSpash.action.action_delivery.target_effects, SmallSplash)
data:extend{AcidProjectileSmallSpash}


local AcidProjectileMediumSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileMediumSpash.name = "acid-projectile-purple-mediumSplash"
local MediumSpash = deepcopy(SpashDmg)
MediumSpash.action.radius = 3
table.insert(AcidProjectileMediumSpash.action.action_delivery.target_effects, MediumSpash)
data:extend{AcidProjectileMediumSpash}

local AcidProjectileBigSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileBigSpash.name = "acid-projectile-purple-bigSplash"
local BigSplash = deepcopy(SpashDmg)
BigSplash.action.radius = 3.5
table.insert(AcidProjectileBigSpash.action.action_delivery.target_effects, BigSplash)
data:extend{AcidProjectileBigSpash}
--]]

data:extend(
{

  {
    type = "item",
    name = "small-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/small-worm-corpse.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[small-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "small-worm-hatching",
    icon = "__base__/graphics/icons/small-worm.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[small-worm]",
    place_result = "small-worm-turret-player",
    stack_size = 50
  },
  
  {
    type = "item",
    name = "medium-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[medium-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "medium-worm-hatching",
    icon = "__base__/graphics/icons/medium-worm.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "b[medium-worm]",
    place_result = "medium-worm-turret-player",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[big-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching",
    icon = "__base__/graphics/icons/big-worm.png",
	icon_size = 32,
    ----flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "c[big-worm]",
    place_result = "big-worm-turret-player",
    stack_size = 50
  },

})

----- Worm Entities
data:extend(
{
  {
    type = "turret",
    name = "small-worm-turret-player",
    icon = "__base__/graphics/icons/small-worm.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"},
    minable = {hardness = 1, mining_time = 1, result = "small-worm-hatching-exhausted"},
    order="b-b-d",
    max_health = 400,
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "acid",
        decrease = 3,
        percent = 30
      },
	  {
        type = "poison",
        decrease = 3,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    map_generator_bounding_box = {{-1.9, -1.8}, {1.9, 1.8}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    shooting_cursor_size = 3,
    corpse = "small-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_small_sounds(0.8),

    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_small, tint_worm_small),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(scale_worm_small, tint_worm_small, "forward"),
    preparing_sound = make_worm_standup_small_sounds(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = make_worm_breath(0.8),
    prepared_animation = worm_prepared_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_speed = 0.024,
    prepared_alternative_speed_secondary = 0.018,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_sound = make_worm_roar_alternative(0.8),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_small, tint_worm_small),
    starting_attack_sound = make_worm_roars(0.75),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_small, tint_worm_small),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_small, tint_worm_small, "backward"),
    folding_sound = make_worm_fold_sounds(1),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_small),
    prepare_range = range_worm_small + prepare_range_worm_small,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_small,--defined in demo-spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_small,--defined in demo-spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_small, scale_worm_small * scale_worm_stream),
      use_shooter_direction = true,

      --turn_range = 1.0 / 3.0,
      --fire_penalty = 15,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      fluids =
      {
        {type = "crude-oil"},
        {type = "heavy-oil", damage_modifier = 1.05},
        {type = "light-oil", damage_modifier = 1.1}
      },
      fluid_consumption = 0.2,

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-small",
            duration = 160,
            source_offset = {0.15, -0.5}
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
      }
    },

    call_for_help_radius = 40
  },

  {
    type = "turret",
    name = "medium-worm-turret-player",
    icon = "__base__/graphics/icons/medium-worm.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"},
    minable = {hardness = 1, mining_time = 1, result = "medium-worm-hatching-exhausted"},
    order="b-b-e",
    max_health = 700,
    resistances =
    {
	  {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 5,
        percent = 30
      },
	  {
        type = "poison",
        decrease = 5,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 20
      }   
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    map_generator_bounding_box = {{-2.1, -2.0}, {2.1, 2.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1),

    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_medium, tint_worm_medium),
    preparing_speed = 0.024,
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    preparing_animation = worm_preparing_animation(scale_worm_medium, tint_worm_medium, "forward"),
    preparing_sound = make_worm_standup_sounds(1),
    prepared_sound = make_worm_breath(0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_medium, tint_worm_medium),
    prepared_alternative_sound = make_worm_roar_alternative(0.8),
    prepared_animation = worm_prepared_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_sound = make_worm_roars(0.8),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_medium, tint_worm_medium),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_medium, tint_worm_medium, "backward"),
    folding_sound = make_worm_fold_sounds(1),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_medium),
    prepare_range = range_worm_medium + prepare_range_worm_medium,
    allow_turning_when_starting_attack = true,

    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_medium,--defined in demo-spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_medium,--defined in demo-spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_medium, scale_worm_medium * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-medium",
            duration = 160,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    call_for_help_radius = 40
  },

  {
    type = "turret",
    name = "big-worm-turret-player",
    icon = "__base__/graphics/icons/big-worm.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"},
    minable = {hardness = 1, mining_time = 1, result = "big-worm-hatching-exhausted"},
    max_health = 1000,
    order="b-b-f",
    resistances =
    {
	  {
        type = "physical",
        decrease = 8,
        percent = 30
      },
      {
        type = "acid",
        decrease = 7,
        percent = 30
      },
	  {
        type = "poison",
        decrease = 7,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 20
      }  
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1.0),

    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_big, tint_worm_big),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(scale_worm_big, tint_worm_big, "forward"),
    preparing_sound = make_worm_standup_sounds(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(scale_worm_big, tint_worm_big),
    prepared_sound = make_worm_breath(0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_big, tint_worm_big),
    prepared_alternative_sound = make_worm_roar_alternative(0.8),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_big, tint_worm_big),
    starting_attack_sound = make_worm_roars(0.95),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_big, tint_worm_big),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_big, tint_worm_big, "backward"),
    folding_sound = make_worm_fold_sounds(1),
    integration = worm_integration(scale_worm_big),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_big + prepare_range_worm_big,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      damage_modifier = damage_modifier_worm_big,--defined in demo-spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_big,--defined in demo-spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_big, scale_worm_big * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-big",
            duration = 160,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    call_for_help_radius = 40
  },
}
)
