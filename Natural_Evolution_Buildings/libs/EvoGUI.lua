require ("stdlib/event/event")

EvoGUI = {}

	if not global.Total_TerraformingStations_Evo_Deduction then
          global.Total_TerraformingStations_Evo_Deduction = 0
        elseif global.Total_TerraformingStations_Evo_Deduction < 0 then
          global.Total_TerraformingStations_Evo_Deduction = 0
	end


    function EvoGUI.create_Evo_Deduction_Text()

		local whole_number = math.floor(global.Total_TerraformingStations_Evo_Deduction*100)
        local fractional_component = math.floor((global.Total_TerraformingStations_Evo_Deduction*100 - whole_number) * 1000)
        local text2 = string.format("%d.%03d%%", whole_number, fractional_component)	
        local text = "Evolution Deduction by T-Stations: " .. text2

        return text
    end
    
    function EvoGUI.setup()
        if remote.interfaces.EvoGUI and remote.interfaces.EvoGUI.create_remote_sensor then
            global.evo_gui.detected = true

            remote.call("EvoGUI", "create_remote_sensor", {
                mod_name = "Natural Evolution",
                name = "evolution_deduction",
                text = "Evolution Deduction:",
                caption = "Evolution Deduction"
            })

            EvoGUI.update_gui()
        end
    end

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

    function EvoGUI.update_gui()
        -- figure out what color to make the text here (if any)
        local color = { r = 255, g = 255, b = 255 }

        remote.call("EvoGUI", "update_remote_sensor", "evolution_deduction", EvoGUI.create_Evo_Deduction_Text(), color)

    end


return EvoGUI