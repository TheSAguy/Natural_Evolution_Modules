local sounds = require("__base__.prototypes.entity.demo-sounds")
local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend(
{

  {
    type = "unit",
    name = "tame-small-biter",
    icon = ICONPATH .. "small-biter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "small-biter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 15,
    order = "b-b-a",
    subgroup="enemies",
    resistances =
    {
      {
        type = "acid",
        percent = 100
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      ammo_type = make_unit_melee_ammo_type(7),
      sound = sounds.biter_roars(0.4),
      animation = biterattackanimation(small_biter_scale, small_biter_tint1, small_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.125,
    pollution_to_join_attack = 20,
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  sounds.biter_dying(0.4),
    working_sound =  sounds.biter_calls(0.3),
    run_animation = biterrunanimation(small_biter_scale, small_biter_tint1, small_biter_tint2),
    ai_settings = biter_ai_settings
  },
  {
    type = "unit",
    name = "tame-medium-biter",
    icon = ICONPATH .. "medium-biter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "medium-biter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 75,
    order="b-b-b",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      },
      {
        type = "acid",
        percent = 100
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      sound = sounds.biter_roars(0.5),
      animation = biterattackanimation(medium_biter_scale, medium_biter_tint1, medium_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.24,
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = 100,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = sounds.biter_calls(0.4),
    dying_sound = sounds.biter_dying(0.5),
    run_animation = biterrunanimation(medium_biter_scale, medium_biter_tint1, medium_biter_tint2),
    ai_settings = biter_ai_settings
  },
  {
    type = "unit",
    name = "tame-big-biter",
	order = "003",
    icon = ICONPATH .. "big-biter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "big-biter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 375,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      },
      {
        type = "acid",
        percent = 100
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    spawning_time_modifier = 3,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      ammo_type = make_unit_melee_ammo_type(30),
      sound =  sounds.biter_roars(0.6),
      animation = biterattackanimation(big_biter_scale, big_biter_tint1, big_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.23,
    distance_per_frame = 0.30,
    -- in pu
    pollution_to_join_attack = 400,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = sounds.biter_calls(0.5),
    dying_sound = sounds.biter_dying(0.6),
    run_animation = biterrunanimation(big_biter_scale, big_biter_tint1, big_biter_tint2),
    ai_settings = biter_ai_settings
  },
  {
    type = "unit",
    name = "tame-behemoth-biter",
	order = "204",
    icon = ICONPATH .. "behemoth-biter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "behemoth-biter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 3000,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 12,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 12,
        percent = 10
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 50,
      ammo_type = make_unit_melee_ammo_type(90),
      sound =  sounds.biter_roars(0.8),
      animation = biterattackanimation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.3,
    distance_per_frame = 0.32,
    -- in pu
    pollution_to_join_attack = 2000,
    corpse = "behemoth-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = sounds.biter_calls(0.7),
    dying_sound = sounds.biter_dying(0.8),
    run_animation = biterrunanimation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2),
    ai_settings = biter_ai_settings
  },

})
