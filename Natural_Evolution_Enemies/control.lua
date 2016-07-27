---ENEMIES v.6.1.2
if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end


require ("util")
require ("config")


	
--- Artifact Collector
local interval = 300 -- this is an interval between the consecutive updates of a single collector
local artifactCollectorRadius = NE_Enemies_Config.ArtifactCollectorRadius
local itemCount = 6
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

local replaceableTiles =
{
  ["grass"] = "grass-medium",
  ["grass-medium"] = "grass-dry",
  ["grass-dry"] = "sand",
  ["sand"] = "sand-dark",
  ["sand-dark"] = "dirt",
  ["dirt"] = "dirt-dark"		
}

---------------------------------------------
script.on_event({defines.events.on_robot_built_entity,defines.events.on_built_entity,},function(event) On_Built(event) end)
script.on_event({defines.events.on_robot_pre_mined,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)
script.on_event(defines.events.on_entity_died,function(event) On_Death(event) end)


---------------------------------------------				 
function On_Load()

	if global.ArtifactCollectors ~= nil then
		script.on_event(defines.events.on_tick, function(event) ticker(event.tick) end)
	end	
	
end

---------------------------------------------				 
function On_Init()

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
	global.launch_units["unit-cluster"] = "unit-cluster"
	
	if global.ArtifactCollectors ~= nil then
		script.on_event(defines.events.on_tick, function(event) ticker(event.tick) end)
		global.update_check = true
        global.next_collector = global.next_collector or 1
	end
	
end

---------------------------------------------
function subscribe_ticker(tick)
	--this function subscribes handler to on_tick event and also sets global values used by it
	--it exists merely for a convenience grouping
	script.on_event(defines.events.on_tick,function(event) ticker(event.tick) end)
	global.ArtifactCollectors = {}
	global.next_check = game.tick + interval
	global.next_collector = 1
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
	

 	--------- If you kill a spawner, enemies will attach you.
	if (event.entity.type == "unit-spawner") then
		if event.entity.force == game.forces.enemy then
			writeDebug("Enemy Spawner Killed")
			local surface = event.entity.surface
			local force = event.entity.force
			local radius = 30
			local pos = event.entity.position
			local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}

			--local boom = surface.create_entity{name = "NE-Acid-explosion", position = pos, force =  force}
			
		-- find nearby players
			local players = surface.find_entities_filtered{area=area, type="player"}

	           -- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (20+math.floor(game.evolution_factor*100)), unit_search_distance = 600}
			end
					
		else
			writeDebug("Friendly Spawner")
			
		end
	
	end
	
	 	--------- An Enemy Unit Died
	if event.entity.force == game.forces.enemy and (event.entity.type == "unit") then
	
		local surface = event.entity.surface
		local force = event.entity.force
		local pos = event.entity.position	
		local currentTilename = surface.get_tile(pos.x, pos.y).name
		local New_tiles = {}
		writeDebug("The current tile is: " .. currentTilename)
	    	
		 for xxx=-2,2 do
			for yyy=-2,2 do
				new_position = {x = pos.x + xxx,y = pos.y + yyy}
				currentTilename = surface.get_tile(new_position.x, new_position.y).name
				if replaceableTiles[currentTilename] then
				table.insert(New_tiles, {name=replaceableTiles[currentTilename], position=new_position})	
				end
			end
		end
	--[[	
		if replaceableTiles[currentTilename] then
		table.insert(New_tiles, {name=replaceableTiles[currentTilename], position=pos})	
			--surface.set_tiles({{name=replaceableTiles[currentTilename], position=pos},{name=replaceableTiles[currentTilename], position={x=pos.x+1, y=pos.y+1}},{name=replaceableTiles[currentTilename], position={x=pos.x-1, y=pos.y+1}},{name=replaceableTiles[currentTilename], position={x=pos.x+1, y=pos.y-1}},{name=replaceableTiles[currentTilename], position={x=pos.x-1, y=pos.y-1}}})
		end
		]]
		
	surface.set_tiles(New_tiles)
	end
	
	
	
	
--[[ Moved to NE Buildings

	--------- Currently the Evolution Factor gets affected even if you or the enemy kills your Spawners. So this should help with that.
	if (event.entity.type == "unit-spawner") then
		if event.entity.force == game.forces.enemy then
			writeDebug("Enemy Spawner Killed")
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
	]]

	
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
	

	
    -- check for civil war 
    if event.force ~= nil then
        if ((event.force.name == "enemy") and (event.force.name == event.entity.force.name)) then
            if NE_Enemies_Config.allowCivilWar then
                -- let the enemy die but prevent loot drop
                event.entity.destroy()
            else 
                -- check if player or player things are near the area of combat
                local playerBattle = false
                local battleRadius = 60
                local playerObject = event.entity.surface.find_nearest_enemy({position = event.entity.position,
                                                                              max_distance = battleRadius,
                                                                              force = "enemy"})
                if playerObject ~= nil then
                    playerBattle = true
                end
                
                -- get bitters that have been affected by splash damage
                local deathRadius = 8
                local enemyEntities = event.entity.surface.find_entities_filtered({area = {{x = event.entity.position.x - deathRadius, y = event.entity.position.y - deathRadius}, 
                                                                                           {x = event.entity.position.x + deathRadius, y = event.entity.position.y + deathRadius}}, 
                                                                                   force = "enemy"})
                if not playerBattle then
                    -- kill around dead enemy to quell war
                    for _, enemyEntity in ipairs(enemyEntities) do
                        if (enemyEntity.type == "unit") and (enemyEntity.has_command()) then
                            enemyEntity.destroy()
                        end
                    end
                else
                    -- retarget each splash affected bitter to enemies first, then they might turn on themselves once everything around them is dead
                    local searchRadius = 60
                    for _, enemyEntity in ipairs(enemyEntities) do
                        local newTarget = event.entity.surface.find_nearest_enemy({position = enemyEntity.position,
                                                                                   max_distance = searchRadius,
                                                                                   force = "enemy"})
                        if newTarget ~= nil then
                            if (enemyEntity.type == "unit") and (enemyEntity.has_command()) then
                                enemyEntity.set_command({type=defines.command.attack, 
                                                         target=newTarget})
                            end
                        end
                    end
                end
            end
        end
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


