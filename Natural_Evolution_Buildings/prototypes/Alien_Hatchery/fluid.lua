local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"
local ICONPATH_L = NEBuildings.modRoot .. "/graphics/icons/fluid/"

data:extend({
  {
    type = "fluid",
    name = "NE_nutrient-solution",
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=0.61, g=0.49, b=0.31},
    flow_color = {r=0.7, g=0.7, b=0.7},
	icon = ICONPATH_L .. "basic-alien-nutrientant.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH_L .. "basic-alien-nutrientant.png",
			icon_size = 64,
		}
	},
    --order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  
  {
    type = "fluid",
    name = "NE_revitalization-solution",
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=0.78, g=0.14, b=0.67},
    flow_color = {r=0.7, g=0.7, b=0.7},
	icon = ICONPATH_L .. "alien-revitalization.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH_L .. "alien-revitalization.png",
			icon_size = 64,
		}
	},
    --order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  
  {
    type = "fluid",
    name = "NE_enhanced-nutrient-solution",
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=0.71, g=0.32, b=0.49},
    flow_color = {r=0.7, g=0.7, b=0.7},
	icon = ICONPATH_L .. "enhanced-alien-nutrientant.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH_L .. "enhanced-alien-nutrientant.png",
			icon_size = 64,
		}
	},
    --order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  
  {
    type = "fluid",
    name = "NE_alien_toxin",
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=1.0, g=1.0, b=0.0},
    flow_color = {r=1.0, g=1.0, b=0.5},
	icon = ICONPATH_L .. "alien-toxin.png",
	icon_size = 64,
	icons = {
		{
			icon = ICONPATH_L .. "alien-toxin.png",
			icon_size = 64,
		}
	},
    --order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  
  
})
