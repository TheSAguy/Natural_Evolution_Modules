
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
		
		--- Add the same amount of "ne_fire" Resistances as the current "fire" Resistances
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


	
--- Add all resistances.

for _, ent_type in pairs(data.raw["electric-pole"]) do
	for k, v in pairs(data.raw["damage-type"]) do
	local Resist_being_Added = {type = v.name, percent = 15} -- or you could use k, and not v.name		
		
				if ent_type.resistances == nil then 
					ent_type.resistances = {}
					table.insert(ent_type.resistances, Resist_being_Added)
				else
					local found = false
					for _, resistance in pairs(ent_type.resistances) do
						if resistance.type == Resist_being_Added.type and resistance.percent > Resist_being_Added.percent then
							--- The current resistance is LARGER that the one being added, so do nothing.
							found = true
							break
						elseif resistance.type == Resist_being_Added.type and resistance.percent < Resist_being_Added.percent then
							--- The current resistance is SMALLER that the one being added, so...
							found = true
							--table.remove(resistance)
							table.insert(ent_type.resistances, Resist_being_Added)
							--resistance.percent = Resist_being_Added.percent
							break
						end
					end
				
					if not found then
					table.insert(ent_type.resistances, Resist)
					end
				
				end
	
	end
end
	
	
--NE_Functions.Add_ALL_Damage_Resists(data.raw["electric-pole"],15)


--[[
--- Add all resistances.
if data.raw.inserter["combat-inserter"] then
	for k, v in pairs(data.raw["damage-type"]) do
	local Resist = {type = v.name, percent = 80} -- or you could use k, and not v.name		
	
				if data.raw.inserter["combat-inserter"].resistances == nil then 
					data.raw.inserter["combat-inserter"].resistances = {}
					table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
				else
					local found = false
					for _, resistance in pairs(data.raw.inserter["combat-inserter"].resistances) do
						if resistance.type == Resist.type and resistance.percent > Resist.percent then
								found = true
							break
						elseif resistance.type == Resist.type and resistance.percent < Resist.percent then
							found = true
							table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
							break
						end
					end
				
					if not found then
					table.insert(data.raw.inserter["combat-inserter"].resistances, Resist)
					end
				
				end
	
	end
end
	
]]	
	
	