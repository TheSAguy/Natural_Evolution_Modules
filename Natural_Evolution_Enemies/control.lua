---ENEMIES v.6.0.2
if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end


require ("util")
require ("config")


	
--- Artifact Collector
local interval = 300 -- this is an interval between the consecutive updates of a single collector
local radius = 25
local itemCount = 6
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
script.on_event({defines.events.on_robot_built_entity,defines.events.on_built_entity,},function(event) On_Built(event) end)
script.on_event({defines.events.on_robot_pre_mined,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)
script.on_event(defines.events.on_entity_died,function(event) On_Death(event) end)


---------------------------------------------				 
function On_Load()

	global.load = true
	
	if global.ArtifactCollectors ~= nil then
		script.on_event(defines.events.on_tick, function(event) ticker(event.tick) end)
		global.update_check = true
        global.next_collector= global.next_collector or 1
	end
end

---------------------------------------------				 
function On_Init()

	global.load = true
	
	--- Used for Unit Turrets
	if not global.tick then
		global.tick = game.tick
	end
	
	if not global.evoFactorFloor then
		if game.evolution_factor > 0.995 then
			global.evoFactorFloor = 10
		else
			global.evoFactorFloor = math.floor(game.evolution_factor * 10)
		end
		global.tick = global.tick + 1800
	end
	
	global.launch_units={}--this is used to define which equipment is put initially
	global.launch_units["unit-cluster"]="unit-cluster"

end

script.on_event(defines.events.on_tick, function(event)
	
	
	if global.load == true then
		for i, player in pairs(game.players) do 
			player.force.reset_recipes() 
			player.force.reset_technologies()
		end
		global.load = false
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
script.on_event(defines.events.on_trigger_created_entity,
function(event)
	--- Unit Cluster created by Worm Launcher Projectile 
	local ent=event.entity;
    if global.launch_units[ent.name] then
		writeDebug("Cluster Unit Created")
		ent.die()
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

end

function On_Death(event)
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
	
	
	--[[	
   if event.entity.type == "unit-spawner" then
	writeDebug("YOU KILLED A SPAWNER")
	   local surface = game.surfaces['nauvis']
       local radius = 25
       local pos = event.entity.position
       local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}

       -- find nearby players
       local players = surface.find_entities_filtered{area=area, type="player"}

        -- send attacks to all nearby players
        for i,player in pairs(players) do
            surface.set_multi_command{command = {type=defines.command.attack, target=player.character, distraction=defines.distraction.by_enemy},unit_count = (20+math.floor(game.evolution_factor*100)), unit_search_distance = 600}
        end

   end
		]]

 

	--------- Currently the Evolution Factor gets affected even if you or the enemy kills your Spawners. So this should help with that.
	if (event.entity.type == "unit-spawner") then
		if event.entity.force == game.forces.enemy then
			writeDebug("Enemy Spawner")
			for i = 1, #game.players, 1 do
			player = game.players[i]
         
				if player.connected and player.character.valid then
					player.surface.set_multi_command{command = {type=defines.command.attack, target=player.character, distraction=defines.distraction.by_enemy},unit_count = (20+math.floor(game.evolution_factor*100/#game.players)), unit_search_distance = 600}
				end
			end						
		else
				writeDebug("Friendly Spawner")
				game.evolution_factor = game.evolution_factor - 0.0002 * (1-game.evolution_factor)	* (1-game.evolution_factor)		
		end
	
	end
	

	
	---- Unit Launcher
	if global.tick < event.tick then
		if game.evolution_factor > 0.995 then
			global.evoFactorFloor = 10
		else
			global.evoFactorFloor = math.floor(game.evolution_factor * 10)
		end
		global.tick = global.tick + 1800
	end
	if (event.entity.name == "unit-cluster") then
		SpawnLaunchedUnits(event.entity)
	end
	


end



---------------------------------------------
-- Spawn Launched Units

function SpawnLaunchedUnits(enemy)
	local subEnemyName = subEnemyNameTable[enemy.name]
	if not subEnemyName then
		return
	end
	if subEnemyNameTable[enemy.name][global.evoFactorFloor] then
		subEnemyName = subEnemyNameTable[enemy.name][global.evoFactorFloor]
	end
	local number = subEnemyNumberTable[enemy.name][global.evoFactorFloor]
	for i = 1, number do
		local subEnemyPosition = enemy.surface.find_non_colliding_position(subEnemyName, enemy.position, 2, 0.5)
		if subEnemyPosition then
			enemy.surface.create_entity({name = subEnemyName, position = subEnemyPosition, force = game.forces.enemy})
		end
	end
end


---------------------------------------------
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
--script.on_init(On_Load)
script.on_load(On_Load)

script.on_configuration_changed(On_Init)
script.on_init(On_Init)

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if NE_Enemies_Config.QCCode then 
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end


if NE_Enemies_Config.QCCode then 

	script.on_event(defines.events.on_player_created, function(event)
		local player = game.players[event.player_index]
		start_items_A(player)
		start_items_B(player)
	end)


	function start_items_A(player)

		player.insert{name="iron-plate", count=100}
		player.insert{name="electronic-circuit", count=200}
		player.insert{name="steel-plate", count=50}
		player.insert{name="copper-plate", count=50}
		player.insert{name="iron-gear-wheel", count=50}
		player.insert{name="stone", count=50}
		player.insert{name="steel-axe", count=3}				  
		player.insert{name="submachine-gun", count=1}
		player.insert{name="piercing-rounds-magazine", count=150}  
		player.insert{name="combat-shotgun", count=1}
		player.insert{name="piercing-shotgun-shell", count=50}  
		player.insert{name="rail", count=50}  
		player.insert{name="burner-inserter", count=50}
		player.insert{name="inserter", count=30}
		player.insert{name="transport-belt", count=200}
		player.insert{name="small-electric-pole", count=20}
		player.insert{name="burner-mining-drill", count=20}
		player.insert{name="stone-furnace", count=35}
		player.insert{name="assembling-machine-1", count=20}
		player.insert{name="rocket-silo", count=2}


	end
	
	function start_items_B(player)
	
		player.insert{name="Artifact-collector-area", count=20}
		player.insert{name="small-alien-artifact", count=100}
		player.insert{name="Biological-bullet-magazine", count=200}

		
	end
end


