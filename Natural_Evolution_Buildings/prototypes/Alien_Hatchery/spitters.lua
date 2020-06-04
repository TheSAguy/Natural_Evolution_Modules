local sounds = require("__base__.prototypes.entity.demo-sounds")
local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend(
{

  {
    type = "unit",
    name = "tame-small-spitter",
    icon = ICONPATH .. "small-spitter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "small-spitter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
    order="b-b-d",
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
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,

    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-small",
      range=range_spitter_small,
      min_attack_distance=10,
      cooldown=100,
      damage_modifier=damage_modifier_spitter_small,
      scale=scale_spitter_small,
      tint1=tint_1_spitter_small,
      tint2=tint_2_spitter_small,
      roarvolume=0.4
    }),
    vision_distance = 30,
    movement_speed = 0.185,

    distance_per_frame = 0.04,
    -- in pu
    pollution_to_join_attack = 20,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = sounds.biter_calls(0.3),
    dying_sound = sounds.spitter_dying(0.4),
    run_animation = spitterrunanimation(scale_spitter_small, tint_1_spitter_small, tint_2_spitter_small),
    ai_settings = biter_ai_settings
  },
  {
    type = "unit",
    name = "tame-medium-spitter",
    icon = ICONPATH .. "medium-spitter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "medium-spitter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order="b-b-e",
    subgroup="enemies",
    resistances =
    {
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
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-medium",
      range=range_spitter_medium,
      min_attack_distance=10,
      cooldown=100,
      damage_modifier=damage_modifier_spitter_medium,
      scale=scale_spitter_medium,
      tint1=tint_1_spitter_medium,
      tint2=tint_2_spitter_medium,
      roarvolume=0.5
    }),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.055,
    -- in pu
    pollution_to_join_attack = 60,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = sounds.biter_calls(0.4),
    dying_sound = sounds.spitter_dying(0.5),
    run_animation = spitterrunanimation(scale_spitter_medium, tint_1_spitter_medium, tint_2_spitter_medium),
    ai_settings = biter_ai_settings
  },
  {
    type = "unit",
    name = "tame-big-spitter",
    icon = ICONPATH .. "big-spitter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "big-spitter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 15
      },
      {
        type = "acid",
        percent = 100
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    spawning_time_modifier = 3,
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-big",
      range=range_spitter_big,
      min_attack_distance=10,
      cooldown=100,
      damage_modifier=damage_modifier_spitter_big,
      scale=scale_spitter_big,
      tint1=tint_1_spitter_big,
      tint2=tint_2_spitter_big,
      roarvolume=0.6
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.07,
    -- in pu
    pollution_to_join_attack = 150,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = sounds.biter_calls(0.5),
    dying_sound = sounds.spitter_dying(0.6),
    run_animation = spitterrunanimation(scale_spitter_big, tint_1_spitter_big, tint_2_spitter_big),
    ai_settings = biter_ai_settings
  },   
  {
    type = "unit",
    name = "tame-behemoth-spitter",
    icon = ICONPATH .. "behemoth-spitter.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "behemoth-spitter.png",
        icon_size = 64,
      }
    }, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 1500,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "acid",
        percent = 100
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-behemoth",
      range=range_spitter_behemoth,
      min_attack_distance=10,
      cooldown=100,
      damage_modifier=damage_modifier_spitter_behemoth,
      scale=scale_spitter_behemoth,
      tint1=tint_1_spitter_behemoth,
      tint2=tint_2_spitter_behemoth,
      roarvolume=0.8
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.084,
    pollution_to_join_attack = 1000,
    corpse = "behemoth-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = sounds.biter_calls(0.7),
    dying_sound = sounds.spitter_dying(0.8),
    run_animation = spitterrunanimation(scale_spitter_behemoth, tint_1_spitter_behemoth, tint_2_spitter_behemoth),
    ai_settings = biter_ai_settings
  },
  
})
