

local loot =
{
  item = "small-alien-artifact",
  probability = 0.5,
  count_min = 1,
  count_max = 1 
}

local lootB =
{
  item = "small-alien-artifact",
  probability = 0.6,
  count_min = 1,
  count_max = 2 
}

local lootC =
{
  item = "small-alien-artifact",
  probability = 0.7,
  count_min = 2,
  count_max = 5 
}

local lootD =
{
  item = "small-alien-artifact",
  probability = 0.8,
  count_min = 5,
  count_max = 5 
}

-- biter --

if data.raw.unit["small-biter"] then
  if data.raw.unit["small-biter"].loot == nil then 
    data.raw.unit["small-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["small-biter"].loot, loot)
  end
end


if data.raw.unit["medium-biter"] then
  if data.raw.unit["medium-biter"].loot == nil then 
    data.raw.unit["medium-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["medium-biter"].loot, lootB)
  end
end


if data.raw.unit["big-biter"] then
  if data.raw.unit["big-biter"].loot == nil then 
    data.raw.unit["big-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["big-biter"].loot, lootC)
  end
end


if data.raw.unit["behemoth-biter"] then
  if data.raw.unit["behemoth-biter"].loot == nil then 
    data.raw.unit["behemoth-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["behemoth-biter"].loot, lootD)
  end
end



-- splitter --

if data.raw.unit["small-spitter"] then
  if data.raw.unit["small-spitter"].loot == nil then 
    data.raw.unit["small-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["small-spitter"].loot, loot)
  end
end


if data.raw.unit["medium-spitter"] then
  if data.raw.unit["medium-spitter"].loot == nil then 
    data.raw.unit["medium-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["medium-spitter"].loot, lootB)
  end
end


if data.raw.unit["big-spitter"] then
  if data.raw.unit["big-spitter"].loot == nil then 
    data.raw.unit["big-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["big-spitter"].loot, lootC)
  end
end


if data.raw.unit["behemoth-spitter"] then
  if data.raw.unit["behemoth-spitter"].loot == nil then 
    data.raw.unit["behemoth-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["behemoth-spitter"].loot, lootD)
  end
end


---- New Units (If no DyTech and you're using the Spawner Adjustments)
if not NEConfig.mod.DyTechWar and NEConfig.Spawners then
	--- Biters
		
	if data.raw.unit["small-biter-Mk2"] then
	  if data.raw.unit["small-biter-Mk2"].loot == nil then 
		data.raw.unit["small-biter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["small-biter-Mk2"].loot, loot)
	  end
	end

	if data.raw.unit["small-biter-Mk3"] then
	  if data.raw.unit["small-biter-Mk3"].loot == nil then 
		data.raw.unit["small-biter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["small-biter-Mk3"].loot, loot)
	  end
	end

		
	if data.raw.unit["medium-biter-Mk2"] then
	  if data.raw.unit["medium-biter-Mk2"].loot == nil then 
		data.raw.unit["medium-biter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["medium-biter-Mk2"].loot, lootB)
	  end
	end

	if data.raw.unit["medium-biter-Mk3"] then
	  if data.raw.unit["medium-biter-Mk3"].loot == nil then 
		data.raw.unit["medium-biter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["medium-biter-Mk3"].loot, lootB)
	  end
	end

	if data.raw.unit["big-biter-Mk2"] then
	  if data.raw.unit["big-biter-Mk2"].loot == nil then 
		data.raw.unit["big-biter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["big-biter-Mk2"].loot, lootC)
	  end
	end

	if data.raw.unit["big-biter-Mk3"] then
	  if data.raw.unit["big-biter-Mk3"].loot == nil then 
		data.raw.unit["big-biter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["big-biter-Mk3"].loot, lootC)
	  end
	end




	---- Spitters
		
	if data.raw.unit["small-spitter-Mk2"] then
	  if data.raw.unit["small-spitter-Mk2"].loot == nil then 
		data.raw.unit["small-spitter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["small-spitter-Mk2"].loot, loot)
	  end
	end

	if data.raw.unit["small-spitter-Mk3"] then
	  if data.raw.unit["small-spitter-Mk3"].loot == nil then 
		data.raw.unit["small-spitter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["small-spitter-Mk3"].loot, loot)
	  end
	end

		
	if data.raw.unit["medium-spitter-Mk2"] then
	  if data.raw.unit["medium-spitter-Mk2"].loot == nil then 
		data.raw.unit["medium-spitter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["medium-spitter-Mk2"].loot, lootB)
	  end
	end

	if data.raw.unit["medium-spitter-Mk3"] then
	  if data.raw.unit["medium-spitter-Mk3"].loot == nil then 
		data.raw.unit["medium-spitter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["medium-spitter-Mk3"].loot, lootB)
	  end
	end

	if data.raw.unit["big-spitter-Mk2"] then
	  if data.raw.unit["big-spitter-Mk2"].loot == nil then 
		data.raw.unit["big-spitter-Mk2"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["big-spitter-Mk2"].loot, lootC)
	  end
	end

	if data.raw.unit["big-spitter-Mk3"] then
	  if data.raw.unit["big-spitter-Mk3"].loot == nil then 
		data.raw.unit["big-spitter-Mk3"].loot = {}
	  end
	  if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["big-spitter-Mk3"].loot, lootC)
	  end
	end


end
------------------

------- DyTech Check --------
-- if DyTechW and enableDyTech then
if NEConfig.mod.DyTechWar then

	-- biter --
	
		
	if data.raw.unit["young-berserk-biter"] then
		if data.raw.unit["young-berserk-biter"].loot == nil then 
			data.raw.unit["young-berserk-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-berserk-biter"].loot, lootB)
		end
	end

	if data.raw.unit["young-elder-biter"] then
		if data.raw.unit["young-elder-biter"].loot == nil then 
			data.raw.unit["young-elder-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-elder-biter"].loot, lootB)
		end
	end

	if data.raw.unit["young-king-biter"] then
		if data.raw.unit["young-king-biter"].loot == nil then 
			data.raw.unit["young-king-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-king-biter"].loot, lootB)
		end
	end


	if data.raw.unit["young-queen-biter"] then
		if data.raw.unit["young-queen-biter"].loot == nil then 
			data.raw.unit["young-queen-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-queen-biter"].loot, lootB)
		end
	end

		
	if data.raw.unit["teen-berserk-biter"] then
		if data.raw.unit["teen-berserk-biter"].loot == nil then 
			data.raw.unit["teen-berserk-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-berserk-biter"].loot, lootC)
		end
	end

	if data.raw.unit["teen-elder-biter"] then
		if data.raw.unit["teen-elder-biter"].loot == nil then 
			data.raw.unit["teen-elder-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-elder-biter"].loot, lootC)
		end
	end

	if data.raw.unit["teen-king-biter"] then
		if data.raw.unit["teen-king-biter"].loot == nil then 
			data.raw.unit["teen-king-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-king-biter"].loot, lootC)
		end
	end


	if data.raw.unit["teen-queen-biter"] then
		if data.raw.unit["teen-queen-biter"].loot == nil then 
			data.raw.unit["teen-queen-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-queen-biter"].loot, lootC)
		end
	end

		
	if data.raw.unit["adult-berserk-biter"] then
		if data.raw.unit["adult-berserk-biter"].loot == nil then 
			data.raw.unit["adult-berserk-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-berserk-biter"].loot, lootD)
		end
	end

	if data.raw.unit["adult-elder-biter"] then
		if data.raw.unit["adult-elder-biter"].loot == nil then 
			data.raw.unit["adult-elder-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-elder-biter"].loot, lootD)
		end
	end

	if data.raw.unit["adult-king-biter"] then
		if data.raw.unit["adult-king-biter"].loot == nil then 
			data.raw.unit["adult-king-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-king-biter"].loot, lootD)
		end
	end


	if data.raw.unit["adult-queen-biter"] then
		if data.raw.unit["adult-queen-biter"].loot == nil then 
			data.raw.unit["adult-queen-biter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-queen-biter"].loot, lootD)
		end
	end


	
	-- Spitter --
			
	if data.raw.unit["young-berserk-spitter"] then
		if data.raw.unit["young-berserk-spitter"].loot == nil then 
			data.raw.unit["young-berserk-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-berserk-spitter"].loot, lootB)
		end
	end

	if data.raw.unit["young-elder-spitter"] then
		if data.raw.unit["young-elder-spitter"].loot == nil then 
			data.raw.unit["young-elder-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-elder-spitter"].loot, lootB)
		end
	end

	if data.raw.unit["young-king-spitter"] then
		if data.raw.unit["young-king-spitter"].loot == nil then 
			data.raw.unit["young-king-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-king-spitter"].loot, lootB)
		end
	end


	if data.raw.unit["young-queen-spitter"] then
		if data.raw.unit["young-queen-spitter"].loot == nil then 
			data.raw.unit["young-queen-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["young-queen-spitter"].loot, lootB)
		end
	end

		
	if data.raw.unit["teen-berserk-spitter"] then
		if data.raw.unit["teen-berserk-spitter"].loot == nil then 
			data.raw.unit["teen-berserk-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-berserk-spitter"].loot, lootC)
		end
	end

	if data.raw.unit["teen-elder-spitter"] then
		if data.raw.unit["teen-elder-spitter"].loot == nil then 
			data.raw.unit["teen-elder-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-elder-spitter"].loot, lootC)
		end
	end

	if data.raw.unit["teen-king-spitter"] then
		if data.raw.unit["teen-king-spitter"].loot == nil then 
			data.raw.unit["teen-king-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-king-spitter"].loot, lootC)
		end
	end


	if data.raw.unit["teen-queen-spitter"] then
		if data.raw.unit["teen-queen-spitter"].loot == nil then 
			data.raw.unit["teen-queen-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["teen-queen-spitter"].loot, lootC)
		end
	end

		
	if data.raw.unit["adult-berserk-spitter"] then
		if data.raw.unit["adult-berserk-spitter"].loot == nil then 
			data.raw.unit["adult-berserk-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-berserk-spitter"].loot, lootD)
		end
	end

	if data.raw.unit["adult-elder-spitter"] then
		if data.raw.unit["adult-elder-spitter"].loot == nil then 
			data.raw.unit["adult-elder-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-elder-spitter"].loot, lootD)
		end
	end

	if data.raw.unit["adult-king-spitter"] then
		if data.raw.unit["adult-king-spitter"].loot == nil then 
			data.raw.unit["adult-king-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-king-spitter"].loot, lootD)
		end
	end


	if data.raw.unit["adult-queen-spitter"] then
		if data.raw.unit["adult-queen-spitter"].loot == nil then 
			data.raw.unit["adult-queen-spitter"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
		table.insert(data.raw.unit["adult-queen-spitter"].loot, lootD)
		end
	end

	--- DyZilla
	--- Currently disabled.
	
	if data.raw.unit["dyzilla-unit-1"] then
		if data.raw.unit["dyzilla-unit-1"].loot == nil then 
			data.raw.unit["dyzilla-unit-1"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
			table.insert(data.raw.unit["dyzilla-unit-1"].loot, lootD)
		end
	end
	
	if data.raw.unit["dyzilla-unit-2"] then
		if data.raw.unit["dyzilla-unit-2"].loot == nil then 
			data.raw.unit["dyzilla-unit-2"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
			table.insert(data.raw.unit["dyzilla-unit-2"].loot, lootD)
		end
	end
	
	if data.raw.unit["dyzilla-unit-3"] then
		if data.raw.unit["dyzilla-unit-3"].loot == nil then 
			data.raw.unit["dyzilla-unit-3"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
			table.insert(data.raw.unit["dyzilla-unit-3"].loot, lootD)
		end
	end
	
	if data.raw.unit["dyzilla-unit-4"] then
		if data.raw.unit["dyzilla-unit-4"].loot == nil then 
			data.raw.unit["dyzilla-unit-4"].loot = {}
		end
		if data.raw.item["small-alien-artifact"] then
			table.insert(data.raw.unit["dyzilla-unit-4"].loot, lootD)
		end
	end
	
end