--- v.5.0.0
require "defines"
require "util"
NEConfig = {}

require "config"


	
	game.on_init(function() On_Load() end)
	game.on_load(function() On_Load() end)


					 
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

if NEConfig.HarderEndGame then


	game.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
	game.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
	game.on_event(defines.events.on_preplayer_mined_item, function(event) On_Removed(event) end)
	game.on_event(defines.events.on_robot_pre_mined, function(event) On_Removed(event) end)
	game.on_event(defines.events.on_entity_died, function(event) On_Removed(event) end)

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
				event.created_entity.surface.set_multi_command({type=defines.command.attack,target=event.created_entity,distraction=defines.distraction.none},2000)
				writeDebug("Attack wave inbound")	
				
				game.player.print("WARNING!")
				game.player.print("Building a Rocket Silo caused a lot of noise and biter will Attack!!!")
			end

	end


---------------------------------------------

	function On_Removed(event)

	   ---- Remove Rocket Silo count
	   if event.entity.name == "rocket-silo" then
			 global.RocketSiloBuilt = global.RocketSiloBuilt - 1      
			 writeDebug("The number of Rocket Silos is: " .. global.RocketSiloBuilt)	
	   end
	end

end

	
	
if NEConfig.Expansion then	

	game.on_event(defines.events.on_tick, function(event)
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
				game.player.surface.set_multi_command({type=defines.command.attack,target=game.player.character,distraction=defines.distraction.by_enemy},Enemy_Count)
				writeDebug("Attack wave inbound")					
			end 
		end	
	end

	
--------------------	
	function Natural_Evolution_SetExpansionLevel(Expansion_State)
	
	local enemy_expansion = game.map_settings.enemy_expansion
	local unit_group = game.map_settings.unit_group
	
		Expansion_State = Expansion_State or "Peaceful"
		
		if Expansion_State == "Peaceful" then
			enemy_expansion.enabled = false
			global.Natural_Evolution_Timer = 0
			
			-- Each time a Phase is triggered, the Evolution Factor is decreased slightly, just during the Phase.
			if game.evolution_factor > 0.05 then
			
				if global.Natural_Evolution_state == "Awakening" then
					game.evolution_factor = game.evolution_factor		
				elseif global.Natural_Evolution_state == "Phase 1" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 2" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 3" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 4" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))			
				elseif global.Natural_Evolution_state == "Phase 5" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 6" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 7" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 8" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 9" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Phase 10" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				elseif global.Natural_Evolution_state == "Armageddon" then
					game.evolution_factor = game.evolution_factor - (0.00012 * (1 - game.evolution_factor))
				end
						
			end
		
		-- Defines the values for the different Evolution States.
		elseif Expansion_State == "Awakening" then
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(2 * 3600, 4 * 3600)
			enemy_expansion.min_base_spacing = 3
			enemy_expansion.max_expansion_distance = 5
			enemy_expansion.min_player_base_distance = 20
			enemy_expansion.settler_group_min_size = 2 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 4 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 60 * 60
			enemy_expansion.max_expansion_cooldown = 120 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 10.0
			unit_group.min_group_radius = 5.0
			unit_group.max_member_speedup_when_behind = 1.4
				
		
		elseif Expansion_State == "Phase 1" then
			----- Harder Ending
			Harder_Endgame(0.1,100)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(2 * 3600, 4 * 3600)
			enemy_expansion.min_base_spacing = 5
			enemy_expansion.max_expansion_distance = 6
			enemy_expansion.min_player_base_distance = 10
			enemy_expansion.settler_group_min_size = 2 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 4 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 40 * 60
			enemy_expansion.max_expansion_cooldown = 60 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 2" then
			----- Harder Ending
			Harder_Endgame(0.1,200)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(2 * 3600, 4 * 3600)
			enemy_expansion.min_base_spacing = 5
			enemy_expansion.max_expansion_distance = 8
			enemy_expansion.min_player_base_distance = 9
			enemy_expansion.settler_group_min_size = 4 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 7 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 24 * 60
			enemy_expansion.max_expansion_cooldown = 30 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 3" then
			----- Harder Ending
			Harder_Endgame(0.05,400)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(3 * 3600, 5 * 3600)
			enemy_expansion.min_base_spacing = 5
			enemy_expansion.max_expansion_distance = 10
			enemy_expansion.min_player_base_distance = 8
			enemy_expansion.settler_group_min_size = 6 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 10 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 20 * 60
			enemy_expansion.max_expansion_cooldown = 30 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)


		elseif Expansion_State == "Phase 4" then
			----- Harder Ending
			Harder_Endgame(0.05,500)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(4 * 3600, 6 * 3600)
			enemy_expansion.min_base_spacing = 5
			enemy_expansion.max_expansion_distance = 12
			enemy_expansion.min_player_base_distance = 8
			enemy_expansion.settler_group_min_size = 8 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 13 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 20 * 60
			enemy_expansion.max_expansion_cooldown = 24 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 5" then
			----- Harder Ending
			Harder_Endgame(0.025,600)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(4 * 3600, 6 * 3600)
			enemy_expansion.min_base_spacing = 4
			enemy_expansion.max_expansion_distance = 13
			enemy_expansion.min_player_base_distance = 7
			enemy_expansion.settler_group_min_size = 10 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 16 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 20 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)				
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 6" then
			----- Harder Ending
			Harder_Endgame(0.025,700)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(4 * 3600, 7 * 3600)
			enemy_expansion.min_base_spacing = 4
			enemy_expansion.max_expansion_distance = 14
			enemy_expansion.min_player_base_distance = 6
			enemy_expansion.settler_group_min_size = 12 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 19 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 15 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 7" then
			----- Harder Ending
			Harder_Endgame(0.015,800)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(5 * 3600, 7 * 3600)
			enemy_expansion.min_base_spacing = 4
			enemy_expansion.max_expansion_distance = 15
			enemy_expansion.min_player_base_distance = 5
			enemy_expansion.settler_group_min_size = 14 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 22 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 15 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

				
		elseif Expansion_State == "Phase 8" then
			----- Harder Ending
			Harder_Endgame(0.015,900)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(5 * 3600, 7 * 3600)
			enemy_expansion.min_base_spacing = 4
			enemy_expansion.max_expansion_distance = 16
			enemy_expansion.min_player_base_distance = 4
			enemy_expansion.settler_group_min_size = 16 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 25 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 15 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)


		elseif Expansion_State == "Phase 9" then
			----- Harder Ending
			Harder_Endgame(0.01,1000)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(5 * 3600, 8 * 3600)
			enemy_expansion.min_base_spacing = 3
			enemy_expansion.max_expansion_distance = 18
			enemy_expansion.min_player_base_distance = 3
			enemy_expansion.settler_group_min_size = 18 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 28 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 15 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)


		elseif Expansion_State == "Phase 10" then
			----- Harder Ending
			Harder_Endgame(0.01,2000)
			-----
			enemy_expansion.enabled = true
			global.Natural_Evolution_Timer = math.random(6 * 3600, 8 * 3600)
			enemy_expansion.min_base_spacing = 3
			enemy_expansion.max_expansion_distance = 20
			enemy_expansion.min_player_base_distance = 0
			enemy_expansion.settler_group_min_size = 30 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 75 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 15 * 60
			enemy_expansion.max_expansion_cooldown = 20 * 60
					---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 2)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 10)

			
		
		elseif Expansion_State == "Armageddon" then
			--- During Armageddon state the player will be attached regardless of Silo built or not.
			game.player.surface.set_multi_command({type=defines.command.attack,target=game.player.character,distraction=defines.distraction.by_enemy},2000)
			writeDebug("Attack wave inbound")	
			
			enemy_expansion.enabled = true					 
			global.Natural_Evolution_Timer = math.random(6 * 3600, 8 * 3600)
			enemy_expansion.min_base_spacing = 2
			enemy_expansion.max_expansion_distance = 20
			enemy_expansion.min_player_base_distance = 0
			enemy_expansion.settler_group_min_size = 100 + global.Natural_Evolution_Counter
			enemy_expansion.settler_group_max_size = 200 + global.Natural_Evolution_Counter
			enemy_expansion.min_expansion_cooldown = 8 * 60
			enemy_expansion.max_expansion_cooldown = 15 * 60
				---
			unit_group.min_group_gathering_time = math.floor(global.Natural_Evolution_Timer / 2)
			unit_group.max_group_gathering_time = global.Natural_Evolution_Timer
			unit_group.max_wait_time_for_late_members = math.floor(global.Natural_Evolution_Timer / 4)
			unit_group.max_group_radius = 30.0 + (global.Natural_Evolution_Counter / 1)
			unit_group.min_group_radius = 5.0 + (global.Natural_Evolution_Counter / 1)
			unit_group.max_member_speedup_when_behind = 1.4 + (global.Natural_Evolution_Counter / 5)
		
		end
				
		if Expansion_State ~= "Peaceful" then
			writeDebug("Expansion state set to: " .. Expansion_State)	
			writeDebug("The Max Group Radius is: " .. unit_group.max_group_radius)
			writeDebug("The Min Group Gathering time is: " .. unit_group.min_group_gathering_time)
			writeDebug("The Max Group Gathering time and N.E. Timer is: " .. unit_group.max_group_gathering_time)
			writeDebug("The wait for late member time is: " .. unit_group.max_wait_time_for_late_members)
		end
			
	end
--------------- END Expansion ------------------------------
end

--- DeBug Messages 
function writeDebug(message)
  if NEConfig.QCCode then game.player.print(tostring(message)) end
end
