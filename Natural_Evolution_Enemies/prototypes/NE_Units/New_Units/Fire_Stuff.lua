require "util"
if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value


local function make_color(r_,g_,b_,a_)
  return { r = r_ * a_, g = g_ * a_, b = b_ * a_, a = a_ }
end

local ne_fireutil = {}

function ne_fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do fun_(tab) end
  return table_
end


function ne_fireutil.create_fire_pictures(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = { "compressed" }
  local retval =
  {
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0390625, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-12.png",
      line_length = 8,
      width = 63,
      height = 116,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.015625, -0.914065 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-11.png",
      line_length = 8,
      width = 61,
      height = 122,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0078125, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-10.png",
      line_length = 8,
      width = 65,
      height = 108,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0625, -0.64844 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-09.png",
      line_length = 8,
      width = 64,
      height = 101,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.03125, -0.695315 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-08.png",
      line_length = 8,
      width = 50,
      height = 98,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0546875, -0.77344 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-07.png",
      line_length = 8,
      width = 54,
      height = 84,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -0.640625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-06.png",
      line_length = 8,
      width = 65,
      height = 92,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.83594 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-05.png",
      line_length = 8,
      width = 59,
      height = 103,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.03125, -0.882815 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 8,
      width = 67,
      height = 130,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -1.109375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 8,
      width = 74,
      height = 117,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.046875, -0.984375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 8,
      width = 74,
      height = 114,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.0078125, -0.96875 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 8,
      width = 66,
      height = 119,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0703125, -1.039065 }
    }
  }
  return ne_fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end


function ne_fireutil.create_burnt_patch_pictures()
  local base =
  {
    filename = "__base__/graphics/entity/fire-flame/burnt-patch.png",
    line_length = 3,
    width = 115,
    height = 56,
    frame_count = 9,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-0.09375, 0.125}
  }

  local variations = {}

  for y=1,(base.frame_count / base.line_length) do
    for x=1,base.line_length do
      table.insert(variations,
      {
        filename = base.filename,
        width = base.width,
        height = base.height,
        tint = base.tint,
        shift = base.shift,
        x = (x-1) * base.width,
        y = (y-1) * base.height
      })
    end
  end

  return variations
end


	--- Breeder
NE_Tree_Fire = table.deepcopy(data.raw.fire["fire-flame-on-tree"])
NE_Tree_Fire.name = "ne-fire-flame-on-tree"
NE_Tree_Fire.damage_per_tick = {amount = 35 / 60, type = "ne_fire",  force = "enemy"}
NE_Tree_Fire.spawn_entity = "ne-fire-flame-on-tree"

data:extend{NE_Tree_Fire}

	

