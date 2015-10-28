game.reload_script()


for index, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;
  
	force.reset_recipes()
	force.reset_technologies()
  
  
	if technologies["Breeding"].researched then
		recipes["small-worm-hatching-refresh"].enabled = true
		recipes["small-worm-hatching-refresh"].reload()
	end

    if technologies["Breeding-2"].researched then
		recipes["medium-worm-hatching-refresh"].enabled = true
		recipes["medium-worm-hatching-refresh"].reload()
	end
  
     if technologies["Breeding-3"].researched then
		recipes["big-worm-hatching-refresh"].enabled = true
		recipes["big-worm-hatching-refresh"].reload()
	end
	
	
     if technologies["Biter_Spawners"].researched then
		recipes["Natural_Evolution_Biter-Spawner-refresh"].enabled = true
		recipes["Natural_Evolution_Biter-Spawner-refresh"].reload()
	end

     if technologies["Spitter_Spawners"].researched then
		recipes["Natural_Evolution_Spitter-Spawner-refresh"].enabled = true
		recipes["Natural_Evolution_Spitter-Spawner-refresh"].reload()
	end
	
end
