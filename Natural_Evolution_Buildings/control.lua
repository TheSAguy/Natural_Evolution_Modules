local BUILDINGS_ver = '7.3.0'
local QC_Mod = false



require ("util")
require ("stdlib/event/event")
require ("control_bio_cannon")

if remote.interfaces.EvoGUI then
	require ("libs/EvoGUI")
end

if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end


--- Settup Settings
global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
global.NE_Buildings.Settings.Artifact_Item_Count = settings.startup["NE_Artifact_Item_Count"].value

	
--- Artifact Collector
local interval = 300 -- this is an interval between the consecutive updates of a single collector
local artifactCollectorRadius = global.NE_Buildings.Settings.Artifact_Collector_Radius
local itemCount = global.NE_Buildings.Settings.Artifact_Item_Count
local chestInventoryIndex = defines.inventory.chest
local filters = {["small-alien-artifact"] = 1,
                 ["alien-artifact"] = 1,
				 ["alien-artifact-red"] = 1,
				 ["alien-artifact-orange"] = 1,
				 ["alien-artifact-yellow"] = 1,
				 ["alien-artifact-green"] = 1,
				 ["alien-artifact-blue"] = 1,
				 ["alien-artifact-purple"] = 1,
				 ["small-alien-artifact-red"] = 1,
				 ["small-alien-artifact-orange"] = 1,
				 ["small-alien-artifact-yellow"] = 1,
				 ["small-alien-artifact-green"] = 1,
				 ["small-alien-artifact-blue"] = 1,
				 ["small-alien-artifact-purple"] = 1
				 }
				 
				 
---- Evolution_MOD
local update_com_count = 80
local agro_area_rad = 40
local call_back_area_rad = agro_area_rad + 15
local max_unit_count = 20
local max_terra_count = 30

---------------------------------------------
--- Artifact Collector
local function ProcessCollector(collector)
	--This makes collectors collect items.
     writeDebug("mod looking for items")
	local items
	local inventory
	items = collector.surface.find_entities_filtered({area = {{x = collector.position.x - artifactCollectorRadius, y = collector.position.y - artifactCollectorRadius}, {x = collector.position.x + artifactCollectorRadius, y = collector.position.y + artifactCollectorRadius}}, name = "item-on-ground"})
	if #items > 0 then
		inventory = collector.get_inventory(chestInventoryIndex)
		local counter = 0
		for i=1,#items do
			local stack = items[i].stack
			if filters[stack.name] == 1 and inventory.can_insert(stack) then
				 inventory.insert(stack)
				 items[i].destroy()
				 counter = counter + 1
				 if counter == itemCount then
					 break
				 end
			end
		end
	end
end

