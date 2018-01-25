--- EXPANSION v.8.0.1
local QC_Mod = false


require ("util")
require ("stdlib/event/event")

if remote.interfaces.EvoGUI then
	require ("libs/EvoGUI")
end


if not global.NE_Expansion then global.NE_Expansion = {} end
if not global.NE_Expansion.Settings then global.NE_Expansion.Settings = {} end

--- Settup Settings
global.NE_Expansion.Settings.Harder_Endgame = settings.startup["NE_Harder_Endgame"].value
global.NE_Expansion.Settings.No_Expansion = settings.startup["NE_No_Expansion"].value

---------------------------------------------
function On_Init()
	
---- Expansion Initialization ----	
	if not global.Natural_Evolution_state then
		global.Natural_Evolution_state = "Peaceful"
	end
	if not global.Natural_Evolution_Timer then
		global.Natural_Evolution_Timer = 0
	end
	if not global.Peace_Timer then
		global.Peace_Timer = 0
	end
	if not global.Natural_Evolution_Counter then
		global.Natural_Evolution_Counter = 0
	end


	--- Harder End Game
	---- Rocket Silo Initialization ----	
	if not global.RocketSiloBuilt then
	  global.RocketSiloBuilt = 0
	end

	
	if not global.Total_Phase_Evo_Deduction then
          global.Total_Phase_Evo_Deduction = 0
        elseif global.Total_Phase_Evo_Deduction < 0 then
          global.Total_Phase_Evo_Deduction = 0
	end
		
	---  Initial Expansion Values	
	local enemy_expansion = game.map_settings.enemy_expansion
	
	if not global.enemy_expansion_G then
		global.enemy_expansion_G = false -- 
	end

	----
	if not global.max_expansion_distance_G then
		global.max_expansion_distance_G = enemy_expansion.max_expansion_distance -- Vanilla 7
	end

	if not global.friendly_base_influence_radius_G then
		global.friendly_base_influence_radius_G = 4 -- Vanilla 2
	end
	
	if not global.enemy_building_influence_radius_G then
		global.enemy_building_influence_radius_G = 4 -- Vanilla 2
	end
	
	if not global.settler_group_min_size_G then
		global.settler_group_min_size_G = enemy_expansion.settler_group_min_size -- Vanilla 5
	end
	
	if not global.settler_group_max_size_G then
		global.settler_group_max_size_G = enemy_expansion.settler_group_max_size -- Vanilla 20
	end

	----
	if not global.building_coefficient_G then
		global.building_coefficient_G = 0.15 -- vanilla 0.1
	end
	
	if not global.other_base_coefficient_G then
		global.other_base_coefficient_G = 3.0 -- vanilla 2.0
	end
	
	if not global.neighbouring_chunk_coefficient_G then
		global.neighbouring_chunk_coefficient_G = 0.625 -- vanilla 0.5
	end
	
	if not global.neighbouring_base_chunk_coefficient_G then
		global.neighbouring_base_chunk_coefficient_G = 0.5 -- vanilla 0.4	
	end
	
	if not global.min_group_radius_G then
		global.min_group_radius_G = 3 -- Vanilla 5		
	end	
	
	if not global.max_group_radius_G then
		global.max_group_radius_G = 20 -- Vanilla 30
	end

		

	--- Settup Settings		
	if not global.NE_Expansion then global.NE_Expansion = {} end
	if not global.NE_Expansion.Settings then global.NE_Expansion.Settings = {} end

	global.NE_Expansion.Settings.Harder_Endgame = settings.startup["NE_Harder_Endgame"].value
	global.NE_Expansion.Settings.No_Expansion = settings.startup["NE_No_Expansion"].value

	
end


function On_Change()
	
