
require ("util")


if settings.startup["NE_Difficulty"] and settings.startup["NE_Difficulty"].value then
	NE_Difficulty = settings.startup["NE_Difficulty"].value
else
	NE_Difficulty = 1
end

--- Value of Bio Damage per startup settings
Bio_Ammo_Damage = settings.startup["NE_Bio_Ammo_Damage"].value

--- Turret Bonuses.
table.insert(data.raw.technology["gun-turret-damage-1"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.1})
table.insert(data.raw.technology["gun-turret-damage-2"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.1})
table.insert(data.raw.technology["gun-turret-damage-3"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-4"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-5"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-6"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.4})
table.insert(data.raw.technology["gun-turret-damage-7"].effects,{type = "turret-attack", turret_id = "NE-gun-turret", modifier = 0.7})


table.insert(data.raw.technology["gun-turret-damage-1"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.1})
table.insert(data.raw.technology["gun-turret-damage-2"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.1})
table.insert(data.raw.technology["gun-turret-damage-3"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-4"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-5"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.2})
table.insert(data.raw.technology["gun-turret-damage-6"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.4})
table.insert(data.raw.technology["gun-turret-damage-7"].effects,{type = "turret-attack", turret_id = "NE-rocket-turret", modifier = 0.7})



 --Ammo
data:extend({

	--- Basic Dart
	{
		type = "ammo",
		name = "basic-dart-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/basic_dart_icon.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "Bio_Turret_Ammo",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot",
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				  damage = { amount = 1 , type = "poison"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 2 , type = "physical"}
				}
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "[aaa]-a[basic-clips]-aa[firearm-magazine]",
		stack_size = 400
  },
  
  
	--- Enhanced Dart
	{
		type = "ammo",
		name = "enhanced-dart-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/enhanced_dart_icon.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "Bio_Turret_Ammo",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot",
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				  damage = { amount = 1 , type = "poison"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 2.5 , type = "bob-pierce"}
				}
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "[aab]-a[basic-clips]-ab[firearm-magazine]",
		stack_size = 400
  },
  
  
	--- Copper Bullet
	{
		type = "ammo",
		name = "copper-bullet-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  damage = { amount = 4 , type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "bob-pierce"}
				}
			  }
			}
		  }
		},
		magazine_size = 12,
		subgroup = "ammo",
		order = "a[basic-clips]-aa[firearm-magazine]",
		stack_size = 200
  },


	--- Biological Bullet
	{
		type = "ammo",
		name = "Biological-bullet-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Biological-bullet-magazine.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				 damage = { amount = ((Bio_Ammo_Damage + 10)/NE_Difficulty) + NE_Difficulty, type = "Biological"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 5 , type = "physical"}
				}
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-b[piercing-rounds-magazine]-c[Biological-bullet-magazine]",
		stack_size = 200
  },
  

  ---------------------- CONVERSION ----------------
  
  	--- Conversion Basic Dart
	{
		type = "ammo",
		name = "basic-dart-magazine_c",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/basic_dart_icon_conversion.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "Bio_Turret_Ammo",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot",
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				  damage = { amount = 1/2 , type = "poison"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 2/2 , type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "NE_Conversion"}		 
				},
				
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "[aaa]-a[basic-clips]-aa[firearm-magazine]-Conversion",
		stack_size = 400
  },
  
  
	--- Conversion Enhanced Dart
	{
		type = "ammo",
		name = "enhanced-dart-magazine_c",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/enhanced_dart_icon_conversion.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "Bio_Turret_Ammo",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot",
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				  damage = { amount = 1/2 , type = "poison"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 2.5/2 , type = "bob-pierce"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "NE_Conversion"}		 
				},
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "[aab]-a[basic-clips]-ab[firearm-magazine]-Conversion",
		stack_size = 400
  },
  
	--- Conversion firearm-magazine
{
    type = "ammo",
    name = "firearm-magazine_c",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/firearm-magazine_conversion.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit"
                },
                {
                  type = "damage",
                  damage = { amount = 5/2 , type = "physical"}
                },
				{
				  type = "damage",
				  damage = { amount = 1 , type = "NE_Conversion"}		 
				},
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]-Conversion",
    stack_size = 200
  },


	--- Conversion Copper Bullet
	{
		type = "ammo",
		name = "copper-bullet-magazine_c",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine_conversion.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  damage = { amount = 4/2 , type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = 1/2 , type = "bob-pierce"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "NE_Conversion"}		 
				},
			  }
			}
		  }
		},
		magazine_size = 12,
		subgroup = "ammo",
		order = "a[basic-clips]-aa[firearm-magazine]-Conversion",
		stack_size = 200
  },

 
	--- Conversion piercing-rounds-magazine  
	 {
    type = "ammo",
    name = "piercing-rounds-magazine_c",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/piercing-rounds-magazine_conversion.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 8/2, type = "physical"}
            },
			{
              type = "damage",
              damage = { amount = 2/2, type = "bob-pierce"}
            },
			{
			  type = "damage",
			  damage = { amount = 1 , type = "NE_Conversion"}		 
			},
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[piercing-rounds-magazine]-Conversion",
    stack_size = 200
  },
 
 
  ----- Conversion uranium-rounds-magazine
  {
    type = "ammo",
    name = "uranium-rounds-magazine_c",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/uranium-rounds-magazine_conversion.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 24/2, type = "physical"}
            },
			{
			  type = "damage",
			  damage = { amount = 1 , type = "NE_Conversion"}		 
			},
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-c[uranium-rounds-magazine]-Conversion",
    stack_size = 200
  },

  
	--- Conversion Biological Bullet
	{
		type = "ammo",
		name = "Biological-bullet-magazine_c",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Biological-bullet-magazine_conversion.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				 damage = { amount = (((Bio_Ammo_Damage + 10)/NE_Difficulty) + NE_Difficulty) / 2, type = "Biological"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 5/2 , type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "NE_Conversion"}		 
				},
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-b[piercing-rounds-magazine]-c[Biological-bullet-magazine]-Conversion",
		stack_size = 200
  },
  
 
  
})