---------------------------------------------
--- Artifact Collector
local function ticker(tick)
	local player = game.players[1]
	--this function provides the smooth handling of all collectors within certain span of time
	--it requires global.ArtifactCollectors, global.next_check, global.next_collector to do that
	if global.update_check then
		global.update_check = false
		if global.next_check < game.tick then
			global.next_check = game.tick
		end
	end
		
	if game.tick == global.next_check then
		local collectors=global.ArtifactCollectors
         writeDebug(#collectors)
		for i=global.next_collector,#collectors,interval do
			ProcessCollector(collectors[i])
		end
		local time_interval = (collectors[global.next_collector + 1] and 1) or (interval- #collectors + 1)
		global.next_collector = (global.next_collector) % (#collectors) + 1
		global.next_check = game.tick + time_interval
	end
end



---------------------------------------------				 
local function On_Init()
 writeDebug("NE Buildings Initialize")
 
 	--- Artifact Collector
 	if global.ArtifactCollectors ~= nil then
		
		Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
		end)
		global.update_check = true
        global.next_collector = global.next_collector or 1
	end
	

---- Evolution_MOD
	if global.Evolution_MOD == nil then
      global.Evolution_MOD = {}
	end
	
	---- Alien Control Initialization ----	
	if not global.beacons then
		global.beacons = {}
	end
	if not global.minds then
		global.minds = {}
	end
	if not global.hiveminds then
		global.hiveminds = {} -- Bases / Spawners
	end

	--- Alien_Control_Station Difficulty settings	
	if global.NE_Buildings.Settings.Conversion_Difficulty == 1 then
		global.minds.difficulty = 3 -- Easy difficulty
	elseif global.NE_Buildings.Settings.Conversion_Difficulty == 2 then
		global.minds.difficulty = 5 -- Normal 
	else 
		global.minds.difficulty = 10 -- Hard
	end

	---- Terraforming Initialization ----	
	if not global.numTerraformingStations then
          global.numTerraformingStations = 0
    elseif global.numTerraformingStations < 0 then
          global.numTerraformingStations = 0
	end
	
	if not global.factormultiplier then
		global.factormultiplier = 0
    elseif global.factormultiplier < 0 then
       global.factormultiplier = 0
	end	

	if not global.Total_TerraformingStations_Evo_Deduction then
        global.Total_TerraformingStations_Evo_Deduction = 0
    elseif global.Total_TerraformingStations_Evo_Deduction < 0 then
        global.Total_TerraformingStations_Evo_Deduction = 0
	end

	
	if global.deduction_constant == nil or global.deduction_constant == 0 then
		global.deduction_constant = 0.0002 -------- DEDUCTION CONSTANT
	end
	
	---- Living Wall Init
	if global.Living_Walls_Table == nil then
          global.Living_Walls_Table = {}
	end

	
	-- enable researched recipes
	for i, force in pairs(game.forces) do
		force.reset_technologies()
		force.reset_recipes()
	end
	
	if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
	end

		
	--- Settup Settings
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
	global.NE_Buildings.Settings.Artifact_Item_Count = settings.startup["NE_Artifact_Item_Count"].value

	
end
		 

---------------------------------------------				 
local function On_Load()

	if global.ArtifactCollectors ~= nil then
		
		Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
		end)
		
	end	

end


---------------------------------------------				 
local function On_Config_Change()


	-- enable researched recipes
	for i, force in pairs(game.forces) do
		for _, tech in pairs(force.technologies) do
			if tech.researched then
				for _, effect in pairs(tech.effects) do
					if effect.type == "unlock-recipe" then          
						force.recipes[effect.recipe].enabled = true
					end
				end
			end
		end
	end
	
	if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
	end
	

	if game.active_mods["EndgameCombat"] or game.active_mods['EndgameCombat'] or game.active_mods[EndgameCombat] then	
		
		for i, player in pairs(game.players) do
			player.print(tostring("You have Endgame Combat Installed, not compatible with Natural Evolution Buildings"))
		end
	end
	

	--- Settup Settings	
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
	global.NE_Buildings.Settings.Artifact_Item_Count = settings.startup["NE_Artifact_Item_Count"].value

	
end




---------------------------------------------
--- Artifact collector
local function subscribe_ticker(tick)
	--this function subscribes handler to on_tick event and also sets global values used by it
	--it exists merely for a convenience grouping
	
	Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
	end)
	
	global.ArtifactCollectors = {}
	global.next_check = game.tick + interval
	global.next_collector = 1
end


---------------------------------------------
---- Removes the Alien Control Station ---
local function ACS_Remove(index)

  if index then
    if global.beacons[index] and not global.beacons[index].valid then
      table.remove(global.beacons, index)
      return -- if an index was found and it's entity was not valid return after removing it
    end
  end
  -- if no index was provided, or an inappropriate index was provided then loop through the table

  for k,beacon in ipairs(global.beacons) do
    if not beacon.valid then
      table.remove(global.beacons,k)
      writeDebug("Alien Control Station Removed")
    end
  end
  
end


--------------- Terraforming Station Calculations ------------------------------
local function GetFactorPerTerraformingStation(numTerraformingStations)
   local res = 1
   -- Calculate the total evolution reduction.
   if numTerraformingStations > 1 then
	for i = 1, (numTerraformingStations-1) do
      res = res + math.pow(0.85, i) -- Each consecutive Terraforming station is only 85% as effective.
	end
   end

   -- Return the evolution reduction per Terraforming Station.
   return res / numTerraformingStations
end


---------------------------------------------
local function T_Count()

	writeDebug("Trying to deduct a station")
	if global.numTerraformingStations > 0 then
		global.numTerraformingStations = global.numTerraformingStations - 1
	else
		global.numTerraformingStations = 0
	end
	
	global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
	
end	  


---------------------------------------------
local function On_Built(event)