--- Expansion Initialization ----	
	if not global.Natural_Evolution_state then
		global.Natural_Evolution_state = "Peaceful"
	end
	if not global.Natural_Evolution_Timer then
		global.Natural_Evolution_Timer = 0
	end
	if not global.Peace_Timer then
		global.Peace_Timer = 0
	end
	if not global.Natural_Evolution_Counter then
		global.Natural_Evolution_Counter = 0
	end


	--- Harder End Game
	---- Rocket Silo Initialization ----	
	if not global.RocketSiloBuilt then
	  global.RocketSiloBuilt = 0
	end

	
	if not global.Total_Phase_Evo_Deduction then
          global.Total_Phase_Evo_Deduction = 0
        elseif global.Total_Phase_Evo_Deduction < 0 then
          global.Total_Phase_Evo_Deduction = 0
	end

	--- Settup Settings
	if not global.NE_Expansion then global.NE_Expansion = {} end
	if not global.NE_Expansion.Settings then global.NE_Expansion.Settings = {} end
	
	global.NE_Expansion.Settings.Harder_Endgame = settings.startup["NE_Harder_Endgame"].value
	global.NE_Expansion.Settings.No_Expansion = settings.startup["NE_No_Expansion"].value

	On_Change_Setup()
end

---------------------------------------------


if global.NE_Expansion.Settings.Harder_Endgame then

	---------------------------------------------
	local function On_Built(event)
		  
	  --- Harder Ending Some action if you built the Rocket-silo!
		if event.created_entity.name == "rocket-silo" then
			
			global.RocketSiloBuilt = global.RocketSiloBuilt + 1
			writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
				-- Increase Evolution factor by 10% of remaining evolution once a Rocket Silo is built	
				if game.forces.enemy.evolution_factor < 0.89999 then
					game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor + (1 - game.forces.enemy.evolution_factor)/10
				else
					game.forces.enemy.evolution_factor = 0.9999
				end  
					
			-- Biters will attack the newly built Rocket Silo
			event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(4000 * game.forces.enemy.evolution_factor), unit_search_distance = 2500}
			
			for i, player in pairs(game.players) do
					player.print("WARNING!")
					player.print("Building a Rocket Silo caused a lot of noise and biters will attack!!!")
			end
		end
	end


	--------------------------------------------
	local function On_Remove(event)

	   ---- Remove Rocket Silo count
	  if event.entity.name == "rocket-silo" then
		 global.RocketSiloBuilt = global.RocketSiloBuilt - 1      
		 writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
	   end
	end

		
	local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
	script.on_event(build_events, On_Built)

	local pre_remove_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}
	script.on_event(pre_remove_events, On_Remove)

	
end




function On_Change_Setup() 
		
	local enemy_expansion = game.map_settings.enemy_expansion
	local unit_group = game.map_settings.unit_group
	
	-- Below 5% evolution, no expansion
	if game.forces.enemy.evolution_factor > 0.05 and global.NE_Expansion.Settings.No_Expansion then
		enemy_expansion.enabled = true
	else
		enemy_expansion.enabled = false
	end
		
		
	---  Initial Expansion Values	
	if not global.enemy_expansion_G then
		global.enemy_expansion_G = false -- 
	end

	----
	if not global.max_expansion_distance_G then
		global.max_expansion_distance_G = enemy_expansion.max_expansion_distance -- Vanilla 7
	end

	if not global.friendly_base_influence_radius_G then
		global.friendly_base_influence_radius_G = 4 -- Vanilla 2
	end
	
	if not global.enemy_building_influence_radius_G then
		global.enemy_building_influence_radius_G = 4 -- Vanilla 2
	end
	
	if not global.settler_group_min_size_G then
		global.settler_group_min_size_G = enemy_expansion.settler_group_min_size -- Vanilla 5
	end
	
	if not global.settler_group_max_size_G then
		global.settler_group_max_size_G = enemy_expansion.settler_group_max_size -- Vanilla 20
	end

	----
	if not global.building_coefficient_G then
		global.building_coefficient_G = 0.15 -- vanilla 0.1
	end
	
	if not global.other_base_coefficient_G then
		global.other_base_coefficient_G = 3.0 -- vanilla 2.0
	end
	
	if not global.neighbouring_chunk_coefficient_G then
		global.neighbouring_chunk_coefficient_G = 0.625 -- vanilla 0.5
	end
	
	if not global.neighbouring_base_chunk_coefficient_G then
		global.neighbouring_base_chunk_coefficient_G = 0.5 -- vanilla 0.4	
	end
	
	if not global.min_group_radius_G then
		global.min_group_radius_G = 3 -- Vanilla 5		
	end	
	
	if not global.max_group_radius_G then
		global.max_group_radius_G = 20 -- Vanilla 30
	end

		
	enemy_expansion.max_expansion_distance = global.max_expansion_distance_G / 2	
	enemy_expansion.friendly_base_influence_radius = global.friendly_base_influence_radius_G	
	enemy_expansion.enemy_building_influence_radius = global.enemy_building_influence_radius_G	
	
	enemy_expansion.settler_group_min_size = global.settler_group_min_size_G / 2
	enemy_expansion.settler_group_max_size = global.settler_group_max_size_G / 2
	---
	enemy_expansion.building_coefficient = global.building_coefficient_G
	enemy_expansion.other_base_coefficient = global.other_base_coefficient_G
	enemy_expansion.neighbouring_chunk_coefficient = global.neighbouring_chunk_coefficient_G
	enemy_expansion.neighbouring_base_chunk_coefficient = global.neighbouring_base_chunk_coefficient_G
	---
	unit_group.max_group_radius = global.max_group_radius_G
	unit_group.min_group_radius = global.min_group_radius_G
		
