---Bio Cannn (Hive Buster) Stuff

require ("stdlib/event/event")


----- Bio Cannon Stuff
local function Bio_Cannon_Check(Bio_Cannon_List)
	
	local Bio_Cannon=Bio_Cannon_List[1]
	local inventory = Bio_Cannon.get_inventory(1)
	local inventoryContent = inventory.get_contents()
	local AmmoType
	local ammo = 0
	local spawner
	local worms
	local target
	local delay

	
	if inventoryContent ~= nil then
		for n,a in pairs(inventoryContent) do
			AmmoType=n
			ammo=a
		end
	end
	
	if ammo > 0 and Bio_Cannon_List[2].energy > 0 then	
			
			local radius = 90 -- Radius it looks for a Spawner / Worm to fire at
			local pos = Bio_Cannon.position
			
			local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}
	
			--- Look for spawners
			spawner = Bio_Cannon.surface.find_entities_filtered({area = area, type = "unit-spawner", force= "enemy"})
			worms = Bio_Cannon.surface.find_entities_filtered({area = area, type = "turret", force= "enemy"})
				
			writeDebug("The Number of Spawners are: " .. #spawner)
			writeDebug("The Number of Worms are: " .. #worms)
			--Find Spawner Target
			if #spawner > 0 and target == nil then
				for _,enemy in pairs(spawner) do
					local distance = math.sqrt(((Bio_Cannon.position.x - enemy.position.x)^2) +((Bio_Cannon.position.y - enemy.position.y)^2) )
					writeDebug("The Distance is: " .. distance)
					if (distance > 20) and (distance < (radius+1)) then
					
						if target == nil then
							target={enemy}
						end
					end
				end
			-- First attack the Spawners, then worms.
			elseif #worms > 0 and target == nil then
				for _,enemy in pairs(worms) do
					local distance = math.sqrt(((Bio_Cannon.position.x - enemy.position.x)^2) +((Bio_Cannon.position.y - enemy.position.y)^2) )
					writeDebug("The Distance is: " .. distance)
					if (distance > 20) and (distance < (radius+1)) then
					
						if target == nil then
							target={enemy}
						end
					end
				end
			end
			
	


		--Fire at Spawner
		if target ~= nil then

			Bio_Cannon.surface.create_entity({name=AmmoType, position = {x = Bio_Cannon.position.x - 0.5, y = Bio_Cannon.position.y - 4.5}, force = Bio_Cannon.force, target = target[1], speed= 0.1})
			Bio_Cannon.surface.pollute(Bio_Cannon.position,100) -- The firing of the Hive Buster will causes Pollution
			Bio_Cannon.surface.set_multi_command{command = {type=defines.command.attack, target=Bio_Cannon, distraction=defines.distraction.by_enemy},unit_count = math.floor(100 * game.forces.enemy.evolution_factor), unit_search_distance = 500}
			
			--Reduce Ammo
			ammo = ammo-1
			inventory.clear()
			if ammo > 0 then
				inventory.insert({name = AmmoType, count = ammo})
			end
			
			--Delay between shots
			if AmmoType == "bi-bio-cannon-proto-ammo" then 
				delay = 9
			elseif AmmoType == "bi-bio-cannon-basic-ammo" then 
				delay = 10
			elseif AmmoType == "bi-bio-cannon-poison-ammo" then 
				delay = 15
			else 
			delay = 20
			end
			
			Bio_Cannon_List[3]=delay
			
		end
	end
end


---------------------------------------------
----- Bio Cannon Stuff
 Event.register(defines.events.on_tick, function(event)	 

  	if global.Bio_Cannon_Table ~= nil then
		if global.Bio_Cannon_Counter == 0 or global.Bio_Cannon_Counter == nil then
			global.Bio_Cannon_Counter = 60		
			for ix, vx in pairs(global.Bio_Cannon_Table) do
				if vx[1].valid and vx[2].valid then
				vx[3]=vx[3]-1
					if vx[3] <=0 then
						Bio_Cannon_Check(vx)
					end
				else
					if vx[1].valid then
						vx[1].destroy()
					end
					if vx[2].valid then
						vx[2].destroy()
					end	
				end
				
			end		
		else
			global.Bio_Cannon_Counter = global.Bio_Cannon_Counter - 1
		end
	else

		-- Event.register(defines.events.on_tick, function() end)
		
	end
end)
--------------------------------------------------------------------

