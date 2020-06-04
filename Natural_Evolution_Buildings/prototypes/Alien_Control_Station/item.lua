local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({
	

	--- Alien Control Station Area
	{
		type = "item",
		name = "AlienControlStation_Area",
		icon = ICONPATH .. "AlienControlStation.png",
		icon_size = 64,
		icons = {
		  {
			icon = ICONPATH .. "AlienControlStation.png",
			icon_size = 64,
		  }
		}, 
		--flags = {"goes-to-quickbar"},
		subgroup = "Natural-Evolution",
		order = "b[AlienControlStation]-a[AlienControlStation]",
		place_result = "AlienControlStation_Area",
		stack_size = 10
	},

})
