--- v.5.0.0
require "defines"
require "util"
NEConfig = {}

require "config"


--- Artifact Collector
local interval=60 -- this is an interval between the consequtive updates of a single collector
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






game.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
game.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
game.on_event({defines.events.on_entity_died,defines.events.on_robot_pre_mined_item,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)

				 
function On_Load()
 -- Make sure all recipes and technologies are up to date.
	for k,force in pairs(game.forces) do 
		force.reset_recipes()
		force.reset_technologies() 
	end
	if global.ArtifactCollectors ~= nil then
        --print('Onload subscription')
		game.on_event(defines.events.on_tick, function(event) ticker(event.tick) end)
        global.next_check= global.next_check or game.tick+interval
        global.next_collector= global.next_collector or 1
	end
end




----
function subscribe_ticker(tick)
	--this function subsribes handler to on_tick event and also sets global values used by it
	--it exists merelly for a convenience grouping
    --print('mod initialized')
    --print(tick)
    --print(global.next_check)
	game.on_event(defines.events.on_tick,function(event) ticker(event.tick) end)
	global.ArtifactCollectors= {}
	global.next_check=game.tick+interval
	global.next_collector= 1
end

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
			subscribe_ticker(event.tick)
		end
		
		table.insert(global.ArtifactCollectors, newCollector)
	end
	
end

function On_Remove(event)
    --Artifact collector
    if event.entity.name=="Artifact-collector" then
        local artifacts=global.ArtifactCollectors;
        for i=1,#artifacts do
            if artifacts[i]==event.entity then
                table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
                if global.next_collector>(#artifacts) then global.next_collector=(#artifacts) end 
                break
            end
        end
        if #artifacts==0 then
        --and here artifacts=nil would not cut it.
            global.ArtifactCollectors=nil--I'm not sure this wins much, on it's own
            game.on_event(defines.events.on_tick, nil);
            --but it's  surelly better done here than during on_tick
        end
    end
end

--- Artifact Collector
function ticker(tick)
	--this function provides the smooth handling of all collectors within certain span of time
	--it requires global.ArtifactCollectors, global.next_check, global.next_collector to do that
	if game.tick==global.next_check then
        --print('mod working')
        --print(tick)
        --print(global.next_collector)
		local collectors=global.ArtifactCollectors
         writeDebug(#collectors)
		for i=global.next_collector,#collectors,interval do
			ProcessCollector(collectors[i])
		end
		local time_interval=(collectors[global.next_collector+1] and 1) or (interval- #collectors +1)
		global.next_collector=(global.next_collector)%(#collectors)+1
		global.next_check=game.tick+time_interval
	end
end

--- Artifact Collector
function ProcessCollector(collector)
	--This makes collectors collect items.
     writeDebug("mod looking for items")
	local items
	local inventory
	local Count_Check=global.ArtifactCollectors
	--if Count_Check ~= nil then
	if Count_Check > 0 then
		items = collector.surface.find_entities_filtered({area = {{x = collector.position.x - radius, y = collector.position.y - radius}, {x = collector.position.x + radius, y = collector.position.y + radius}}, name = "item-on-ground"})
		if #items > 0 then
			inventory = collector.get_inventory(chestInventoryIndex)
			for i=1,#items do
				local stack = items[i].stack
				--print(stack.name)
				if filters[stack.name] == 1 and inventory.can_insert(stack) then
					 inventory.insert(stack)
					 items[i].destroy()
					 break
				end
			end
		end
	end
end

game.on_init(On_Load)
game.on_load(On_Load)
--
--- DeBug Messages 
function writeDebug(message)
  if NEConfig.QCCode then game.player.print(tostring(message)) end
end