--- Landmine
data:extend({ 

 {
    type = "land-mine",
    name = "bio_land_mine",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_land_mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 1, result = "bio_land_mine"},
    max_health = 25,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_land_mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_land_mine_set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 3.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              perimeter = 8,
              collision_mask = { "player-layer" },
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 300, type = "explosion"}
                  },
				  {
                    type = "damage",
                    damage = { amount = 300, type = "Biological"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          },
		  {
            type = "damage",
            damage = { amount = 1000, type = "Biological"}
          }
        }
      }
    },
  },
  
  	
})


--- NE Turret Pictires
function base_picture(tint)
return
{
	layers =
	{
	  {
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_base.png",
		priority = "high",
		width = 256,
		height = 256,
		axially_symmetrical = false,
		direction_count = 1,
		frame_count = 1,
		tint = tint,
	  }
	}
 }
end


function preparing_animation(tint)
	return {layers = {
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "medium",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16,  
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		--apply_runtime_tint = true,
	},	
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "high",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16,  
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		apply_runtime_tint = true,
	},	
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding_mask.png",
		priority = "high",
		flags = { "mask" },
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16,  
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		tint = tint,
	},
	}
	}
end

function prepared_animation(tint)
	return {layers = 
	{
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main.png",
		priority = "medium",
		width = 256,
		height = 256,
		direction_count = 64, 
		frame_count = 1, 
		line_length = 8, 
		axially_symmetrical = false,
		--apply_runtime_tint = true,		
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main.png",
		priority = "high",
		width = 256,
		height = 256,
		direction_count = 64, 
		frame_count = 1, 
		line_length = 8, 
		axially_symmetrical = false,
		apply_runtime_tint = true,		
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main_mask.png",
		priority = "high",
		flags = { "mask" },
		width = 256,
		height = 256,
		direction_count = 64,
		frame_count = 1, 
		line_length = 8, 
		axially_symmetrical = false,
		tint = tint,		
	},
	}
	}
