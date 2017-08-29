local BUILDINGS_ver = '7.3.4'
local QC_Mod = false



require ("util")
require ("stdlib/event/event")
require ("control_bio_cannon")
require ("control_artifact_collector")
require ("control_acs")
require ("control_terraforming")
require ("control_evolution")


if remote.interfaces.EvoGUI then
	require ("libs/EvoGUI")
end


--- Settup Settings
if not global.NE_Buildings then global.NE_Buildings = {} end
if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end
global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value



---------------------------------------------				 
local function On_Init()
 writeDebug("NE Buildings Initialize")
 
 	--- Artifact Collector
 	if global.ArtifactCollectors ~= nil then
		
		Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
		end)
		global.update_check = true
        global.next_collector = global.next_collector or 1
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
		global.deduction_constant = 0.00025 -------- DEDUCTION CONSTANT
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

		
	--- Settup Settings
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
	global.NE_Buildings.Settings.Artifact_Item_Count = settings.startup["NE_Artifact_Item_Count"].value

	
end
		 

---------------------------------------------				 
local function On_Load()

	if global.ArtifactCollectors ~= nil then
		
		Event.register(defines.events.on_tick, function(event)	
			ticker(event.tick)
		end)
		
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
	
	if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
	end
	

	if game.active_mods["EndgameCombat"] or game.active_mods['EndgameCombat'] or game.active_mods[EndgameCombat] then	
		
		for i, player in pairs(game.players) do
			player.print(tostring("You have Endgame Combat Installed, not compatible with Natural Evolution Buildings"))
		end
	end
	

	--- Settup Settings	
	if not global.NE_Buildings then global.NE_Buildings = {} end
	if not global.NE_Buildings.Settings then global.NE_Buildings.Settings = {} end

	global.NE_Buildings.Settings.Conversion_Difficulty = settings.startup["NE_Conversion_Difficulty"].value
	global.NE_Buildings.Settings.Battle_Marker = settings.startup["NE_Battle_Marker"].value
	global.NE_Buildings.Settings.Search_Distance = settings.startup["NE_Conversion_Search_Distance"].value
	global.NE_Buildings.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value
	global.NE_Buildings.Settings.Artifact_Item_Count = settings.startup["NE_Artifact_Item_Count"].value

	
end


---------------------------------------------
local function On_Built(event)

local entity = event.created_entity
local surface = entity.surface
local position = entity.position	
local force = entity.force


	
	--- Artifact Collector	
	local newCollector
	if entity.valid and entity.name == "Artifact-collector-area" then
	
		newCollector = surface.create_entity({name = "Artifact-collector", position = position, force = force})
		entity.destroy()
		
		if global.ArtifactCollectors == nil then
			subscribe_ticker(event.tick)
		end
		table.insert(global.ArtifactCollectors, newCollector)
	end
		
	
	--- Living Wall built
	if entity.valid and entity.name == "ne-living-wall" then
		if global.Living_Walls_Table == nil then
          global.Living_Walls_Table = {}
		end
		writeDebug("Living Wall has been built")				

		local Created_L_Wall = event.created_entity
		
		table.insert(global.Living_Walls_Table, Created_L_Wall)
		
	end

	
	--- Alien Control Station has been built	
	if entity.valid and entity.name == "AlienControlStation_Area" then
	local newAlienControlStation
	local surface = event.created_entity.surface
	local force = event.created_entity.force
	
	writeDebug("ACS has been built")			
	writeDebug("The ACS Difficulty is: " .. global.minds.difficulty)  					
			
		newAlienControlStation = surface.create_entity({name = "AlienControlStation", position = event.created_entity.position, force = force})
		event.created_entity.destroy()

		table.insert(global.beacons, newAlienControlStation)
	end	


	
   --- Terraforming Station has been built
	if entity.valid and entity.name == "TerraformingStation" then
	
		if global.numTerraformingStations < 0 then
			global.numTerraformingStations = 0
		end

		global.numTerraformingStations = global.numTerraformingStations + 1
      
		global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
		writeDebug("The the number of Terraforming Stations: " .. global.numTerraformingStations)
	  
		T_Station_Radar = surface.create_entity({name = "TerraformingStation_r", position = position, direction = event.created_entity.direction, force = force})
	
		T_Station_Radar.operable = false
		T_Station_Radar.destructible = false
		T_Station_Radar.minable = false
			
		global.Terraforming_Station_Table[entity.unit_number] = {inventory=entity, radar=T_Station_Radar}
	    writeDebug("The Unit # is: "..entity.unit_number)
	  
	end   

	
		
	--- Bio Cannon (Hive Buster) has been built
	if entity.valid and entity.name == "Bio_Cannon_Area" then
	
	local New_Bio_Cannon
	local New_Bio_CannonR
	
	writeDebug("Bio Cannon has been built")				

		New_Bio_Cannon  = surface.create_entity({name = "Bio_Cannon", position = position, direction = event.created_entity.direction, force = force})
		New_Bio_CannonR = surface.create_entity({name = "Bio_Cannon_r", position = position, direction = event.created_entity.direction, force = force})

		New_Bio_Cannon.health = event.created_entity.health
		
		event.created_entity.destroy()

		
		New_Bio_CannonR.operable = false
		New_Bio_CannonR.destructible = false
		New_Bio_CannonR.minable = false
		
		if global.Bio_Cannon_Table == nil then
			global.Bio_Cannon_Table = {}
			Event.register(defines.events.on_tick, function(event) end)
		end

		table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon,New_Bio_CannonR,0})
		
	end


	
