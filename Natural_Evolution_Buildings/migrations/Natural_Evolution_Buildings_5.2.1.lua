
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

end



for i, force in pairs(game.forces) do 
	if force.technologies["logistics-2"].researched then 
		force.recipes["NE-belt-balancer"].enabled = true
	end
	
end