end

function attacking_animation(tint)
	return {layers = 
	{
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main.png",
		priority = "medium",
		width = 256,
		height = 256,
		direction_count = 64, 
		frame_count = 1, 
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		--apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main.png",
		priority = "high",
		width = 256,
		height = 256,
		direction_count = 64, 
		frame_count = 1, 
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_main_mask.png",
		priority = "high",
		flags = { "mask" },
		width = 256,
		height = 256,
		direction_count = 64,
		frame_count = 1, 
		line_length = 8, 
		run_mode = "forward",
		axially_symmetrical = false,
		tint = tint,	
	},
	}
	}
end

function folding_animation(tint)
	return {layers = 
	{
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "medium",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16, 
		line_length = 8, 
		run_mode = "backward",
		axially_symmetrical = false,
		--apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "high",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16, 
		line_length = 8, 
		run_mode = "backward",
		axially_symmetrical = false,
		apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding_mask.png",
		priority = "high",
		flags = { "mask" },
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 16, 
		line_length = 8, 
		run_mode = "backward",
		axially_symmetrical = false,
		tint = tint,
	},
	}
	}
end

function folded_animation(tint)
	return {layers = 
	{
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "medium",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 2,
		line_length = 1,
		run_mode = "forward",
		axially_symmetrical = false,
		--apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding.png",
		priority = "high",
		width = 256,
		height = 256,
		direction_count = 4, 
		frame_count = 2,
		line_length = 1,
		run_mode = "forward",
		axially_symmetrical = false,
		apply_runtime_tint = true,
	},
	{
		filename = "__Natural_Evolution_Buildings__/graphics/entities/ne_turret/ne_turret_folding_mask.png",
		priority = "high",
		flags = { "mask" },
		width = 256,
		height = 256,
		direction_count = 4,
		frame_count = 2, 
		line_length = 1,
		run_mode = "forward",
		axially_symmetrical = false,
		tint = tint,
	},
	}
	}
end


--- Dart Turret 
function bio_turret_pic(inputs)

return
{
	layers = 
	{
		{
			filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_turret/bio_turret.png",
			priority = "medium",
			scale = 0.5,
			width = 224,
			height = 160,
			direction_count = inputs.direction_count and inputs.direction_count or 64,
			frame_count = 1,
			line_length = inputs.line_length and inputs.line_length or 8,
			axially_symmetrical = false,
			run_mode = inputs.run_mode and inputs.run_mode or "forward",
			shift = { 0.25, -0.25 },
		}
	}
}
end

