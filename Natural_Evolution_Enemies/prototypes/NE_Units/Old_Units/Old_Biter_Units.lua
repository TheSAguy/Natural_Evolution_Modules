require "prototypes.NE_Units.Old_Units.Settings"




smallbiterMk2scale = 0.55
small_biter_Mk2_tint1 = {r=124, g=252, b=0, a=85}
small_biter_Mk2_tint2 = {r=255, g=0, b=0, a=255}

smallbiterMk3scale = 0.6
small_biter_Mk3_tint1 = {r=255, g=255, b=0, a=85}
small_biter_Mk3_tint2 = {r=255, g=0, b=0, a=255}


mediumbiterMk2scale = 0.75
medium_biter_Mk2_tint1 = {r=124, g=252, b=0, a=170}
medium_biter_Mk2_tint2 = {r=255, g=0, b=0, a=255}

mediumbiterMk3scale = 0.8
medium_biter_Mk3_tint1 = {r=255, g=255, b=0, a=170}
medium_biter_Mk3_tint2 = {r=255, g=0, b=0, a=255}


bigbiterMk2scale = 1.05
big_biter_Mk2_tint1 = {r=124, g=252, b=0, a=255}
big_biter_Mk2_tint2 = {r=255, g=0, b=0, a=255}

bigbiterMk3scale = 1.1
big_biter_Mk3_tint1 = {r=255, g=255, b=0, a=255}
big_biter_Mk3_tint2 = {r=255, g=0, b=0, a=255}


------------------------

smallbiterscale = 0.5
small_biter_tint1 = {r=0.56, g=0.46, b=0.42, a=0.65}
small_biter_tint2 = {r=255, g=0, b=0, a=255}

mediumbiterscale = 0.7
medium_biter_tint1 = {r=0.78, g=0.15, b=0.15, a=0.6}
medium_biter_tint2 = {r=255, g=0, b=0, a=255}


bigbiterscale = 1.0
big_biter_tint1 = {r=0.34, g=0.68, b=0.90, a=0.6}
big_biter_tint2 = {r=255, g=0, b=0, a=255}


behemothbiterscale = 2
behemoth_biter_tint1 = {r=0.3, g=0.9, b=0.3, a=0.75}
behemoth_biter_tint2 = {r=255, g=0, b=0, a=255}



data:extend(
{

--- New Small Biter 1
  {
    type = "unit",
    name = "small-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = Health.Small_Biter_Mk2,
    order = "b-b-b",
    subgroup="enemies",
	resistances = Resistances.Small_Biter_Mk2,
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
      ammo_category = "melee",
      ammo_type = Damage.Small_Biter_Mk2,
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(smallbiterMk2scale, small_biter_Mk2_tint1, small_biter_Mk2_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 250,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(1.0),
    working_sound =  make_biter_calls(0.7),
    run_animation = biterrunanimation(smallbiterMk2scale, small_biter_Mk2_tint1, small_biter_Mk2_tint2)
  },

  --- New Small Biter 2
  {
    type = "unit",
    name = "small-biter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = Health.Small_Biter_Mk3,
    order = "b-b-c",
    subgroup="enemies",
	resistances = Resistances.Small_Biter_Mk3,
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
      ammo_category = "melee",
      ammo_type = Damage.Small_Biter_Mk3,
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(smallbiterMk3scale, small_biter_Mk3_tint1, small_biter_Mk3_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 300,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(1.0),
    working_sound =  make_biter_calls(0.7),
    run_animation = biterrunanimation(smallbiterMk3scale, small_biter_Mk3_tint1, small_biter_Mk3_tint2)
  },

 --- New Medium Biter 1
   {
    type = "unit",
    name = "medium-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Biter_Mk2,
    order="b-b-e",
    subgroup="enemies",
    resistances = Resistances.Medium_Biter_Mk2,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.015,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = Damage.Medium_Biter_Mk2,
      range = 1,
      cooldown = 35,
      sound = make_biter_roars(0.7),
      animation = biterattackanimation(mediumbiterMk2scale, medium_biter_Mk2_tint1, medium_biter_Mk2_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 850,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.8),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(mediumbiterMk2scale, medium_biter_Mk2_tint1, medium_biter_Mk2_tint2)
  },

  --- New Medium Biter 2
   {
    type = "unit",
    name = "medium-biter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Biter_Mk3,
    order="b-b-f",
    subgroup="enemies",
    resistances = Resistances.Medium_Biter_Mk3,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.015,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = Damage.Medium_Biter_Mk3,
      range = 1,
      cooldown = 35,
      sound = make_biter_roars(0.7),
      animation = biterattackanimation(mediumbiterMk3scale, medium_biter_Mk3_tint1, medium_biter_Mk3_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 900,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.8),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(mediumbiterMk3scale, medium_biter_Mk3_tint1, medium_biter_Mk3_tint2)
  },

  ----- New Big Biter 1
  {
    type = "unit",
    name = "big-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Biter_Mk2,
	order="b-b-h",
    subgroup="enemies",
    resistances = Resistances.Big_Biter_Mk2,
	alert_when_damaged = false,
	alert_when_attacking = false,
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = Damage.Big_Biter_Mk2,
      sound =  make_biter_roars(0.6),
      animation = biterattackanimation(bigbiterMk2scale, big_biter_Mk2_tint1, big_biter_Mk2_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 2100,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterMk2scale, big_biter_Mk2_tint1, big_biter_Mk2_tint2)
  },

----- New Big Biter 2 
  {
    type = "unit",
    name = "big-biter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Biter_Mk3,
	order="b-b-i",
    subgroup="enemies",
	resistances = Resistances.Big_Biter_Mk3,
	alert_when_damaged = false,
	alert_when_attacking = false,
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = Damage.Big_Biter_Mk3,
      sound =  make_biter_roars(0.6),
      animation = biterattackanimation(bigbiterMk3scale, big_biter_Mk3_tint1, big_biter_Mk3_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 2200,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterMk3scale, big_biter_Mk3_tint1, big_biter_Mk3_tint2)
  },

})




if not NE_Enemies.Settings.NE_Remove_Vanilla_Spawners then

	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"small-biter-Mk2", {{0.10, 0.0}, {0.40, 0.3}, {0.50, 0.0}}})
	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"small-biter-Mk3", {{0.20, 0.0}, {0.50, 0.3}, {0.60, 0.0}}})
	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"medium-biter-Mk2", {{0.40, 0.0}, {0.70, 0.3}, {0.80, 0.0}}})
	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"medium-biter-Mk3", {{0.50, 0.0}, {0.80, 0.3}, {0.90, 0.0}}})
	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"big-biter-Mk2",	 {{0.70, 0.0}, {1.00, 0.3}}})
	table.insert(data.raw["unit-spawner"]["biter-spawner"].result_units, {"big-biter-Mk3",	{{0.80, 0.0}, {1.00, 0.3}}})

end	  
