data:extend({

	 {
    type = "ammo",
    name = "NE-Napalm-Rocket",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/napalm_rocket.png",
	icon_size = 32,
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "NE-Napalm-Rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-bb[explosive]",
    stack_size = 200
  },
	
})