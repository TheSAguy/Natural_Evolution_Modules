require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

  if technologies["Alien_Hatchery"].researched then
    recipes["NE_basic-alien-nutrientant"].enabled = true
    recipes["NE_basic-alien-nutrientant"].reload()
    recipes["NE_alien-revitalization"].enabled = true
    recipes["NE_alien-revitalization"].reload()
    recipes["NE_enhanced-alien-nutrientant"].enabled = true
    recipes["NE_enhanced-alien-nutrientant"].reload()
	if NEConfig.mod.NEEnemies then
		recipes["NE_alien-toxin"].enabled = true
		recipes["NE_alien-toxin"].reload()
	end

	end
end
