
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;



  	if game.item_prototypes["bi-standard-dart-magazine"] and game.technology_prototypes["military"] and technologies["military"].researched then
		
		recipes["bi_recipe_standard_dart_magazine"].enabled = true
		recipes["bi_recipe_standard_dart_magazine"].reload()

	end
 
   	if game.item_prototypes["bi-enhanced-dart-magazine"] and game.technology_prototypes["military-2"] and technologies["military-2"].researched then
		
		recipes["bi_recipe_enhanced_dart_magazine"].enabled = true
		recipes["bi_recipe_enhanced_dart_magazine"].reload()

	end
 
   	if game.item_prototypes["bi-poison-dart-magazine"] and game.technology_prototypes["military-3"] and technologies["military-3"].researched then
		
		recipes["bi_recipe_poison_dart_magazine"].enabled = true
		recipes["bi_recipe_poison_dart_magazine"].reload()

	end

	if technologies["AlienUnderstanding"].researched then  
		
			recipes["bi-basic_dart_magazine_c"].enabled = true
			recipes["bi-basic_dart_magazine_c"].reload()	
			recipes["bi-standard_dart_magazine_c"].enabled = true
			recipes["bi-standard_dart_magazine_c"].reload()	
			
	end
  
  
  	if technologies["AlienUnderstanding-2"].researched then  
		
			recipes["bi-enhanced_dart_magazine_c"].enabled = true
			recipes["bi-enhanced_dart_magazine_c"].reload()				
			recipes["bi-poison_dart_magazine_c"].enabled = true
			recipes["bi-poison_dart_magazine_c"].reload()		
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end