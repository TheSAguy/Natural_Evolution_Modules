
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()
  	
	    	
	if technologies["Alien_Hatchery"].researched then
		recipes["ne-living-wall"].enabled = true
		recipes["ne-living-wall"].reload()
		recipes["ne-living-wall-refresh"].enabled = true
		recipes["ne-living-wall-refresh"].reload()
	end
  
end
