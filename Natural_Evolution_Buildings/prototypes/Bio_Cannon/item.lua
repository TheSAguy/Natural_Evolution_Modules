local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"




  data:extend({
    -- Hive Buster Turret
    {
      type = "item",
      name = "bi-bio-cannon-area",
      icon = ICONPATH .. "biocannon_icon.png",
      icon_size = 64,
      icon_mipmaps = 1,
      icons = {
        {
          icon = ICONPATH .. "biocannon_icon.png",
          icon_size = 64,
        }
      },
      subgroup = "defensive-structure",
      order = "x[turret]-x[gun-turret]",
      place_result = "bi-bio-cannon-area",
      stack_size = 1,
    },
  })

  
