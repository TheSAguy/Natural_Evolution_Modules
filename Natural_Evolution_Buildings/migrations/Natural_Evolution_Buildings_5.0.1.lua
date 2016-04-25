game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;
  
  force.reset_recipes()
  force.reset_technologies()
  
  
  if technologies["AlienUnderstanding"].researched then
    recipes["Thumper"].enabled = true
    recipes["Thumper"].reload()
  end

end
