-- NE BUILDINGS Ver = 0.18.04

local QC_Mod = false
local NEBuildings = require('common')('Natural_Evolution_Buildings')
local Event = require('__stdlib__/stdlib/event/event').set_protected_mode(true)

require ("util")
require ("control_bio_cannon")
require ("control_artifact_collector")
require ("control_acs")
require ("control_terraforming")
require ("control_evolution")
require ("libs/EvoGUI")

--- Used for Testing -----
--require ("Test_Spawn")



--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value

--- Conversion Ammo Types
local AMMO_TYPES = {
   ["bi-basic-dart-magazine_c"] = true,
   ["bi-standard-dart-magazine_c"] = true,
   ["bi-enhanced-dart-magazine_c"] = true,
   ["bi-poison-dart-magazine_c"] = true,
   ["firearm-magazine_c"] = true,
   ["copper-bullet-magazine_c"] = true,
   ["piercing-rounds-magazine_c"] = true,
   ["uranium-rounds-magazine_c"] = true,
   ["Biological-bullet-magazine_c"] = true
}


---------------------------------------------				 
local function On_Init()
 --writeDebug("NE Buildings Initialize")
 
 	--- Artifact Collector
	global.world = {}
	global.world.itemCollectorLookup = {}
	global.world.itemCollectorEvents = {}
	
	--- For Bio Cannon
	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end

---- Evolution_MOD
	if global.Evolution_MOD == nil then
      global.Evolution_MOD = {}
	end
	
	---- Alien Control Initialization ----	
	if not global.beacons then
		global.beacons = {}
	end
	if not global.minds then
		global.minds = {}
	end
	if not global.hiveminds then
		global.hiveminds = {} -- Bases / Spawners
	end

	--- Alien_Control_Station Difficulty settings	
	if global.NE_Buildings.Settings.Conversion_Difficulty == 1 then
		global.minds.difficulty = 3 -- Easy difficulty
	elseif global.NE_Buildings.Settings.Conversion_Difficulty == 2 then
		global.minds.difficulty = 5 -- Normal 
	else 
		global.minds.difficulty = 10 -- Hard
	end

	---- Terraforming Initialization ----	
	if not global.numTerraformingStations then
          global.numTerraformingStations = 0
    elseif global.numTerraformingStations < 0 then
          global.numTerraformingStations = 0
	end
	
	if not global.factormultiplier then
		global.factormultiplier = 0
    elseif global.factormultiplier < 0 then
       global.factormultiplier = 0
	end	

	if not global.Total_TerraformingStations_Evo_Deduction then
        global.Total_TerraformingStations_Evo_Deduction = 0
    elseif global.Total_TerraformingStations_Evo_Deduction < 0 then
        global.Total_TerraformingStations_Evo_Deduction = 0
	end

	
	if global.deduction_constant == nil or global.deduction_constant == 0 then
		global.deduction_constant = 0.00020 -------- DEDUCTION CONSTANT
	end
	
	---- Living Wall Init
	if global.Living_Walls_Table == nil then
          global.Living_Walls_Table = {}
	end

	
	-- enable researched recipes
	for i, force in pairs(game.forces) do
		force.reset_technologies()
		force.reset_recipes()
	end
	
	if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
	end
	
	if not global.laid_pheromone_concrete then
		global.laid_pheromone_concrete = {}
	end	
	
	
	--- Settup Settings
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value

	
	--[[
	if QC_Mod then
		---*************
		local surface = game.surfaces['nauvis']
		Test_Spawn(surface)
		---*************
	end
	]]
end
		 

--------------------------------------------------------------------
local function On_Load()

	--- For Bio Cannon
  if global.Bio_Cannon_Table ~= nil then
    Event.register(defines.events.on_tick, function(event) end)
  end
end


---------------------------------------------				 
local function On_Config_Change()

	--- EvoGUI Stuff
	if game.active_mods["EvoGUI"] then 	
		if not global.evo_gui then global.evo_gui = {} end
		EvoGUI.setup()		
	end
	
	--- For Bio Cannon
	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
    end
  
 	--- Artifact Collector
	if global.world == nil then
		global.world = {}
		global.world.itemCollectorLookup = {}
		global.world.itemCollectorEvents = {}
	end

	
	if global.deduction_constant == nil or global.deduction_constant == 0 then
		global.deduction_constant = 0.00020 -------- DEDUCTION CONSTANT
	end	
	
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
	
	if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
	end
	

	if not global.laid_pheromone_concrete then
		global.laid_pheromone_concrete = {}
	end	

	
	--- Settup Settings	
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
		
