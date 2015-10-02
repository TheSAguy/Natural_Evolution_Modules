--- v.5.0.0
require "defines"
require "util"
NEConfig = {}

require "config"


--- Artifact Collector
local loaded
local radius = 25
local chestInventoryIndex = defines.inventory.chest
local filters = {["small-alien-artifact"] = 1,
                 ["alien-artifact"] = 1,
                 ["small-corpse"] = 1,
                 ["medium-corpse"] = 1,
                 ["big-corpse"] = 1,
                 ["berserk-corpse"] = 1,
                 ["elder-corpse"] = 1,
                 ["king-corpse"] = 1,
                 ["queen-corpse"] = 1,
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


--- Artifact Collector
function ticker()
	if global.ArtifactCollectors ~= nil then
		if global.ticks == 0 or global.ticks == nil then
			global.ticks = 59
			processCollectors()
		else
			global.ticks = global.ticks - 1
		end
	else
		game.on_event(defines.events.on_tick, nil)
	end
end


game.on_load(function() On_Load() end)

game.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
game.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)

				 
function On_Load()

 -- Make sure all recipes and technologies are up to date.
	for k,force in pairs(game.forces) do 
		force.reset_recipes()
		force.reset_technologies() 
	end
 
	--- Artifact Collector
	if not loaded then
		loaded = true
		
		if global.ArtifactCollectors ~= nil then
			game.on_event(defines.events.on_tick, ticker)
		end
	end

end


game.on_init(function()
	loaded = true
	
	if global.itemCollectors ~= nil then
		game.on_event(defines.events.on_tick, ticker)
	end
end)

---------------------------------------------

function On_Built(event)

	--- Artifact Collector	
	local newCollector
	
	if event.created_entity.name == "Artifact-collector-area" then
	local surface = event.created_entity.surface
    local force = event.created_entity.force
		newCollector = surface.create_entity({name = "Artifact-collector", position = event.created_entity.position, force = force})
		event.created_entity.destroy()
		
		if global.ArtifactCollectors == nil then
			global.ArtifactCollectors = {}
			game.on_event(defines.events.on_tick, ticker)
		end
		
		table.insert(global.ArtifactCollectors, newCollector)
	end
	
end



--- Artifact Collector
function processCollectors()
	local items
	local inventory
	local belt
	
	for k,collector in pairs(global.ArtifactCollectors) do
		if collector.valid then
			items = collector.surface.find_entities_filtered({area = {{x = collector.position.x - radius, y = collector.position.y - radius}, {x = collector.position.x + radius, y = collector.position.y + radius}}, name = "item-on-ground"})
			
			if #items > 0 then
				inventory = collector.get_inventory(chestInventoryIndex)
				for _,item in pairs(items) do
				
			local stack = item.stack
				if filters[stack.name] == 1 and inventory.can_insert(stack) then
					 inventory.insert(stack)
					 item.destroy()
					 break
					end
				end
			end
		else
			table.remove(global.ArtifactCollectors, k)
			if #global.ArtifactCollectors == 0 then
				global.ArtifactCollectors = nil
			end
		end
	end
end

--
--- DeBug Messages 
function writeDebug(message)
  if NEConfig.QCCode then game.player.print(tostring(message)) end
end
