game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;
  
  force.reset_recipes()
  force.reset_technologies()
  
  
    			
	if game.entity_prototypes["bio_land_mine"] then

			if technologies["AlienUnderstanding-2"].researched then
					recipes["bio_land_mine"].enabled = true
					recipes["bio_land_mine"].reload()

			end	

	end  
	
	

  end
	

	
	