--- v.5.0.4
require "defines"
require "util"
NEConfig = {}

require "config"


--- Artifact Collector
local interval = 60 -- this is an interval between the consecutive updates of a single collector
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


---------------------------------------------
script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
script.on_event({defines.events.on_entity_died,defines.events.on_robot_pre_mined_item,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)

---------------------------------------------				 
function On_Load()

	if global.ArtifactCollectors ~= nil then
		script.on_event(defines.events.on_tick, function(event) ticker(event.tick) end)
        global.next_check= global.next_check or game.tick+interval
        global.next_collector= global.next_collector or 1
	end
end


script.on_configuration_changed(function()
	for k,force in pairs(game.forces) do 
		force.reset_recipes()
		force.reset_technologies() 
	end

end)
---------------------------------------------
function subscribe_ticker(tick)
	--this function subscribes handler to on_tick event and also sets global values used by it
	--it exists merely for a convenience grouping
	script.on_event(defines.events.on_tick,function(event) ticker(event.tick) end)
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

---------------------------------------------
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
            script.on_event(defines.events.on_tick, nil);
            --but it's surely better done here than during on_tick
        end
    end
	-- Detect killing a Unit spawner.
	if event.entity.type == "unit-spawner" then
	writeDebug("YOU KILLED A SPAWNER")
		for i = 1, #game.players, 1 do
			player = game.players[i]
			--player.surface.set_multi_command({type=defines.command.attack,target=player.character,distraction=defines.distraction.by_enemy},(20+math.floor(game.evolution_factor*100/#game.players)))
			player.surface.set_multi_command{command = {type=defines.command.attack, target=player.character, distraction=defines.distraction.by_enemy},unit_count = (20+math.floor(game.evolution_factor*100/#game.players)), unit_search_distance = 600}
		end
	end
	
end

---------------------------------------------
function ticker(tick)
	--this function provides the smooth handling of all collectors within certain span of time
	--it requires global.ArtifactCollectors, global.next_check, global.next_collector to do that
	if game.tick==global.next_check then
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

---------------------------------------------
function ProcessCollector(collector)
	--This makes collectors collect items.
     writeDebug("mod looking for items")
	local items
	local inventory
	items = collector.surface.find_entities_filtered({area = {{x = collector.position.x - radius, y = collector.position.y - radius}, {x = collector.position.x + radius, y = collector.position.y + radius}}, name = "item-on-ground"})
	if #items > 0 then
		inventory = collector.get_inventory(chestInventoryIndex)
		for i=1,#items do
			local stack = items[i].stack
			if filters[stack.name] == 1 and inventory.can_insert(stack) then
				 inventory.insert(stack)
				 items[i].destroy()
				 break
			end
		end
	end
end

---------------------------------------------
script.on_init(On_Load)
script.on_load(On_Load)


---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if NEConfig.QCCode then 
		for i, player in ipairs(game.players) do
			player.print(tostring(message))
		end
	end
end

