
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.technology_prototypes["military-science-pack"] and technologies["military-science-pack"].researched then
		
		  force.reset_recipes()
		  force.reset_technologies()

	end
	

 
  	if game.technology_prototypes["AlienUnderstanding-2"] and technologies["AlienUnderstanding-2"].researched then
	
	
		recipes["piercing_rounds_magazine_c"].enabled = true
		recipes["piercing_rounds_magazine_c"].reload()
		recipes["bi-standard_dart_magazine_c"].enabled = true
		recipes["bi-standard_dart_magazine_c"].reload()

	
	end

  	if game.technology_prototypes["AlienUnderstanding-3"] and technologies["AlienUnderstanding-3"].researched then
	
	
		recipes["uranium_rounds_magazine_c"].enabled = true
		recipes["uranium_rounds_magazine_c"].reload()
		recipes["Biological_bullet_magazine_c"].enabled = true
		recipes["Biological_bullet_magazine_c"].reload()

	
	end
	
		  
end