local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({

  	---- Building Materials
	{
		type = "item",
		name = "Building_Materials",
		icon = ICONPATH .. "Building_Materials.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Building_Materials.png",
				icon_size = 64,
			}
		}, 
		subgroup = "intermediate-product",
		order = "a[iron-stick]-b[Building_Materials]",
		stack_size = 10
	},
	

	--- Battle Marker
	{
		type = "item",
		name = "battle_marker",
		icon = ICONPATH .. "Battle_Marker.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Battle_Marker.png",
				icon_size = 64,
			}
		}, 
		subgroup = "defensive-structure",
		order = "x[battle_marker]",
		place_result = "battle_marker",
		stack_size = 50
  },

		
})

if not mods["Unit_Control"] then

	data:extend({


	 
			--- Attractor
			{
				type = "item",
				name = "attractor-on",
				icon = ICONPATH .. "attractor_on.png",
				icon_size = 64,
				icons = {
					{
						icon = ICONPATH .. "attractor_on.png",
						icon_size = 64,
					}
				}, 
				subgroup = "Tools",
				order = "a[attractor-on]",
				stack_size = 1
			},
			
			{
				type = "item",
				name = "attractor-off",
				icon = ICONPATH .. "attractor_off.png",
				icon_size = 64,
				icons = {
					{
						icon = ICONPATH .. "attractor_off.png",
						icon_size = 64,
					}
				}, 
				subgroup = "Tools",
				order = "b[attractor-off]",
				stack_size = 1
			},

			
	})

end