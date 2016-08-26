---ENEMIES v.6.3.0
if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end


require ("util")
require ("config")

	
--- Artifact Collector
local interval = 300 -- this is an interval between the consecutive updates of a single collector
local artifactCollectorRadius = NE_Enemies_Config.Artifact_Collector_Radius
local itemCount = NE_Enemies_Config.Artifact_Collector_Item_Count
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

--- Scorched Earth
local replaceableTiles =
{
  ["grass"] = "grass-medium",
  ["grass-medium"] = "grass-dry",
  ["grass-dry"] = "sand",
  ["sand"] = "sand-dark",
  ["sand-dark"] = "dirt",
  ["dirt"] = "dirt-dark"
}
local waterTiles =
{
  ["deepwater"] = true,
  ["deepwater-green"] = true,
  ["water"] = true,
  ["water-green"] = true
}


-- Auto repair items
local autoRepairType = 
{
    ["straight-rail"] = true,
    ["curved-rail"] = true,
    ["rail-signal"] = true,
    ["rail-chain-signal"] = true
}
local autoRepairName = 
{
    ["bi-big-wooden-pole"] = true,
}


-- List of Entities Types that can catch fire if destoyed
local catchFire = 
{
    ["furnace"] = true,
	["transport-belt"] = false,
	["boiler"] = false,
	["container"] = false,
	["electric-pole"] = false,
    ["generator"] = true,
    ["offshore-pump"] = true,
	["inserter"] = true,
	["radar"] = true,
	["lamp"] = false,
	["pipe-to-ground"] = false,
	["assembling-machine"] = true,
	["wall"] = false,
	["underground-belt"] = false,
	["loader"] = true,
	["splitter"] = false,
	["car"] = true,
	["solar-panel"] = true,
	["locomotive"] = true,
	["cargo-wagon"] = true,
	["gate"] = false,
	["lab"] = true,
	["rocket-silo"] = true,
	["roboport"] = true,
	["storage-tank"] = true,
	["pump"] = true,
	["market"] = true,
	["accumulator"] = true,
	["beacon"] = true,
	["mining-drill"] = true,
	["electric-turret"] = true,
	["ammo-turret"] = true,
	["turret"] = false,
	["straight-rail"] = false,
    ["curved-rail"] = false,
    ["rail-signal"] = false,
    ["rail-chain-signal"] = false	
}

-- Corpse Size = Fire Size
local corpseSize = 
{
    ["furnace"] = "medium-remnants",
	["transport-belt"] = "small-remnants",
	["boiler"] = "small-remnants",
	["container"] = "small-remnants",
	["electric-pole"] = "small-remnants",
    ["generator"] = "big-remnants",
    ["offshore-pump"] = "small-remnants",
	["inserter"] = "small-remnants",
	["radar"] = "big-remnants",
	["lamp"] = "small-remnants",
	["pipe-to-ground"] = "small-remnants",
	["assembling-machine"] = "big-remnants",
	["wall"] = "small-remnants",
	["underground-belt"] = "small-remnants",
	["loader"] = "small-remnants",
	["splitter"] = "medium-remnants",
	["car"] = "medium-remnants",
	["solar-panel"] = "big-remnants",
	["locomotive"] = "big-remnants",
	["cargo-wagon"] = "medium-remnants",
	["gate"] = "small-remnants",
	["lab"] = "big-remnants",
	["rocket-silo"] = "big-remnants",
	["roboport"] = "big-remnants",
	["storage-tank"] = "medium-remnants",
	["pump"] = "small-remnants",
	["market"] = "big-remnants",
	["accumulator"] = "medium-remnants",
	["beacon"] = "big-remnants",
	["mining-drill"] = "big-remnants",
	["electric-turret"] = "big-remnants",
	["ammo-turret"] = "big-remnants",
	["turret"] = "big-remnants",
	["straight-rail"] = "small-remnants",
    ["curved-rail"] = "small-remnants",
    ["rail-signal"] = "small-remnants",
    ["rail-chain-signal"] = "small-remnants"
}


