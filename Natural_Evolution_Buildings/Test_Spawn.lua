----- Just used for Testing
--if QC_Mod then

	function Test_Spawn(surface)



		--surface.create_entity({name="small-worm-turret-player", position={-5, -5}, force = game.forces.player})	
		--surface.create_entity({name="medium-worm-turret-player", position={-30, -30}, force = game.forces.player})	
		--surface.create_entity({name="big-worm-turret-player", position={-15, -15}, force = game.forces.player})	
		--surface.create_entity({name="behemoth-worm-turret-player", position={-25, -25}, force = game.forces.player})


		--surface.create_entity({name="small-worm-turret", position={-50, -5}, force = game.forces.enemy})	
		--surface.create_entity({name="medium-worm-turret", position={-50, -10}, force = game.forces.enemy})	
		surface.create_entity({name="big-worm-turret", position={-50, -15}, force = game.forces.enemy})	
		--surface.create_entity({name="behemoth-worm-turret", position={-50, -20}, force = game.forces.enemy})
		
		--surface.create_entity({name="ne-biter-fire-10", position={-50, 15}, force = game.forces.enemy})
		--surface.create_entity({name="ne-biter-fire-40", position={-40, 15}, force = game.forces.enemy})
		--surface.create_entity({name="ne-biter-fire-60", position={-30, 15}, force = game.forces.enemy})
		
		script.on_event(defines.events.on_player_created, function(event)
		
			local iteminsert = game.players[event.player_index].insert

			iteminsert{name="submachine-gun", count=1}	
			iteminsert{name="uranium-rounds-magazine", count=200}		
			iteminsert{name="power-armor-mk2", count=1}		
			iteminsert{name="rocket-silo", count=4}		
			iteminsert{name="pheromone_concrete", count=200}
			iteminsert{name="concrete", count=200}
			iteminsert{name="TerraformingStation_New", count=5}
			iteminsert{name="Artifact-collector-area", count=5}
			iteminsert{name="solar-panel", count=50}
			iteminsert{name="medium-electric-pole", count=5}
			iteminsert{name="Alien-Stimulant", count=200}
		end)
		
		surface.always_day = true
		
	end

--end