local entity = event.created_entity
local surface = entity.surface
local position = entity.position	
local force = entity.force


	
	--- Artifact Collector	
	local newCollector
	if entity.valid and entity.name == "Artifact-collector-area" then
	
		newCollector = surface.create_entity({name = "Artifact-collector", position = position, force = force})
		entity.destroy()
		
		if global.ArtifactCollectors == nil then
			subscribe_ticker(event.tick)
		end
		table.insert(global.ArtifactCollectors, newCollector)
	end
		
	
	--- Living Wall built
	if entity.valid and entity.name == "ne-living-wall" then
		if global.Living_Walls_Table == nil then
          global.Living_Walls_Table = {}
		end
		writeDebug("Living Wall has been built")				

		local Created_L_Wall = event.created_entity
		
		table.insert(global.Living_Walls_Table, Created_L_Wall)
		
	end

	
	--- Alien Control Station has been built	
	if entity.valid and entity.name == "AlienControlStation_Area" then
	local newAlienControlStation
	local surface = event.created_entity.surface
	local force = event.created_entity.force
	
	writeDebug("ACS has been built")			
	writeDebug("The ACS Difficulty is: " .. global.minds.difficulty)  					
			
		newAlienControlStation = surface.create_entity({name = "AlienControlStation", position = event.created_entity.position, force = force})
		event.created_entity.destroy()

		table.insert(global.beacons, newAlienControlStation)
	end	


	
   --- Terraforming Station has been built
	if entity.valid and entity.name == "TerraformingStation" then
	
		if global.numTerraformingStations < 0 then
			global.numTerraformingStations = 0
		end

		global.numTerraformingStations = global.numTerraformingStations + 1
      
		global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
		writeDebug("The the number of Terraforming Stations: " .. global.numTerraformingStations)
	  
		T_Station_Radar = surface.create_entity({name = "TerraformingStation_r", position = position, direction = event.created_entity.direction, force = force})
	
		T_Station_Radar.operable = false
		T_Station_Radar.destructible = false
		T_Station_Radar.minable = false
			
		global.Terraforming_Station_Table[entity.unit_number] = {inventory=entity, radar=T_Station_Radar}
	    writeDebug("The Unit # is: "..entity.unit_number)
	  
	end   

	
		
	--- Bio Cannon (Hive Buster) has been built
	if entity.valid and entity.name == "Bio_Cannon_Area" then
	
	local New_Bio_Cannon
	local New_Bio_CannonR
	
	writeDebug("Bio Cannon has been built")				

		New_Bio_Cannon  = surface.create_entity({name = "Bio_Cannon", position = position, direction = event.created_entity.direction, force = force})
		New_Bio_CannonR = surface.create_entity({name = "Bio_Cannon_r", position = position, direction = event.created_entity.direction, force = force})

		New_Bio_Cannon.health = event.created_entity.health
		
		event.created_entity.destroy()

		
		New_Bio_CannonR.operable = false
		New_Bio_CannonR.destructible = false
		New_Bio_CannonR.minable = false
		
		if global.Bio_Cannon_Table == nil then
			global.Bio_Cannon_Table = {}
			Event.register(defines.events.on_tick, function(event) end)
		end

		table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon,New_Bio_CannonR,0})
		
	end


	
end


---------------------------------------------
local function On_Remove(event)

	local entity = event.entity	

	
	  --- fully heal the items that need a refresh in the alien hatchery anyway to avoid having multiple item stacks for damaged items.
	if event.name ~= defines.events.on_entity_died then
		if (
				entity.name == "small-worm-turret-player" or
				entity.name == "medium-worm-turret-player" or
				entity.name == "big-worm-turret-player" or
				entity.name == "Natural_Evolution_Biter-Spawner" or
				entity.name == "Natural_Evolution_Spitter-Spawner" or
				entity.name == "ne-living-wall" 
			) then
			entity.health = 100000 -- Note: Just needs to be higher or identical to maxhealth
		end
	end
	
	  
	  
    --Artifact collector
    if entity.valid and entity.name == "Artifact-collector" then

        local artifacts = global.ArtifactCollectors;
		if artifacts then 
			for i=1,#artifacts do
				if artifacts[i] == entity then
					table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
					if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
					break
				end
			end
		
			if #artifacts == 0 then
			--and here artifacts=nil would not cut it.
				global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
				
				Event.register(defines.events.on_tick, nil)
				--but it's surely better done here than during on_tick
			end
		end 
    end
	
  
   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end

		
		--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation"   then
		
		if global.Terraforming_Station_Table[entity.unit_number] == nil then 
		--Legacy from 7.1.5 Should remove during next update.
			T_Count()

		else 
		
			global.Terraforming_Station_Table[entity.unit_number].radar.destroy()
			global.Terraforming_Station_Table[entity.unit_number] = nil
			T_Count()	

		end
		
	end
	