data:extend({

	--- Fire Flame
	{
	  type = "fire",
	  name = "ne-fire-flame-3",
	  flags = {"placeable-off-grid", "not-on-map"},
	  force = "enemy",
	  damage_per_tick = {amount = 3 / 60, type = "ne_fire", force = "enemy"}, -- v 13
	  maximum_damage_multiplier = 6,
	  damage_multiplier_increase_per_added_fuel = 1,
	  damage_multiplier_decrease_per_tick = 0.005,

	  spawn_entity = "ne-fire-flame-on-tree",

	  spread_delay = 300,
	  spread_delay_deviation = 180,
	  maximum_spread_count = 100,

	  flame_alpha = 0.35,
	  flame_alpha_deviation = 0.05,

	  --emissions_per_tick = 0.005,

	  add_fuel_cooldown = 10,
	  fade_in_duration = 30,
	  fade_out_duration = 30,

	  initial_lifetime = 120,
	  lifetime_increase_by = 150,
	  lifetime_increase_cooldown = 4,
	  maximum_lifetime = 1800,
	  delay_between_initial_flames = 10,
	  burnt_patch_lifetime = 1800,

	  on_fuel_added_action = nil,

	  pictures = ne_fireutil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5}),

	  smoke_source_pictures =
	  {
		{
		  filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
		  line_length = 8,
		  width = 101,
		  height = 138,
		  frame_count = 31,
		  axially_symmetrical = false,
		  direction_count = 1,
		  shift = {-0.109375, -1.1875},
		  animation_speed = 0.5
		},
		{
		  filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-2.png",
		  line_length = 8,
		  width = 99,
		  height = 138,
		  frame_count = 31,
		  axially_symmetrical = false,
		  direction_count = 1,
		  shift = {-0.203125, -1.21875},
		  animation_speed = 0.5
		}
	  },

	  burnt_patch_pictures = ne_fireutil.create_burnt_patch_pictures(),
	  burnt_patch_alpha_default = 0.4,
	  burnt_patch_alpha_variations =
	  {
		{ tile = "stone-path", alpha = 0.26 },
		{ tile = "concrete", alpha = 0.24 }
	  },

	  smoke = nil,

	  light = {intensity = 0.8, size = 10},

	  working_sound = nil
	  --[[
	  {
		sound = { filename = "__base__/sound/furnace.ogg" },
		max_sounds_per_type = 3
	  },]]

	},

  --- Small Fire Projectile
    {
    type = "projectile",
    name = "ne-small-fire-projectile",
	flags = {"not-on-map"},
    acceleration = 0,
	force = "enemy",
    action =
    {
      {
        type = "direct",
		force = "enemy",
        action_delivery =
        {
          type = "instant",
		  force = "enemy",
          target_effects =
          {
            {
			  type = "damage",
              damage = {amount = 3 + NE_Enemies.Settings.NE_Difficulty, type = "ne_fire",  force = "enemy"}
            },
			{
			  type = "create-entity",
			  force = "enemy",
              entity_name = "ne-fire-flame-3"
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
  

  --- Medium Fire Projectile
    {
    type = "projectile",
    name = "ne-medium-fire-projectile",
	flags = {"not-on-map"},
    acceleration = 0,
	force = "enemy",
    action =
    {
      {
        type = "direct",
		force = "enemy",
        action_delivery =
        {
          type = "instant",
		  force = "enemy",
          target_effects =
          {
            {
			  type = "damage",
              damage = {amount = 12 + NE_Enemies.Settings.NE_Difficulty, type = "ne_fire",  force = "enemy"}
            },
			{
			  type = "create-entity",
			  force = "enemy",
              entity_name = "ne-fire-flame-3"
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
  
  --- Big Fire Projectile
    {
    type = "projectile",
    name = "ne-big-fire-projectile",
	flags = {"not-on-map"},
    acceleration = 0,
	force = "enemy",
    action =
    {
      {
        type = "direct",
		force = "enemy",
        action_delivery =
        {
          type = "instant",
		  force = "enemy",
          target_effects =
          {
            {
			  type = "damage",
              damage = {amount = 24 + NE_Enemies.Settings.NE_Difficulty, type = "ne_fire",  force = "enemy"}
            },
			{
			  type = "create-entity",
			  force = "enemy",
              entity_name = "ne-fire-flame-3"
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
  
    
     
   
 --- Small Fire Explosion
   {
    type = "explosion",
    name = "ne-small-fire-explosion",
    flags = {"not-on-map"},
    acceleration = 0.005,
	force = "enemy",
    created_effect =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "damage",
			force = "enemy",
            damage = {amount = 40, type = "ne_fire", force = "enemy",}
          },
       
		  {
            type = "nested-result",
			force = "enemy",
            action =
            {
              type = "area",
			  force = "enemy",
              target_entities = false,
              repeat_count = 2,
              radius = 2,
              action_delivery =
              {
                type = "projectile",
				force = "enemy",
                projectile = "ne-small-fire-projectile",
                starting_speed = 0.5
              }
            }
          } 
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animations =
    {{
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }}
  },
  
 --- Medium Fire Explosion
   {
    type = "explosion",
    name = "ne-medium-fire-explosion",
    flags = {"not-on-map"},
    acceleration = 0.005,
	force = "enemy",
    created_effect =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },

          {
            type = "damage",
			force = "enemy",
            damage = {amount = 80, type = "ne_fire", force = "enemy",}
          },
       
		  {
            type = "nested-result",
			force = "enemy",
            action =
            {
              type = "area",
			  force = "enemy",
              target_entities = false,
              repeat_count = 5,
              radius = 4,
              action_delivery =
              {
                type = "projectile",
				force = "enemy",
                projectile = "ne-medium-fire-projectile",
                starting_speed = 0.5
              }
            }
          } 
        }
      }
    },
    light = {intensity = 0.6, size = 6},
    animations =
    {{
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }}
  },
 
 --- Big Fire Explosion
   {
    type = "explosion",
    name = "ne-big-fire-explosion",
    flags = {"not-on-map"},
    acceleration = 0.005,
	force = "enemy",
    created_effect =
    {
      type = "direct",
	  force = "enemy",
      action_delivery =
      {
        type = "instant",
		force = "enemy",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },

          {
            type = "damage",
			force = "enemy",
            damage = {amount = 500, type = "ne_fire", force = "enemy",}
          },
       
		  {
            type = "nested-result",
			force = "enemy",
            action =
            {
              type = "area",
			  force = "enemy",
              target_entities = false,
              repeat_count = 12,
              radius = 6,
              action_delivery =
              {
                type = "projectile",
				force = "enemy",
                projectile = "ne-big-fire-projectile",
                starting_speed = 0.5
              }
            }
          } 
        }
      }
    },
    light = {intensity = 0.8, size = 8},
    animations =
    {{
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }}
  },
  
 
}
)





