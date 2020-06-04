if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend(
	{
		{
			type = "item",
			name = "Artifact-collector-area",
			icon = ICONPATH .. "Artifact-chest-icon.png",
			icon_size = 64,
			icons = {
				{
					icon = ICONPATH .. "Artifact-chest-icon.png",
					icon_size = 64,
				}
			}, 
			subgroup = "storage",
			order = "d[Artifact-collector]",
			place_result = "Artifact-collector-area",
			stack_size = 50
		}
	}
)