end


---------------------------------------------
local function On_Remove(event)

	local entity = event.entity	

	
	  --- fully heal the items that need a refresh in the alien hatchery anyway to avoid having multiple item stacks for damaged items.
	if event.name ~= defines.events.on_entity_died then
		if (
				entity.name == "small-worm-turret-player" or
				entity.name == "medium-worm-turret-player" or
				entity.name == "big-worm-turret-player" or
				entity.name == "Natural_Evolution_Biter-Spawner" or
				entity.name == "Natural_Evolution_Spitter-Spawner" or
				entity.name == "ne-living-wall" 
			) then
			entity.health = 100000 -- Note: Just needs to be higher or identical to maxhealth
		end
	end
	
	  
	  
    --Artifact collector
    if entity.valid and entity.name == "Artifact-collector" then

        local artifacts = global.ArtifactCollectors;
		if artifacts then 
			for i=1,#artifacts do
				if artifacts[i] == entity then
					table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
					if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
					break
				end
			end
		
			if #artifacts == 0 then
			--and here artifacts=nil would not cut it.
				global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
				
				Event.register(defines.events.on_tick, nil)
				--but it's surely better done here than during on_tick
			end
		end 
    end
	
  
   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end

		
		--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation"   then
		
		if global.Terraforming_Station_Table[entity.unit_number] == nil then 
		--Legacy from 7.1.5 Should remove during next update.
			T_Count()

		else 
		
			global.Terraforming_Station_Table[entity.unit_number].radar.destroy()
			global.Terraforming_Station_Table[entity.unit_number] = nil
			T_Count()	

		end
		
	end
	

end