end


---------------------------------------------
local function On_Death(event)

	local entity = event.entity	
	local surface = entity.surface
	local pos = entity.position	
	
	--Artifact collector
    if entity.valid and entity.name == "Artifact-collector" then

        local artifacts=global.ArtifactCollectors;
		if artifacts then 
			for i=1,#artifacts do
				if artifacts[i] == entity then
					table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
					if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
					break
				end
			end
		 
			if #artifacts == 0 then
			--and here artifacts=nil would not cut it.
				global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
				
				Event.register(defines.events.on_tick, nil)
				--but it's surely better done here than during on_tick
			end
		end
    end
	

		--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation"   then
		
		if global.Terraforming_Station_Table[entity.unit_number] == nil then 
		--Legacy from 7.1.5 Should remove during next update.
			T_Count()

		else 
		
			global.Terraforming_Station_Table[entity.unit_number].radar.destroy()
			global.Terraforming_Station_Table[entity.unit_number] = nil
			T_Count()	

		end
		
	end
	


   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end
	

 	--------- Spawner killed
	if entity.valid and (entity.type == "unit-spawner") and (entity.force == game.forces.enemy) and global.NE_Buildings.Settings.Battle_Marker then

			writeDebug("Enemy Spawner Killed")

			local force = event.force


			Battle_Marker = surface.create_entity({name = "battle_marker", position = pos, force = force})
			Battle_Marker.destructible = false		

	end

	--- Conversion Turret
	
	if event.force ~= nil and entity.force.name == "enemy" and  entity.type	 == "unit" and event.cause and event.cause.type == "ammo-turret" then 
	
		local name = entity.name

			local inventory = event.cause.get_inventory(defines.inventory.turret_ammo)

			if inventory then

				local inventoryContent = inventory.get_contents()		
				local AmmoType
				local Ammo = 0
				
				if inventoryContent ~= nil then
					for n,a in pairs(inventoryContent) do
						AmmoType=n
						Ammo=a
					end
				end
				
				writeDebug("Ammo Type: " .. AmmoType)
				writeDebug("Ammo Count: " .. Ammo)
				if AmmoType == "basic-dart-magazine_c"  or AmmoType == "enhanced-dart-magazine_c"  or AmmoType == "firearm-magazine_c"  or AmmoType == "copper-bullet-magazine_c"  or AmmoType == "piercing-rounds-magazine_c"  or AmmoType == "uranium-rounds-magazine_c"  or AmmoType == "Biological-bullet-magazine_c" then
					Convert = surface.create_entity({name = name, position = pos, force = event.cause.force.name})
					Convert.health = entity.prototype.max_health / 4
				end
			end	

	end
	
	
end



----- Terraforming Station Stuff
local function Reduce_Evolution(TS_table)
		
		local AmmoType
		local ammo = 0
		
		if TS_table.inventory.get_inventory(1).get_contents() ~= nil then
			for n,a in pairs(TS_table.inventory.get_inventory(1).get_contents()) do
				AmmoType=n
				ammo=a
			end
		end


	writeDebug("Ammo Count: "..ammo)

	
	if ammo > 0 then 
		
		if global.deduction_constant == nil or global.deduction_constant == 0 then
			global.deduction_constant = 0.0002 -------- DEDUCTION CONSTANT
		end
   
		reduction = ((global.deduction_constant * global.factormultiplier) * ((((1 - game.forces.enemy.evolution_factor)^2) * 2) + (game.forces.enemy.evolution_factor * (1 - game.forces.enemy.evolution_factor)))/3) -- Tweak:  ((1 - evo) ^ 2 * 2 + (Evo * (1 - evo))) / 3 see: http://i.imgur.com/gxJOqco.png 
		reduction95 = ((global.deduction_constant * global.factormultiplier) * (1 - 0.95)^2) --- Last 5% will be a constant.
		
		if game.forces.enemy.evolution_factor > 0.95 and  game.forces.enemy.evolution_factor > reduction95 then
		
			game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor - reduction95
			global.Total_TerraformingStations_Evo_Deduction = global.Total_TerraformingStations_Evo_Deduction + reduction95
			game.forces.player.evolution_factor = game.forces.enemy.evolution_factor	
				
		elseif game.forces.enemy.evolution_factor > reduction then
		
			game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor - reduction
			global.Total_TerraformingStations_Evo_Deduction = global.Total_TerraformingStations_Evo_Deduction + reduction
			game.forces.player.evolution_factor = game.forces.enemy.evolution_factor	
			
		end
		
		writeDebug("The current Factor Multiplier is: " .. global.factormultiplier)  
		writeDebug("The total Evolution Deduction due to Terraforming Stations is: " .. global.Total_TerraformingStations_Evo_Deduction)  

		--Reduce Ammo
		ammo = ammo-1
		TS_table.inventory.get_inventory(1).clear()
		if ammo > 0 then
			TS_table.inventory.get_inventory(1).insert({name = AmmoType, count = ammo})
		end
			
		writeDebug("New Ammo Count: "..ammo)
		
	end	
	
