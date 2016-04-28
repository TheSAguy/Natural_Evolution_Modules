require "prototypes.Vanilla_Changes.Settings"


smallbiterscale = 0.5
small_biter_tint1 = {r=0.56, g=0.46, b=0.42, a=0.65}
small_biter_tint2 = {r=1, g=0.63, b=0, a=0.4}

smallbiterMk2scale = 0.55
small_biter_Mk2_tint1 = {r=0.56, g=0.66, b=0.42, a=0.65}
small_biter_Mk2_tint2 = {r=1, g=0.63, b=0.5, a=0.4}

smallbiterMk3scale = 0.6
small_biter_Mk3_tint1 = {r=0.56, g=0.86, b=0.42, a=0.65}
small_biter_Mk3_tint2 = {r=1, g=0.63, b=1, a=0.4}


mediumbiterscale = 0.7
medium_biter_tint1 = {r=0.78, g=0.15, b=0.15, a=0.6}
medium_biter_tint2 = {r=0.9, g=0.3, b=0.3, a=0.75}

mediumbiterMk2scale = 0.75
medium_biter_Mk2_tint1 = {r=0.78, g=0.45, b=0.15, a=0.6}
medium_biter_Mk2_tint2 = {r=0.9, g=0.6, b=0.3, a=0.75}

mediumbiterMk3scale = 0.8
medium_biter_Mk3_tint1 = {r=0.78, g=0.75, b=0.15, a=0.6}
medium_biter_Mk3_tint2 = {r=0.9, g=0.9, b=0.3, a=0.75}


bigbiterscale = 1.0
big_biter_tint1 = {r=0.34, g=0.68, b=0.90, a=0.6}
big_biter_tint2 = {r=0.31, g=0.61, b=0.95, a=0.85}

bigbiterMk2scale = 1.05
big_biter_Mk2_tint1 = {r=0.34, g=0.68, b=0.60, a=0.6}
big_biter_Mk2_tint2 = {r=0.31, g=0.61, b=0.65, a=0.85}

bigbiterMk3scale = 1.1
big_biter_Mk3_tint1 = {r=0.34, g=0.68, b=0.30, a=0.6}
big_biter_Mk3_tint2 = {r=0.31, g=0.61, b=0.35, a=0.85}



behemothbiterscale = 2
behemoth_biter_tint1 = {r=0.3, g=0.9, b=0.3, a=0.75}
behemoth_biter_tint2 = {r=0.88, g=0.24, b=0.24, a=0.9}


unit_cluster_scale = 1.2
unit_cluster_tint1 = {r=0.34, g=0.68, b=0.30, a=0.6}
unit_cluster_tint2 = {r=0.78, g=0.75, b=0.15, a=0.6}


function web_animation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        width = 64,
        height = 64,
        frame_count = 1,
        direction_count = 1,
        shift = {scale * 0.714844, scale * -0.246094},
        scale = scale,
        stripes =
        {
         {
          filename = "__Natural_Evolution_Enemies__/graphics/entity/Web_64_shadow.png",
          width_in_frames = 1,
          height_in_frames = 1,
         },
         {
          filename = "__Natural_Evolution_Enemies__/graphics/entity/Web_64.png",
          width_in_frames = 1,
          height_in_frames = 1,
         }
        }
      },

      {
        filename = "__Natural_Evolution_Enemies__/graphics/entity/Web_64_shadow.png",
        width = 64,
        height = 64,
        frame_count = 1,
        direction_count = 1,
        shift = {scale * 0.117188, scale * -0.867188},
        scale = scale,
        tint = tint1
      },

      {
        filename = "__Natural_Evolution_Enemies__/graphics/entity/Web_64.png",
        line_length = 1,
        width = 64,
        height = 64,
        frame_count = 1,
        direction_count = 1,
        shift = {scale * 0.117188, scale * -0.855469},
        scale = scale,
        tint = tint2
      }
	  
    }
  }
end



