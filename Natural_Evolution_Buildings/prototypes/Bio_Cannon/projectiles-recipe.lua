data:extend({

  ---- Hive Buster Ammo
 {
    type= "recipe",
    name= "Bio_Cannon_Basic_Ammo",
    enabled = false,
	energy_required = 4,
	ingredients = {{"iron-plate", 10}, {"rocket", 10}},
    result = "Bio_Cannon_Basic_Ammo",
	result_count = 2,
 },
 
 --- Poison
 {
    type= "recipe",
    name= "Bio_Cannon_Poison_Ammo",
    enabled = false,
	energy_required = 8,
	ingredients = {{"Bio_Cannon_Basic_Ammo", 1},{"poison-capsule", 5}, {"explosive-rocket", 5}},
    result = "Bio_Cannon_Poison_Ammo",
	result_count = 1,
 },

  ---- Bio
 {
    type= "recipe",
    name= "Bio_Cannon_Bio_Ammo",
	category = "crafting-with-fluid",
    enabled = false,
	energy_required = 12,

	ingredients =
		{
			{type="item", name="Bio_Cannon_Basic_Ammo", amount=1},
			{type="item", name="explosive-rocket", amount=10},
			{type="fluid", name="NE_alien_toxin", amount=50},
  

		},
	
	
    result = "Bio_Cannon_Bio_Ammo",
	result_count = 1,
 },
 
 
 })