--- Killing Trees
local tree_names = {
	["tree-01"] = true,
	["tree-02"] = true,
	["tree-02-red"] = true,
	["tree-03"] = true,
	["tree-04"] = true,
	["tree-05"] = true,
	["tree-06"] = true,
	["tree-06-brown"] = true,
	["tree-07"] = true,
	["tree-08"] = true,
	["tree-08-brown"] = true,
	["tree-08-red"] = true,
	["tree-09"] = true,
	["tree-09-brown"] = true,
	["tree-09-red"] = true
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
script.on_event(defines.events.on_trigger_created_entity, function(event)
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
		
 	--------- Did you really just kill that tree...
	if (event.entity.type == "tree") and tree_names[event.entity.name] then
	
		writeDebug("Tree Mined")
		local surface = event.entity.surface
		local force = event.entity.force
		local radius = 15
		local pos = event.entity.position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}	
		-- find nearby players
		local players = surface.find_entities_filtered{area=area, type="player"}
		local attack_chance = math.random(100)

		writeDebug("Attack Chance: "..attack_chance)
		writeDebug("Evo Factor: "..math.floor(game.evolution_factor*100))
		if attack_chance < math.floor(game.evolution_factor*100) then
			-- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (1+math.floor(game.evolution_factor*30)), unit_search_distance = 600}
			end
		end

	end

    --Artifact collector
    if event.entity.name == "Artifact-collector" then
        local artifacts = global.ArtifactCollectors;
        for i=1,#artifacts do
            if artifacts[i] == event.entity then
                table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
                if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
                break
            end
        end
        if #artifacts == 0 then
        --and here artifacts=nil would not cut it.
            global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
            script.on_event(defines.events.on_tick, nil);
            --but it's surely better done here than during on_tick
        end
    end

	
end