NE_gun_turret_tint = {r=85/255, g=107/255, b=47/255, a=255/255} -- Green
NE_rocket_turret_tint = {r=139/255, g=1/255, b=1/255, a=255/255} -- Red
--- Turret
data:extend({ 
 
 --- Dart Turret
  {
    type = "ammo-turret",
    name = "bio-turret",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_turret_icon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.25, result = "bio-turret"},
    max_health = 250,
    corpse = "medium-remnants",
	 
	 -- darkfrei: just another size of boxes, that's all
    collision_box = {{-0.4, -0.4 }, {0.4, 0.4}},
    selection_box = {{-.4, -.4 }, {.4, .4}},
    rotation_speed = 0.05,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 1, -- makes nothing, it's animation's parameter
   
	folded_animation = bio_turret_pic{direction_count = 8, line_length = 1},
	preparing_animation = bio_turret_pic{direction_count = 8, line_length = 1},
	prepared_animation = bio_turret_pic{},
	attacking_animation = bio_turret_pic{},
	folding_animation = bio_turret_pic{direction_count = 8, line_length = 1, run_mode = "backward"},


   vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 }, 
    
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "Bio_Turret_Ammo",
      cooldown = 3.6,  -- cooldown = 6 -- darkfrei: means cooldown 6/60 sec or 10 shoots at second; = 60 is one shoot/sec
      projectile_creation_distance = 1.41,
	  projectile_center = {-0.0625, 0.55},

      range = 20,
	  sound =
	  {
        filename = "__Natural_Evolution_Buildings__/sound/dart-turret.ogg",
        volume = 0.85
      },
    },

    call_for_help_radius = 40
  },
 
  --- Long Range turret
  {
    type = "ammo-turret",
    name = "NE-gun-turret",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_turret_icon.png",
   	flags = {"placeable-player", "player-creation"},
	minable = {mining_time = 0.5, result = "NE-gun-turret"},
	max_health = 400,
	corpse = "medium-remnants",
	collision_box = {{-1.4, -1.4 }, {1.4, 1.4}},
	selection_box = {{-1.5, -1.5 }, {1.5, 1.5}},
	rotation_speed = 0.004,
	prepare_range = 50,
	preparing_speed = 0.012,
	folding_speed = 0.012,
	dying_explosion = "medium-explosion",
	inventory_size = 1,
	automated_ammo_count = 10,
	attacking_speed = 1/2/3.75, --0.02, -- just animation
	base_picture = base_picture (NE_gun_turret_tint),
	preparing_animation = preparing_animation(NE_gun_turret_tint),
	prepared_animation = prepared_animation(NE_gun_turret_tint),
	attacking_animation = attacking_animation(NE_gun_turret_tint),
	folding_animation =folding_animation(NE_gun_turret_tint),
	folded_animation = folded_animation(NE_gun_turret_tint),
	vehicle_impact_sound =  {filename = "__base__" .. "/sound/car-metal-impact.ogg", volume = 0.65},
   	attack_parameters =
		{
		type = "projectile",
		ammo_category = "bullet",
		cooldown = 30, -- in ticks; 60 is 1 shoot / sec
		projectile_creation_distance = 3.4, 
		projectile_center = {0,0},
		range = 40,
		sound = make_heavy_gunshot_sounds(),
		damage_modifier = 3.1
		},

	call_for_help_radius = 40
	},
 

 --- Rocket turret
  {
    type = "ammo-turret",
    name = "NE-rocket-turret",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_rocket_turret_icon.png",
   	flags = {"placeable-player", "player-creation"},
	minable = {mining_time = 0.5, result = "NE-rocket-turret"},
	max_health = 500,
	corpse = "medium-remnants",
	collision_box = {{-1.4, -1.4 }, {1.4, 1.4}},
	selection_box = {{-1.5, -1.5 }, {1.5, 1.5}},
	rotation_speed = 0.004,
	prepare_range = 50,
	preparing_speed = 0.012,
	folding_speed = 0.012,
	dying_explosion = "medium-explosion",
	inventory_size = 1,
	automated_ammo_count = 10,
	attacking_speed = 1/2/3.75, --0.02, -- just animation
	
	base_picture = base_picture (NE_rocket_turret_tint),
	preparing_animation = preparing_animation(NE_rocket_turret_tint),
	prepared_animation = prepared_animation(NE_rocket_turret_tint),
	attacking_animation = attacking_animation(NE_rocket_turret_tint),
	folding_animation = folding_animation(NE_rocket_turret_tint),
	folded_animation = folded_animation(NE_rocket_turret_tint),
	
	vehicle_impact_sound =  {filename = "__base__" .. "/sound/car-metal-impact.ogg", volume = 0.65},
    
	attack_parameters =
		{
		type = "projectile",
		ammo_category = "rocket",
		cooldown = 120, -- in ticks; 60 is 1 shoot / sec
		projectile_creation_distance = 3.4, 
		projectile_center = {0,0},
		range = 45,
		min_range = 25,
		sound = make_heavy_gunshot_sounds(),
		damage_modifier = 2.5
		},

	call_for_help_radius = 45
	},
 

 
 
})