end

Event.register(defines.events.on_player_joined_game, function(event)
	
	if global.deduction_constant == nil or global.deduction_constant == 0 then
		global.deduction_constant = 0.00020 -------- DEDUCTION CONSTANT
	end	
   
end)


---------------------------------------------
local function On_Built(event)

local entity = event.created_entity
local surface = entity.surface
local position = entity.position	
local force = entity.force


	
	--- Artifact Collector	- Thanks to Veden for letting me use this code!
	
    if (entity.name == "Artifact-collector-area") then 

	local x = entity.position.x
	local y = entity.position.y
	local chest

		if (entity.name == "Artifact-collector-area") then
			entity.destroy()
			chest = surface.create_entity({name = "Artifact-collector",
						   position = position,
						   force = force})
			position_r = {position.x + 1, position.y}
			entity = surface.create_entity({name="Artifact-collector_r",
							position = position_r,
							force = force})

		else	    
			local ghosts = surface.find_entities_filtered({name="entity-ghost",
								   area={{x=x-1,
									  y=y-1},
									   {x=x+1,
									y=y+1}},
								   limit=1})
			if (#ghosts > 0) then
			local ghost = ghosts[1]
			if (ghost.ghost_name == "Artifact-collector") then
				local conflicts
				conflicts, chest = ghost.revive()
			end
			else
			chest = surface.create_entity({name = "Artifact-collector",
							   position = position,
							   force = force})
			end
		end
		
		if chest and chest.valid then
			local pair = { chest, entity }
			global.world.itemCollectorLookup[chest.unit_number] = pair
			global.world.itemCollectorLookup[entity.unit_number] = pair
			entity.backer_name = ""
		end
    end	

	
	--- Living Wall built
	if entity.valid and entity.name == "ne-living-wall" then
		if global.Living_Walls_Table == nil then
          global.Living_Walls_Table = {}
		end
		--writeDebug("Living Wall has been built")				

		local Created_L_Wall = event.created_entity
		
		table.insert(global.Living_Walls_Table, Created_L_Wall)
		
	end

	
	--- Alien Control Station has been built	
	if entity.valid and entity.name == "AlienControlStation_Area" then
		local newAlienControlStation
		local surface = event.created_entity.surface
		local force = event.created_entity.force	
		--writeDebug("ACS has been built")			
		--writeDebug("The ACS Difficulty is: " .. global.minds.difficulty)  					
			
		newAlienControlStation = surface.create_entity({name = "AlienControlStation", position = event.created_entity.position, force = force})

		table.insert(global.beacons, newAlienControlStation)
		event.created_entity.destroy()
		
	end	


	
   --- Terraforming Station has been built
	if entity.valid and entity.name == "TerraformingStation_New" then
	
		if global.numTerraformingStations < 0 then
			global.numTerraformingStations = 0
		end

		global.numTerraformingStations = global.numTerraformingStations + 1
      
		global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
		--writeDebug("The the number of Terraforming Stations: " .. global.numTerraformingStations)
	  
		position_c = {position.x - 1.7, position.y + 1.7}
		T_Station_Container = surface.create_entity({name = "TerraformingStation_c", position = position_c, direction = event.created_entity.direction, force = force})
	
		T_Station_Container.minable = false
		T_Station_Container.destructible = false
		T_Station_Container.set_request_slot({name = "Alien-Stimulant", count = "10"}, 1)		
	
		global.Terraforming_Station_Table[entity.unit_number] = {radar=entity, inventory=T_Station_Container}
	   -- writeDebug("The Radar # is: "..entity.unit_number)
		--writeDebug("The Container # is: "..T_Station_Container.unit_number)
	  
	end   

	
		
	--- Bio Cannon (Hive Buster) has been built
	if entity.valid and entity.name == "bi-bio-cannon-area" then
	
	local New_Bio_Cannon
	local New_Bio_CannonR
	
	--writeDebug("Bio Cannon has been built")				


		-- Hidden Radar
		New_Bio_CannonR = surface.create_entity({
		  name = "Bio-Cannon-r",
		  position = position,
		  direction = event.created_entity.direction,
		  force = force
		})

		-- New Cannon, the first was just used for Radius overlay
		-- (If normally built -- if built from blueprint we just use the same code anyway.)
		New_Bio_Cannon = surface.create_entity({
		  name = "bi-bio-cannon",
		  position = position,
		  direction = event.created_entity.direction,
		  force = force
		})
		New_Bio_Cannon.health = event.created_entity.health
		
	
		New_Bio_CannonR.operable = false
		New_Bio_CannonR.destructible = false
		New_Bio_CannonR.minable = false
		
		if global.Bio_Cannon_Table == nil then
			global.Bio_Cannon_Table = {}
			Event.register(defines.events.on_tick, function(event) end)
		end

		-- Group Multiple Entities Together
		table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon, New_Bio_CannonR, 0})

		-- Remove the "Overlay" Entity
		event.created_entity.destroy()
		
	end


	
