
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if technologies["explosive-rocketry"].researched then
		recipes["NE_Napalm_Rocket"].enabled = true
		recipes["NE_Napalm_Rocket"].reload()
	end

	
	
end
