
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()
  	
	if game.item_prototypes["Alien-Stimulant"] then   	
		if technologies["TerraformingStation"].researched then
			recipes["Alien-Stimulant"].enabled = true
			recipes["Alien-Stimulant"].reload()
		end
	end
  
end