end


---------------------------------------------
local function On_Remove(event)

	local entity = event.entity	

	
	  --- fully heal the items that need a refresh in the alien hatchery anyway to avoid having multiple item stacks for damaged items.
	if entity.valid and event.name ~= defines.events.on_entity_died then
		if (
				entity.name == "small-worm-turret-player" or
				entity.name == "medium-worm-turret-player" or
				entity.name == "big-worm-turret-player" or
				entity.name == "behemoth-worm-turret-player" or
				entity.name == "Natural_Evolution_Biter-Spawner" or
				entity.name == "Natural_Evolution_Spitter-Spawner" or
				entity.name == "ne-living-wall" 
			) then
			entity.health = 100000 -- Note: Just needs to be higher or identical to maxhealth
		end
	end
	
	--- Artifact Collector	- Thanks to Veden for letting me use this code!
    if entity.valid and (entity.name == "Artifact-collector" or entity.name == "Artifact-collector_r") then 
		local pair = global.world.itemCollectorLookup[entity.unit_number]
		if pair then
			local chest = pair[1]
			local dish = pair[2]

			if chest and chest.valid then
				global.world.itemCollectorLookup[chest.unit_number] = nil
				if destroyed and (entity == chest) then
					chest.die()
				elseif (entity ~= chest) then
					chest.destroy()
				end
			end
			
			if dish and dish.valid then
				global.world.itemCollectorLookup[dish.unit_number] = nil
				if destroyed and (entity ~= dish) then
					dish.die()
				elseif (entity ~= dish) then
					dish.destroy()
				end
			end
			
		end
    end
	

   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end

		
		--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation_New"   then
		
		global.Terraforming_Station_Table[entity.unit_number].inventory.destroy()
		global.Terraforming_Station_Table[entity.unit_number] = nil
		T_Count()	
		
	end
	

end


