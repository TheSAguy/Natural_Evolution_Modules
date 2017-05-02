if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value





data:extend({
{
    type = "recipe",
    name = "alien-artifact-from-small",
    result= "alien-artifact",
    ingredients= { {"small-alien-artifact", 50 * NE_Enemies.Settings.NE_Difficulty} },
	energy_required= 2.5,
    enabled= "true",
	category= "crafting"
  },
})