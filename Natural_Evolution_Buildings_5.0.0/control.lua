--- v.5.0.0
require "defines"
require "util"
NEConfig = {}

require "config"


---- Evolution_MOD
local update_com_count = 80
local agro_area_rad = 40
local call_back_area_rad = agro_area_rad + 15
local max_unit_count = 20
----

game.on_init(function() On_Load() end)
game.on_load(function() On_Load() end)

game.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
game.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
game.on_event(defines.events.on_preplayer_mined_item, function(event) On_Removed(event) end)
game.on_event(defines.events.on_robot_pre_mined, function(event) On_Removed(event) end)
game.on_event(defines.events.on_entity_died, function(event) On_Removed(event) end)

game.on_event(defines.events.on_research_finished, function(event)
  if event.research.name == "Alien_Training" then
    for _, player in pairs(event.research.force.players) do
      player.insert{name="attractor-off",count=1}
    end
  end
end)

				 
function On_Load()

 -- Make sure all recipes and technologies are up to date.
	for k,force in pairs(game.forces) do 
		force.reset_recipes()
		force.reset_technologies() 
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
	if NEConfig.Conversion_Difficulty == Easy then
      global.minds.difficulty = 3 -- Easy difficulty
	elseif NEConfig.Conversion_Difficulty == Normal then
	  global.minds.difficulty = 5 -- Normal 
	else global.minds.difficulty = 10 -- Hard
	end

	
---- Terraforming Initialization ----	
	if not global.numTerraformingStations then
      global.numTerraformingStations = 0
	end

end

---------------------------------------------

function On_Built(event)
     
   --- Terraforming Station has been built
	if event.created_entity.name == "TerraformingStation" then
      global.numTerraformingStations = global.numTerraformingStations + 1
      
      global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
	  writeDebug("The the number of Terraforming Stations: " .. global.numTerraformingStations)
	  
	end
   
   
   --- Alien Control Station has been built
    if event.created_entity.name == "AlienControlStation" then
		table.insert(global.beacons, event.created_entity)
	end

end


---------------------------------------------

function On_Removed(event)
	--- Terraforming Station has been removed
   if event.entity.name == "TerraformingStation" then
      
      global.numTerraformingStations = global.numTerraformingStations - 1
      global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
   end
    
   --- Alien Control Station has been removed
	if event.entity.name == "AlienControlStation" then
		ACS_Remove()
	end
	
end


---- Removes the Alien Control Station ---
function ACS_Remove(index)

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
function GetFactorPerTerraformingStation(numTerraformingStations)
   local res = 1
   -- Calculate the total evolution reduction.
   if numTerraformingStations > 1 then
	for i = 1, numTerraformingStations do
      res = res + math.pow(0.9, i) -- Each consecutive Terraforming station is only 90% as effective.
	end
   end

   -- Return the evolution reduction per Terraforming Station.
   return res / numTerraformingStations
end



----------------Radars Scanning Function -----------------------------
game.on_event(defines.events.on_sector_scanned, function(event)
	
	---- Each time a Terraforming Station scans a sector, reduce the evolution factor ----	
	if event.radar.name == "TerraformingStation" then
   
   			if game.evolution_factor > 0.05 then
				game.evolution_factor = game.evolution_factor - ((0.000125 * global.factormultiplier) * (1 - game.evolution_factor))
			else
				game.evolution_factor = .0001
			end 
   
		writeDebug("The current Factor Multiplier is: " .. global.factormultiplier)   
	end
	
	--- Each time a Thumper "Scans", it will attract biters in the area
	if event.radar.name == "Thumper" then
        event.radar.surface.set_multi_command({type=defines.command.attack, target=event.radar, distraction=defines.distraction.by_enemy},10)
		writeDebug("Thumper Scanned, units should attack")   
    end   
	
end)