---------------------------------------------
local function On_Death(event)

	local entity = event.entity	
	local surface = entity.surface
	local pos = entity.position	
	
	--Artifact collector
    if entity.valid and entity.name == "Artifact-collector" then

        local artifacts=global.ArtifactCollectors;
		if artifacts then 
			for i=1,#artifacts do
				if artifacts[i] == entity then
					table.remove(artifacts,i);--yep, that'll remove value from global.ArtifactCollectors
					if global.next_collector > (#artifacts) then global.next_collector = (#artifacts) end 
					break
				end
			end
		 
			if #artifacts == 0 then
			--and here artifacts=nil would not cut it.
				global.ArtifactCollectors = nil--I'm not sure this wins much, on it's own
				
				Event.register(defines.events.on_tick, nil)
				--but it's surely better done here than during on_tick
			end
		end
    end
	

		--- Terraforming Station has been removed
	if entity.valid and entity.name == "TerraformingStation"   then
		
		if global.Terraforming_Station_Table[entity.unit_number] == nil then 
		--Legacy from 7.1.5 Should remove during next update.
			T_Count()

		else 
		
			global.Terraforming_Station_Table[entity.unit_number].radar.destroy()
			global.Terraforming_Station_Table[entity.unit_number] = nil
			T_Count()	

		end
		
	end
	


   --- Alien Control Station has been removed
	if entity.valid and entity.name == "AlienControlStation" then
		ACS_Remove()
	end
	

 	--------- Spawner killed
	if entity.valid and (entity.type == "unit-spawner") and (entity.force == game.forces.enemy) and global.NE_Buildings.Settings.Battle_Marker then

			writeDebug("Enemy Spawner Killed")

			local force = event.force


			Battle_Marker = surface.create_entity({name = "battle_marker", position = pos, force = force})
			Battle_Marker.destructible = false		

	end

	--- Conversion Turret
	
	if event.force ~= nil and entity.force.name == "enemy" and  entity.type	 == "unit" and event.cause and event.cause.type == "ammo-turret" then 
	
		local name = entity.name
		local inventory = event.cause.get_inventory(defines.inventory.turret_ammo)

		if inventory then

			local inventoryContent = inventory.get_contents()		
			local AmmoType
			local Ammo = 0
				
			if inventoryContent ~= nil then
				for n,a in pairs(inventoryContent) do
					AmmoType=n
					Ammo=a
				end
			end
				
			writeDebug("Ammo Type: " .. AmmoType)
			writeDebug("Ammo Count: " .. Ammo)
			if AmmoType == "basic-dart-magazine_c"  or AmmoType == "enhanced-dart-magazine_c"  or AmmoType == "firearm-magazine_c"  or AmmoType == "copper-bullet-magazine_c"  or AmmoType == "piercing-rounds-magazine_c"  or AmmoType == "uranium-rounds-magazine_c"  or AmmoType == "Biological-bullet-magazine_c" then
				Convert = surface.create_entity({name = name, position = pos, force = event.cause.force.name})
				Convert.health = entity.prototype.max_health / 4
			end
		end	

	end


	--- Conversion Player Ammo
	
	if event.force ~= nil and entity.force.name == "enemy" and  entity.type	 == "unit" and event.cause and event.cause.type == "player" then 
	
		local name = entity.name
		local inventory = event.cause.get_inventory(defines.inventory.player_ammo)

		if inventory then

			local inventoryContent = inventory.get_contents()		
			local AmmoType
			local Ammo = 0
				
			if inventoryContent ~= nil then
				for n,a in pairs(inventoryContent) do
					AmmoType=n
					Ammo=a
				end
			end
				
			writeDebug("Ammo Type: " .. AmmoType)
			writeDebug("Ammo Count: " .. Ammo)
			if AmmoType == "basic-dart-magazine_c"  or AmmoType == "enhanced-dart-magazine_c"  or AmmoType == "firearm-magazine_c"  or AmmoType == "copper-bullet-magazine_c"  or AmmoType == "piercing-rounds-magazine_c"  or AmmoType == "uranium-rounds-magazine_c"  or AmmoType == "Biological-bullet-magazine_c" then
				Convert = surface.create_entity({name = name, position = pos, force = event.cause.force.name})
				Convert.health = entity.prototype.max_health / 4
			end
		end	

	end
		
	
end


----------------Radars Scanning Function, used by Terraforming Sataion and Thumper -----------------------------
script.on_event(defines.events.on_sector_scanned, function(event)
	
	---- Each time a Terraforming Station scans a sector, reduce the evolution factor ----	
	if event.radar.name == "TerraformingStation_r" then
		writeDebug("The Unit # is: "..event.radar.unit_number)
		local num = (event.radar.unit_number - 1)
		Reduce_Evolution(global.Terraforming_Station_Table[num])
		
	end

	
	--- Each time a Thumper "Scans", it will attract biters in the area
	if event.radar.name == "Thumper" then
		event.radar.surface.set_multi_command{command = {type=defines.command.attack, target=event.radar, distraction=defines.distraction.by_enemy},unit_count = 10, unit_search_distance = 500}
		writeDebug("Thumper Scanned, units should attack")   
    end   
	
end)

--------------------------------------------
--- Living Wall Stuff
Event.register(defines.events.on_tick, function(event)	


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
script.on_event(defines.events.on_research_finished, function(event)

	local research = event.research.name
	if research == "Alien_Training" then
		for _, player in pairs(event.research.force.players) do
			player.insert{name="attractor-off",count=1}
		end
	end
  
    if research == "TerraformingStation-2" then
        global.deduction_constant = global.deduction_constant + (global.deduction_constant / 4)
    end      

    if research == "TerraformingStation-3" then
        global.deduction_constant = global.deduction_constant + (global.deduction_constant / 4)
    end    	
  
end)



----------------------------------------
script.on_configuration_changed(On_Config_Change)
script.on_load(On_Load)
script.on_init(On_Init)


local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
script.on_event(build_events, On_Built)

local pre_remove_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined}
script.on_event(pre_remove_events, On_Remove)

local death_events = {defines.events.on_entity_died}
script.on_event(death_events, On_Death)





-------------------- For Testing --------------
if QC_Mod == true then  

	script.on_event(defines.events.on_player_created, function(event)
	local iteminsert = game.players[event.player_index].insert
	iteminsert{name="TerraformingStation", count=5}
	iteminsert{name="solar-panel", count=50}
	iteminsert{name="medium-electric-pole", count=5}
	iteminsert{name="Alien-Stimulant", count=200}
	end)

end

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if QC_Mod == true then  
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
