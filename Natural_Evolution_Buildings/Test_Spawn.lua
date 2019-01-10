----- Just used for Testing
if QC_Mod then

	function Test_Spawn(surface)



		surface.create_entity({name="medium-worm-turret-player", position={-5, -5}, force = game.forces.enemy})	
		surface.create_entity({name="big-worm-turret-player", position={-30, -30}, force = game.forces.enemy})	
		surface.create_entity({name="big-worm-turret", position={-15, -15}, force = game.forces.player})	
		
		
		--surface.create_entity({name="ne-biter-fire-10", position={-50, 15}, force = game.forces.enemy})
		--surface.create_entity({name="ne-biter-fire-40", position={-40, 15}, force = game.forces.enemy})
		--surface.create_entity({name="ne-biter-fire-60", position={-30, 15}, force = game.forces.enemy})
		
		script.on_event(defines.events.on_player_created, function(event)
		
			local iteminsert = game.players[event.player_index].insert

			iteminsert{name="submachine-gun", count=1}	
			iteminsert{name="steel-axe", count=1}	
			iteminsert{name="uranium-rounds-magazine", count=200}		
			iteminsert{name="power-armor-mk2", count=1}		
			iteminsert{name="rocket-silo", count=4}		
		
		end)
		
		surface.always_day = true
		
	end

end