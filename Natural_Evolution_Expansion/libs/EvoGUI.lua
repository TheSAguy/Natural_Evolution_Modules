require ("stdlib/event/event")

EvoGUI = {}


	
	if not global.Total_Phase_Evo_Deduction then
          global.Total_Phase_Evo_Deduction = 0
        elseif global.Total_Phase_Evo_Deduction < 0 then
          global.Total_Phase_Evo_Deduction = 0
	end

    function EvoGUI.create_Evolution_Rate_Text()
        local diff = game.forces.enemy.evolution_factor - global.exponential_moving_average
        -- percentage is decimal * 100, * 60 for per minute value
        local evo_rate_per_min = math.abs(diff * 100 * 60)
        
        -- this nonsense is because string.format(%.3f) is not safe in MP across platforms, but integer math is
        local whole_number = math.floor(evo_rate_per_min)
        local fractional_component = math.floor((evo_rate_per_min - whole_number) * 1000)
        local text = string.format("%d.%04d%%", whole_number, fractional_component)
        if diff > 0 then
            return "Evolution Rate: +" .. text .. " / min"
        else
            return "Evolution Rate: -" .. text .. " / min"
        end
    end


    function EvoGUI.create_Evolution_Text()
        local text = "Evolution State: " .. global.Natural_Evolution_state
		if global.Natural_Evolution_state ~= "Peaceful" then
        text = text .. " ( " .. math.floor(global.Natural_Evolution_Timer / 60) .. "s )"
		else 
		text = text .. " ( " .. math.floor(global.Peace_Timer / 60) .. "s )"
		end
        return text
    end

	
    function EvoGUI.create_Phase_Text()

		local whole_number = math.floor(global.Total_Phase_Evo_Deduction*100)
        local fractional_component = math.floor((global.Total_Phase_Evo_Deduction*100 - whole_number) * 1000)
        local text2 = string.format("%d.%03d%%", whole_number, fractional_component)	
        local text = "Evo Deduction from Exp Phases: " .. text2

        return text
    end
	
		
    function EvoGUI.calculate_Evolution_Rate_Color()
        local diff = game.forces.enemy.evolution_factor - global.exponential_moving_average
        
        if diff > 0 then
            local red = (100 * 255 * diff) / 0.0035
            return { r = math.max(0, math.min(255, math.floor( red ))), g = math.max(0, math.min(255, math.floor( 255 - red ))), b = 0 }
        else
            return { r = 0, g = 255, b = 0 }
        end
    end


    
    function EvoGUI.setup()
        if remote.interfaces.EvoGUI and remote.interfaces.EvoGUI.create_remote_sensor then
            global.evo_gui.detected = true

            remote.call("EvoGUI", "create_remote_sensor", {
                mod_name = "Natural Evolution",
                name = "evolution_state",
                text = "Evolution State:",
                caption = "Evolution State"
            })
            remote.call("EvoGUI", "create_remote_sensor", {
                mod_name = "Natural Evolution",
                name = "evolution_rate",
                text = "Evolution Rate:",
                caption = "Evolution Rate"
            })
			    remote.call("EvoGUI", "create_remote_sensor", {
                mod_name = "Natural Evolution",
                name = "phase_deduction",
                text = "Total Phase Evo Deduction:",
                caption = "Total Phase Evo Deduction"
            })
            EvoGUI.update_gui()
        end
    end

	
Event.register(defines.events.on_tick, function(event)
        if not global.evo_gui then global.evo_gui = {} end
        if not global.exponential_moving_average then
            global.exponential_moving_average = game.forces.enemy.evolution_factor
        end

        if not global.evo_gui.detected then
            EvoGUI.setup()
        end
        if global.evo_gui.detected and game.tick % 10 == 0 then
            if remote.interfaces.EvoGUI then
				EvoGUI.update_gui()
                global.exponential_moving_average = global.exponential_moving_average + (0.8 * (game.forces.enemy.evolution_factor - global.exponential_moving_average))
            end
        end
    end)

    function EvoGUI.update_gui()
        -- figure out what color to make the text here (if any)
        local color = { r = 255, g = 255, b = 255 }

        remote.call("EvoGUI", "update_remote_sensor", "evolution_state", EvoGUI.create_Evolution_Text(), color)
        remote.call("EvoGUI", "update_remote_sensor", "evolution_rate", EvoGUI.create_Evolution_Rate_Text(), EvoGUI.calculate_Evolution_Rate_Color())
		remote.call("EvoGUI", "update_remote_sensor", "phase_deduction", EvoGUI.create_Phase_Text(), color)
    end



return EvoGUI