
if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end
if not NE_Functions then NE_Functions = {} end


require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 

---- Add Long Range  & Rocket Turret to tech tree
thxbob.lib.tech.add_recipe_unlock("bi_tech_bio_cannon", "NE_gun_turret")
thxbob.lib.tech.add_recipe_unlock("bi_tech_bio_cannon", "NE_rocket_turret")

-- add Prototype Artillery as pre req for artillery
thxbob.lib.tech.add_prerequisite("artillery", "bi_tech_bio_cannon")

----- Update the Alien Atrifact Graphic
data.raw.item["alien-artifact"].icon = "__Natural_Evolution_Buildings__/graphics/icons/alien-artifact.png"


----- Updates to Ammo
data.raw.recipe["piercing-rounds-magazine"].icon = "__Natural_Evolution_Buildings__/graphics/icons/piercing_magazine_iron.png"
data.raw.recipe["piercing-rounds-magazine"].icon_size = 32
data.raw.ammo["piercing-rounds-magazine"].icon = "__base__/graphics/icons/piercing-rounds-magazine.png"
data.raw.ammo["piercing-rounds-magazine"].icon_size = 32


if not mods["bobwarfare"] then
	if data.raw.ammo["piercing-rounds-magazine"].ammo_type and
	  data.raw.ammo["piercing-rounds-magazine"].ammo_type.action and
	  data.raw.ammo["piercing-rounds-magazine"].ammo_type.action.action_delivery and
	  data.raw.ammo["piercing-rounds-magazine"].ammo_type.action.action_delivery.target_effects
	then
	  table.insert(data.raw.ammo["piercing-rounds-magazine"].ammo_type.action.action_delivery.target_effects, { type = "damage", damage = {amount = 2 , type = "bob-pierce"} } )
	end

	if data.raw.projectile["piercing-shotgun-pellet"].action and
	  data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery and
	  data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects
	then
	  table.insert(data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects, { type = "damage",  damage = {amount = 2 , type = "bob-pierce"} } )
	end
end
------

-- Remove Alerts from units. 
local units = data.raw["unit"]

for k, v in pairs(units) do
	if v.alert_when_damaged == 'false' then
		break		
	else
		v.alert_when_damaged = 'false'
	end
	
	if v.alert_when_attacking == 'false' then
		break	
	else
		v.alert_when_attacking = 'false'
	end
	
end



		
-- Make it so that you can mine spawners & worms, since you are able to convert them, you can now remove them. 

data.raw["unit-spawner"]["biter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
data.raw["unit-spawner"]["spitter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Spitter-Spawner-exhausted", amount=1},}}
data.raw["turret"]["small-worm-turret"].minable = {hardness = 0.5, mining_time = 1.6, results = {{type="item", name="small-worm-hatching-exhausted", amount=1},}}
data.raw["turret"]["medium-worm-turret"].minable = {hardness = 1.0, mining_time = 1.6, results = {{type="item", name="medium-worm-hatching-exhausted", amount=1},}}
data.raw["turret"]["big-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}

if mods["bobenemies"] then

	data.raw["unit-spawner"]["bob-biter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
	data.raw["unit-spawner"]["bob-spitter-spawner"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Spitter-Spawner-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-explosive-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-fire-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-poison-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-piercing-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-big-electric-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-giant-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}
	data.raw["turret"]["bob-behemoth-worm-turret"].minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="big-worm-hatching-exhausted", amount=1},}}

end

--- All other Spawners
local spawners = data.raw["unit-spawner"]
for k, v in pairs(spawners) do

	if v.minable then
		break		
	else
		local minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
		table.insert(v.minable, minable)
	end

end

--- All other turrets?
local worms = data.raw["turret"]
for k, v in pairs(worms) do

	if v.minable then
		break		
	else
		local minable = {hardness = 0.5, mining_time = 1.6, results = {{type="item", name="small-worm-hatching-exhausted", amount=1},}}
		table.insert(v.minable, minable)
	end

end


--- Adjust N.E. Building spawners to N.E. Enemy Settings
if mods["Natural_Evolution_Enemies"] then

	-- Natural Evolution Biter Spawner Adjustments 
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_cooldown = data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_health = data.raw["unit-spawner"]["biter-spawner"].max_health
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_radius = data.raw["unit-spawner"]["biter-spawner"].spawning_radius
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].spawning_spacing = data.raw["unit-spawner"]["biter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].max_spawn_shift = data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["Natural_Evolution_Biter-Spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute


	-- Natural Evolution Spitter Spawner Adjustments 
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_cooldown = data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_health = data.raw["unit-spawner"]["spitter-spawner"].max_health
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_radius = data.raw["unit-spawner"]["spitter-spawner"].spawning_radius
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].spawning_spacing = data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].max_spawn_shift = data.raw["unit-spawner"]["spitter-spawner"].max_spawn_shift
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional
	data.raw["unit-spawner"]["Natural_Evolution_Spitter-Spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute


end


-- Adds a resitance of all damage types to an entity
for k, v in pairs(data.raw["damage-type"]) do
	local Resist = {type = v.name, percent = 80} -- or you could use k, and not v.name		

	if data.raw.inserter["combat-inserter"].resistances == nil then 
		data.raw.inserter["combat-inserter"].resistances = {}
		table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
	else
		local found = false
		for _, resistance in pairs(data.raw.inserter["combat-inserter"].resistances) do
			if resistance.type == Resist.type and resistance.percent then
				if resistance.percent < Resist.percent then
					resistance.percent = Resist.percent
				end
				found = true
			end            
		end
		
		if not found then
			table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
		end
	end
end


---------- Adds Alient Artifacts back for recipies in NE Buildings
if settings.startup["NE_Difficulty"] and settings.startup["NE_Difficulty"].value then
	NE_Difficulty = settings.startup["NE_Difficulty"].value
else
	NE_Difficulty = 1
end

local function add_loot(spawner,item)
	  if not spawner.loot then spawner.loot = {} end
	  local has = false
	  for _,v in pairs(spawner.loot) do
		if v.item == item.item then has = true break end
		end
	  if not has then
		table.insert(spawner.loot,item)
		end
end


if data.raw.item["alien-artifact"] then

	 for k, spawners in pairs(data.raw["unit-spawner"]) do
	 
		add_loot(
		  spawners,
		  {item = "alien-artifact",count_min = 5,count_max = 10,probability = 1/NE_Difficulty}
		  ) 
	 
	 end

end

if data.raw.item["small-alien-artifact"] then

	 for k, units in pairs(data.raw["unit"]) do
	 
		 add_loot(
		  units,
		  {item = "small-alien-artifact",count_min = 1,count_max = 3,probability = 1/NE_Difficulty}
		  )
	  
	 end
 
end














