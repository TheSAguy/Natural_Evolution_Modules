--- EXPANSION v.6.1.0

if not NE_Expansion_Config then NE_Expansion_Config = {} end
if not NE_Expansion_Config.mod then NE_Expansion_Config.mod = {} end


require ("util")
require ("config")
require ("libs/event")

if NE_Expansion_Config.Single_Player_Only and remote.interfaces.EvoGUI then
	require ("libs/EvoGUI")
end


---------------------------------------------
function On_Init()
	
---- Expansion Initialization ----	
	if not global.Natural_Evolution_state then
		global.Natural_Evolution_state = "Peaceful"
	end
	if not global.Natural_Evolution_Timer then
		global.Natural_Evolution_Timer = 0
	end
	if not global.Natural_Evolution_Counter then
		global.Natural_Evolution_Counter = 0
	end
	if not global.Peaceful_Sleep_Time then
		global.Peaceful_Sleep_Time = 0
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
		
end


---------------------------------------------


if NE_Expansion_Config.HarderEndGame then

	---------------------------------------------
	script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
	script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
	script.on_event({defines.events.on_entity_died,defines.events.on_robot_pre_mined,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)

---------------------------------------------
	function On_Built(event)
	  
	   --- Harder Ending Some action if you built the Rocket-silo!
		if event.created_entity.name == "rocket-silo" then
			
			global.RocketSiloBuilt = global.RocketSiloBuilt + 1
			writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
				-- Increase Evolution factor by 10% of remaining evolution once a Rocket Silo is built	
				if game.evolution_factor < 0.89999 then
					game.evolution_factor = game.evolution_factor + (1 - game.evolution_factor)/10
				else
					game.evolution_factor = 0.9999
				end  
					
			-- Biters will attack the newly built Rocket Silo
			event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(4000 * game.evolution_factor), unit_search_distance = 1500}
			
			for i, player in pairs(game.players) do
					player.print("WARNING!")
					player.print("Building a Rocket Silo caused a lot of noise and biter will Attack!!!")
			end

		end
	end


	---------------------------------------------
	function On_Remove(event)

	   ---- Remove Rocket Silo count
	   if event.entity.name == "rocket-silo" then
			 global.RocketSiloBuilt = global.RocketSiloBuilt - 1      
			 writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
	   end
	end

