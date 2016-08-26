-- create worm attack variants with spash damage

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
    perimeter = 2.5,
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

--[[
local AcidProjectileSmallSpash = deepcopy(data.raw["projectile"]["acid-projectile-purple"])
AcidProjectileSmallSpash.name = "acid-projectile-purple-smallSplash"
local SmallSplash = deepcopy(SpashDmg)
SmallSplash.action.perimeter = 2
table.insert(AcidProjectileSmallSpash.action.action_delivery.target_effects, SmallSplash)
data:extend{AcidProjectileSmallSpash}
--]]

local AcidProjectileMediumSpash = deepcopy(data.raw["projectile"]["acid-projectile-purple"])
AcidProjectileMediumSpash.name = "acid-projectile-purple-mediumSplash"
local MediumSpash = deepcopy(SpashDmg)
MediumSpash.action.perimeter = 3
table.insert(AcidProjectileMediumSpash.action.action_delivery.target_effects, MediumSpash)
data:extend{AcidProjectileMediumSpash}

local AcidProjectileBigSpash = deepcopy(data.raw["projectile"]["acid-projectile-purple"])
AcidProjectileBigSpash.name = "acid-projectile-purple-bigSplash"
local BigSplash = deepcopy(SpashDmg)
BigSplash.action.perimeter = 3.5
table.insert(AcidProjectileBigSpash.action.action_delivery.target_effects, BigSplash)
data:extend{AcidProjectileBigSpash}


data:extend(
{

  {
    type = "item",
    name = "small-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/small-worm-corpse.png",
    flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[small-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "small-worm-hatching",
    icon = "__base__/graphics/icons/small-worm.png",
    flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[small-worm]",
    place_result = "small-worm-turret-player",
    stack_size = 50
  },
  
  {
    type = "item",
    name = "medium-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
    flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[medium-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "medium-worm-hatching",
    icon = "__base__/graphics/icons/medium-worm.png",
    flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "b[medium-worm]",
    place_result = "medium-worm-turret-player",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching-exhausted",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
    flags = {"goes-to-quickbar"},
    subgroup = "worms",
    order = "a[big-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching",
    icon = "__base__/graphics/icons/big-worm.png",
    flags = {"goes-to-quickbar"},
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
    healing_per_tick = 0.0222,
    collision_box = {{-0.6, -0.5 }, {0.6, 0.5}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    shooting_cursor_size = 3,
    corpse = "small-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(0.8),
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(small_worm_scale, small_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(small_worm_scale, small_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(small_worm_scale, small_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(small_worm_scale, small_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.75),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(small_worm_scale, small_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(small_worm_scale, small_worm_tint, "backward"),
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 15,
      range = 18,
      projectile_creation_distance = 1.8,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple",
            starting_speed = 0.5
          }
        }
      }
    },
	call_for_help_radius = 40,
  },

  {
    type = "turret",
    name = "medium-worm-turret-player",
    icon = "__base__/graphics/icons/medium-worm.png",
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
    healing_per_tick = 0.0389,
    collision_box = {{-0.8, -0.7}, {0.8, 0.7}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(0.9),
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(medium_worm_scale, medium_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(medium_worm_scale, medium_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(medium_worm_scale, medium_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(medium_worm_scale, medium_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.8),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(medium_worm_scale, medium_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(medium_worm_scale, medium_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 22,
      projectile_creation_distance = 1.9,
      damage_modifier = 3,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple-mediumSplash",
            starting_speed = 0.5
          }
        }
      }
    },
	call_for_help_radius = 40,
  },

  {
    type = "turret",
    name = "big-worm-turret-player",
    icon = "__base__/graphics/icons/big-worm.png",
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
    healing_per_tick = 0.0556,
    collision_box = {{-1.1, -0.9}, {1.1, 0.9}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1.0),
    inventory_size = 2,
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(big_worm_scale, big_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(big_worm_scale, big_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(big_worm_scale, big_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(big_worm_scale, big_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.95),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(big_worm_scale, big_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(big_worm_scale, big_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 90,
      range = 28,
      projectile_creation_distance = 2.1,
      damage_modifier = 6,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple-bigSplash",
            starting_speed = 0.5
          }
        }
      }
    },
	call_for_help_radius = 40,
  },
}
)
