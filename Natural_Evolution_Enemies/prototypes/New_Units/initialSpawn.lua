


function Initial_Spawn(surface)

	
	for i = 10, 15 do
	
    --surface.create_entity({name="ne-biter-fast-" .. i, position={-50 + i, 25}, force = game.forces.player})
	--surface.create_entity({name="ne-biter-tank-" .. i, position={-50 + i, 10}, force = game.forces.player})
	--surface.create_entity({name="ne-biter-breeder-" .. i, position={-50 + i, 15}, force = game.forces.player})
	--surface.create_entity({name="ne-biter-fire-" .. i, position={-100 + i, 20}, force = game.forces.enemy})
	--surface.create_entity({name="ne-biter-turtle-" .. i, position={-50 + i, 30}, force = game.forces.player})
	
	

	--surface.create_entity({name="ne-spitter-ulaunch-" .. i, position={-50 + i, -25}, force = game.forces.enemy})
    --surface.create_entity({name="ne-spitter-breeder-" .. i, position={-50 + i, -10}, force = game.forces.player})	
    surface.create_entity({name="ne-spitter-fire-" .. i, position={-50 + i, -15}, force = game.forces.enemy})
	--surface.create_entity({name="ne-spitter-mine-" .. i, position={-50 + i, -20}, force = game.forces.enemy})
--	surface.create_entity({name="ne-spitter-wallbreak-" .. i, position={-50 + i, -30}, force = game.forces.player})
	
	

	
	end
	
	
	
	script.on_event(defines.events.on_player_created, function(event)
	local iteminsert = game.players[event.player_index].insert

	iteminsert{name="submachine-gun", count=1}	
	iteminsert{name="uranium-rounds-magazine", count=200}		
	iteminsert{name="power-armor-mk2", count=1}		
	
	
	end)
	

	game.surfaces[1].always_day=true
	
	
			for i, player in pairs(game.players) do
			game.player.cheat_mode = true
			game.player.force.research_all_technologies()
		end	
	--[[
	
    --surface.create_entity({name="ne-biter-tank-" .. i, position={-50 + i, 50}, force = game.forces.player})
	surface.create_entity({name="ne-biter-breeder-100" , position={-50 , 50}, force = game.forces.enemy})
    surface.create_entity({name="ne-spitter-breeder-100", position={-50, 25}, force = game.forces.enemy})
	game.surfaces[1].always_day=true
	
]]
	

end

