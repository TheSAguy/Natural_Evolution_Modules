
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["AlienUnderstanding-2"] and technologies["AlienUnderstanding-2"].researched then
	
	
		recipes["pheromone_concrete"].enabled = true
		recipes["pheromone_concrete"].reload()
		recipes["rejuvenate_pheromone_concrete"].enabled = true
		recipes["rejuvenate_pheromone_concrete"].reload()
	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end