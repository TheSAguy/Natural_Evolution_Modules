data:extend(
{

  {
	name = "NE_Alien_Artifacts", 
	type = "bool-setting",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-a[Artifacts]",
    per_user = false,
  },

  {
    name = "NE_Scorched_Earth",
	type = "bool-setting",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-b[Scorched_Earth]",
    per_user = false,
  },
  
  {
	name = "NE_Burning_Buildings",   
	type = "bool-setting",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-c[Burning_Buildings]",
    per_user = false,
  },
  
  {
	name = "NE_Tree_Hugger",
	type = "bool-setting",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-d[Tree_Hugger]",
    per_user = false,
  },
  
  {
	name = "NE_Remove_Blood_Spatter",
	type = "bool-setting",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-e[Remove_Blood_Spatter]",
    per_user = false,
  },

  
  {
	name = "NE_Remove_Vanilla_Spawners",
	type = "bool-setting",
    setting_type = "startup",
    default_value = false,
	order = "a[modifier]-f[NE_Remove_Vanilla_Spawners]",
    per_user = false,
  },
  
  

  {
    name = "NE_Difficulty",
	type = "int-setting",
    setting_type = "startup",
    default_value = 1,
    maximum_value = 5,
    minimum_value = 1,
	order = "a[modifier]-g[Difficulty]",
    per_user = false,
  },

}
)