data:extend(
{
--- Vanilla Small Biter
--[[
 {
    type = "unit",
    name = "small-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = Health.Small_Biter,
    order = "b-b-a",
    subgroup="enemies",
	resistances = Resistances.Small_Biter,
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(6),
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 200,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(1.0),
    working_sound =  make_biter_calls(0.7),
    run_animation = biterrunanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)
  },
--]]

--- New Small Biter 1
  {
    type = "unit",
    name = "small-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = Health.Small_Biter_Mk2,
    order = "b-b-b",
    subgroup="enemies",
	resistances = Resistances.Small_Biter_Mk2,
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
    pollution_to_join_attack = 200,
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
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = Health.Small_Biter_Mk3,
    order = "b-b-c",
    subgroup="enemies",
	resistances = Resistances.Small_Biter_Mk3,
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
    pollution_to_join_attack = 200,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(1.0),
    working_sound =  make_biter_calls(0.7),
    run_animation = biterrunanimation(smallbiterMk3scale, small_biter_Mk3_tint1, small_biter_Mk3_tint2)
  },
 
--- Vanilla Medium Biter 
--[[
 {
    type = "unit",
    name = "medium-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Biter,
    order="b-b-d",
    subgroup="enemies",
	resistances = Resistances.Medium_Biter,
    healing_per_tick = 0.015,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      sound = make_biter_roars(0.7),
      animation = biterattackanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.8),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
  },
 --]]
 --- New Medium Biter 1
   {
    type = "unit",
    name = "medium-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Biter_Mk2,
    order="b-b-e",
    subgroup="enemies",
    resistances = Resistances.Medium_Biter_Mk2,
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
    pollution_to_join_attack = 800,
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
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Biter_Mk3,
    order="b-b-f",
    subgroup="enemies",
    resistances = Resistances.Medium_Biter_Mk3,
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
    pollution_to_join_attack = 800,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.8),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(mediumbiterMk3scale, medium_biter_Mk3_tint1, medium_biter_Mk3_tint2)
  },

  ------ Vanilla Big Biter 
  --[[
  {
    type = "unit",
    name = "big-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Biter,
	order="b-b-g",
    subgroup="enemies",
	resistances = Resistances.Big_Biter,
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
      ammo_type = make_unit_melee_ammo_type(30),
      sound =  make_biter_roars(0.6),
      animation = biterattackanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 4000,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
  },
--]]
  ----- New Big Biter 1
  {
    type = "unit",
    name = "big-biter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Biter_Mk2,
	order="b-b-h",
    subgroup="enemies",
    resistances = Resistances.Big_Biter_Mk2,
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
      animation = biterattackanimation(bigbiterMk2scale, big_biter_Mk2_tint1, big_Mk2_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterMk2scale, big_biter_Mk2_tint1, big_Mk2_biter_tint2)
  },

----- New Big Biter 2
  
  {
    type = "unit",
    name = "big-biter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Biter_Mk3,
	order="b-b-i",
    subgroup="enemies",
	resistances = Resistances.Big_Biter_Mk3,
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
      animation = biterattackanimation(bigbiterMk3scale, big_biter_Mk3_tint1, big_Mk3_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterMk3scale, big_biter_Mk3_tint1, big_Mk3_biter_tint2)
  },

  --- Vanilla Behemoth Biter
  --[[
  {
    type = "unit",
    name = "behemoth-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Behemoth_Biter,
	order="b-b-i",
    subgroup="enemies",
	resistances = Resistances.Behemoth_Biter,
    spawning_time_modifier = 8,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 50,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(100),
      sound =  make_biter_roars(0.8),
      animation = biterattackanimation(behemothbiterscale, behemoth_biter_tint1, behemoth_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 20000,
    corpse = "behemoth-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(1.2),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(behemothbiterscale, behemoth_biter_tint1, behemoth_biter_tint2)
  },
--]]
})


--- Unit Cluster Entity. A unit that will be killed once it's generated, to spwan the actual units.
data:extend(
{

 {
    type = "unit",
    name = "unit-cluster",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = 10,
    order = "b-b-a",
    subgroup="enemies",
	healing_per_tick = -1,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      type = "projectile",
      range = 0.0005,
      cooldown = 3000,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(0),
      sound = make_biter_roars(0),
      animation = web_animation(unit_cluster_scale, unit_cluster_tint1, unit_cluster_tint2)

    },
    vision_distance = 1,
    movement_speed = 0.00002,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 200000,
    distraction_cooldown = 300,
    corpse = "unit-cluster-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(0),
    working_sound =  make_biter_calls(0),
    run_animation = web_animation(unit_cluster_scale, unit_cluster_tint1, unit_cluster_tint2)

  },

    {
    type = "corpse",
    name = "unit-cluster-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 1,
    time_before_removed = 1,
    final_render_layer = "corpse",
    animation = web_animation(unit_cluster_scale, unit_cluster_tint1, unit_cluster_tint2)
  },

  
})
  

  
