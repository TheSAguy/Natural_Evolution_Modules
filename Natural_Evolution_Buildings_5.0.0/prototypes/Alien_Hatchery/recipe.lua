data:extend({
  
  
	---- Alien Hatchery
	{
      type = "recipe",
		  name = "Alien_Hatchery",
		  enabled = "false",
		  ingredients = 
		  {
			{"Building_Materials", 3},
            --  {type="fluid", name="sulfuric-acid", amount=10},
		  },
		  result = "Alien_Hatchery"
	},
		
		
	
  --- Small Biter Hatching
  {
    type = "recipe",
    name = "small-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
        {"alien-artifact", 1},
		{type="fluid", name="sulfuric-acid", amount=50},
    },
    result = "small-biter-hatching",
    energy_required = 1,
  },
  
    --- Medium Biter Hatching
  {
    type = "recipe",
    name = "medium-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"small-biter-hatching", 2},
		{type="fluid", name="sulfuric-acid", amount=100},
    },
    result = "medium-biter-hatching",
    energy_required = 2,
  },
  
    --- Big Biter Hatching
  {
    type = "recipe",
    name = "big-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"medium-biter-hatching", 4},
		{type="fluid", name="sulfuric-acid", amount=150},
    },
    result = "big-biter-hatching",
    energy_required = 4,
  },
  
    --- Behemoth Biter Hatching
  {
    type = "recipe",
    name = "behemoth-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"big-biter-hatching", 8},
		{type="fluid", name="sulfuric-acid", amount=500},
    },
    result = "behemoth-biter-hatching",
    energy_required = 10,
  },	

  
	--- Small Spitter Hatching
  {
    type = "recipe",
    name = "small-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
        {"alien-artifact", 2},
		{type="fluid", name="sulfuric-acid", amount=50},
    },
    result = "small-spitter-hatching",
    energy_required = 1.5,
  },

  --- Medium Spitter Hatching
  {
    type = "recipe",
    name = "medium-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"small-spitter-hatching", 2},
		{type="fluid", name="sulfuric-acid", amount=100},
    },
    result = "medium-spitter-hatching",
    energy_required = 2.5,
  },

  --- Big Spitter Hatching
  {
    type = "recipe",
    name = "big-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"medium-spitter-hatching", 4},
		{type="fluid", name="sulfuric-acid", amount=150},
    },
    result = "big-spitter-hatching",
    energy_required = 5,
  },

  --- Behemoth Spitter Hatching
  {
    type = "recipe",
    name = "behemoth-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"big-spitter-hatching", 8},
		{type="fluid", name="sulfuric-acid", amount=500},
    },
    result = "behemoth-spitter-hatching",
    energy_required = 15,
  },
  
  
	--- Small Worm Hatching
  {
    type = "recipe",
    name = "small-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		--{"Building_Materials", 1},
		{"alien-artifact", 1},
		{"stone", 50},
    },
    result = "small-worm-hatching",
    energy_required = 2.5,
  },
  
	--- Medium Worm Hatching
  {
    type = "recipe",
    name = "medium-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"Building_Materials", 1},
		{"stone", 100},
		{"small-worm-hatching", 2},
    },
    result = "medium-worm-hatching",
    energy_required = 3.5,
  },

	--- Big Worm Hatching
  {
    type = "recipe",
    name = "big-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"Building_Materials", 1},
		{"stone", 150},
		{"medium-worm-hatching", 2},
    },
    result = "big-worm-hatching",
    energy_required = 5,
  },
  
    --- Spawner Biter
	{
		type = "recipe",
		name = "Natural_Evolution_Biter-Spawner",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"Building_Materials", 5},
		  {"alien-artifact", 50},
		  {type="fluid", name="sulfuric-acid", amount=500},
		},
		result = "Natural_Evolution_Biter-Spawner",
		energy_required = 5,
	},
  
    --- Spawner Spitter
	{
		type = "recipe",
		name = "Natural_Evolution_Spitter-Spawner",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"Building_Materials", 5},
		  {"alien-artifact", 50},
		  {type="fluid", name="sulfuric-acid", amount=500},
		},
		result = "Natural_Evolution_Spitter-Spawner",
		energy_required = 5,
	},
	
	
  
	
})