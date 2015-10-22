data:extend({

  
  	---- Building Materials
	{
		type = "item",
		name = "Building_Materials",
		icon = "__Natural_Evolution_Enemies__/graphics/icons/Building_Materials.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "Materials",
		order = "b[Building_Materials]",
		stack_size = 10
	},
	

	--- Biological Bullet
	{
		type = "ammo",
		name = "Biological-bullet-magazine",
		icon = "__Natural_Evolution_Enemies__/graphics/icons/Biological-bullet-magazine.png",
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
				  damage = { amount = 25 , type = "Biological"}
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
		order = "a[basic-clips]-b[piercing-bullet-magazine]-c[Biological-bullet-magazine]",
		stack_size = 100
  },
})
