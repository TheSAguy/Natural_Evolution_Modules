
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()
  	
	if game.item_prototypes["copper-bullet-magazine"] then   	
		if technologies["military"].researched then
			recipes["copper_bullets"].enabled = true
			recipes["copper_bullets"].reload()
		end
	end
  
    	
	if technologies["military-2"].researched then
		recipes["piercing_magazine_copper"].enabled = true
		recipes["piercing_magazine_copper"].reload()
	end

  	if game.item_prototypes["AlienUnderstanding-2"] then   	
		if technologies["military"].researched then
			recipes["Biological-bullet-magazine"].enabled = true
			recipes["Biological-bullet-magazine"].reload()
			recipes["bio_land_mine"].enabled = true
			recipes["bio_land_mine"].reload()
		end
	end
  
    if game.item_prototypes["Artifact-collector-area"] then   	
		if technologies["AlienUnderstanding"].researched then
			recipes["Artifact-collector"].enabled = true
			recipes["Artifact-collector"].reload()
		end
	end
  	
  
  
end
