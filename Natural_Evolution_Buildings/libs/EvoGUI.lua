
EvoGUI = {}

function EvoGUI.new()

--[[
    function EvoGUI:createEvolutionRateText()
        local diff = global.Total_TerraformingStations_Evo_Deduction
        -- percentage is decimal * 100, * 60 for per minute value
        local evo_rate_per_min = math.abs(diff * 100 * 60)
        
        -- this nonsense is because string.format(%.3f) is not safe in MP across platforms, but integer math is
        local whole_number = math.floor(evo_rate_per_min)
        local fractional_component = math.floor((evo_rate_per_min - whole_number) * 1000)
        local text = string.format("%d.%04d%%", whole_number, fractional_component)
        if diff > 0 then
            return "The total Evolution Deduction due to Terraforming Stations is: +" .. text .. " / min"
        else
            return "The total Evolution Deduction due to Terraforming Stations is: -" .. text .. " / min"
        end
    end
]]

    function EvoGUI:createEvolutionText()
        local text = "The total Evolution Deduction due to Terraforming Stations is: " .. global.Total_TerraformingStations_Evo_Deduction
        return text
    end
    
    function EvoGUI:setup()
        if remote.interfaces.EvoGUI and remote.interfaces.EvoGUI.create_remote_sensor then
            global.evo_gui.detected = true

            remote.call("EvoGUI", "create_remote_sensor", {
                mod_name = "Natural Evolution",
                name = "evolution_deduction",
                text = "Evolution Deduction:",
                caption = "Evolution Deduction"
            })

            self:updateGUI()
        end
    end

    function EvoGUI:tick()
        if not global.evo_gui then global.evo_gui = {} end


        if not global.evo_gui.detected then
            self:setup()
        end
        if global.evo_gui.detected and game.tick % 3 == 0 then
            self:updateGUI()
        end
    end

    function EvoGUI:updateGUI()
        -- figure out what color to make the text here (if any)
        local color = { r = 255, g = 255, b = 255 }

        remote.call("EvoGUI", "update_remote_sensor", "evolution_deduction", self:createEvolutionText(), color)

    end

    return EvoGUI
end

return EvoGUI