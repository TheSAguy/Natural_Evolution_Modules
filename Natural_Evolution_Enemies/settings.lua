data:extend(
{

  {
    type = "bool-setting",
    name = "NE_Alien_Artifacts",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-a[Artifacts]",
    per_user = false,
  },

  {
    type = "bool-setting",
    name = "NE_Scorched_Earth",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-b[Scorched_Earth]",
    per_user = false,
  },
  
  {
    type = "bool-setting",
    name = "NE_Burning_Buildings",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-c[Burning_Buildings]",
    per_user = false,
  },
  
  {
	type = "bool-setting",
    name = "NE_Tree_Hugger",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-d[Tree_Hugger]",
    per_user = false,
  },
 

  {
    type = "int-setting",
    name = "NE_Difficulty",
    setting_type = "startup",
    default_value = 1,
    maximum_value = 5,
    minimum_value = 1,
	order = "a[modifier]-e[Difficulty]",
    per_user = false,
  },
  --[[
  {
    type = "bool-setting",
    name = "NE_QC",
    setting_type = "startup",
    default_value = false,
    per_user = false,
  },
]]
  
}
)


