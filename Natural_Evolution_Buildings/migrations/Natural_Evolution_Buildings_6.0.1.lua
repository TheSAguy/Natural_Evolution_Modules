
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

    	
	if technologies["AlienUnderstanding"].researched then
		recipes["Building_Materials"].enabled = true
		recipes["Building_Materials"].reload()
	end

  
end