---------------------------------------------
local function On_Death(event)

	local entity = event.entity	
	local surface = entity.surface
	local pos = entity.position	

	


  	--Artifact collector
    --if entity.valid and entity.name == "Artifact-collector" then 
	if entity.valid and (entity.name == "Artifact-collector" or entity.name == "Artifact-collector_r") then 
		local pair = global.world.itemCollectorLookup[entity.unit_number]
		if pair then
			local chest = pair[1]
			local dish = pair[2]

			if chest and chest.valid then
				global.world.itemCollectorLookup[chest.unit_number] = nil
				if destroyed and (entity == chest) then
					chest.die()
				elseif (entity ~= chest) then
					chest.destroy()
				end
			end
			
			if dish and dish.valid then
				global.world.itemCollectorLookup[dish.unit_number] = nil
				if destroyed and (entity ~= dish) then
					dish.die()
				elseif (entity ~= dish) then
					dish.destroy()
				end
			end
		end
    end
	
	--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation_New"   then
		
		global.Terraforming_Station_Table[entity.unit_number].inventory.destroy()
		global.Terraforming_Station_Table[entity.unit_number] = nil
		T_Count()	
		
	end
	

   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end
	

 	--------- Spawner killed
	if entity.valid and (entity.type == "unit-spawner") and (entity.force == game.forces.enemy) and global.NE_Buildings.Settings.Battle_Marker then

		--writeDebug("Enemy Spawner Killed")
		local force = event.force

		Battle_Marker = surface.create_entity({name = "battle_marker", position = pos, force = force})
		Battle_Marker.destructible = false		

	end

	
	--- Conversion Ammo Stuff
	-- Nexela Code! Thanks for your help!
	local ammo
	if event.force ~= nil and entity.force.name == "enemy" and entity.type == "unit" and event.cause then 
	--writeDebug("Step 1 of Conversion Check")
		
		if event.cause.type == "ammo-turret" then
		--writeDebug("Step 2a of Conversion Check: Turret Killed Unit")
			local turret = event.cause
			local inventory = turret.get_inventory(defines.inventory.turret_ammo)
			--writeDebug("Inventory Name: "..inventory)
			for k in pairs(inventory.get_contents()) do
				if AMMO_TYPES[k] then
					ammo = inventory.find_item_stack(k)
					break
				end
			end
			
		elseif event.cause.type == "character" then
		--writeDebug("Step 2b of Conversion Check: Player Killed Unit")
			local character = event.cause
			local index = character.selected_gun_index
			ammo = character.get_inventory(defines.inventory.character_ammo)[index]
			--writeDebug("Inventory Name: "..ammo.name)
		--else
			--writeDebug("Step 2c of Conversion Check: SOMETHING else Killed Unit")
		end

		if ammo and ammo.valid_for_read and AMMO_TYPES[ammo.name] then
			local Convert = surface.create_entity({name = entity.name, position = pos, force = event.cause.force.name})
			Convert.health = entity.prototype.max_health / 4 -- converted unit will be at 25% health
		end
	end
	
	
end


----------------Radars Scanning Function, used by Terraforming Sataion and Thumper -----------------------------
Event.register(defines.events.on_sector_scanned, function(event)
	
	---- Each time a Terraforming Station scans a sector, reduce the evolution factor ----	
	if event.radar.name == "TerraformingStation_New" then
		--writeDebug("The Unit # is: "..event.radar.unit_number)
		local num = (event.radar.unit_number)
		Reduce_Evolution(global.Terraforming_Station_Table[num])
		
	end

	
	--- Each time a Thumper "Scans", it will attract biters in the area
	if event.radar.name == "Thumper" then
		event.radar.surface.set_multi_command{command = {type=defines.command.attack, target=event.radar, distraction=defines.distraction.by_enemy},unit_count = 10, unit_search_distance = 500}
		--writeDebug("Thumper Scanned, units should attack")   
    end   
	

    if (event.radar.name == "Artifact-collector_r") then
		local count = #global.world.itemCollectorEvents
		if (count <= 20) then	    
			global.world.itemCollectorEvents[count+1] = event.radar.unit_number
		end
    end
	
end)


