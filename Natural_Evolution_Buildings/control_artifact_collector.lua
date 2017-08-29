---Artifact Collector Stuff


require ("stdlib/event/event")

--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
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