end


	
---------------------------------------------	

local evolution_Timer_Peace = (5 * 3600) * 2 -- Default is 10min. There will thus be a random 0-10min peace after each Phase.
--- global.Peace_Timer is only used for EvoGui value
global.Peace_Timer = evolution_Timer_Peace
	
	
Event.register(defines.events.on_tick, function(event)		

		if global.Peace_Timer > 0 then
			global.Peace_Timer = global.Peace_Timer - 1
		elseif global.Peace_Timer == 0 then
			global.Peace_Timer = evolution_Timer_Peace
		end

	
		--------------- Expansion ----------------------------------

			--- Check every minute. Nothing will happen until at leasst 5% evolution
			if (game.tick % (evolution_Timer_Peace)  == 0) and (game.forces.enemy.evolution_factor >= .005) and (global.Natural_Evolution_state == "Peaceful") then
				
				
				--- Should generate a random value between 0 and 200
				local expansionChance = math.random(math.floor((game.forces.enemy.evolution_factor * 100) + global.Natural_Evolution_Counter), math.floor((game.forces.enemy.evolution_factor * 100) + 100))

				-- For Early game, has about a 25% change to start Evolution
				if expansionChance >= 75 and expansionChance < 100 then
					Natural_Evolution_SetExpansionLevel("Awakening")
					
					
				-- Evolution Factor = 1% - 9%:
				elseif expansionChance >= 100 and expansionChance < 110 then
					Natural_Evolution_SetExpansionLevel("Phase 1")
					if game.forces.enemy.evolution_factor >.1 and global.Natural_Evolution_Counter < 10 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 10% - 19%:
				elseif expansionChance >= 110 and expansionChance < 120 then
					Natural_Evolution_SetExpansionLevel("Phase 2")
					if game.forces.enemy.evolution_factor >.2 and global.Natural_Evolution_Counter < 15 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 20% - 29%:
				elseif expansionChance >= 120 and expansionChance < 130 then
					Natural_Evolution_SetExpansionLevel("Phase 3")
					if game.forces.enemy.evolution_factor >.3 and global.Natural_Evolution_Counter < 20 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 30% - 39%:
				elseif expansionChance >= 130 and expansionChance < 140 then
					Natural_Evolution_SetExpansionLevel("Phase 4")
					if game.forces.enemy.evolution_factor >.4 and global.Natural_Evolution_Counter < 25 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 40% - 49%:
				elseif expansionChance >= 140 and expansionChance < 150 then
					Natural_Evolution_SetExpansionLevel("Phase 5")
					if game.forces.enemy.evolution_factor >.5 and global.Natural_Evolution_Counter < 30 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 50% - 59%:
				elseif expansionChance >= 150 and expansionChance < 160 then
					Natural_Evolution_SetExpansionLevel("Phase 6")
					if game.forces.enemy.evolution_factor >.6 and global.Natural_Evolution_Counter < 35 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 60% - 69%:
				elseif expansionChance >= 160 and expansionChance < 170 then
					Natural_Evolution_SetExpansionLevel("Phase 7")
					if game.forces.enemy.evolution_factor >.7 and global.Natural_Evolution_Counter < 40 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 70% - 79%:
				elseif expansionChance >= 170 and expansionChance < 180 then
					Natural_Evolution_SetExpansionLevel("Phase 8")
					if game.forces.enemy.evolution_factor >.7 and global.Natural_Evolution_Counter < 45 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 80% - 89%:
				elseif expansionChance >= 180 and expansionChance < 190 then
					Natural_Evolution_SetExpansionLevel("Phase 9")
					if game.forces.enemy.evolution_factor >.8 and global.Natural_Evolution_Counter < 50 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 90% - 98%:
				elseif expansionChance >= 190 and expansionChance < 199 then
					Natural_Evolution_SetExpansionLevel("Phase 10")
					if game.forces.enemy.evolution_factor >.9 and global.Natural_Evolution_Counter < 50 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 99% - 100%:						
				elseif expansionChance >= 199 and expansionChance <= 200 then
					Natural_Evolution_SetExpansionLevel("Armageddon")
				end
				
				--writeDebug("The Expansion Chance is: " .. expansionChance)	
				--writeDebug("The Natural_Evolution Counter is: " .. global.Natural_Evolution_Counter)	

			end
			----
			if global.Natural_Evolution_state ~= "Peaceful" then
				if global.Natural_Evolution_Timer > 0 then
					global.Natural_Evolution_Timer = global.Natural_Evolution_Timer - 1
				else
					Natural_Evolution_SetExpansionLevel("Peaceful")
					global.Peace_Timer = evolution_Timer_Peace
				end	
			end
	end)


