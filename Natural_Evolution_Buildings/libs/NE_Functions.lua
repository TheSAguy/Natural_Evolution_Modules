-----------------------
--NE Functions--
-----------------------

--- Multiplies ingridient
function NE_Functions.Ingredient_Multiplier(Input, Multiplier)	
	if data.raw.recipe[Input] ~= nil then
		for _, recipe in pairs({Input}) do
			for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
				if ingredient[2] ~= nil then
					ingredient[2] = ingredient[2] * Multiplier
				elseif ingredient.amount ~= nil then
					ingredient.amount = ingredient.amount * Multiplier
				end   
			end
		end
	end
end	
	
-- Adds a resistance of a single damage type to an entity
function NE_Functions.Add_Damage_Resists(D_Type,Raw,percent)
	if data.raw["damage-type"][D_Type] ~= nil then
		local Resist = {type = D_Type, percent = percent}
		for i,d in pairs(Raw) do
			if d.resistances == nil then 
				d.resistances = {}
				table.insert(d.resistances, Resist)
			else
				local found = false
				for _, resistance in pairs(d.resistances) do
					if resistance.type == Resist.type and resistance.percent then
						if resistance.percent < Resist.percent then
							resistance.percent = Resist.percent
						end
						found = true
					end            
				end
				
				if not found then
					table.insert(d.resistances, Resist)
				end
			end
		end
	end
end


-- Adds a resistance of all damage types to an item type
function NE_Functions.Add_ALL_Damage_Resists(Raw,Percent)
	if Raw ~= nil then	
		for k, v in pairs(data.raw["damage-type"]) do
			NE_Functions.Add_Damage_Resists(v.name, Raw, Percent)
		end
	end
end


---- Makes it that Biters don't attack rail. Side effect though is that rails don't show up on mini-map or blue-prints
---- Not used anymore
function NE_Functions.Biters_Dont_Attack(Raw)
	for i,d in pairs(Raw) do
		local newflags = {}
		for pos=1,#d.flags do
			if not (d.flags[pos] == "player-creation") then
				table.insert(newflags, d.flags[pos])
			end
		end
		d.flags = newflags
	
	end
end

