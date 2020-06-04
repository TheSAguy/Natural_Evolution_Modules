local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({
	
	--- Terraforming Station
	{
	    type = "item",
	    name = "TerraformingStation_New",
		icon = ICONPATH .. "TerraformingStation.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "TerraformingStation.png",
				icon_size = 64,
			}
		},
	    subgroup = "Natural-Evolution",
	    order = "b[TerraformingStation]-a[TerraformingStation]",
	    place_result = "TerraformingStation_New",
	    stack_size = 10 ,
	},

})


data:extend(
{
  {
    type = "ammo",
    name = "Alien-Stimulant",
	icon = ICONPATH .. "alien_stimulant.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH .. "alien_stimulant.png",
			icon_size = 64,
		}
	},
    ammo_type =
    {
      category = "Terraforming_Station",
     -- action = {}
	  --[[
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
                  type = "damage",
                  damage = { amount = 0 , type = "physical"}
                }
              }
            }
          }
        }
      }
	  ]]
    },
    magazine_size = 1,
    subgroup = "Materials",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  }
}
)