function On_Death(event)


	
	--- Buildings catch fire if destroyed.
	--if (event.force == game.forces.enemy) and catchFire[event.entity.type] then	
	if NE_Enemies_Config.Burning_Buildings and catchFire[event.entity.type] then
		local surface = event.entity.surface
		local force = event.entity.force	
		local pos = event.entity.position
		local e_corpse = corpseSize[event.entity.type]
		
		writeDebug("Corpse Size: "..e_corpse)
		if (force == game.forces.enemy) then
		-- do nothing
		elseif e_corpse == "medium-remnants" then
			surface.create_entity({name="medium-fire-cloud", position=pos, force= "enemy"})
		elseif e_corpse == "big-remnants" then
			surface.create_entity({name="big-fire-cloud", position=pos, force= "enemy"})
		else
			surface.create_entity({name="small-fire-cloud", position=pos, force= "enemy"})
		end	
		
	end	

 	--------- If you kill a spawner, enemies will attach you.
	if (event.entity.type == "unit-spawner") then
		if event.entity.force == game.forces.enemy then
			writeDebug("Enemy Spawner Killed")
			local surface = event.entity.surface
			local force = event.entity.force
			local radius = 60
			local pos = event.entity.position
			local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}

			--local boom = surface.create_entity{name = "NE-Acid-explosion", position = pos, force =  force}
			
		-- find nearby players
			local players = surface.find_entities_filtered{area=area, type="player"}

	           -- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (20+math.floor(game.evolution_factor*100)), unit_search_distance = 600}
			end
			
			if NE_Enemies_Config.Scorched_Earth then
				Scorched_Earth(surface, pos, 6)		
			end
			
		else
			writeDebug("Friendly Spawner")
			
		end
	
	end
	
	 	--------- An Enemy Unit Died
	if event.entity.force == game.forces.enemy and (event.entity.type == "unit") then
		local surface = event.entity.surface
		local pos = event.entity.position	

		if NE_Enemies_Config.Scorched_Earth then
			Scorched_Earth(surface, pos, 2)		
		end
	end

	
 	--------- Did you really just kill that tree...
	if (event.entity.type == "tree") and tree_names[event.entity.name] then
		writeDebug("Tree Killed")
		local surface = event.entity.surface
		local force = event.entity.force
		local radius = 15
		local pos = event.entity.position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}	
		-- find nearby players
		local players = surface.find_entities_filtered{area=area, type="player"}
		local attack_chance = math.random(100)

		writeDebug("Attack Chance: "..attack_chance)
		writeDebug("Evo Factor: "..math.floor(game.evolution_factor*100))
		if attack_chance < math.floor(game.evolution_factor*100) then
			-- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (1+math.floor(game.evolution_factor*30)), unit_search_distance = 600}
			end
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


	--Artifact collector
    if event.entity.name == "Artifact-collector" then
        local artifacts=global.ArtifactCollectors;
        for i=1,#artifacts do
            if artifacts[i] == event.entity then
                table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
                if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
                break
            end
        end
        if #artifacts == 0 then
        --and here artifacts=nil would not cut it.
            global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
            script.on_event(defines.events.on_tick, nil);
            --but it's surely better done here than during on_tick
        end
    end
	
	
		
    -- auto repair things like rails, and signals. Also by destroying the entity the enemy retargets.
    if (event.force == game.forces.enemy) and (autoRepairType[event.entity.type] or autoRepairName[event.entity.name]) then
        local repairPosition = event.entity.position
        local repairName = event.entity.name
        local repairForce = event.entity.force
        local repairDirection = event.entity.direction
        event.entity.destroy()
        local entityRepaired = game.surfaces[1].create_entity({position=repairPosition,
                                                               name=repairName,
                                                               direction=repairDirection,
                                                               force=repairForce})
        local enemies = game.surfaces[1].find_entities_filtered({area = {{x=repairPosition.x-20, y=repairPosition.y-20},
                                                                         {x=repairPosition.x+20, y=repairPosition.y+20}},
                                                                 type = "unit",
                                                                 force = game.forces.enemy})
        for i=1, #enemies do
            local enemy = enemies[i]
            enemy.set_command({type=defines.command.wander,
                               distraction=defines.distraction.by_enemy})
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
function Scorched_Earth(surface, pos, size)
	--- Turn the terrain into desert
	local New_tiles = {}
	local Water_Nearby_near = false
	local Water_Nearby_far = false
	local search_size = size + 1
   
	for xxx = -size, size do
		for yyy = -size, size do
			--made local
			local new_position = {x = pos.x + xxx,y = pos.y + yyy}
			local currentTilename = surface.get_tile(new_position.x, new_position.y).name
			writeDebug("The current tile is: " .. currentTilename)

			if waterTiles[currentTilename] then
				Water_Nearby_near = true
				--added break to stop this loop
				break
			--replaced if with elseif
			elseif replaceableTiles[currentTilename] then
				table.insert(New_tiles, {name=replaceableTiles[currentTilename], position=new_position})   
			end
		end
		--if water nearby then stop loop
		if Water_Nearby_near then
			break
		end
		
		for xxx = -(search_size), (search_size) do
			for yyy = -(search_size), (search_size) do
				--no need to go through the tiles you already checked above
				--so only check tiles that are outside the square that was checked in the above for loops
				if xxx < -size or xxx > size or
					yyy < -size or yyy > size then
					--made local
					local new_position = {x = pos.x + xxx,y = pos.y + yyy}
					local currentTilename = surface.get_tile(new_position.x, new_position.y).name

					if waterTiles[currentTilename] then
						Water_Nearby_near = true
						--added break to stop this loop
						break
					end
				end
			end
			--if water nearby then stop loop
			if Water_Nearby_near then
				break
			end
		end
		
	end

	if Water_Nearby_near then
		-- Water found, so don't replace any tiles.	
		--surface.set_tiles(New_tiles, false)
	else
		for xxx = -(search_size+5), (search_size+5) do
			for yyy = -(search_size+5), (search_size+5) do
				--no need to go through the tiles you already checked above
				--so only check tiles that are outside the square that was checked in the above for loops
				if xxx < -search_size or xxx > search_size or
					yyy < -search_size or yyy > search_size then
					--made local
					local new_position = {x = pos.x + xxx,y = pos.y + yyy}
					local currentTilename = surface.get_tile(new_position.x, new_position.y).name

					if waterTiles[currentTilename] then
						Water_Nearby_far = true
						--added break to stop this loop
						break
					end
				end
			end
			--if water nearby then stop loop
			if Water_Nearby_far then
				break
			end
		end

		if Water_Nearby_far then 
			surface.set_tiles(New_tiles, false)
		else
			surface.set_tiles(New_tiles)
		end
	end
end

----------------------------------------

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


