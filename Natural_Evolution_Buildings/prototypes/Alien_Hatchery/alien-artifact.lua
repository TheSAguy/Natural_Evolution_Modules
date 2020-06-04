local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend(
{
    {
    type = "item",
    name = "alien-artifact",
	icon = ICONPATH .. "alien-artifact.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH .. "alien-artifact.png",
			icon_size = 64,
		}
	}, 
	subgroup = "raw-material",
	order = "g[alien-artifact]-a[pink]-a[small]",
    stack_size = 500,
    default_request_amount = 10
  },
    
}
)

