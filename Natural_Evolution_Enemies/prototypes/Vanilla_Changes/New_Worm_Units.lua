----------------------------------------------------------
----------------------------------------------------------
--			THIS IS NOT BIENG USED AT THE MOMENT		--
----------------------------------------------------------
----------------------------------------------------------



require "util"
require "prototypes.Vanilla_Changes.Settings"
require "prototypes.Vanilla_Changes.Projectiles"


medium_launcher_worm_scale = 0.95
medium_launcher_worm_tint = {r=0.92, g=0.97, b=0.55, a=1.0}

big_launcher_worm_scale = 1
big_launcher_worm_tint = {r=0.16, g=0.87, b=0.26, a=1.0}


function shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end


function shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end



data:extend(
{
  {
    type = "turret",
    name = "medium-launcher-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    order="b-b-e",
    subgroup="enemies",
    max_health = 800,
    resistances =
    {  
	  {type = "fire", decrease = 0, percent = -60},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 5},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 10, percent = 10} 
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-launcher-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(0.9),
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(medium_launcher_worm_scale, medium_launcher_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(medium_launcher_worm_scale, medium_launcher_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(medium_launcher_worm_scale, medium_launcher_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(medium_launcher_worm_scale, medium_launcher_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.8),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(medium_launcher_worm_scale, medium_launcher_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(medium_launcher_worm_scale, medium_launcher_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 50,
      range = 25,
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
            projectile = "medium-unit-projectile",
            starting_speed = 0.8
          }
        }
      },
    },
    autoplace =
    {
      sharpness = 0.3,
      control = "enemy-base",
      order = "b[enemy]-a[base]",
      force = "enemy",
      peaks =
      {
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.14,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        {
          influence = 0.38,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 10,
          tier_from_start_top_property_limit = 10,
          tier_from_start_max_range = 20,
        },
      }
    }
  },

  {
    type = "turret",
    name = "big-launcher-worm-turret",
    icon = "__base__/graphics/icons/big-worm.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    max_health = 1500,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {  
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 5, percent = 20},
      {type = "impact", decrease = 10, percent = 10},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 15, percent = 25}
    },	
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-launcher-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1.0),
    inventory_size = 2,
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(big_launcher_worm_scale, big_launcher_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(big_launcher_worm_scale, big_launcher_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(big_launcher_worm_scale, big_launcher_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(big_launcher_worm_scale, big_launcher_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.95),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(big_launcher_worm_scale, big_launcher_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(big_launcher_worm_scale, big_launcher_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 50,
      range = 30,
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
            projectile = "big-unit-projectile",
            starting_speed = 1
          }
        }
      }
    },
    autoplace =
    {
      sharpness = 0.3,
      control = "enemy-base",
      order = "b[enemy]-a[base]",
      force = "enemy",
      peaks =
      {
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.07,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        {
          influence = 0.3,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 10,
          tier_from_start_top_property_limit = 10,
          tier_from_start_max_range = 20,
        }
      }
    }
  },

   {
    type = "corpse",
    name = "medium-launcher-worm-corpse",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
	icon_size = 32,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = worm_die_animation(medium_launcher_worm_scale, medium_launcher_worm_tint)
  },
  {
    type = "corpse",
    name = "big-launcher-worm-corpse",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
	icon_size = 32,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = worm_die_animation(big_launcher_worm_scale, big_launcher_worm_tint)
  }

  
})
  

  