end


----------------Radars Scanning Function, used by Terraforming Sataion and Thumper -----------------------------
script.on_event(defines.events.on_sector_scanned, function(event)
	
	---- Each time a Terraforming Station scans a sector, reduce the evolution factor ----	
	if event.radar.name == "TerraformingStation_r" then
		writeDebug("The Unit # is: "..event.radar.unit_number)
		local num = (event.radar.unit_number - 1)
		Reduce_Evolution(global.Terraforming_Station_Table[num])
		
	end

	
	--- Each time a Thumper "Scans", it will attract biters in the area
	if event.radar.name == "Thumper" then
		event.radar.surface.set_multi_command{command = {type=defines.command.attack, target=event.radar, distraction=defines.distraction.by_enemy},unit_count = 10, unit_search_distance = 200}
		writeDebug("Thumper Scanned, units should attack")   
    end   
	
end)


---------------------------------------------
local function GetDistance(pos1 , pos2)
	return math.sqrt((pos1.x - pos2.x)^2 + (pos1.y - pos2.y)^2)
end


---------------------------------------------
local function Get_Bounding_Box(position, radius)
	return {{position.x-radius, position.y-radius}, {position.x+radius,position.y+radius}}
end


--------------- Alien Control Station ---------------------------------
local function Convert_Base(base, died, newforce, surface)
  
  local enemies=Get_Bounding_Box(base.position, global.NE_Buildings.Settings.Search_Distance)
  local units={}
  local hives={}
  local worms={}
  local count=0
  local count_worms=0
  local count_spawners=0
  local count_units=0
  enemies = surface.find_entities(enemies)
  for i, enemy in ipairs(enemies) do
    if enemy.type=="turret" then 
      table.insert(worms, enemy)
    elseif enemy.type=="unit-spawner" then
      table.insert(hives, enemy)
    elseif enemy.type=="unit" then
     table.insert(units, enemy)
    end
  end

  count=#units+#hives+#worms
  count_worms=#worms
  count_spawners=#hives
  count_units=#units
  
  if count~=0 then -- prevent empty random interval	
	--writeDebug("The number of Worms/Turrets in Range: " .. count_worms)	
	--writeDebug("The number of Spawners in Range: " .. count_spawners)	
	writeDebug("The number of Units in Range: " .. count_units)	
  end
  
  if count~=0 and math.random(1+math.sqrt(count))==1 then

    if died then 
	  table.insert(global.hiveminds, base.surface.create_entity{name=base.name, position=base.position, force=game.newforce}) 

	end
	
	for _, worm in pairs(worms) do 
	  worm.force=newforce 
	  writeDebug("Turret/Worm Converted") 
	end
    
	for _, hive in pairs(hives) do 
	  hive.force=newforce  
	  table.insert(global.hiveminds, hive) 
	  writeDebug("Spawner Converted") 
	end
	
    for _, unit in pairs(units) do

	  unit.force=newforce
      unit.set_command{type=defines.command.wander, distraction=defines.distraction.by_enemy}
      -- remove mind controlled biters in range from the minds table
      -- so they aren't converted back into enemies when wandering away from the beacon
      for i, controlled in ipairs(global.minds) do
          if unit == (controlled) then
          table.remove(global.minds, i)
          break
        end
      end
    end
  end
end


