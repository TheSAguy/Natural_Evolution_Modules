if remote.interfaces.EvoGUI then


	local Event = require('__stdlib__/stdlib/event/event').set_protected_mode(true)
	
	EvoGUI = {}

		if not global.Total_TerraformingStations_Evo_Deduction then
			  global.Total_TerraformingStations_Evo_Deduction = 0
			elseif global.Total_TerraformingStations_Evo_Deduction < 0 then
			  global.Total_TerraformingStations_Evo_Deduction = 0
		end


		function EvoGUI.create_Evo_Deduction_Text()

			local whole_number = math.floor(global.Total_TerraformingStations_Evo_Deduction*100)
			local fractional_component = math.floor((global.Total_TerraformingStations_Evo_Deduction*100 - whole_number) * 100)
			local text2 = string.format("%d.%02d%%", whole_number, fractional_component)	
			local text = "Evolution Deduction by T-Stations: " .. text2

			return text
		end

		--- Evolution due to Destruction
		function EvoGUI.create_Evo_Destruction_Text()

			local percent_destruction_evo_factor = game.forces.enemy.evolution_factor_by_killing_spawners * 100
			local whole_number = math.floor(percent_destruction_evo_factor)
			local fractional_component = math.floor((percent_destruction_evo_factor - whole_number) * 100)
			local text2 = string.format("%d.%02d%%", whole_number, fractional_component)	
			local text = "Evolution Increase via Destruction: " .. text2

			return text
		end

		--- Evolution due to Time
		function EvoGUI.create_Evo_Time_Text()

			local percent_destruction_evo_factor = game.forces.enemy.evolution_factor_by_time * 100
			local whole_number = math.floor(percent_destruction_evo_factor)
			local fractional_component = math.floor((percent_destruction_evo_factor - whole_number) * 100)
			local text2 = string.format("%d.%02d%%", whole_number, fractional_component)	
			local text = "Evolution Increase via Time: " .. text2

			return text
		end

		--- Evolution due to Pollution
		function EvoGUI.create_Evo_Pollution_Text()

			local percent_destruction_evo_factor = game.forces.enemy.evolution_factor_by_pollution * 100
			local whole_number = math.floor(percent_destruction_evo_factor)
			local fractional_component = math.floor((percent_destruction_evo_factor - whole_number) * 100)
			local text2 = string.format("%d.%02d%%", whole_number, fractional_component)	
			local text = "Evolution Increase via Pollution: " .. text2

			return text
		end


		
		
		function EvoGUI.setup()
			if remote.interfaces.EvoGUI and remote.interfaces.EvoGUI.create_remote_sensor then
				if not global.evo_gui then global.evo_gui = {} end
				global.evo_gui.detected = true

				remote.call("EvoGUI", "create_remote_sensor", {
					mod_name = "Natural Evolution",
					name = "evolution_deduction",
					text = "Evolution Deduction:",
					caption = "Evolution Deduction"
				})
					remote.call("EvoGUI", "create_remote_sensor", {
					mod_name = "Natural Evolution",
					name = "evolution_destruction",
					text = "Evolution increase via Destruction:",
					caption = "Evolution increase via Destruction"
				})
					remote.call("EvoGUI", "create_remote_sensor", {
					mod_name = "Natural Evolution",
					name = "evolution_time",
					text = "Evolution increase via Time:",
					caption = "Evolution increase via Time"
				})
					remote.call("EvoGUI", "create_remote_sensor", {
					mod_name = "Natural Evolution",
					name = "evolution_pollution",
					text = "Evolution increase via Pollution:",
					caption = "Evolution increase via Pollution"
				})
				
				EvoGUI.update_gui()
			end
		end

		--[[
	Event.register(defines.events.on_tick, function(event)	

		if not global.evo_gui then global.evo_gui = {} end

			if not global.evo_gui.detected then
				EvoGUI.setup()
			end
			
			if global.evo_gui.detected and game.tick % 10 == 0 then
				if remote.interfaces.EvoGUI then
					EvoGUI.update_gui()
				end
			end

	end)	
]]
		function EvoGUI.update_gui()
			-- figure out what color to make the text here (if any)
			local color = { r = 255, g = 255, b = 255 }
			local color_red = { r = 255, g = 0, b = 0 }
			local color_green = { r = 0, g = 255, b = 0 }

			remote.call("EvoGUI", "update_remote_sensor", "evolution_deduction", EvoGUI.create_Evo_Deduction_Text(), color)
			remote.call("EvoGUI", "update_remote_sensor", "evolution_destruction", EvoGUI.create_Evo_Destruction_Text(), color)
			remote.call("EvoGUI", "update_remote_sensor", "evolution_time", EvoGUI.create_Evo_Time_Text(), color)
			remote.call("EvoGUI", "update_remote_sensor", "evolution_pollution", EvoGUI.create_Evo_Pollution_Text(), color)
			
		end


	return EvoGUI

end