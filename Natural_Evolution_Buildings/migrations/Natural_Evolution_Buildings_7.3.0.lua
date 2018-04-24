
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	if technologies["AlienUnderstanding"].researched then  
		
			recipes["Alien-Stimulant"].enabled = true
			recipes["Alien-Stimulant"].reload()	
			recipes["bi-basic_dart_magazine_c"].enabled = true
			recipes["bi-basic_dart_magazine_c"].reload()	
			recipes["copper_bullets_c"].enabled = true
			recipes["copper_bullets_c"].reload()	
			recipes["firearm_magazine_c"].enabled = true
			recipes["firearm_magazine_c"].reload()	
			recipes["piercing_rounds_magazine_c"].enabled = true
			recipes["piercing_rounds_magazine_c"].reload()			
	end
  
  
  	if technologies["AlienUnderstanding-2"].researched then  
		
			recipes["uranium_rounds_magazine_c"].enabled = true
			recipes["uranium_rounds_magazine_c"].reload()	
			recipes["Biological_bullet_magazine_c"].enabled = true
			recipes["Biological_bullet_magazine_c"].reload()				
	end
	
	
	if game.item_prototypes["NE-gun-turret"] then   	
		if technologies["bi_tech_bio_cannon"].researched then
			recipes["NE_gun_turret"].enabled = true
			recipes["NE_gun_turret"].reload()
		end
	end
	
	
end
