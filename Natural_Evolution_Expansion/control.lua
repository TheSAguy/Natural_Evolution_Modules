--- EXPANSION v.6.4.0

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
	Expansion_Initial_Setup() 
	
end


function On_Change()
	
	if not global.Peace_Timer then
		global.Peace_Timer = 0
	end
	

end

---------------------------------------------


if NE_Expansion_Config.HarderEndGame then

	---------------------------------------------
	script.on_event({defines.events.on_robot_built_entity,defines.events.on_built_entity,},function(event) On_Built(event) end)
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
			event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(4000 * game.evolution_factor), unit_search_distance = 2500}
			
			for i, player in pairs(game.players) do
					player.print("WARNING!")
					player.print("Building a Rocket Silo caused a lot of noise and biters will attack!!!")
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

	--------------------
function Expansion_Initial_Setup() 
		
	local enemy_expansion = game.map_settings.enemy_expansion
	local unit_group = game.map_settings.unit_group
		
	enemy_expansion.enabled = false -- Disable Initial Expansion - Vanilla = True	
	enemy_expansion.min_base_spacing = 3 -- Vanilla 3
	enemy_expansion.max_expansion_distance = 5 -- Vanilla 7
	enemy_expansion.building_coefficient = 0.8 -- vanilla 0.1
	enemy_expansion.other_base_coefficient = 2.1 -- vanilla 2.0
	enemy_expansion.neighbouring_chunk_coefficient = 0.6 -- vanilla 0.5
	enemy_expansion.neighbouring_base_chunk_coefficient = 0.5 -- vanilla 0.4	
	enemy_expansion.settler_group_min_size = 2 -- Vanilla 5
	enemy_expansion.settler_group_max_size = 4 -- Vanilla 20
	---
	unit_group.max_group_radius = 20 -- Vanilla 30
	unit_group.min_group_radius = 5 -- Vanilla 5		
		
