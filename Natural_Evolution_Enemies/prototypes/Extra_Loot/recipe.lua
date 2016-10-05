require ("config")
local NE = NE_Enemies_Config

data:extend({
{
    type = "recipe",
    name = "alien-artifact-from-small",
    result= "alien-artifact",
    ingredients= { {"small-alien-artifact", 100 * NE.Set_Difficulty} },
	energy_required= 2.5,
    enabled= "true",
	category= "crafting"
  },
})