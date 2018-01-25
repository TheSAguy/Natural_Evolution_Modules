data:extend(
{

  {
    type = "unit",
    name = "tame-small-spitter",
	icon = "__Natural_Evolution_Buildings__/graphics/icons/small-spitter_32.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
	order = "001",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 15,
      },
    },
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.0001,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitter_attack_parameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=1,
                                                 scale=smallspitterscale,
                                                 tint=smallspittertint,
                                                 roarvolume=0.7}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterscale, smallspittertint)
  },
  {
    type = "unit",
    name = "tame-medium-spitter",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/medium-spitter_32.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
	order = "002",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 30,
      },
      {
        type = "acid",
        percent = 30,
      },
	  {
        type = "explosion",
        percent = 15
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    healing_per_tick = 0.0001,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitter_attack_parameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=2,
                                                 scale=mediumspitterscale,
                                                 tint=mediumspittertint,
                                                 roarvolume=0.85}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterscale, mediumspittertint)
  },
  {
    type = "unit",
    name = "tame-big-spitter",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/big-spitter_32.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
	order = "003",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 50,
      },
      {
        type = "laser",
        percent = 50,
      },
      {
        type = "acid",
        percent = 50,
      },
	  {
        type = "explosion",
        percent = 30
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
	spawning_time_modifier = 2,
    healing_per_tick = 0.0001,
    collision_box = {{0, -0.01}, {0, 0.01}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitter_attack_parameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=3,
                                                 scale=bigspitterscale,
                                                 tint=bigspittertint,
                                                 roarvolume=0.95}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterscale, bigspittertint)
  }, 
  {
    type = "unit",
    name = "tame-behemoth-spitter",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/behemoth-spitter_32.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 2000,
	order = "204",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 35
      }
    },
	alert_when_damaged = false,
	alert_when_attacking = false,	
    spawning_time_modifier = 8,
    healing_per_tick = 0.0001,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitter_attack_parameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=5,
                                                 scale=behemothspitterscale,
                                                 tint=behemothspittertint}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 10000,
    corpse = "behemoth-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(behemothspitterscale, behemothspittertint)
  },
  
})
