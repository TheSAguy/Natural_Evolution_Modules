---ENEMIES v.7.2.0
local QC_Mod = false


if not NE_Enemies_Config then NE_Enemies_Config = {} end
if not NE_Enemies_Config.mod then NE_Enemies_Config.mod = {} end

if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value


require ("util")
require ("prototypes.Vanilla_Changes.Unit_Launcher_Cluster")

if QC_Mod then
	---**************
	require ("prototypes.Vanilla_Changes.initialSpawn")
	---*************
end
--- Scorched Earth
local replaceableTiles =
{
  -- vanilla
	["grass-medium"] = "grass",
	["grass"] = "grass-dry",
	["grass-dry"] = "sand",
	["sand"] = "sand-dark",
	["sand-dark"] = "dirt",
	["dirt"] = "dirt-dark",
	["dirt-dark"] = "red-desert",
	["red-desert"] = "red-desert-dark",
  

  -- Alien biomes
	["grass-yellow"] = "grass-yellow-fade",
	["grass-orange"] = "sand-orange",
	["grass-red"] = "dirt-red",
	["grass-yellow-fade"] = "grass-dry",
	["grass-blue"] = "grass-blue-fade",
	["grass-purple"] = "grass-purple-fade",
	["grass-blue-fade"] = "grass-dry",
	["grass-purple-fade"] = "grass-dry",
	["dirt-brown"] = "dirt-brown-dark",
	["dirt-brown-dark"] = "dirt",
	["dirt-tan"] = "dirt-tan-dark",
	["dirt-tan-dark"] = "dirt",
	["dirt-red"] = "dirt-red-dark",
	["dirt-red-dark"] = "sand-red",
	["dirt-grey"] = "dirt-grey-dark",
	["dirt-grey-dark"] = "sand-grey",
	["dirt-dull"] = "dirt-dull-dark",
	["dirt-dull-dark"] = "sand-dull",
	["sand-orange"] = "sand-orange-dark",
	["sand-orange-dark"] = "sand",
	["sand-gold"] = "sand-gold-dark",
	["sand-gold-dark"] = "sand",
	["sand-red"] = "sand-red-dark",
	["sand-red-dark"] = "sand",
	["sand-grey"] = "sand-grey-dark",
	["sand-grey-dark"] = "sand",
	["sand-dull"] = "sand-dull-dark",
	["sand-dull-dark"] = "sand",
	["volcanic-cool"] = "volcanic-medium",
	["snow"] = "red-desert-dark",
	["volcanic-medium"] = "volcanic-hot",
	["volcanic-hot"] = "red-desert-dark"

 
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
local function On_Init()


	--- Used for Unit Turrets
	if not global.tick then
		global.tick = game.tick
	end
	
	if not global.evoFactorFloor then
		if game.forces.enemy.evolution_factor > 0.995 then
			global.evoFactorFloor = 10
		else
			global.evoFactorFloor = math.floor(game.forces.enemy.evolution_factor * 10)
		end
		global.tick = global.tick + 1800
	end
	
	global.launch_units={}--this is used to define which equipment is put initially
	global.launch_units["unit-cluster"] = "unit-cluster"
	
	if QC_Mod then
		---*************
		local surface = game.surfaces['nauvis']
		Initial_Spawn(surface)
		---*************
	end
	
end


---------------------------------------------				 
local function On_Config_Change()

	-- enable researched recipes
	for i, force in pairs(game.forces) do
		for _, tech in pairs(force.technologies) do
			if tech.researched then
				for _, effect in pairs(tech.effects) do
					if effect.type == "unlock-recipe" then          
						force.recipes[effect.recipe].enabled = true
					end
				end
			end
		end
	end
	
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
local function On_Remove(event)
		
	local entity = event.entity		
 	--------- Did you really just kill that tree...
	if entity.valid and settings.startup["NE_Tree_Hugger"].value and (entity.type == "tree") and tree_names[entity.name] then
	
		writeDebug("Tree Mined")
		local surface = entity.surface
		local force = entity.force
		local radius = 15 * NE_Enemies.Settings.NE_Difficulty
		local pos = entity.position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}	
		-- find nearby players
		local players = surface.find_entities_filtered{area=area, type="player"}
		local attack_chance = math.random(100)

		writeDebug("Attack Chance: "..attack_chance)
		writeDebug("Evo Factor: "..math.floor(game.forces.enemy.evolution_factor*100))
		if attack_chance < math.floor(game.forces.enemy.evolution_factor*100) then
			-- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (2 * NE_Enemies.Settings.NE_Difficulty + math.floor(game.forces.enemy.evolution_factor * 30)), unit_search_distance = 600 * NE_Enemies.Settings.NE_Difficulty}
			end
		end

	end

	
end


