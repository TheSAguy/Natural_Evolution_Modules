


function Initial_Spawn(surface)

	surface.create_entity({name="small-spitter-Mk2", position={5, 15},force = game.forces.enemy})
	surface.create_entity({name="small-spitter-Mk3", position={7, 15},force = game.forces.enemy})
	surface.create_entity({name="medium-spitter-Mk2", position={9, 15},force = game.forces.enemy})
	surface.create_entity({name="medium-spitter-Mk3", position={11, 15},force = game.forces.enemy})
	surface.create_entity({name="medium-spitter-Mk2", position={13, 15},force = game.forces.enemy})
	surface.create_entity({name="medium-spitter-Mk3", position={15, 15},force = game.forces.enemy})
	surface.create_entity({name="big-spitter-Mk2", position={17, 15},force = game.forces.enemy})
	surface.create_entity({name="big-spitter-Mk3", position={19, 15},force = game.forces.enemy})

	surface.create_entity({name="small-biter-Mk2", position={5, 20},force = game.forces.enemy})
	surface.create_entity({name="small-biter-Mk3", position={7, 20},force = game.forces.enemy})
	surface.create_entity({name="medium-biter-Mk2", position={9, 20},force = game.forces.enemy})
	surface.create_entity({name="medium-biter-Mk3", position={11, 20},force = game.forces.enemy})
	surface.create_entity({name="medium-biter-Mk2", position={13, 20},force = game.forces.enemy})
	surface.create_entity({name="medium-biter-Mk3", position={15, 20},force = game.forces.enemy})
	surface.create_entity({name="big-biter-Mk2", position={17, 20},force = game.forces.enemy})
	surface.create_entity({name="big-biter-Mk3", position={19, 20},force = game.forces.enemy})
	
end

