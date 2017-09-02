data:extend({
	
	--- Terraforming Station
	{
	    type = "item",
	    name = "TerraformingStation_New",
	    icon = "__Natural_Evolution_Buildings__/graphics/icons/TerraformingStation.png",
	    flags = {"goes-to-quickbar"},
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
    icon = "__Natural_Evolution_Buildings__/graphics/icons/alien_stimulant.png",
    flags = {"goes-to-main-inventory"},
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
