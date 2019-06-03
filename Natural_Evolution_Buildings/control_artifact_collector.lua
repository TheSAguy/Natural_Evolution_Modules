---Artifact Collector Stuff


--require ("stdlib/event/event")
local Event = require('__stdlib__/stdlib/event/event').set_protected_mode(true)

--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value


	
--- Artifact Collector
local artifactCollectorRadius = global.NE_Buildings.Settings.Artifact_Collector_Radius



function processWorld(surface)
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
				 
				 

--[[
--- Artifact Collectors
Event.register(defines.events.on_tick, function(event)	
	if (game.tick % (60 * 6) == 0) then 
		--game.print('old check')
	--	local surface = game.surfaces[1]
	--	local tick = event.tick
	--	processWorld(surface, tick) 
	end
end)
]]
--- Artifact Collectors
Event.register(-360, function(event)
		---game.print('every 30th tick')
		local surface = game.surfaces[1]
		processWorld(surface) 
end)

