local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({
	

	--- Thumper
	{
		type = "item",
		name = "Thumper",
		icon = ICONPATH .. "TerraformingStation.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Thumper.png",
				icon_size = 64,
			}
		},
		subgroup = "Natural-Evolution",
		order = "Thumper",
		place_result = "Thumper",
		stack_size = 10
	},

})
