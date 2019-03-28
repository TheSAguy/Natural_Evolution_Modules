require "util"

if mods["Natural_Evolution_Enemies"] then
	NE_Damage = 2
else
	NE_Damage = 1
end



function fire_pic(inputs)
return

	
		
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/ne_fire.png",
      priority = "low",
      width = 128,
      height = 128,
      frame_count = 12,
      line_length = 4,
	  animation_speed = 1,    
      scale = inputs.scale,
    }
	

end



data:extend({
	--Projectile

 -- Bio Cannon Ammo
 
 	 -- Prototype
	   {
		type = "projectile",
		name = "bi-bio-cannon-proto-ammo",
		flags = {"not-on-map"},
		acceleration = 0.0004,
		action =
		{
			{
				type = "area",
				radius = 2,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
						type = "damage",
						damage = {amount = 80 * NE_Damage, type = "physical"}
						},
						{
						type = "create-entity",
						entity_name = "small-scorchmark",
						check_buildability = true
						},
					
					}
				}
			},


		},
		light = {intensity = 0.7, size = 3},
		animation =
		{
			filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Basic_Ammo.png",
			priority = "extra-high",
			width = 18,
			height = 47,
			scale = 0.85,
			frame_count = 1
		},
		shadow =
		{
			filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Ammo-shadow.png",
			priority = "extra-high",
			width = 18,
			height = 47,
			scale = 0.85,
			frame_count = 1
		},

		smoke =
			{
			  {
				name = "smoke-fast",
				deviation = {0.15, 0.15},
				frequency = 1,
				position = {0, 1},
				slow_down_factor = 1,
				starting_frame = 3,
				starting_frame_deviation = 5,
				starting_frame_speed = 0,
				starting_frame_speed_deviation = 5
			  }
			}
	  },

 
 -- Basic
   {
    type = "projectile",
    name = "bi-bio-cannon-basic-ammo",
    flags = {"not-on-map"},
    acceleration = 0.0005,
	action =
	{
		{
			type = "area",
			radius = 8,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
					},
					
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					   {
						type = "nested-result",
						action =
						{
						  type = "area",
						  target_entities = false,
						  repeat_count = 10,
						  radius = 2,
						  action_delivery =
						  {
							type = "projectile",
							projectile = "NE-Napalm-Small",
							starting_speed = 0.5
						  }
						}
					  },
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},					
					{
					type = "create-entity",
					entity_name = "bio-cannon-explosion",
					},
				}
				
			}
		},

	},
	light = {intensity = 0.7, size = 6},
    animation =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Basic_Ammo.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
    shadow =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Ammo-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
	--[[
	sound =
	{
		{
			filename = "__Natural_Evolution_Buildings__/sound/launch.ogg",
			volume = 4.0
		},
	},
	]]
	smoke =
		{
		  {
			name = "smoke-fast",
			deviation = {0.15, 0.15},
			frequency = 1,
			position = {0, 1},
			slow_down_factor = 1,
			starting_frame = 3,
			starting_frame_deviation = 5,
			starting_frame_speed = 0,
			starting_frame_speed_deviation = 5
		  }
		}
  },

  --- Poison
   {
    type = "projectile",
    name = "bi-bio-cannon-poison-ammo",
    flags = {"not-on-map"},
    acceleration = 0.0006,
	action =
	{
		{
			type = "area",
			radius = 12,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
					},
					{
					type = "damage",
					damage = {amount = 250 * NE_Damage, type = "poison"}
					},
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					   {
						type = "nested-result",
						action =
						{
						  type = "area",
						  target_entities = false,
						  repeat_count = 20,
						  radius = 3,
						  action_delivery =
						  {
							type = "projectile",
							projectile = "NE-Napalm-Small",
							starting_speed = 0.5
						  }
						}
					  },
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},					
					{
					type = "create-entity",
					entity_name = "bio-cannon-explosion",
					},
				}
				
			}
		},
	},
	light = {intensity = 0.8, size = 7},
    animation =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Poison_Ammo.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
    shadow =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Ammo-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
	--[[
	sound =
	{
		{
			filename = "__Natural_Evolution_Buildings__/sound/launch.ogg",
			volume = 4.0
		},
	},
	]]
	smoke =
		{
		  {
			name = "smoke-fast",
			deviation = {0.15, 0.15},
			frequency = 1,
			position = {0, 1},
			slow_down_factor = 1,
			starting_frame = 3,
			starting_frame_deviation = 5,
			starting_frame_speed = 0,
			starting_frame_speed_deviation = 5
		  }
		}	
  },

  --- Bio
  {
    type = "projectile",
    name = "bi-bio-cannon-biological-ammo",
    flags = {"not-on-map"},
    acceleration = 0.0007,
	action =
	{
		{
			type = "area",
			radius = 15,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
					},
					{
					type = "damage",
					damage = {amount = 350 * NE_Damage, type = "Biological"}
					},
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					   {
						type = "nested-result",
						action =
						{
						  type = "area",
						  target_entities = false,
						  repeat_count = 30,
						  radius = 5,
						  action_delivery =
						  {
							type = "projectile",
							projectile = "NE-Napalm-Small",
							starting_speed = 0.5
						  }
						}
					  },
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},					
					{
					type = "create-entity",
					entity_name = "bio-cannon-explosion",
					},
				}
				
			}
		},

	},
	light = {intensity = 0.9, size = 8},
    animation =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Bio_Ammo.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
    shadow =
    {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Ammo-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
	--[[
	sound =
	{
		{
			filename = "__Natural_Evolution_Buildings__/sound/launch.ogg",
			volume = 4.0
		},
	},
	]]
	smoke =
		{
		  {
			name = "smoke-fast",
			deviation = {0.15, 0.15},
			frequency = 1,
			position = {0, 1},
			slow_down_factor = 1,
			starting_frame = 3,
			starting_frame_deviation = 5,
			starting_frame_speed = 0,
			starting_frame_speed_deviation = 5
		  }
		}	
  },


  
  ----- Fire Clouds. 
  ---- Small Fire Cloud
   {
    type = "smoke-with-trigger",
    name = "small-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
	animation = fire_pic{scale = 0.7},
	
	--[[
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
	]]
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 8,
    fade_away_duration = 2 * 60,
    spread_duration = 8,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 6,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 6, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  --- medium File Cloud
    {
    type = "smoke-with-trigger",
    name = "medium-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
	animation = fire_pic{scale = 0.85},
	
	--[[
    {
      filename = "__Natural_Evolution_Enemies__/graphics/entity/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
	]]
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 10,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 10,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 8, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  --- Bio Cannon Explosion
  	{
		type = "smoke-with-trigger",
		name = "bio-cannon-explosion",
		flags = {"not-on-map"},
		show_when_smoke_off = true,
		animation =
		{
			filename = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/explosion.png",
			priority = "low",
			width = 256,
			height = 128,
			frame_count = 12,
			animation_speed = 0.2,
			line_length = 3,
			scale = 2,
		},
		sound =
		{
		{
			filename = "__Natural_Evolution_Buildings__/sound/boom.ogg",
			volume = 4.0
		},
		},
		slow_down_factor = 0,
		affected_by_wind = false,
		cyclic = false,
		duration = 60 * 5,
		spread_duration = 10,
	},

	--- Napalm Small
    {
    type = "projectile",
    name = "NE-Napalm-Small",
	flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
			  type = "create-entity",
              entity_name = "fire-flame"
            },

          }
        }
      },

    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  },
  
 
  
  --- Napalm Large
    {
    type = "projectile",
    name = "NE-Napalm-Large",
	flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
			  type = "create-entity",
              entity_name = "fire-flame"
            },
			{
			type = "create-entity",
			entity_name = "small-fire-cloud",
			},
          }
        }
      },

    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  }
  
  

})