--------------------------------------------
--- Living Wall & Pheromone Concrete Stuff
Event.register(defines.events.on_tick, function(event)	



	--- EvoGUI Stuff
		--- EvoGUI Stuff
	if game.active_mods["EvoGUI"] then 		
	
		if not global.evo_gui then global.evo_gui = {} end

			if not global.evo_gui.detected then
				EvoGUI.setup()
			end
			
			if global.evo_gui.detected and game.tick % 10 == 0 then
				if remote.interfaces.EvoGUI then
					EvoGUI.update_gui()
				end
			end
	end


	if game.tick % (60 * 60 * 10) == 0 then -- 3600 one min

	
		--Pheromone Concrete Stuff
		if #global.laid_pheromone_concrete > 0 then
	
		
			local New_tiles = {}
			local Tile_test = false	
			local last_element_index = 1
			
			-- Check to make sure tiles are "pheromone_concrete"
			for current_index = 1, #global.laid_pheromone_concrete do 
				local surface = global.laid_pheromone_concrete[current_index].surface
				local currentTilename = surface.get_tile(global.laid_pheromone_concrete[current_index].position).name
			  
				if currentTilename == "pheromone_concrete" then   

					if current_index ~= last_element_index then
					  global.laid_pheromone_concrete[last_element_index] = global.laid_pheromone_concrete[current_index]
					  global.laid_pheromone_concrete[current_index] = nil
					end
					
					last_element_index = last_element_index + 1
					
				else
				
					global.laid_pheromone_concrete[current_index] = nil
					
				end

			end

			
			
		for i = 1, #global.laid_pheromone_concrete do
				
				if event.tick < global.laid_pheromone_concrete[i].time then
					break 
				end
				
				local surface = global.laid_pheromone_concrete[i].surface
				local currentTilename = surface.get_tile(global.laid_pheromone_concrete[i].position).name
				--writeDebug("The Current Tile is: "..currentTilename)
				
				if currentTilename == "pheromone_concrete" then
				
					--writeDebug("Tile test passed")
					
					local Tile_test = true	
					table.insert(New_tiles, {name="exhausted_pheromone_concrete", position=global.laid_pheromone_concrete[i].position}) 
					surface.set_tiles(New_tiles)

				end
				
			end
				
		end
		
		--- Place the new "exhausted_pheromone_concrete" tiles
		if Tile_test then
			--WriteDebug("Test Passed, placing new concrete")
			surface.set_tiles(New_tiles)
		end	
	

	end

	

	---- Regenerate some health on living walls
	if game.tick % 60 == 0 and global.Living_Walls_Table ~= nil then

		for k,Living_Wall in pairs(global.Living_Walls_Table) do
			if Living_Wall.valid then
				local LW_Health = Living_Wall.health
				local Regen = 0.5
				if LW_Health < 600 then
					New_LW_Health = LW_Health + Regen
					Living_Wall.health = New_LW_Health 
				end
			else
				table.remove(global.Living_Walls_Table, k)
			end
		end
	end
	

end)



---------------------------------------------
Event.register(defines.events.on_research_finished, function(event)

	local research = event.research.name
	if research == "Alien_Training" then
		for _, player in pairs(event.research.force.players) do
			player.insert{name="attractor-off",count=1}
		end
	end
  
    if research == "TerraformingStation-2" then
        global.deduction_constant = global.deduction_constant * 1.25
    end      

    if research == "TerraformingStation-3" then
       global.deduction_constant = global.deduction_constant * 1.05
    end    	
  
end)


----- Pheromone Concrete stuff
--------------------------------------------------------------------
local function pheromone_concrete_laid (event, surface)

	for i, vv in ipairs(event.tiles) do
		local position = vv.position
		local currentTilename = surface.get_tile(position.x,position.y).name
		
		if currentTilename == "pheromone_concrete" then
						
			if not global.laid_pheromone_concrete then global.laid_pheromone_concrete = {} end
			local pheromone_time = math.random(36000) + 198000 -- 216,000 is one Hour
			table.insert(global.laid_pheromone_concrete, {position = vv.position, time = event.tick + pheromone_time, surface = surface})
			table.sort(global.laid_pheromone_concrete, function(a, b) return a.time < b.time end)			
				
		end
		
	end	

	
end


local function Player_Tile_Built(event)

	local player = game.players[event.player_index]
	local surface = player and player.surface

	--writeDebug("Tile Built")		
	if event.tiles then pheromone_concrete_laid (event, surface) end

	
end

	
local function Robot_Tile_Built(event)


	local robot = event.robot
	local surface = robot.surface
	
	-- fix #2 Error while running event Bio_Industries::on_robot_built_tile
	if surface == nil then
		return
	end
	
	if event.tiles then pheromone_concrete_laid (event, surface) end

end


----------------------------------------

Event.register(Event.core_events.configuration_changed, On_Config_Change)
Event.register(Event.core_events.init, On_Init)
Event.register(Event.core_events.load, On_Load)

Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
Event.pre_remove_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined}
Event.death_events = {defines.events.on_entity_died}
Event.player_build_event = {defines.events.on_player_built_tile}
Event.robot_build_event = {defines.events.on_robot_built_tile}

Event.register(Event.build_events, On_Built)
Event.register(Event.pre_remove_events, On_Remove)
Event.register(Event.death_events, On_Death)
Event.register(Event.player_build_event, Player_Tile_Built)
Event.register(Event.robot_build_event, Robot_Tile_Built)



---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if QC_Mod == true then  
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