--------------- Alien Control Station ---------------------------------
function Control_Enemies()

 -- old code--  local surface = game.surfaces['nauvis']  
  local enemyForce = game.forces.enemy 
  
  for k,beacon in ipairs(global.beacons) do
    if beacon.valid then
	local surface = beacon.surface -- New Code
	
      if beacon.energy > 0 then
        
		local bases = surface.find_entities_filtered{type="unit-spawner", area=Get_Bounding_Box(beacon.position, NEConfig.Spawner_Search_Distance)} --search area of thirty around each ACS for spawners
		
        if #bases > 0 then
          for i, base in ipairs(bases) do
            if base.force == (enemyForce) and math.random(global.minds.difficulty*2)==1 then --easy = 16.5% chance, normal = 10%, hard = 5%     
			 Convert_Base(base, false, beacon.force)
            end
          end
        else -- no bases in range 
       
		  for i, enemy in ipairs(surface.find_enemy_units(beacon.position, NEConfig.Unit_Search_Distance)) do --search area of ten around each ACS
		  
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
function Remove_Mind_Control()

  local surface = game.surfaces['nauvis'] --- Old Code Need to Fix
  --local surface = beacon.surface
   local enemyForce = game.forces.enemy 
	
  if global.beacons[1] then -- if there are valid beacons
    for k,mind in ipairs (global.minds) do --remove mind control from biters not in area of influence
      if not mind.valid then --first make sure the enemy is still valid, if not remove them
        table.remove(global.minds, k)
      else -- is valid
        local controlled = false --assume out of range
        if surface.find_entities_filtered{name="AlienControlStation", area=Get_Bounding_Box(mind.position, NEConfig.Unit_Search_Distance)}[1] then --a AlienControlStation is in range
          controlled = true
          break
        end
        if not controlled then mind.force=enemyForce end
      end
    end
  end
end


--------------- Alien Control Station ---------------------------------
function Convert_Base(base, died, newforce)
  
  local surface = game.surfaces['nauvis'] -- Old Code, need to fix
  --local surface = base.surface
  local enemies=Get_Bounding_Box(base.position, NEConfig.Unit_Search_Distance)
  local units={}
  local hives={}
  local worms={}
  local count=0
  local count_worms=0
  local count_spawners=0
  local count_units=0
  enemies = surface.find_entities(enemies)
  for i, enemy in ipairs(enemies) do
    if enemy.type=="turret" and enemy.force == (enemyForce) then
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
	writeDebug("The number of Worms/Turrets in Range: " .. count_worms)	
	writeDebug("The number of Spawners in Range: " .. count_spawners)	
	writeDebug("The number of Units in Range: " .. count_units)	
  end
  
  if count~=0 and math.random(1+math.sqrt(count))==1 then

    if died then 
	  table.insert(global.hiveminds, base.surface.create_entity{name=base.name, position=base.position, force=game.newforce}) 
	  -- table.insert(global.hiveminds, game.create_entity{name=base.name, position=base.position, force=game.newforce}) --- Old Code --- game.create_entity issue
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


function Get_Bounding_Box(position, radius)
	return {{position.x-radius, position.y-radius}, {position.x+radius,position.y+radius}}
end

--------------------------------------------



game.on_event(defines.events.on_tick, function(event)

 -- check for biters within Alien Control Station's range
	if (game.tick % (60 * 6) == 0) and global.beacons[1] then

		Remove_Mind_Control() --free out of range biters
		Control_Enemies() --control newly in range biters

	end

	--	Evolution_MOD
	
	if event.tick % update_com_count == 0 then
		for index, player in ipairs(game.players) do
			if player.character then
				UpdateUnitsCommands(index)		
			end
		end
	end
	
end)

---- Evolution_MOD
function UpdateUnitsCommands(player_index)
	--local player = game.players[player_index].character
	local player = game.get_player(player_index)
	local pos = player.position
    local aggression_area = {{pos.x - agro_area_rad, pos.y - agro_area_rad}, {pos.x + agro_area_rad, pos.y + agro_area_rad}}
	if not player.surface.valid then return end
	local targets = player.surface.find_entities(aggression_area)
	local min_dist = agro_area_rad + 10;
	local closest_index = -1
	local surface = player.surface
	
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
		
		--local attOn = game.players[player_index].get_item_count("attractor-on") 
		--local attOff = game.players[player_index].get_item_count("attractor-off") 
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

function GetDistance(pos1 , pos2)
	return math.sqrt((pos1.x - pos2.x)^2 + (pos1.y - pos2.y)^2)
end


--- DeBug Messages 
function writeDebug(message)
  if NEConfig.QCCode then game.player.print(tostring(message)) end
end
