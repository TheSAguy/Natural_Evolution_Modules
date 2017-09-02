---Artifact Collector Stuff


require ("stdlib/event/event")

--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value


	
--- Artifact Collector

local artifactCollectorRadius = global.NE_Buildings.Settings.Artifact_Collector_Radius
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
				 


function processWorld(surface, tick)
    local collectors = global.world.itemCollectorEvents
    if (#collectors > 0) then
	local collectorLookup = global.world.itemCollectorLookup

	local inserter = {name="", count=0}
	local topLeftPosition = {x = 0, y = 0}
	local bottomRightPosition = {x = 0, y = 0}
	local boundingArea = {topLeftPosition,
			      bottomRightPosition}

	local count = 0
	for index = #collectors, 1, -1 do
	    count = count + 1
	    local itemCollectorPair = collectorLookup[collectors[index]]
	    collectors[index] = nil

	    if itemCollectorPair then
		local chest = itemCollectorPair[1]
		local dish = itemCollectorPair[2]
		
		if chest.valid and dish.valid then

		    local collectorPosition = dish.position
		    
		    topLeftPosition.x = collectorPosition.x - artifactCollectorRadius
		    topLeftPosition.y = collectorPosition.y - artifactCollectorRadius

		    bottomRightPosition.x = collectorPosition.x + artifactCollectorRadius
		    bottomRightPosition.y = collectorPosition.y + artifactCollectorRadius
		    
		    local items = surface.find_entities_filtered({area = boundingArea,
								  name = "item-on-ground"})
		    
		    local counts = {}
		    if (#items > 0) then
			for x=1,#items do
			    local item = items[x]
			    local itemName = item.stack.name
			    if not counts[itemName] then
				counts[itemName] = {item}
			    else
				counts[itemName][#counts[itemName]+1] = item
			    end
			end
			for k,a in pairs(counts) do
			    inserter.name = k
			    inserter.count = #a
			    local stored = chest.insert(inserter)
			    for i=1,stored do
				a[i].destroy()
			    end
			end

		    end
		end
	    end
	    if (count >= 6) then
		return
	    end
	end
    end
end
				 
				 


--- Artifact Collectors
Event.register(defines.events.on_tick, function(event)	
	if (game.tick % (60 * 6) == 0) then 
		local surface = game.surfaces[1]
		local tick = event.tick
		processWorld(surface, tick) 
	end
end)

--[[
				 
				 
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
function ticker(tick)
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
--- Artifact collector
function subscribe_ticker(tick)
	--this function subscribes handler to on_tick event and also sets global values used by it
	--it exists merely for a convenience grouping
	
	Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
	end)
	
	global.ArtifactCollectors = {}
	global.next_check = game.tick + interval
	global.next_collector = 1
end

]]