end

	
---------------------------------------------	
if NE_Expansion_Config.Expansion then	


	Event.register(defines.events.on_tick, function(event)		

		
		--------------- Expansion ----------------------------------

			if (game.tick % (60 * 60)  == 0) and (game.evolution_factor >= .005) and (global.Natural_Evolution_state == "Peaceful") then

				if global.Peaceful_Sleep_Time > 0 then
					-- Extra sleep between expansion waves
					global.Peaceful_Sleep_Time = global.Peaceful_Sleep_Time - 1
					return
				end

				local expansionChance = math.random(math.floor((game.evolution_factor * 100) + global.Natural_Evolution_Counter), math.floor((game.evolution_factor * 100) + 100))

				-- For Early game, has about a 25% change to start Evolution
				if expansionChance >= 75 and expansionChance < 100 then
					Natural_Evolution_SetExpansionLevel("Awakening")
					
					
				-- Evolution Factor = 1% - 9%:
				elseif expansionChance >= 100 and expansionChance < 110 then
					Natural_Evolution_SetExpansionLevel("Phase 1")
					if game.evolution_factor >.1 and global.Natural_Evolution_Counter < 10 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 10% - 19%:
				elseif expansionChance >= 110 and expansionChance < 120 then
					Natural_Evolution_SetExpansionLevel("Phase 2")
					if game.evolution_factor >.2 and global.Natural_Evolution_Counter < 15 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 20% - 29%:
				elseif expansionChance >= 120 and expansionChance < 130 then
					Natural_Evolution_SetExpansionLevel("Phase 3")
					if game.evolution_factor >.3 and global.Natural_Evolution_Counter < 20 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 30% - 39%:
				elseif expansionChance >= 130 and expansionChance < 140 then
					Natural_Evolution_SetExpansionLevel("Phase 4")
					if game.evolution_factor >.4 and global.Natural_Evolution_Counter < 25 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 40% - 49%:
				elseif expansionChance >= 140 and expansionChance < 150 then
					Natural_Evolution_SetExpansionLevel("Phase 5")
					if game.evolution_factor >.5 and global.Natural_Evolution_Counter < 30 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 50% - 59%:
				elseif expansionChance >= 150 and expansionChance < 160 then
					Natural_Evolution_SetExpansionLevel("Phase 6")
					if game.evolution_factor >.6 and global.Natural_Evolution_Counter < 35 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 60% - 69%:
				elseif expansionChance >= 160 and expansionChance < 170 then
					Natural_Evolution_SetExpansionLevel("Phase 7")
					if game.evolution_factor >.7 and global.Natural_Evolution_Counter < 40 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 70% - 79%:
				elseif expansionChance >= 170 and expansionChance < 180 then
					Natural_Evolution_SetExpansionLevel("Phase 8")
					if game.evolution_factor >.7 and global.Natural_Evolution_Counter < 45 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 80% - 89%:
				elseif expansionChance >= 180 and expansionChance < 190 then
					Natural_Evolution_SetExpansionLevel("Phase 9")
					if game.evolution_factor >.8 and global.Natural_Evolution_Counter < 50 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
					
				-- Evolution Factor = 90% - 98%:
				elseif expansionChance >= 190 and expansionChance < 199 then
					Natural_Evolution_SetExpansionLevel("Phase 10")
					if game.evolution_factor >.9 and global.Natural_Evolution_Counter < 50 then
					global.Natural_Evolution_Counter = global.Natural_Evolution_Counter + 1
					end
				
				-- Evolution Factor = 99% - 100%:						
				elseif expansionChance >= 199 and expansionChance <= 200 then
					Natural_Evolution_SetExpansionLevel("Armageddon")
				end
				
				writeDebug("The Expansion Chance is: " .. expansionChance)	
				writeDebug("The Natural_Evolution Counter is: " .. global.Natural_Evolution_Counter)	

			end
			----
			if global.Natural_Evolution_state ~= "Peaceful" then
				if global.Natural_Evolution_Timer > 0 then
					global.Natural_Evolution_Timer = global.Natural_Evolution_Timer - 1
				else
					Natural_Evolution_SetExpansionLevel("Peaceful")
					global.Peaceful_Sleep_Time = NE_Expansion_Config.Extra_Peaceful_Time
				end	
			end
	end)

	
	
	----Harder Endgame Function
	function Harder_Endgame(Evo_Increase,Enemy_Count)
		if NE_Expansion_Config.HarderEndGame then	
			if global.RocketSiloBuilt > 0 then
			local E_Increase = 0
				if ((1-game.evolution_factor) / (10 * Evo_Increase)) > 0.05 then
					E_Increase = 0.05
				else 
					E_Increase = ((1-game.evolution_factor) / (10 * Evo_Increase))
				end
				 
				if game.evolution_factor < 0.9899 then
					game.evolution_factor = game.evolution_factor + E_Increase
						
				else
					game.evolution_factor = 0.99999
				end  
			
			---- Attack the player, since you have a silo built						
				for _, player in pairs(game.players) do
					if player.connected and player.valid and player.character and player.character.valid then
						player.surface.set_multi_command{command = {type=defines.command.attack, target=player.character, distraction=defines.distraction.by_enemy},unit_count = math.floor(Enemy_Count * game.evolution_factor), unit_search_distance = 1500}
					end
				end	

				writeDebug("Attack wave inbound")					
			end 
		end	
	end

	
	--------------------
	function Natural_Evolution_Expansion_Settings(Evolution_Timer_Min, Evolution_Timer_Max, NE_Min_Base_Spacing, NE_Max_Expansion_Distance, NE_building_coefficient, NE_Settler_Group_Min_Size, NE_Settler_Group_Max_Size, NE_Min_Expansion_Cooldown, NE_Max_Expansion_Cooldown, NE_Max_Group_Radius, NE_Min_Group_Radius, NE_Speedup)
		
		local enemy_expansion = game.map_settings.enemy_expansion
		local unit_group = game.map_settings.unit_group
		-----
		global.Natural_Evolution_Timer = math.random(Evolution_Timer_Min * 3600, Evolution_Timer_Max * 7200)
		if game.evolution_factor > 0.05 then
			enemy_expansion.enabled = true
		else
			enemy_expansion.enabled = false
		end
		
		enemy_expansion.min_base_spacing = NE_Min_Base_Spacing
		enemy_expansion.max_expansion_distance = NE_Max_Expansion_Distance
		--enemy_expansion.min_Player_Base_Distance = NE_min_Player_Base_Distance
		enemy_expansion.building_coefficient = NE_building_coefficient
		enemy_expansion.settler_group_min_size = NE_Settler_Group_Min_Size + global.Natural_Evolution_Counter
		enemy_expansion.settler_group_max_size = NE_Settler_Group_Max_Size + global.Natural_Evolution_Counter
		enemy_expansion.min_expansion_cooldown = NE_Min_Expansion_Cooldown * 60
		enemy_expansion.max_expansion_cooldown = NE_Max_Expansion_Cooldown * 60
			---
		unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
		unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
		unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
		unit_group.max_group_radius = NE_Max_Group_Radius + (global.Natural_Evolution_Counter / 2)
		unit_group.min_group_radius = NE_Min_Group_Radius + (global.Natural_Evolution_Counter / 2)
		unit_group.max_member_speedup_when_behind = NE_Speedup + (global.Natural_Evolution_Counter / 10)		
		
	end
	
	--------------------	
	function Natural_Evolution_SetExpansionLevel(Expansion_State)
		
		Expansion_State = Expansion_State or "Peaceful"

	
		-- allow biters to path from farther away (minor performance hit)
		if expansion_state ~= "peaceful" then
			game.map_settings.path_finder.max_steps_worked_per_tick = 500
		else
			game.map_settings.path_finder.max_steps_worked_per_tick = 50
		end

		-- default expansion settings for the "Awakening" state
		local evolution_Timer_Min = 2
		local evolution_Timer_Max = 4
		local min_Base_Spacing = 5
		local max_Expansion_Distance = 5
		
		local building_coefficient = 0.15 -- vanilla 0.1
		local other_base_coefficient = 2.0 -- vanilla 2.0
		local neighbouring_chunk_coefficient = 0.5 -- vanilla 0.5
		local neighbouring_base_chunk_coefficient = 0.4 -- vanilla 0.4
		
		
		local settler_Group_Min_Size = 2
		local settler_Group_Max_Size = 4
		local min_Expansion_Cooldown = 60
		local max_Expansion_Cooldown = 120
		local max_Group_Radius = 30
		local min_Group_Radius = 5
		local enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame

		if Expansion_State == "Peaceful" then
		
			game.map_settings.enemy_expansion.enabled = false   --- No Expansion during peaceful time
			global.Natural_Evolution_Timer = 0			
									
			if game.evolution_factor > 0.05 then
				if global.Natural_Evolution_state == "Awakening" then
					game.evolution_factor = game.evolution_factor		
				else
				-- Each time a Phase is triggered, the Evolution Factor is decreased slightly, just during the Phase.						
					local Evo_Deduction = (0.002 * (1 - game.evolution_factor))
					
					game.evolution_factor = game.evolution_factor - Evo_Deduction
					global.Total_Phase_Evo_Deduction = global.Total_Phase_Evo_Deduction + Evo_Deduction
					writeDebug("Evolution Deduction during Expansion: " .. Evo_Deduction)	
					writeDebug("Total Evolution Deduction from Phase Switch: " .. global.Total_Phase_Evo_Deduction)	
				end
							
			end	
			
		-- Defines the values for the different Evolution States.
		elseif Expansion_State == "Awakening" then
			-- No adjustments needed - Awakening is the default.


		elseif Expansion_State == "Phase 1" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----
			max_Expansion_Distance = max_Expansion_Distance + 1
			--min_Player_Base_Distance = 10
			building_coefficient = 0.125
			settler_Group_Min_Size = 2
			settler_Group_Max_Size = 4
			min_Expansion_Cooldown = 40
			max_Expansion_Cooldown = 60


		elseif Expansion_State == "Phase 2" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----
			max_Expansion_Distance = max_Expansion_Distance + 3
			--min_Player_Base_Distance = 9
			building_coefficient = 0.1 -- vanilla
			settler_Group_Min_Size = 4
			settler_Group_Max_Size = 7
			min_Expansion_Cooldown = 24
			max_Expansion_Cooldown = 30


		elseif Expansion_State == "Phase 3" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 1
			evolution_Timer_Max = evolution_Timer_Max + 1
			max_Expansion_Distance = max_Expansion_Distance + 5
			--min_Player_Base_Distance = 8
			building_coefficient = 0.1
			settler_Group_Min_Size = 6
			settler_Group_Max_Size = 10
			min_Expansion_Cooldown = 20
			max_Expansion_Cooldown = 30


		elseif Expansion_State == "Phase 4" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 2
			evolution_Timer_Max = evolution_Timer_Max + 2
			max_Expansion_Distance = max_Expansion_Distance + 7
			--min_Player_Base_Distance = 8
			building_coefficient = 0.09
			settler_Group_Min_Size = 8
			settler_Group_Max_Size = 13
			min_Expansion_Cooldown = 20
			max_Expansion_Cooldown = 24


		elseif Expansion_State == "Phase 5" then
			----- Harder Ending
			Harder_Endgame(1,1000)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 2
			evolution_Timer_Max = evolution_Timer_Max + 2
			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 8
			--min_Player_Base_Distance = 7
			building_coefficient = 0.08
			settler_Group_Min_Size = 10
			settler_Group_Max_Size = 16
			min_Expansion_Cooldown = 20
			max_Expansion_Cooldown = 20


		elseif Expansion_State == "Phase 6" then
			----- Harder Ending
			Harder_Endgame(1.5,1500)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 2
			evolution_Timer_Max = evolution_Timer_Max + 3
			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 9
			--min_Player_Base_Distance = 6
			building_coefficient = 0.07
			settler_Group_Min_Size = 12
			settler_Group_Max_Size = 19
			min_Expansion_Cooldown = 15
			max_Expansion_Cooldown = 20


		elseif Expansion_State == "Phase 7" then
			----- Harder Ending
			Harder_Endgame(1.5,2000)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 3
			evolution_Timer_Max = evolution_Timer_Max + 3
			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 10
			--min_Player_Base_Distance = 5
			building_coefficient = 0.06
			settler_Group_Min_Size = 14
			settler_Group_Max_Size = 22
			min_Expansion_Cooldown = 15
			max_Expansion_Cooldown = 20

				
		elseif Expansion_State == "Phase 8" then
			----- Harder Ending
			Harder_Endgame(1.5,2500)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 3
			evolution_Timer_Max = evolution_Timer_Max + 3
			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 11
			--min_Player_Base_Distance = 4
			building_coefficient = 0.05
			settler_Group_Min_Size = 16
			settler_Group_Max_Size = 25
			min_Expansion_Cooldown = 15
			max_Expansion_Cooldown = 20


		elseif Expansion_State == "Phase 9" then
			----- Harder Ending
			Harder_Endgame(2,3000)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 3
			evolution_Timer_Max = evolution_Timer_Max + 4
			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 13
			--min_Player_Base_Distance = 3
			building_coefficient = 0.04
			settler_Group_Min_Size = 18
			settler_Group_Max_Size = 28
			min_Expansion_Cooldown = 15
			max_Expansion_Cooldown = 20


		elseif Expansion_State == "Phase 10" then
			----- Harder Ending
			Harder_Endgame(2,3000)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 4
			evolution_Timer_Max = evolution_Timer_Max + 4
			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 15
			--min_Player_Base_Distance = 1
			building_coefficient = 0.03
			settler_Group_Min_Size = 30
			settler_Group_Max_Size = 75
			min_Expansion_Cooldown = 15
			max_Expansion_Cooldown = 20
		    enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame
			
		
		elseif Expansion_State == "Armageddon" then
			----- Harder Ending
			Harder_Endgame(2.5,3000)
			-----
			evolution_Timer_Min = evolution_Timer_Min + 4
			evolution_Timer_Max = evolution_Timer_Max + 4
			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 20
			--min_Player_Base_Distance = 1
			building_coefficient = 0.02
			settler_Group_Min_Size = 100
			settler_Group_Max_Size = 200
			min_Expansion_Cooldown = 8
			max_Expansion_Cooldown = 15
		    enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame

			
		end	

		global.Natural_Evolution_state = Expansion_State
	
		if Expansion_State ~= "Peaceful" then
			-- adjust the expansion settings based on any customizations from the config settings, making sure they stay above zero
			evolution_Timer_Min = math.max(1, evolution_Timer_Min + NE_Expansion_Config.Evolution_Timer_Min)
			evolution_Timer_Max = math.max(1, evolution_Timer_Max + NE_Expansion_Config.Evolution_Timer_Max)
			min_Base_Spacing = math.max(1, min_Base_Spacing + NE_Expansion_Config.Min_Base_Spacing)
			max_Expansion_Distance = math.max(1, max_Expansion_Distance + NE_Expansion_Config.Max_Expansion_Distance)
			--min_Player_Base_Distance = math.max(1, --min_Player_Base_Distance + NE_Expansion_Config.--min_Player_Base_Distance)
			--building_coefficient = math.max(1, building_coefficient + NE_Expansion_Config.building_coefficient)
			settler_Group_Min_Size = math.max(1, settler_Group_Min_Size * NE_Expansion_Config.Settler_Group_Size)
			settler_Group_Max_Size = math.max(1, settler_Group_Max_Size * NE_Expansion_Config.Settler_Group_Size)
			min_Expansion_Cooldown = math.max(1, min_Expansion_Cooldown * NE_Expansion_Config.Expansion_Cooldown)
			max_Expansion_Cooldown = math.max(1, max_Expansion_Cooldown * NE_Expansion_Config.Expansion_Cooldown)
			-- max_Group_Radius does not have a config setting
			-- min_Group_Radius does not have a config setting
			-- enemy_speedup has had its config settings applied already
		
			-- apply the expansion settings
			Natural_Evolution_Expansion_Settings(evolution_Timer_Min, evolution_Timer_Max, min_Base_Spacing, max_Expansion_Distance, building_coefficient, settler_Group_Min_Size, settler_Group_Max_Size, min_Expansion_Cooldown, max_Expansion_Cooldown, max_Group_Radius, min_Group_Radius, enemy_speedup)

			local unit_group = game.map_settings.unit_group
			writeDebug("Expansion state set to: " .. Expansion_State)	
			writeDebug("The Max Group Radius is: " .. unit_group.max_group_radius)
			writeDebug("The Min Group Gathering time is: " .. unit_group.min_group_gathering_time)
			writeDebug("The Max Group Gathering time and N.E. Timer is: " .. unit_group.max_group_gathering_time)
			writeDebug("The wait for late member time is: " .. unit_group.max_wait_time_for_late_members)
		end
			
	end

end


---------------------------------------------
script.on_init(On_Init)
script.on_load(On_Load)
script.on_configuration_changed(On_Load)

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if NE_Expansion_Config.QCCode then 
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