----Harder Endgame Function - Will send waves of enemies to attack the player once the Rocket Silo is built. Will also increase the Evolutio factor slightly with each wave.
function Harder_Endgame(Evo_Increase,Enemy_Count)
		if global.NE_Expansion.Settings.Harder_Endgame then	
			if global.RocketSiloBuilt > 0 then
			local E_Increase = 0
				if ((1-game.forces.enemy.evolution_factor) / (10 * Evo_Increase)) > 0.05 then
					E_Increase = 0.05
				else 
					E_Increase = ((1-game.forces.enemy.evolution_factor) / (10 * Evo_Increase))
				end
				 
				if game.forces.enemy.evolution_factor < 0.9899 then
					game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor + E_Increase
						
				else
					game.forces.enemy.evolution_factor = 0.99999
				end  
			
			---- Attack the player, since you have a silo built						
				for _, player in pairs(game.players) do
					if player.connected and player.valid and player.character and player.character.valid then
						player.surface.set_multi_command{command = {type=defines.command.attack, target=player.character, distraction=defines.distraction.by_enemy},unit_count = math.floor(Enemy_Count * game.forces.enemy.evolution_factor), unit_search_distance = 1500}
					end
				end	

				writeDebug("Attack wave inbound")					
			end 
		end	
	end

	
	-------------------- Apply the Expansion Settings ------------------
function Natural_Evolution_Expansion_Settings(evolution_Timer, NE_Max_Expansion_Distance, NE_Friendly_Base_Influence_Radius, NE_Enemy_Building_Influence_Radius, NE_building_coefficient, NE_Settler_Group_Min_Size, NE_Settler_Group_Max_Size, NE_Max_Group_Radius, NE_Min_Group_Radius, NE_Speedup, NE_other_base_coefficient,NE_neighbouring_chunk_coefficient, NE_neighbouring_base_chunk_coefficient)
		
		local enemy_expansion = game.map_settings.enemy_expansion
		local unit_group = game.map_settings.unit_group
		-----

		--Current formula 5 min @ 0% evo and 10min @ 100% evo. So A phase can last 5 - 15min.
		global.Natural_Evolution_Timer = (evolution_Timer + (game.forces.enemy.evolution_factor * evolution_Timer) * 2)
		
		
		-- Below 5% evolution, no expansion
		if game.forces.enemy.evolution_factor > 0.05 and global.NE_Expansion.Settings.No_Expansion then
			enemy_expansion.enabled = true
			writeDebug("Condition 1: Evo larger than 5% and Exp allowed")
			writeDebug(game.map_settings.enemy_expansion.enabled)
		else
			enemy_expansion.enabled = false
			writeDebug("No Expansion")
			writeDebug(game.map_settings.enemy_expansion.enabled)
		end
		

		enemy_expansion.max_expansion_distance = NE_Max_Expansion_Distance
		enemy_expansion.friendly_base_influence_radius = NE_Friendly_Base_Influence_Radius
		enemy_expansion.enemy_building_influence_radius = NE_Enemy_Building_Influence_Radius	
		enemy_expansion.building_coefficient = NE_building_coefficient
		enemy_expansion.other_base_coefficient = NE_other_base_coefficient
		enemy_expansion.neighbouring_chunk_coefficient = NE_neighbouring_chunk_coefficient
		enemy_expansion.neighbouring_base_chunk_coefficient = NE_neighbouring_base_chunk_coefficient
		
		enemy_expansion.settler_group_min_size = NE_Settler_Group_Min_Size
		enemy_expansion.settler_group_max_size = NE_Settler_Group_Max_Size

		unit_group.max_group_radius = NE_Max_Group_Radius
		unit_group.min_group_radius = NE_Min_Group_Radius
		unit_group.max_member_speedup_when_behind = NE_Speedup		
		
		
		
		--writeDebug("The Global.Natural_Evolution_Timer is: " .. global.Natural_Evolution_Timer)		
		--writeDebug("The Min Cooldown is: " .. (global.Natural_Evolution_Timer / 4))
		--writeDebug("The Max Cooldown is: " .. (global.Natural_Evolution_Timer / 2))
	
		
