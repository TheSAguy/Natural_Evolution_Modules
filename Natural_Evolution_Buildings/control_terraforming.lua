---- Terraforming Station Stuff ----------

require ("stdlib/event/event")


--------------- Terraforming Station Calculations ------------------------------
function GetFactorPerTerraformingStation(numTerraformingStations)
   local res = 1
   -- Calculate the total evolution reduction.
   if numTerraformingStations > 1 then
	for i = 1, (numTerraformingStations-1) do
      res = res + math.pow(0.85, i) -- Each consecutive Terraforming station is only 85% as effective.
	end
   end

   -- Return the evolution reduction per Terraforming Station.
   return res / numTerraformingStations
end


---------------------------------------------
function T_Count()

	writeDebug("Trying to deduct a station")
	if global.numTerraformingStations > 0 then
		global.numTerraformingStations = global.numTerraformingStations - 1
	else
		global.numTerraformingStations = 0
	end
	
	global.factormultiplier = GetFactorPerTerraformingStation(global.numTerraformingStations)
	
end	  


----- Terraforming Station Stuff
function Reduce_Evolution(TS_table)
		
		local AmmoType
		local ammo = 0
		
		if TS_table == nil then
		--if global.Terraforming_Station_Table == nil then
			global.Terraforming_Station_Table = {}
		else
		
		if TS_table.inventory.get_inventory(1).get_contents() ~= nil then
			for n,a in pairs(TS_table.inventory.get_inventory(1).get_contents()) do
				AmmoType=n
				ammo=a
			end
		end

		end

	writeDebug("Ammo Count: "..ammo)

	
	if ammo > 0 and AmmoType == "Alien-Stimulant" then 
		
		if global.deduction_constant == nil or global.deduction_constant == 0 then
			global.deduction_constant = 0.00025 -------- DEDUCTION CONSTANT
		end
   
		reduction = ((global.deduction_constant * global.factormultiplier) * ((((1 - game.forces.enemy.evolution_factor)^2) * 2) + (game.forces.enemy.evolution_factor * (1 - game.forces.enemy.evolution_factor)))/3) -- Tweak:  ((1 - evo) ^ 2 * 2 + (Evo * (1 - evo))) / 3 see: http://i.imgur.com/gxJOqco.png 
		reduction95 = ((global.deduction_constant * global.factormultiplier) * (1 - 0.95)^2) --- Last 5% will be a constant.
		
		if game.forces.enemy.evolution_factor > 0.95 and  game.forces.enemy.evolution_factor > reduction95 then
		
			game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor - reduction95
			global.Total_TerraformingStations_Evo_Deduction = global.Total_TerraformingStations_Evo_Deduction + reduction95
			game.forces.player.evolution_factor = game.forces.enemy.evolution_factor	
				
		elseif game.forces.enemy.evolution_factor > reduction then
		
			game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor - reduction
			global.Total_TerraformingStations_Evo_Deduction = global.Total_TerraformingStations_Evo_Deduction + reduction
			game.forces.player.evolution_factor = game.forces.enemy.evolution_factor	
			
		end
		
		writeDebug("The current Factor Multiplier is: " .. global.factormultiplier)  
		writeDebug("The total Evolution Deduction due to Terraforming Stations is: " .. global.Total_TerraformingStations_Evo_Deduction)  

		--Reduce Ammo
		ammo = ammo-1
		TS_table.inventory.get_inventory(1).clear()
		if ammo > 0 then
			TS_table.inventory.get_inventory(1).insert({name = AmmoType, count = ammo})
		end
			
		--writeDebug("New Ammo Count: "..ammo)
		
	end	
	
end

