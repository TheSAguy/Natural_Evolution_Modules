---- Alien Control Station Stuff  ---------

require ("stdlib/event/event")


--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value

				 

---------------------------------------------
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


--- ACS
Event.register(defines.events.on_tick, function(event)	


 -- check for biters within Alien Control Station's range
	if (game.tick % (60 * 6) == 0) and global.beacons[1] then

		--Remove_Mind_Control() --free out of range biters - I DON'T THINK THIS IS NEEDED....
		Control_Enemies() --control newly in range biters

	end
end)

