data:extend({
 

	--- Alien Control Station Area
	{
		type = "recipe",
		name = "AlienControlStation",
        energy_required = 20,
		enabled = false,
		ingredients =
        {
            {"Building_Materials", 10},
            {"alien-artifact", 10},
        },
		result = "AlienControlStation_Area"
	}, 
--[[
		--- Alien Control Station
	{
		type = "recipe",
		name = "AlienControlStation",
        energy_required = 20,
		enabled = false,
		ingredients =
        {
            {"Building_Materials", 10},
            {"alien-artifact", 10},
        },
		result = "AlienControlStation"
	}, 
]]
	
})