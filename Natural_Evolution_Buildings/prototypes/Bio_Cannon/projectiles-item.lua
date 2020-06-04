local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

data:extend({


			-- Prototype Artillery Proto Ammo
		{
			type = "ammo",
			name = "bi-bio-cannon-proto-ammo",
			icon = ICONPATH .. "Bio_Cannon_Proto_Ammo_Icon.png",
			icon_size = 64,
			icons = {
				{
					icon = ICONPATH .. "Bio_Cannon_Proto_Ammo_Icon.png",
					icon_size = 64,
				}
			}, 
			ammo_type =
			{
				category = "artillery-shell",
				target_type = "direction",
				action =
				{
					{
						type = "direct",
						action_delivery =
						{				
							type = "projectile",
							projectile = "bi-bio-cannon-proto-ammo",
							starting_speed = 1,
							direction_deviation = 0.8,
							range_deviation = 0.8,
							max_range = 90
						}
					}
				}
			},
			subgroup = "ammo",
			order = "z[Bio_Cannon_Ammo]-a[Proto]",
			stack_size = 50,
		},
		
		
		-- Prototype Artillery Basic Ammo
	{
		type = "ammo",
		name = "bi-bio-cannon-basic-ammo",
		icon = ICONPATH .. "Bio_Cannon_Basic_Ammo_Icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Bio_Cannon_Basic_Ammo_Icon.png",
				icon_size = 64,
			}
		}, 
		ammo_type =
		{
			category = "artillery-shell",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "bi-bio-cannon-basic-ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 90
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-b[Basic]",
		stack_size = 50,
	},

			-- Prototype Artillery Poison Ammo
	{
		type = "ammo",
		name = "bi-bio-cannon-poison-ammo",
		icon = ICONPATH .. "Bio_Cannon_Poison_Ammo_Icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Bio_Cannon_Poison_Ammo_Icon.png",
				icon_size = 64,
			}
		}, 
		ammo_type =
		{
			category = "artillery-shell",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "bi-bio-cannon-poison-ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 90
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-c[Poison]",
		stack_size = 50,
	},

	
			-- Prototype Artillery Bio Ammo
	{
		type = "ammo",
		name = "bi-bio-cannon-biological-ammo",
		icon = ICONPATH .. "Bio_Cannon_Bio_Ammo_Icon.png",
		icon_size = 64,
		icons = {
			{
				icon = ICONPATH .. "Bio_Cannon_Bio_Ammo_Icon.png",
				icon_size = 64,
			}
		}, 
		ammo_type =
		{
			category = "artillery-shell",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "bi-bio-cannon-biological-ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 90
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-d[Bio]",
		stack_size = 50,
	},


	
})