end




	
---------------------------------------------	
if NE_Expansion_Config.Expansion then	

	local evolution_Timer_Peace = (NE_Expansion_Config.Evolution_Timer * 3600) * 2 -- Default is 10min. There will thus be a random 0-10min peace after each Phase.
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
			if (game.tick % (evolution_Timer_Peace)  == 0) and (game.evolution_factor >= .005) and (global.Natural_Evolution_state == "Peaceful") then
				
				
				--- Should generate a random value between 0 and 200
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
					global.Peace_Timer = evolution_Timer_Peace
				end	
			end
	end)


	----Harder Endgame Function - Will send waves of enemies to attack the player once the Rocket Silo is built. Will also increase the Evolutio factor slightly with each wave.
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
	function Natural_Evolution_Expansion_Settings(evolution_Timer, NE_Min_Base_Spacing, NE_Max_Expansion_Distance, NE_building_coefficient, NE_Settler_Group_Min_Size, NE_Settler_Group_Max_Size, NE_Max_Group_Radius, NE_Min_Group_Radius, NE_Speedup, NE_other_base_coefficient,NE_neighbouring_chunk_coefficient, NE_neighbouring_base_chunk_coefficient)
		
		local enemy_expansion = game.map_settings.enemy_expansion
		local unit_group = game.map_settings.unit_group
		-----

		--Current formula 5 min + 0min @ 0% evo and 10min @ 100% evo. So A phase can last 5 - 15min.
		global.Natural_Evolution_Timer = (evolution_Timer + (game.evolution_factor * evolution_Timer) * 2)
		
		
		-- Below 5% evolution, no expansion
		if game.evolution_factor > 0.05 then
			enemy_expansion.enabled = true
		else
			enemy_expansion.enabled = false
		end
		
		if NE_Min_Base_Spacing < 1 then NE_Min_Base_Spacing = 1 end
		
		enemy_expansion.min_base_spacing = NE_Min_Base_Spacing
		enemy_expansion.max_expansion_distance = NE_Max_Expansion_Distance
		enemy_expansion.building_coefficient = NE_building_coefficient
		enemy_expansion.other_base_coefficient = NE_other_base_coefficient
		enemy_expansion.neighbouring_chunk_coefficient = NE_neighbouring_chunk_coefficient
		enemy_expansion.neighbouring_base_chunk_coefficient = NE_neighbouring_base_chunk_coefficient
		enemy_expansion.settler_group_min_size = NE_Settler_Group_Min_Size + global.Natural_Evolution_Counter
		enemy_expansion.settler_group_max_size = NE_Settler_Group_Max_Size + global.Natural_Evolution_Counter
		enemy_expansion.min_Expansion_Cooldown = math.floor(global.Natural_Evolution_Timer / 4)
		enemy_expansion.max_Expansion_Cooldown = math.floor(global.Natural_Evolution_Timer / 2)
			
		unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 4)
		unit_group.max_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
		unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 8)
		unit_group.max_group_radius = NE_Max_Group_Radius + (global.Natural_Evolution_Counter / 2)
		unit_group.min_group_radius = NE_Min_Group_Radius + (global.Natural_Evolution_Counter / 2)
		unit_group.max_member_speedup_when_behind = NE_Speedup + (global.Natural_Evolution_Counter / 10)		
		
		
		
		writeDebug("The Global.Natural_Evolution_Timer is: " .. global.Natural_Evolution_Timer)		
		writeDebug("The Min Cooldown is: " .. (global.Natural_Evolution_Timer / 4))
		writeDebug("The Max Cooldown is: " .. (global.Natural_Evolution_Timer / 2))
	
		
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

		-- DEFAULT expansion settings for the "Peace" & "Awakening" state. Awake state has Expansion Enabled though.

		local min_Base_Spacing = 3 -- Vanilla 3
		local max_Expansion_Distance = 5 -- Vanilla 7
		
		local building_coefficient = 0.6 - (global.Natural_Evolution_Counter / 250) -- vanilla 0.1
		local other_base_coefficient = 2.1 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
		local neighbouring_chunk_coefficient = 0.6 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
		local neighbouring_base_chunk_coefficient = 0.45 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4
		
		
		local settler_Group_Min_Size = 2 -- Vanilla 5
		local settler_Group_Max_Size = 4 -- Vanilla 20

		local max_Group_Radius = 20 -- Vanilla 30
		local min_Group_Radius = 5 -- Vanilla 5
		local enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame

		if Expansion_State == "Peaceful" then
		
			game.map_settings.enemy_expansion.enabled = false   --- No Expansion during Peaceful time
			global.Natural_Evolution_Timer = 0			
			
			-- Each time a Phase is triggered, the Evolution Factor is decreased slightly, just during the Phase.				
			if NE_Expansion_Config.Reduce_Evo_on_Phase_Change then			
				if game.evolution_factor > 0.05 then
					if global.Natural_Evolution_state == "Awakening" then
						game.evolution_factor = game.evolution_factor		
					else
										
						local Evo_Deduction = (0.0025 * (1 - game.evolution_factor)*(1 - game.evolution_factor))
						
						game.evolution_factor = game.evolution_factor - Evo_Deduction
						global.Total_Phase_Evo_Deduction = global.Total_Phase_Evo_Deduction + Evo_Deduction
						writeDebug("Evolution Deduction during Expansion: " .. Evo_Deduction)	
						writeDebug("Total Evolution Deduction from Phase Switch: " .. global.Total_Phase_Evo_Deduction)	
					end
								
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
		
			building_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.55 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.45 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4			
		
			settler_Group_Min_Size = 2
			settler_Group_Max_Size = 4



		elseif Expansion_State == "Phase 2" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----
			max_Expansion_Distance = max_Expansion_Distance + 3
			
			building_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.55 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 6
			settler_Group_Max_Size = 12



		elseif Expansion_State == "Phase 3" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----

			max_Expansion_Distance = max_Expansion_Distance + 5
			
			building_coefficient = 0.2 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.5 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.45 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4		
			
			settler_Group_Min_Size = 8
			settler_Group_Max_Size = 16



		elseif Expansion_State == "Phase 4" then
			----- Harder Ending
			Harder_Endgame(1,500)
			-----

			max_Expansion_Distance = max_Expansion_Distance + 7
			
			building_coefficient = 0.15 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.5 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 10
			settler_Group_Max_Size = 20



		elseif Expansion_State == "Phase 5" then
			----- Harder Ending
			Harder_Endgame(1,1000)
			-----

			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 8
			
			building_coefficient = 0.1 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.5 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 12
			settler_Group_Max_Size = 24



		elseif Expansion_State == "Phase 6" then
			----- Harder Ending
			Harder_Endgame(1.5,1500)
			-----

			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 9
			
			building_coefficient = 0.1 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 2.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.5 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.35 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 14
			settler_Group_Max_Size = 28



		elseif Expansion_State == "Phase 7" then
			----- Harder Ending
			Harder_Endgame(1.5,2000)
			-----

			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 10
			
			building_coefficient = 0.1 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 1.8 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.45 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.35 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4
			
			settler_Group_Min_Size = 16
			settler_Group_Max_Size = 36


				
		elseif Expansion_State == "Phase 8" then
			----- Harder Ending
			Harder_Endgame(1.5,2500)
			-----

			min_Base_Spacing = min_Base_Spacing - 1
			max_Expansion_Distance = max_Expansion_Distance + 11
			
			building_coefficient = 0.08 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 1.8 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.32 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 20
			settler_Group_Max_Size = 44



		elseif Expansion_State == "Phase 9" then
			----- Harder Ending
			Harder_Endgame(2,3000)
			-----

			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 13
			
			building_coefficient = 0.06 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 1.6 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.38 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.32 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 22
			settler_Group_Max_Size = 56



		elseif Expansion_State == "Phase 10" then
			----- Harder Ending
			Harder_Endgame(2,3000)
			-----

			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 15
			
			building_coefficient = 0.04 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 1.4 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.34 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.3 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 30
			settler_Group_Max_Size = 75

		    enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame
			
		
		elseif Expansion_State == "Armageddon" then
			----- Harder Ending
			Harder_Endgame(2.5,3000)
			-----

			min_Base_Spacing = min_Base_Spacing - 2
			max_Expansion_Distance = max_Expansion_Distance + 20
			
			building_coefficient = 0.04 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.1
			other_base_coefficient = 1.0 - (global.Natural_Evolution_Counter / 1000) -- vanilla 2.0
			neighbouring_chunk_coefficient = 0.3 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.5
			neighbouring_base_chunk_coefficient = 0.3 - (global.Natural_Evolution_Counter / 1000) -- vanilla 0.4	
			
			settler_Group_Min_Size = 100
			settler_Group_Max_Size = 200

		    enemy_speedup = NE_Expansion_Config.Enemy_Speedup_Endgame

			
		end	

		global.Natural_Evolution_state = Expansion_State
	
		if Expansion_State ~= "Peaceful" then
			-- adjust the expansion settings based on any customizations from the config settings, making sure they stay above zero

			evolution_Timer = (NE_Expansion_Config.Evolution_Timer * 3600)

			settler_Group_Min_Size = math.max(1, settler_Group_Min_Size * NE_Expansion_Config.Settler_Group_Size)
			settler_Group_Max_Size = math.max(1, settler_Group_Max_Size * NE_Expansion_Config.Settler_Group_Size)

		
			-- apply the expansion settings
			Natural_Evolution_Expansion_Settings(evolution_Timer, min_Base_Spacing, max_Expansion_Distance, building_coefficient, settler_Group_Min_Size, settler_Group_Max_Size, max_Group_Radius, min_Group_Radius, enemy_speedup, other_base_coefficient, neighbouring_chunk_coefficient, neighbouring_base_chunk_coefficient)

		end
			
	end

end


---------------------------------------------
script.on_init(On_Init)
--script.on_load(On_Load)
script.on_configuration_changed(On_Change)

---------------------------------------------
--- DeBug Messages 
function writeDebug(message)
	if NE_Expansion_Config.QCCode then 
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