end
	
	--------------------	
function Natural_Evolution_SetExpansionLevel(Expansion_State)
		
	Expansion_State = Expansion_State or "Peaceful"
	
	-- allow biters to path from farther away (minor performance hit)
	if expansion_state ~= "Peaceful" then
		game.map_settings.path_finder.max_steps_worked_per_tick = 500
	else
		game.map_settings.path_finder.max_steps_worked_per_tick = 50
	end

	-- DEFAULT expansion settings for the "Peace" state. Awake state has Expansion Enabled though.

	local max_Base_Expansion_Distance = global.max_expansion_distance_G
	local Friendly_Base_Influence_Radius = global.friendly_base_influence_radius_G	
	local Enemy_Building_Influence_Radius = global.enemy_building_influence_radius_G	
	local settler_Group_Min_Size = global.settler_group_min_size_G
	local settler_Group_Max_Size = global.settler_group_max_size_G
	---
	local building_coefficient = global.building_coefficient_G
	local other_base_coefficient = global.other_base_coefficient_G
	local neighbouring_chunk_coefficient = global.neighbouring_chunk_coefficient_G
	local neighbouring_base_chunk_coefficient = global.neighbouring_base_chunk_coefficient_G
	---
	local min_Group_Radius = global.min_group_radius_G	
	local max_Group_Radius = global.max_group_radius_G 
	local enemy_speedup = 1.4
	

		
	if Expansion_State == "Peaceful" then

		game.map_settings.enemy_expansion.enabled = false   --- No Expansion during Peaceful time
		global.Natural_Evolution_Timer = 0			
		
		writeDebug("No Expansion in Peace")
		writeDebug(game.map_settings.enemy_expansion.enabled)
		-- Each time a Phase is triggered, the Evolution Factor is decreased slightly, just during the Phase.				
		
		if game.forces.enemy.evolution_factor > 0.05 then
			if global.Natural_Evolution_state == "Awakening" then
				game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor		
			else
								
				local Evo_Deduction = (0.0020 * (1 - game.forces.enemy.evolution_factor)*(1 - game.forces.enemy.evolution_factor))
				
				game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor - Evo_Deduction
				global.Total_Phase_Evo_Deduction = global.Total_Phase_Evo_Deduction + Evo_Deduction
				--writeDebug("Evolution Deduction during Expansion: " .. Evo_Deduction)	
				--writeDebug("Total Evolution Deduction from Phase Switch: " .. global.Total_Phase_Evo_Deduction)	
			end
							
		end
	

	-- Defines the values for the different Evolution States.
	elseif Expansion_State == "Awakening" then
			-- Use Default Values

	elseif Expansion_State == "Phase 1" then
		----- Harder Ending
		Harder_Endgame(1,500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 1 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 0.25 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 0.30 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 1 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 3.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.10 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 0.20 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.03 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.03 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 1 -- up (1)
		max_Group_Radius = max_Group_Radius + 4 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.1 + (global.Natural_Evolution_Counter / 50) -- up (.1)
		



	elseif Expansion_State == "Phase 2" then
		----- Harder Ending
		Harder_Endgame(1,500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 2 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 0.5 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 0.60 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 1 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 6.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.20 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 0.40 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.06 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.06 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 2 -- up (1)
		max_Group_Radius = max_Group_Radius + 8 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.2 + (global.Natural_Evolution_Counter / 50) -- up (.1)
		

	elseif Expansion_State == "Phase 3" then
		----- Harder Ending
		Harder_Endgame(1,500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 3 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 0.75 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 0.90 -- donw (.3)
			settler_Group_Min_Size = settler_Group_Min_Size  + 2 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 9.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.30 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 0.60 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.09 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.09 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 3 -- up (1)
		max_Group_Radius = max_Group_Radius + 12 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.3 + (global.Natural_Evolution_Counter / 50) -- up (.1)
		

	elseif Expansion_State == "Phase 4" then
		----- Harder Ending
		Harder_Endgame(1,500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 4 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 1.00 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 1.20 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 2 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 12.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.40 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 0.80 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.12 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.12 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 4 -- up (1)
		max_Group_Radius = max_Group_Radius + 16 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.4 + (global.Natural_Evolution_Counter / 50) -- up (.1)



	elseif Expansion_State == "Phase 5" then
		----- Harder Ending
		Harder_Endgame(1,1000)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 5 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 1.25 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 1.50 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 3 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 15.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.50 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.00 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.15 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.15 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 5 -- up (1)
		max_Group_Radius = max_Group_Radius + 20 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.5 + (global.Natural_Evolution_Counter / 50) -- up (.1)


	elseif Expansion_State == "Phase 6" then
		----- Harder Ending
		Harder_Endgame(1.5,1500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 6 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 1.50 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 1.80 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 3 -- up (.5) alt
		settler_Group_Max_Size = settler_Group_Max_Size + 15.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.50 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.00 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.15 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.15 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 5 -- up (1)
		max_Group_Radius = max_Group_Radius + 20 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.5 + (global.Natural_Evolution_Counter / 50) -- up (.1)



	elseif Expansion_State == "Phase 7" then
		----- Harder Ending
		Harder_Endgame(1.5,2000)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 7 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 1.75 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 2.10 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 4 -- up (1) 
		settler_Group_Max_Size = settler_Group_Max_Size + 18.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.60 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.20 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 0.18 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 0.18 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 6 -- up (1)
		max_Group_Radius = max_Group_Radius + 24 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.6 + (global.Natural_Evolution_Counter / 50) -- up (.1)


				
	elseif Expansion_State == "Phase 8" then
		----- Harder Ending
		Harder_Endgame(1.5,2500)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 8 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 2.00 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 2.40 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 5 -- up (1) 
		settler_Group_Max_Size = settler_Group_Max_Size + 21.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.70 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.40 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 2.10 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 2.10 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 7 -- up (1)
		max_Group_Radius = max_Group_Radius + 28 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.7 + (global.Natural_Evolution_Counter / 50) -- up (.1)



	elseif Expansion_State == "Phase 9" then
		----- Harder Ending
		Harder_Endgame(2,3000)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 9 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 2.25 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 2.70 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 6 -- up (1) 
		settler_Group_Max_Size = settler_Group_Max_Size + 24.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.80 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.60 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 2.40 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 2.40 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 8 -- up (1)
		max_Group_Radius = max_Group_Radius + 32 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.8 + (global.Natural_Evolution_Counter / 50) -- up (.1)




	elseif Expansion_State == "Phase 10" then
		----- Harder Ending
		Harder_Endgame(2,3000)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 10 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 2.50 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 3.00 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 7 -- up (1) 
		settler_Group_Max_Size = settler_Group_Max_Size + 27.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 0.90 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 1.80 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 2.70 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 2.70 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 9 -- up (1)
		max_Group_Radius = max_Group_Radius + 34 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 0.9 + (global.Natural_Evolution_Counter / 50) -- up (.1)


			
		
	elseif Expansion_State == "Armageddon" then
		----- Harder Ending
		Harder_Endgame(2.5,3000)
		-----

		max_Base_Expansion_Distance = max_Base_Expansion_Distance + 15 -- up (1)
		Friendly_Base_Influence_Radius = Friendly_Base_Influence_Radius - 2.75 -- down (.25)
		Enemy_Building_Influence_Radius = Enemy_Building_Influence_Radius - 3.00 -- donw (.3)
		settler_Group_Min_Size = settler_Group_Min_Size  + 8 -- up (1) 
		settler_Group_Max_Size = settler_Group_Max_Size + 30.00 + global.Natural_Evolution_Counter --up (3)
		---
		building_coefficient = building_coefficient  - 1.00 -- down (.1)
		other_base_coefficient = other_base_coefficient  - 2.00 -- down (.2)
		neighbouring_chunk_coefficient = neighbouring_chunk_coefficient - 3.00 -- down (.03)
		neighbouring_base_chunk_coefficient = neighbouring_base_chunk_coefficient - 3.00 -- down (.03)
		---
		min_Group_Radius = min_Group_Radius + 10 -- up (1)
		max_Group_Radius = max_Group_Radius + 40 + global.Natural_Evolution_Counter -- up (4)
		enemy_speedup = enemy_speedup + 1.0 + (global.Natural_Evolution_Counter / 50) -- up (.1)
			
	end	

		global.Natural_Evolution_state = Expansion_State
	
	if Expansion_State ~= "Peaceful" then
	
		-- adjust the expansion settings based on any customizations from the config settings, making sure they stay above zero

		evolution_Timer = (5 * 3600)
		max_Base_Expansion_Distance = math.max(3, max_Base_Expansion_Distance)
		Friendly_Base_Influence_Radius = math.max(1, Friendly_Base_Influence_Radius)
		Enemy_Building_Influence_Radius = math.max(1, Enemy_Building_Influence_Radius)
		settler_Group_Min_Size = math.max(1, settler_Group_Min_Size)
		settler_Group_Max_Size = math.max(1, settler_Group_Max_Size)
		min_Group_Radius = math.max(1, min_Group_Radius)
		max_Group_Radius = math.max(1, max_Group_Radius)
		

		-- display values for QC
		writeDebug("The Expansion_State is: " ..Expansion_State)
		writeDebug("The max_Expansion_Distance is: " ..max_Base_Expansion_Distance..", Global: " ..global.max_expansion_distance_G)
		writeDebug("The Friendly_Base_Influence_Radius is: " ..Friendly_Base_Influence_Radius..", Global: " ..global.friendly_base_influence_radius_G)
		writeDebug("The Enemy_Building_Influence_Radius is: " ..Enemy_Building_Influence_Radius..", Global: " ..global.enemy_building_influence_radius_G)
		writeDebug("The settler_Group_Min_Size is: " ..settler_Group_Min_Size..", Global: " ..global.settler_group_min_size_G)
		writeDebug("The settler_Group_Max_Size is: " ..settler_Group_Max_Size..", Global: " ..global.settler_group_max_size_G)
		writeDebug("The building_coefficient is: " ..building_coefficient..", Global: " ..global.building_coefficient_G)
		writeDebug("The other_base_coefficient is: " ..other_base_coefficient..", Global: " ..global.other_base_coefficient_G)
		writeDebug("The neighbouring_chunk_coefficient is: " ..neighbouring_chunk_coefficient..", Global: " ..global.neighbouring_chunk_coefficient_G)
		writeDebug("The neighbouring_base_chunk_coefficient is: " ..neighbouring_base_chunk_coefficient..", Global: " ..global.neighbouring_base_chunk_coefficient_G)
		writeDebug("The max_Group_Radius is: " ..max_Group_Radius..", Global: " ..global.max_group_radius_G)
		writeDebug("The min_Group_Radius is: " ..min_Group_Radius..", Global: " ..global.min_group_radius_G )
		writeDebug("The enemy_speedup is: " ..enemy_speedup)


		-- apply the expansion settings			
		Natural_Evolution_Expansion_Settings(evolution_Timer, max_Base_Expansion_Distance, Friendly_Base_Influence_Radius, Enemy_Building_Influence_Radius, building_coefficient, settler_Group_Min_Size, settler_Group_Max_Size, max_Group_Radius, min_Group_Radius, enemy_speedup, other_base_coefficient, neighbouring_chunk_coefficient, neighbouring_base_chunk_coefficient)

	end
			
end



---------------------------------------------
script.on_init(On_Init)
script.on_configuration_changed(On_Change)

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if QC_Mod == true then  
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end

