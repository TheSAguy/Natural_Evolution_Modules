local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({


	---- Bio Land Mine
    {
		type = "item",
		name = "bio_land_mine",
		icon = ICONPATH .. "bio_land_mine.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "bio_land_mine.png",
				icon_size = 64,
			}
		},
		damage_radius = 8,
		subgroup = "gun",
		order = "g[land-mine]",
		place_result = "bio_land_mine",
		stack_size = 100,
		trigger_radius = 1.5
	},
	
      --- Dart Turret
    {
		type = "item",
		name = "bi-dart-turret",
		icon = ICONPATH .. "bio_turret_icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "bio_turret_icon.png",
				icon_size = 64,
			}
		},
		subgroup = "defensive-structure",
		order = "b[turret]-x[gun-turret]",
		place_result = "bi-dart-turret",
		stack_size = 50
  },
  
  --- Long Range Turret
    {
		type = "item",
		name = "NE-gun-turret",
		icon = ICONPATH .. "ne_turret_icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "ne_turret_icon.png",
				icon_size = 64,
			}
		},
		subgroup = "defensive-structure",
		order = "c[turret]-x[NE-gun-turret]",
		place_result = "NE-gun-turret",
		stack_size = 50
	},

  --- Rocket Turret
    {
		type = "item",
		name = "NE-rocket-turret",
		icon = ICONPATH .. "ne_rocket_turret_icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "ne_rocket_turret_icon.png",
				icon_size = 64,
			}
		},
		subgroup = "defensive-structure",
		order = "c[turret]-x[NE-rocket-turret]",
		place_result = "NE-rocket-turret",
		stack_size = 50
	},
  
	

  
})
