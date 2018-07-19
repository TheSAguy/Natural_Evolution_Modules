require "prototypes.NE_Units.Old_Units.Settings"
require "prototypes.NE_Units.Old_Units.Functions"
require "prototypes.NE_Units.Old_Units.Projectiles"



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
  
})
  
if not NE_Enemies.Settings.NE_Remove_Vanilla_Spawners then

	data.raw["unit-spawner"]["spitter-spawner"].result_units = (function()
						 local res = {}

						   res[1] = {"small-biter", 		{{0.00, 0.3}, {0.05, 0.3}, {0.10, 0.0}}}        
						   
						   res[2] = {"small-spitter", 		{{0.05, 0.3}, {0.35, 0.3}, {0.45, 0.0}}}
						   res[3] = {"small-spitter-Mk2", 	{{0.15, 0.0}, {0.45, 0.3}, {0.55, 0.0}}}
						   res[4] = {"small-spitter-Mk3", 	{{0.25, 0.0}, {0.55, 0.3}, {0.65, 0.0}}}
						   
						   res[5] = {"medium-spitter", 	 	{{0.35, 0.0}, {0.65, 0.3}, {0.75, 0.0}}}
						   res[6] = {"medium-spitter-Mk2", 	{{0.45, 0.0}, {0.75, 0.3}, {0.85, 0.0}}}
						   res[7] = {"medium-spitter-Mk3", 	{{0.55, 0.0}, {0.85, 0.3}, {0.95, 0.0}}}
						   
						   res[8] = {"big-spitter",	 	 	{{0.65, 0.0}, {0.95, 0.3}, {1.00, 0.0}}}
						   res[9] = {"big-spitter-Mk2",	 	{{0.75, 0.0}, {1.00, 0.3}}}
						   res[10] = {"big-spitter-Mk3", 	{{0.85, 0.0}, {1.00, 0.3}}}
						   
						   res[11] = {"behemoth-spitter",  	{{0.95, 0.0}, {1.00, 0.3}}}					   			   
						
						 return res
					   end)()

end				   
