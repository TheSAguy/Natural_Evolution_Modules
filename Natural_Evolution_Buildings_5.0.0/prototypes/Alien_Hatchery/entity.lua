

Natural_Evolution_Biter_Spawner_tint = {r=0.92, g=0.54, b=0, a=0.5}
Natural_Evolution_Spitter_Spawner_tint = {r=0.54, g=0.92, b=0.3, a=1.0}


data:extend({


  	---- Alien Hatchery
  {
    type = "assembling-machine",
    name = "Alien_Hatchery",
    icon = "__Natural_Evolution_Buildings__/graphics/entity/Alien_Hatchery.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Alien_Hatchery"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
	animation =
		{
			filename = "__Natural_Evolution_Buildings__/graphics/entity/Alien_Hatchery.png",
			priority = "high",
			width = 128,
			height = 128,
			frame_count = 16,
			line_length = 4,
			shift = {0.225, -0.3},
			animation_speed=0.5,
		},
    crafting_categories = {"Hatchery"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 6,
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"speed", "productivity", "pollution"}
  },
	
	--- Capsules
	--- Capsules - Small Biter
  {
    type = "capsule",
    name = "small-biter-hatching",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "small-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "a[small-biter-hatching]",
    stack_size = 50
  },

	--- Capsules - Small Spitter
  {
    type = "capsule",
    name = "small-spitter-hatching",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "small-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "a[small-spitter-hatching]",
    stack_size = 50
  },
  
	--- Capsules - Medium Biter
  {
    type = "capsule",
    name = "medium-biter-hatching",
    icon = "__base__/graphics/icons/medium-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "medium-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "b[medium-biter-hatching]",
    stack_size = 50
  },
  
	--- Capsules - Medium Spitter
  {
    type = "capsule",
    name = "medium-spitter-hatching",
    icon = "__base__/graphics/icons/medium-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "medium-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "b[medium-spitter-hatching]",
    stack_size = 50
  },
  
	--- Capsules - Big Biter
  {
    type = "capsule",
    name = "big-biter-hatching",
    icon = "__base__/graphics/icons/big-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "big-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "c[big-biter-hatching]",
    stack_size = 50
  },
  
	--- Capsules - Big Spitter
  {
    type = "capsule",
    name = "big-spitter-hatching",
    icon = "__base__/graphics/icons/big-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "big-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "c[big-spitter-hatching]",
    stack_size = 50
  },
   
	--- Capsules - Behemoth Biter
  {
    type = "capsule",
    name = "behemoth-biter-hatching",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/behemoth-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "behemoth-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "d[behemoth-biter-hatching]",
    stack_size = 50
  },
  
   --- Capsules - Behemoth Spitter
  {
    type = "capsule",
    name = "behemoth-spitter-hatching",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/behemoth-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "behemoth-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "d[behemoth-spitter-hatching]",
    stack_size = 50
  },
  
  ----- Projectiles
  ----- Projectiles - Small Biter   
  {
    type = "projectile",
    name = "small-biter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-biter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
    ----- Projectiles - Small Spitter   
  {
    type = "projectile",
    name = "small-spitter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-spitter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
 
  ----- Projectiles - Medium Biter    
  {
    type = "projectile",
    name = "medium-biter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "medium-biter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },

  ----- Projectiles - Medium Spitter      
  {
    type = "projectile",
    name = "medium-spitter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "medium-spitter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
    ----- Projectiles - Big Biter
  {
    type = "projectile",
    name = "big-biter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-biter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
    ----- Projectiles - Big Spitter
  {
    type = "projectile",
    name = "big-spitter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-spitter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },

    ----- Projectiles - Behemoth Biter
  {
    type = "projectile",
    name = "behemoth-biter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "behemoth-biter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
    ----- Projectiles - Behemoth Spitter
  {
    type = "projectile",
    name = "behemoth-spitter-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "behemoth-spitter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
  
  ---- Natural_Evolution_Spawners
  ---- Biters
 
  {
    type = "unit-spawner",
    name = "Natural_Evolution_Biter-Spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 750,
    order="b-b-i",
    subgroup="enemies",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 1.0
        }
      },
      apparent_volume = 2
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
      },
      {
        type = "explosion",
        percent = 20,
      },
	 {
        type = "laser",
        percent = 80,
      },
      {
        type = "acid",
        percent = 20,
      },
      {
        type = "poison",
        percent = 20,
      },
    },
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
	
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
    corpse = "Natural_Evolution_Biter-Spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    loot =
    {
      {
        count_min = 5,
        count_max = 15,
        item = "alien-artifact",
        probability = 1
      },
    },
    max_count_of_owned_units = 10,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, Natural_Evolution_Biter_Spawner_tint),
      spawner_idle_animation(1, Natural_Evolution_Biter_Spawner_tint),
      spawner_idle_animation(2, Natural_Evolution_Biter_Spawner_tint),
      spawner_idle_animation(3, Natural_Evolution_Biter_Spawner_tint)
    },
    result_units = (function()
                     local res = {}
                     res[1] = {"tame-small-biter", {{0.0, 0.3}, {0.7, 0.0}}}
                     
                       -- from evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3
                       -- this means for example that when the evolution_factor is 0.45 the probability of spawning
                       -- a small biter is 66% while probability for medium biter is 33%.
                       res[2] = {"tame-medium-biter", {{0.3, 0.0}, {0.6, 0.3}, {0.8, 0.1}}}
                       -- for evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/7, big-biter 4/7, behemoth biter 3/7
                       res[3] = {"tame-big-biter", {{0.6, 0.0}, {1.0, 0.4}}}
                       res[4] = {"tame-behemoth-biter", {{0.99, 0.0}, {1.0, 0.3}}}

                     return res
                   end)(),
    -- With zero evolution the spawn rate is 5 seconds, with max evolution it is 2 seconds
    spawning_cooldown = {300, 120},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,

  },

  {
    type = "corpse",
    name = "Natural_Evolution_Biter-Spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    subgroup="corpses",
    order = "c[corpse]-d[Natural_Evolution_Biter-Spawner]",
    final_render_layer = "corpse",
    animation =
    {
      spawner_die_animation(0, Natural_Evolution_Biter_Spawner_tint),
      spawner_die_animation(1, Natural_Evolution_Biter_Spawner_tint),
      spawner_die_animation(2, Natural_Evolution_Biter_Spawner_tint),
      spawner_die_animation(3, Natural_Evolution_Biter_Spawner_tint)
    }
  },

 ---- Spitter
  {
    type = "unit-spawner",
    name = "Natural_Evolution_Spitter-Spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 750,
    order="b-b-j",
    subgroup="enemies",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 1.0
        }
      },
      apparent_volume = 2
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 25,
      },
	 {
        type = "laser",
        percent = 80,
      },
      {
        type = "fire",
        percent = 20,
      },
    },
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    pollution_to_enhance_spawning = 30000,
    corpse = "Natural_Evolution_Spitter-Spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    loot =
    {
      {
        count_min = 5,
        count_max = 15,
        item = "alien-artifact",
        probability = 1
      },
    },
    max_count_of_owned_units = 10,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, Natural_Evolution_Spitter_Spawner_tint),
      spawner_idle_animation(1, Natural_Evolution_Spitter_Spawner_tint),
      spawner_idle_animation(2, Natural_Evolution_Spitter_Spawner_tint),
      spawner_idle_animation(3, Natural_Evolution_Spitter_Spawner_tint)
    },
    result_units = (function()
                     local res = {}
                     res[1] = {"tame-small-biter", {{0.0, 0.3}, {0.7, 0.0}}}
                     
                       -- from evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3
                       -- this means for example that when the evolution_factor is 0.45 the probability of spawning
                       -- a small biter is 66% while probability for medium biter is 33%.
                       res[2] = {"tame-medium-biter", {{0.3, 0.0}, {0.6, 0.3}, {0.8, 0.1}}}
                       -- for evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/7, big-biter 4/7, behemoth biter 3/7
                       res[3] = {"tame-big-biter", {{0.6, 0.0}, {1.0, 0.4}}}
                       res[4] = {"tame-behemoth-biter", {{0.99, 0.0}, {1.0, 0.3}}}

                     return res
                   end)(),
    -- With zero evolution the spawn rate is 5 seconds, with max evolution it is 2 seconds
    spawning_cooldown = {300, 120},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,

  },

  {
    type = "corpse",
    name = "Natural_Evolution_Spitter-Spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    subgroup="corpses",
    order = "c[corpse]-c[Natural_Evolution_Spitter-Spawner]",
    final_render_layer = "corpse",
    animation =
    {
      spawner_die_animation(0, Natural_Evolution_Spitter_Spawner_tint),
      spawner_die_animation(1, Natural_Evolution_Spitter_Spawner_tint),
      spawner_die_animation(2, Natural_Evolution_Spitter_Spawner_tint),
      spawner_die_animation(3, Natural_Evolution_Spitter_Spawner_tint)
    }
  },

	
})
