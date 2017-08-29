--- Evolution Mod - Controling Tame Biters -------

require ("stdlib/event/event")
				 
---- Evolution_MOD
local update_com_count = 80
local agro_area_rad = 40
local call_back_area_rad = agro_area_rad + 15
local max_unit_count = 20
local max_terra_count = 30


---------------------------------------------
local function GetDistance(pos1 , pos2)
	return math.sqrt((pos1.x - pos2.x)^2 + (pos1.y - pos2.y)^2)
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