---------------------------------------------
local function On_Death(event)


	local entity = event.entity	
	--- Buildings catch fire if destroyed.
	if entity.valid and settings.startup["NE_Burning_Buildings"].value and catchFire[entity.type] then
		local surface = entity.surface
		local force = entity.force	
		local pos = entity.position
		local e_corpse = corpseSize[entity.type]
		
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
	if entity.valid and (entity.type == "unit-spawner") then
		if entity.force == game.forces.enemy then
			writeDebug("Enemy Spawner Killed")
			local surface = entity.surface
			local force = entity.force
			local radius = 60 * NE_Enemies.Settings.NE_Difficulty
			local pos = entity.position
			local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}
				
		-- find nearby players
			local players = surface.find_entities_filtered{area=area, type="player"}

	           -- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (20 * NE_Enemies.Settings.NE_Difficulty + math.floor(game.forces.enemy.evolution_factor * 100)), unit_search_distance = 600 * NE_Enemies.Settings.NE_Difficulty}
			end
			
			if settings.startup["NE_Scorched_Earth"].value then
				Scorched_Earth(surface, pos, 6)		
			end
			
		else
			writeDebug("Friendly Spawner")
			
		end
	
	end
	
	 	--------- An Enemy Unit Died
	if entity.valid and entity.force == game.forces.enemy and (entity.type == "unit") then
		local surface = entity.surface
		local pos = entity.position	

		if settings.startup["NE_Scorched_Earth"].value then
			Scorched_Earth(surface, pos, 2)		
		end
	end

	
 	--------- Did you really just kill that tree...
	if entity.valid and settings.startup["NE_Tree_Hugger"].value and (entity.type == "tree") and tree_names[entity.name] then
		writeDebug("Tree Killed")
		local surface = entity.surface
		local force = entity.force
		local radius = 15 * NE_Enemies.Settings.NE_Difficulty
		local pos = entity.position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}	
		-- find nearby players
		local players = surface.find_entities_filtered{area=area, type="player"}
		local attack_chance = math.random(100)

		writeDebug("Attack Chance: "..attack_chance)
		writeDebug("Evo Factor: "..math.floor(game.forces.enemy.evolution_factor*100))
		if attack_chance < math.floor(game.forces.enemy.evolution_factor*100) then
			-- send attacks to all nearby players
			for i,player in pairs(players) do
				player.surface.set_multi_command{command = {type=defines.command.attack, target=player, distraction=defines.distraction.by_enemy},unit_count = (2 * NE_Enemies.Settings.NE_Difficulty + math.floor(game.forces.enemy.evolution_factor * 30)), unit_search_distance = 600 * NE_Enemies.Settings.NE_Difficulty}
			end
		end
	end
	
	---- Unit Launcher
	if global.tick < event.tick then
		if game.forces.enemy.evolution_factor > 0.995 then
			global.evoFactorFloor = 10
		else
			global.evoFactorFloor = math.floor(game.forces.enemy.evolution_factor * 10)
		end
		global.tick = global.tick + 1800
	end
	
	if (entity.name == "unit-cluster") then
		SpawnLaunchedUnits(entity)
	end


		
    -- auto repair things like rails, and signals. Also by destroying the entity the enemy retargets.
    if entity.valid and (event.force == game.forces.enemy) and (autoRepairType[entity.type] or autoRepairName[entity.name]) then

        local repairPosition = entity.position
        local repairName = entity.name
        local repairForce = entity.force
		local surface = entity.surface
        local repairDirection = entity.direction
		local wires
		
		if (entity.type == "electric-pole") then
			wires = entity.neighbours
		end
		
        entity.destroy()
        local entityRepaired = surface.create_entity({position=repairPosition,
                                                               name=repairName,
                                                               direction=repairDirection,
                                                               force=repairForce})
															   

		if wires then
			for connectType,neighbourGroup in pairs(wires) do
				if connectType == "copper" then
				for _,v in pairs(neighbourGroup) do
					entityRepaired.connect_neighbour(v);
				end
				elseif connectType == "red" then
				for _,v in pairs(neighbourGroup) do
					entityRepaired.connect_neighbour({wire = defines.wire_type.red, target_entity = v});
				end
				elseif connectType == "green" then
				for _,v in pairs(neighbourGroup) do
					entityRepaired.connect_neighbour({wire = defines.wire_type.green, target_entity = v});
				end
				end
			end
		end
		
		
        local enemies = surface.find_entities_filtered({area = {{x=repairPosition.x-20, y=repairPosition.y-20},
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


script.on_configuration_changed(On_Config_Change)
script.on_init(On_Init)


local pre_remove_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined}
script.on_event(pre_remove_events, On_Remove)

local death_events = {defines.events.on_entity_died}
script.on_event(death_events, On_Death)




---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if QC_Mod == true then  
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end


