if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value
NE_Enemies.Settings.Bio_Ammo_Damage = settings.startup["NE_Bio_Ammo_Damage"].value

require ("util")


data:extend({


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
				  
				 damage = { amount = ((NE_Enemies.Settings.Bio_Ammo_Damage + 10)/NE_Enemies.Settings.NE_Difficulty) + NE_Enemies.Settings.NE_Difficulty, type = "Biological"}
				 
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
		stack_size = 100
  },
  
	---- Bio Land Mine
    {
    type = "item",
    name = "bio_land_mine",
    icon = "__Natural_Evolution_Enemies__/graphics/icons/bio_land_mine.png",
    flags = {"goes-to-quickbar"},
    damage_radius = 8,
    subgroup = "gun",
    order = "g[land-mine]",
    place_result = "bio_land_mine",
    stack_size = 100,
    trigger_radius = 1.5
  },
  
})
