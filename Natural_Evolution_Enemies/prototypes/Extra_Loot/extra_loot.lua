if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value




local loot =
{
  item = "small-alien-artifact",
  probability = 1/NE_Enemies.Settings.NE_Difficulty,
  count_min = 1,
  count_max = 1 
}

local lootB =
{
  item = "small-alien-artifact",
  probability = 1/NE_Enemies.Settings.NE_Difficulty,
  count_min = 1,
  count_max = 2 
}

local lootC =
{
  item = "small-alien-artifact",
  probability = 1/NE_Enemies.Settings.NE_Difficulty,
  count_min = 2,
  count_max = 5 
}

local lootD =
{
  item = "small-alien-artifact",
  probability = 1/NE_Enemies.Settings.NE_Difficulty,
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


---- New Units 

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

	---- Spawners
	
	if data.raw["unit-spawner"]["biter-spawner"].loot == nil then 
		data.raw["unit-spawner"]["biter-spawner"].loot = {}
	end
	if data.raw.item["alien-artifact"] then
		table.insert(data.raw["unit-spawner"]["biter-spawner"].loot, {  item = "alien-artifact",  count_min = 5,  count_max = 10,  probability = 1 } )
	end

  
  	if data.raw["unit-spawner"]["spitter-spawner"].loot == nil then 
		data.raw["unit-spawner"]["spitter-spawner"].loot = {}
	end
	if data.raw.item["alien-artifact"] then
		table.insert(data.raw["unit-spawner"]["spitter-spawner"].loot, {  item = "alien-artifact",  count_min = 5,  count_max = 10,  probability = 1 } )
	end
  
	

------------------