--------------- Alien Control Station ---------------------------------
local function Control_Enemies()


  local enemyForce = game.forces.enemy 
  
  for k,beacon in ipairs(global.beacons) do
    if beacon.valid then
	local surface = beacon.surface -- New Code
	
      if beacon.energy > 0 then
        
		local bases = surface.find_entities_filtered{type="unit-spawner", area=Get_Bounding_Box(beacon.position, global.NE_Buildings.Settings.Search_Distance), force = enemyForce} --search area of thirty around each ACS for spawners
		local turret = surface.find_entities_filtered{type="turret", area=Get_Bounding_Box(beacon.position, global.NE_Buildings.Settings.Search_Distance), force = enemyForce} --search area of thirty around each ACS for spawners
        
		if #bases > 0 then
		writeDebug("The number of Spawners in Range: " .. #bases)
          for i, base in ipairs(bases) do
            if base.force == (enemyForce) and math.random(global.minds.difficulty*2)==1 then --easy = 16.5% chance, normal = 10%, hard = 5%     
			 Convert_Base(base, false, beacon.force, surface)
            end
          end
		 
		elseif #turret > 0 then
		writeDebug("The number of Worms/Turrets in Range: " .. #turret)	
          for i, turret in ipairs(turret) do
            if turret.force == (enemyForce) and math.random(global.minds.difficulty*2)==1 then --easy = 16.5% chance, normal = 10%, hard = 5%     
			 Convert_Base(turret, false, beacon.force, surface)
            end
          end	  
		  
        else -- no bases in range 
       
		  for i, enemy in ipairs(surface.find_enemy_units(beacon.position, global.NE_Buildings.Settings.Search_Distance)) do --search area of ten around each ACS
		  
            if enemy.force == (enemyForce) then --do only if not already controlled
              if math.random(global.minds.difficulty*2)==1 then --easy = 16.5% chance, normal = 10%, hard = 5%              
                enemy.force=beacon.force
                enemy.set_command{type=defines.command.wander,distraction=defines.distraction.by_enemy}
                table.insert(global.minds, enemy)
                writeDebug("An Enemy has been Converted")
              end
            end
          end
        end
      else
        writeDebug("A Alien Control Station has no Power")
      end
    else
      ACS_Remove()
    end
  end
end


--------------- Alien Control Station ---------------------------------
local function Remove_Mind_Control()

	local surface = game.surfaces['nauvis'] --- Old Code Need to Fix

	local enemyForce = game.forces.enemy 
	
	if global.beacons[1] then -- if there are valid beacons
		for k,mind in ipairs (global.minds) do --remove mind control from biters not in area of influence
			
				if not mind.valid then --first make sure the enemy is still valid, if not remove them
					table.remove(global.minds, k)
				else -- is valid
					local controlled = false --assume out of range
				if surface.find_entities_filtered{name="AlienControlStation", area=Get_Bounding_Box(mind.position, global.NE_Buildings.Settings.Search_Distance)}[1] then --a AlienControlStation is in range

					controlled = true
					break
				end
			if not controlled then mind.force=enemyForce end
			end
		end
	end
end

---------------------------------------------
---- Evolution_MOD
local function UpdateUnitsCommands(player_index)
	
	local player = game.players[player_index]
	local pos = player.position
    local aggression_area = {{pos.x - agro_area_rad, pos.y - agro_area_rad}, {pos.x + agro_area_rad, pos.y + agro_area_rad}}
	if not player.surface.valid then return end
	local min_dist = agro_area_rad + 10;
	local closest_index = -1
	local surface = player.surface
	
	local attOn = player.get_item_count("attractor-on")
	local attOff = player.get_item_count("attractor-off")
	local lastState = nil
	if global.Evolution_MOD[player.name] and global.Evolution_MOD[player.name].lastState then
		lastState = global.Evolution_MOD[player.name].lastState
	else
		if global.Evolution_MOD[player.name] == nil then
			global.Evolution_MOD[player.name] = {}
		end
		global.Evolution_MOD[player.name].lastState = nil
	end
	
	if attOn > 0 and attOff == 0 then
		if attOn > 1 then
			player.remove_item({name="attractor-on", count=(attOn - 1)})
		end
		lastState = "on"
	elseif attOn == 0 and attOff > 0 then
		if attOff > 1 then
			player.remove_item({name="attractor-off", count=(attOff - 1)})
		end
		lastState = "off"
	elseif attOn > 0 and attOff > 0 then
		if lastState ~= nil and lastState == "off" then
			player.remove_item({name="attractor-off", count=attOff})
			if attOn > 1 then
				player.remove_item({name="attractor-on", count=(attOn - 1)})
			end
			lastState = "on"
		else
			player.remove_item({name="attractor-on", count=attOn})
			if attOn > 1 then
				player.remove_item({name="attractor-on", count=(attOn - 1)})
			end
			lastState = "off"
		end
	else
		lastState = "off"
	end
	global.Evolution_MOD[player.name].lastState = lastState
	
	if lastState == "off" then return end

	local targets = player.surface.find_entities(aggression_area)
	
	for index, target in ipairs(targets) do
		if target.health then
			if target.force == game.forces.enemy and target.type ~= "turret" and target.type ~= "unit" then
				local dist = GetDistance(target.position, pos)			
				if min_dist > dist then
					min_dist = dist
					closest_index = index
				end
			end
		end
	end
	
	local unit_count = 0
	if closest_index == -1 then	
		local call_back_area = {{pos.x -  call_back_area_rad, pos.y -  call_back_area_rad}, {pos.x +  call_back_area_rad, pos.y +  call_back_area_rad}}
		local biters = surface.find_entities_filtered{area = call_back_area, type = "unit"}
		for index, biter in ipairs(biters) do
			if biter.force == (player.force) then
				biter.set_command({type = defines.command.go_to_location, destination = pos, radius = 10, distraction = defines.distraction.byanything});	
				unit_count = unit_count + 1
				
			end
			if unit_count > max_unit_count then return end
		end	
	else
		local call_back_area = {{pos.x -  call_back_area_rad, pos.y -  call_back_area_rad}, {pos.x +  call_back_area_rad, pos.y +  call_back_area_rad}}
		local biters = player.surface.find_entities_filtered{area = call_back_area, type = "unit"}
		for index, biter in ipairs(biters) do
			if biter.force == player.force then
				biter.set_command({type = defines.command.attack, target = targets[closest_index], distraction = defines.distraction.byanything});
				unit_count = unit_count + 1					
			end
			if unit_count > max_unit_count then return end
		end	
	end
end


  




--------------------------------------------
--- Living Wall Stuff
Event.register(defines.events.on_tick, function(event)	


	if game.tick % 60 == 0 and global.Living_Walls_Table ~= nil then

		for k,Living_Wall in pairs(global.Living_Walls_Table) do
			if Living_Wall.valid then
				local LW_Health = Living_Wall.health
				local Regen = 0.5
				if LW_Health < 600 then
					New_LW_Health = LW_Health + Regen
					Living_Wall.health = New_LW_Health 
				end
			else
				table.remove(global.Living_Walls_Table, k)
			end
		end
	end
	

end)

--- ACS
Event.register(defines.events.on_tick, function(event)	


 -- check for biters within Alien Control Station's range
	if (game.tick % (60 * 6) == 0) and global.beacons[1] then

		--Remove_Mind_Control() --free out of range biters - I DON'T THINK THIS IS NEEDED....
		Control_Enemies() --control newly in range biters

	end
end)

---	Evolution_MOD	
Event.register(defines.events.on_tick, function(event)	


	if event.tick % update_com_count == 0 then
		for index, player in pairs(game.players) do
			if player.connected and player.character then
				UpdateUnitsCommands(index)		
			end
		end
	end

end)


---------------------------------------------
script.on_event(defines.events.on_research_finished, function(event)

	local research = event.research.name
	if research == "Alien_Training" then
		for _, player in pairs(event.research.force.players) do
			player.insert{name="attractor-off",count=1}
		end
	end
  
    if research == "TerraformingStation-2" then
        global.deduction_constant = global.deduction_constant + (global.deduction_constant / 4)
    end      

    if research == "TerraformingStation-3" then
        global.deduction_constant = global.deduction_constant + (global.deduction_constant / 4)
    end    	
  
end)



----------------------------------------
script.on_configuration_changed(On_Config_Change)
script.on_load(On_Load)
script.on_init(On_Init)


local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
script.on_event(build_events, On_Built)

local pre_remove_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined}
script.on_event(pre_remove_events, On_Remove)

local death_events = {defines.events.on_entity_died}
script.on_event(death_events, On_Death)





-------------------- For Testing --------------
if QC_Mod == true then  

	script.on_event(defines.events.on_player_created, function(event)
	local iteminsert = game.players[event.player_index].insert
	iteminsert{name="TerraformingStation", count=5}
	iteminsert{name="solar-panel", count=50}
	iteminsert{name="medium-electric-pole", count=5}
	iteminsert{name="Alien-Stimulant", count=200}
	end)

end

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if QC_Mod == true then  
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
