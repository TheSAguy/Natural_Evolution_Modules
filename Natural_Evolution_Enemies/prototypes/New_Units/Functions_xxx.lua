
--[[
---- Biter Attack Function - Normal Biter
function Biter_Melee_Attack_Healthy(damagevalue)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue , type = "physical"}
        },
      }
    }
  }
end


---- Biter Attack Function - Infected Biter (Poison / Physical)
function Biter_Melee_Attack_Infected(damagevalue, damagevalue2)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue2 , type = "physical"}
        },
		{
          type = "damage",
          damage = { amount = damagevalue , type = "poison"}
        },
      }
    }
  }
end


---- Biter Attack Function - Mutated Biter (Acid / Physical)
function Biter_Melee_Attack_Mutated(damagevalue, damagevalue2)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue2 , type = "physical"}
        },
		{
          type = "damage",
          damage = { amount = damagevalue , type = "acid"}
        },
      }
    }
  }
end


---- Spitter Attack Functions - Infected Spitter
function Spitter_Attack_Infected(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Infected-Projectile",
          starting_speed = 1
        }
      }
    },
    sound = make_spitter_roars(0.75),
    animation = spitterattackanimation(data.scale, data.tint),
  }
end

---- Spitter Attack Functions - Mutated Spitter
function Spitter_Attack_Mutated(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Mutated-Projectile",
          starting_speed = 1.5
        }
      }
    },
    sound = make_spitter_roars(0.75),
    animation = spitterattackanimation(data.scale, data.tint),
  }
end


]]

local item_types = {}
local item_types_list = {}
local entity_types = {}
local entity_types_list = {}

function is_value_in_list (value, list)
  for i, v in pairs (list) do
    if value == v then
      return true
    end
  end
  return false
end

for type_name, type_prot in pairs (data.raw) do
  for element_name, element_prot in pairs (type_prot) do
    if element_prot.minable 
    or element_prot.collision_box 
    or element_prot.selection_box 
    then
      if not entity_types[type_name] then
        entity_types[type_name] = {element_name}
      else
        if not is_value_in_list (element_name, entity_types[type_name]) then
          table.insert(entity_types[type_name], element_name)
        end
      end
      
      if not is_value_in_list (type_name, entity_types_list) then
        table.insert(entity_types_list, type_name)
      end
    end
    
    if element_prot.name and element_prot.type == "item" 
    or element_prot.stack_size
    or element_prot.place_result
    or element_prot.place_as_tile
    then
      if not item_types[type_name] then
        item_types[type_name] = {element_name}
      else
        if not is_value_in_list (element_name, item_types[type_name]) then
          table.insert(item_types[type_name], element_name)
        end
      end
      
      if not is_value_in_list (type_name, item_types_list) then
        table.insert(item_types_list, type_name)
      end
    end
  end
end

--log ('entity_types = '.. serpent.block(entity_types))
--log ('entity_types_list = '.. serpent.block(entity_types_list))
	


	local function add_immunity(ent_type, immunity, amount)
	  if not ent_type.resistances then ent_type.resistances = {} end
	  table.insert(ent_type.resistances, {type = immunity, percent = amount})
	end

	local function remove_immunity(ent_type, immunity)
	  if not ent_type.resistances then ent_type.resistances = {} end
	  table.insert(ent_type.resistances, {type = immunity, percent = amount})
	end


	
	local ent_count = 	 #entity_types_list
	for i = 1, ent_count do
		
		--- Add the same amount of NE_Fire Resistances as the current Fire Resistances
		for _, ent_type in pairs(data.raw[entity_types_list[i]]) do
			
			if ent_type.type == "unit" then
			
				add_immunity(ent_type, "ne_fire", 100) -- Units have a 100% Immunity to "ne_fire"
			
			elseif ent_type.resistances then
			
				for _, r_type in pairs(ent_type.resistances) do	
					if r_type.type == "fire" then
						table.insert(ent_type.resistances, {type = "ne_fire", percent = r_type.percent})
					end
				end
				
			end
			
		end
		
		
		--- Add or Remove Wall Breaker Resistances
		for _, ent_type in pairs(data.raw[entity_types_list[i]]) do
		
			if ent_type.type == "wall" or ent_type.type == "gate" then
				remove_immunity(ent_type, "ne_wallbreaker", -25) -- Walls and Gates get Wall Breaker Weakness
			else
				add_immunity(ent_type, "ne_wallbreaker", 100) -- All other entities get Wall Breaker Immunity
			end
		end


	end

