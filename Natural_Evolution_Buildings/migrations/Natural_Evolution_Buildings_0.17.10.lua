
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["Breeding-4"] and technologies["Breeding-4"].researched then
	
	
		recipes["behemoth-worm-hatching"].enabled = true
		recipes["behemoth-worm-hatching"].reload()
		recipes["behemoth-worm-hatching-refresh"].enabled = true
		recipes["behemoth-worm-hatching-refresh"].reload()

	
	end

	
		  
end