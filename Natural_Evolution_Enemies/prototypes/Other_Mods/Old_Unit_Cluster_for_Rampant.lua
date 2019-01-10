--- Unit Cluster Entity. A unit that will be killed once it's generated, to spwan the actual units.

if mods["Rampant"] then

	data:extend(
	{

	 {
		type = "unit",
		name = "unit-cluster",
		icon = "__base__/graphics/icons/creeper.png",
		icon_size = 32,
		flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
		max_health = 10,
		order = "b-b-a",
		subgroup="enemies",
		alert_when_damaged = false,
		alert_when_attacking = false,
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
		  --animation = web_animation(unit_cluster_scale, unit_cluster_tint1, unit_cluster_tint2)
		  animation = biterattackanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)

		},

		vision_distance = 1,
		movement_speed = 0.00002,
		distance_per_frame = 0.1,
		pollution_to_join_attack = 200000,
		distraction_cooldown = 300,
		corpse = "small-biter-corpse",
		dying_explosion = "blood-explosion-small",
		dying_sound =  make_biter_dying_sounds(0),
		working_sound =  make_biter_calls(0),
		--run_animation = web_animation(unit_cluster_scale, unit_cluster_tint1, unit_cluster_tint2)
		run_animation = biterrunanimation(smallbiterscale, small_biter_tint1, small_biter_tint2)

	  },


	})
  
end