require "prototypes.Vanilla_Changes.Settings"
require "prototypes.Vanilla_Changes.Functions"
require "prototypes.Vanilla_Changes.Projectiles"



smallspitterMk2scale = 0.55
smallspitterMk2tint =  {r=124, g=252, b=0, a=85}

smallspitterMk3scale = 0.6
smallspitterMk3tint = {r=255, g=255, b=0, a=85}



mediumspitterMk2scale = 0.75
mediumspitterMk2tint =  {r=124, g=252, b=0, a=170}

mediumspitterMk3scale = 0.8
mediumspitterMk3tint =  {r=255, g=255, b=0, a=170}


bigspitterMk2scale = 1.05
bigspitterMk2tint = {r=124, g=252, b=0, a=255}

bigspitterMk3scale = 1.1
bigspitterMk3tint = {r=255, g=255, b=0, a=255}



---------------

smallspitterscale = 0.5
smallspittertint =  {r=0.68, g=0.4, b=0, a=1}


mediumspitterscale = 0.7
mediumspittertint =  {r=0.83, g=0.39, b=0.36, a=0.75}

bigspitterscale = 1
bigspittertint = {r=0.54, g=0.58, b=0.85, a=0.6}


behemothspitterscale = 2
behemothspittertint = {r=0.3, g=0.9, b=0.3, a=0.75}



data:extend(
{

---- Vanilla Small Spitter
--[[
  {
    type = "unit",
    name = "small-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Small_Spitter,
    order="b-d-a",
    subgroup="enemies",
	resistances = Resistances.Small_Spitter,
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
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
    working_sound = make_biter_calls(0.65),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterscale, smallspittertint)
  },
--]]
---- New Small Spitter 1
  {
    type = "unit",
    name = "small-spitter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Small_Spitter_Mk2,
    order="b-d-b",
    subgroup="enemies",
	resistances = Resistances.Small_Spitter_Mk2,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Infected({range=13,
                                                 cooldown=100,
                                                 damage_modifier=1.1,
                                                 scale=smallspitterMk2scale,
                                                 tint=smallspitterMk2tint,
                                                 roarvolume=0.7}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.65),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterMk2scale, smallspitterMk2tint)
	},
	
---- New Small Spitter 2
	{
    type = "unit",
    name = "small-spitter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Small_Spitter_Mk3,
    order="b-d-c",
    subgroup="enemies",
	resistances = Resistances.Small_Spitter_Mk3,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Mutated({range=13,
                                                 cooldown=100,
                                                 damage_modifier=1.2,
                                                 scale=smallspitterMk3scale,
                                                 tint=smallspitterMk3tint,
                                                 roarvolume=0.7}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.65),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterMk3scale, smallspitterMk3tint)
  },

---- Vanilla Medium Spitter
--[[
  {
    type = "unit",
    name = "medium-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Spitter,
    order="b-d-d",
    subgroup="enemies",
	resistances = Resistances.Medium_Spitter,
    healing_per_tick = 0.015,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
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
    working_sound = make_biter_calls(0.75),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterscale, mediumspittertint)
  },
--]]
--- New Medium Spitter 1  
  {
    type = "unit",
    name = "medium-spitter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Spitter_Mk2,
    order="b-d-e",
    subgroup="enemies",
	resistances = Resistances.Medium_Spitter_Mk2,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.015,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Infected({range=14,
                                                 cooldown=100,
                                                 damage_modifier=2.3,
                                                 scale=mediumspitterMk2scale,
                                                 tint=mediumspitterMk2tint,
                                                 roarvolume=0.85}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.75),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterMk2scale, mediumspitterMk2tint)
  },

  --- New Medium Spitter 2
  {
    type = "unit",
    name = "medium-spitter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Medium_Spitter_Mk3,
    order="b-d-f",
    subgroup="enemies",
	resistances = Resistances.Medium_Spitter_Mk3,
	alert_when_damaged = false,
	alert_when_attacking = false,
    healing_per_tick = 0.015,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Mutated({range=14,
                                                 cooldown=100,
                                                 damage_modifier=2.6,
                                                 scale=mediumspitterMk3scale,
                                                 tint=mediumspitterMk3tint,
                                                 roarvolume=0.85}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.75),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterMk3scale, mediumspitterMk3tint)
  },

  --- Vanilla Big Spitter
  --[[
   {
    type = "unit",
    name = "big-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Spitter,
    order="b-d-g",
    subgroup="enemies",
	resistances = Resistances.Big_Spitter,
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=3,
                                                 scale=bigspitterscale,
                                                 tint=bigspittertint,
                                                 roarvolume=0.95}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 1500,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterscale, bigspittertint)
  },
  --]]
  --- New Big Spitter 1
  {
    type = "unit",
    name = "big-spitter-Mk2",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Spitter_Mk2,
    order="b-d-h",
    subgroup="enemies",
	resistances = Resistances.Big_Spitter_Mk2,
	alert_when_damaged = false,
	alert_when_attacking = false,
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Infected({range=16,
                                                 cooldown=100,
                                                 damage_modifier=3.3,
                                                 scale=bigspitterMk2scale,
                                                 tint=bigspitterMk2tint,
                                                 roarvolume=0.95}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 1200,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterMk2scale, bigspitterMk2tint)
  },

  --- New Big Spitter 2
  {
    type = "unit",
    name = "big-spitter-Mk3",
    icon = "__base__/graphics/icons/creeper.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Big_Spitter_Mk3,
    order="b-d-i",
    subgroup="enemies",
	resistances = Resistances.Big_Spitter_Mk3,
	alert_when_damaged = false,
	alert_when_attacking = false,
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = Spitter_Attack_Mutated({range=16,
                                                 cooldown=100,
                                                 damage_modifier=3.6,
                                                 scale=bigspitterMk3scale,
                                                 tint=bigspitterMk3tint,
                                                 roarvolume=0.95}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 1200,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterMk3scale, bigspitterMk3tint)
  },
  
  --- Vanilla Behemoth Spitter
  --[[
  {
    type = "unit",
    name = "behemoth-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Health.Behemoth_Spitter,
    order="b-d-j",
    subgroup="enemies",
	resistances = Resistances.Behemoth_Spitter,
    spawning_time_modifier = 8,
    healing_per_tick = 0.1,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
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
--]]

})
  

  
