
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()
  	
	if game.entity_prototypes["decelerate_concrete"] then   	
		if technologies["AlienUnderstanding-2"].researched then
			recipes["decelerate_concrete"].enabled = true
			recipes["decelerate_concrete"].reload()
		end
	end
  
end
