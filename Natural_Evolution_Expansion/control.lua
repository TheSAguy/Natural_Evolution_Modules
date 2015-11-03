--- v.5.0.4
require "defines"
require "util"
NEConfig = {}

require "config"



---------------------------------------------
function On_Load()
		
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

	--- Harder End Game
	---- Rocket Silo Initialization ----	
	if not global.RocketSiloBuilt then
	  global.RocketSiloBuilt = 0
	end
		
end


---------------------------------------------
if NEConfig.HarderEndGame then

	---------------------------------------------
	script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
	script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
	script.on_event({defines.events.on_entity_died,defines.events.on_robot_pre_mined_item,defines.events.on_preplayer_mined_item,},function(event) On_Remove(event) end)

---------------------------------------------
	function On_Built(event)
	  
	   --- Harder Ending Some action if you built the Rocket-silo!
		if event.created_entity.name == "rocket-silo" then
			
			global.RocketSiloBuilt = global.RocketSiloBuilt + 1
			writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
				-- Increase Evolution factor by 10% once a Rocket Silo is built	
				if game.evolution_factor < 0.89999 then
					game.evolution_factor = game.evolution_factor + 0.1
				else
					game.evolution_factor = 0.9999
				end  
					
			-- Biters will attack the newly built Rocket Silo
			event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(4000 * game.evolution_factor), unit_search_distance = 1000}
			
			for i, player in ipairs(game.players) do
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
if NEConfig.Expansion then	

	script.on_event(defines.events.on_tick, function(event)
		--------------- Expansion ----------------------------------

			if (game.tick % (60 * 60)  == 0) and (game.evolution_factor >= .005) and (global.Natural_Evolution_state == "Peaceful") then
					
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
				end	
			end
	end)

	
	
	----Harder Endgame Function
	function Harder_Endgame(Evo_Increase,Enemy_Count)
		if NEConfig.HarderEndGame then	
			if global.RocketSiloBuilt > 0 then
				if game.evolution_factor < 0.9899 then
					game.evolution_factor = game.evolution_factor + Evo_Increase
						
				else
					game.evolution_factor = 0.99999
				end  	
				---- Attack the player, since you have a silo built			
				game.player.surface.set_multi_command{command = {type=defines.command.attack, target=game.player.character, distraction=defines.distraction.by_enemy},unit_count = math.floor(Enemy_Count * game.evolution_factor), unit_search_distance = 1000}
				writeDebug("Attack wave inbound")					
			end 
		end	
	end

	
	--------------------
	function Natural_Evolution_Expansion_Settings(Evolution_Timer_Min, Evolution_Timer_Max, NE_Min_Base_Spacing, NE_Max_Expansion_Distance, NE_Min_Player_Base_Distance, NE_Settler_Group_Min_Size, NE_Settler_Group_Max_Size, NE_Min_Expansion_Cooldown, NE_Max_Expansion_Cooldown, NE_Max_Group_Radius, NE_Min_Group_Radius, NE_Speedup)
		
		local enemy_expansion = game.map_settings.enemy_expansion
		local unit_group = game.map_settings.unit_group
		-----
		global.Natural_Evolution_Timer = math.random(Evolution_Timer_Min * 3600, Evolution_Timer_Max * 3600)
		enemy_expansion.enabled = true
		enemy_expansion.min_base_spacing = NE_Min_Base_Spacing
		enemy_expansion.max_expansion_distance = NE_Max_Expansion_Distance
		enemy_expansion.min_player_base_distance = NE_Min_Player_Base_Distance
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
		
		-- cause pollution to spread farther
		game.map_settings.pollution.diffusion_ratio = 0.04
		game.map_settings.pollution.min_to_diffuse = 50
	
		-- allow biters to path from farther away (minor performance hit)
		if expansion_state ~= "peaceful" then
			game.map_settings.path_finder.max_steps_worked_per_tick = 500
		end
	
		if Expansion_State == "Peaceful" then
			game.map_settings.enemy_expansion.enabled = false
			global.Natural_Evolution_Timer = 0
			
									
		if game.evolution_factor > 0.05 then
			if global.Natural_Evolution_state == "Awakening" then
				game.evolution_factor = game.evolution_factor		
			else 
				-- Each time a Phase is triggered, the Evolution Factor is decreased slightly, just during the Phase.
				game.evolution_factor = game.evolution_factor - (0.002 * (1 - game.evolution_factor))
				writeDebug("Evolution Deduction during Expansion: " .. (0.002 * (1 - game.evolution_factor)))	
			end
						
		end	
			
		-- Defines the values for the different Evolution States.
		elseif Expansion_State == "Awakening" then
			Natural_Evolution_Expansion_Settings(2,4,3,5,20,2,4,60,120,10,5,1.4)
			
		
		elseif Expansion_State == "Phase 1" then
			----- Harder Ending
			Harder_Endgame(0.1,500)
			-----
			Natural_Evolution_Expansion_Settings(2,4,5,6,10,2,4,40,60,30,5,1.4)

				
		elseif Expansion_State == "Phase 2" then
			----- Harder Ending
			Harder_Endgame(0.1,500)
			-----
			Natural_Evolution_Expansion_Settings(2,4,5,8,9,4,7,24,30,30,5,1.4)

				
		elseif Expansion_State == "Phase 3" then
			----- Harder Ending
			Harder_Endgame(0.05,500)
			-----
			Natural_Evolution_Expansion_Settings(3,5,5,10,8,6,10,20,30,30,5,1.4)


		elseif Expansion_State == "Phase 4" then
			----- Harder Ending
			Harder_Endgame(0.05,500)
			-----
			Natural_Evolution_Expansion_Settings(4,6,5,12,8,8,13,20,24,30,5,1.4)

				
		elseif Expansion_State == "Phase 5" then
			----- Harder Ending
			Harder_Endgame(0.025,1000)
			-----
			Natural_Evolution_Expansion_Settings(4,6,4,13,7,10,16,20,20,30,5,1.4)

				
		elseif Expansion_State == "Phase 6" then
			----- Harder Ending
			Harder_Endgame(0.025,1500)
			-----
			Natural_Evolution_Expansion_Settings(4,7,4,14,6,12,19,15,20,30,5,1.4)
			
				
		elseif Expansion_State == "Phase 7" then
			----- Harder Ending
			Harder_Endgame(0.015,2000)
			-----
			Natural_Evolution_Expansion_Settings(5,7,4,15,5,14,22,15,20,30,5,1.4)

				
		elseif Expansion_State == "Phase 8" then
			----- Harder Ending
			Harder_Endgame(0.015,2500)
			-----
			Natural_Evolution_Expansion_Settings(5,7,4,16,4,16,25,15,20,30,5,1.4)


		elseif Expansion_State == "Phase 9" then
			----- Harder Ending
			Harder_Endgame(0.01,3000)
			-----
			Natural_Evolution_Expansion_Settings(5,8,3,18,3,18,28,15,20,30,5,1.4)


		elseif Expansion_State == "Phase 10" then
			----- Harder Ending
			Harder_Endgame(0.01,3000)
			-----
			Natural_Evolution_Expansion_Settings(6,8,3,20,1,30,75,15,20,30,5,2)
			
		
		elseif Expansion_State == "Armageddon" then
			----- Harder Ending
			Harder_Endgame(0.001,3000)
			-----
			Natural_Evolution_Expansion_Settings(6,8,2,20,1,100,200,8,15,30,5,2)
		
		end
			
		global.Natural_Evolution_state = Expansion_State
		
		if Expansion_State ~= "Peaceful" then
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
