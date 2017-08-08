



if settings.startup["NE_Difficulty"] and settings.startup["NE_Difficulty"].value then

	NE_Difficulty = settings.startup["NE_Difficulty"].value
else
	NE_Difficulty = 1
end

Bio_Ammo_Damage = settings.startup["NE_Bio_Ammo_Damage"].value

require ("util")


--- Bio Ammo
data:extend({


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
      filename = "__Natural_Evolution_Buildings__/graphics/entity/bio_land_mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entity/bio_land_mine_set.png",
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

