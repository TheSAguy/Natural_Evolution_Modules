if not bobmods.lib.recipe then bobmods.lib.recipe = {} end


function bobmods.lib.recipe.replace_ingredient(recipe, old, new)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(new) then

    local amount = 0
    if data.raw.recipe[recipe].ingredients and not data.raw.recipe[recipe].normal and not data.raw.recipe[recipe].expensive then
      for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
        local item = bobmods.lib.item.basic_item(ingredient)
        if item.name == old then
          amount = item.amount + amount
        end
      end
      if amount > 0 then
        if bobmods.lib.item.get_type(old) == "fluid" and bobmods.lib.item.get_type(new) == "item" then
          amount = math.ceil(amount / 10)
        end
        if bobmods.lib.item.get_type(old) == "item" and bobmods.lib.item.get_type(new) == "fluid" then
          amount = amount * 10
        end
        bobmods.lib.recipe.remove_ingredient(recipe, old)
        bobmods.lib.recipe.add_ingredient(recipe, {new, amount})
        return true
      else
        return false
      end
    end

    local retval = false
    if data.raw.recipe[recipe].normal then
      amount = 0
      for i, ingredient in pairs(data.raw.recipe[recipe].normal.ingredients) do
        local item = bobmods.lib.item.basic_item(ingredient)
        if item.name == old then
          amount = item.amount + amount
        end
      end
      if amount > 0 then
        if bobmods.lib.item.get_type(old) == "fluid" and bobmods.lib.item.get_type(new) == "item" then
          amount = math.ceil(amount / 10)
        end
        if bobmods.lib.item.get_type(old) == "item" and bobmods.lib.item.get_type(new) == "fluid" then
          amount = amount * 10
        end
        bobmods.lib.recipe.remove_difficulty_ingredient(recipe, "normal", old)
        bobmods.lib.recipe.add_difficulty_ingredient(recipe, "normal", {new, amount})
        retval = true
      end
    end

    if data.raw.recipe[recipe].expensive then
      amount = 0
      for i, ingredient in pairs(data.raw.recipe[recipe].expensive.ingredients) do
        local item = bobmods.lib.item.basic_item(ingredient)
        if item.name == old then
          amount = item.amount + amount
        end
      end
      if amount > 0 then
        if bobmods.lib.item.get_type(old) == "fluid" and bobmods.lib.item.get_type(new) == "item" then
          amount = math.ceil(amount / 10)
        end
        if bobmods.lib.item.get_type(old) == "item" and bobmods.lib.item.get_type(new) == "fluid" then
          amount = amount * 10
        end
        bobmods.lib.recipe.remove_difficulty_ingredient(recipe, "expensive", old)
        bobmods.lib.recipe.add_difficulty_ingredient(recipe, "expensive", {new, amount})
        retval = true
      end
    end

    return retval
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(new) then
      log("Ingredient " .. new .. " does not exist.")
    end
    return false
  end
end


function bobmods.lib.recipe.replace_ingredient_in_all(old, new)
  if bobmods.lib.item.get_basic_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      bobmods.lib.recipe.replace_ingredient(recipe.name, old, new)
    end
  else
    log("Ingredient " .. new .. " does not exist.")
  end
end


function bobmods.lib.recipe.remove_ingredient(recipe, item)
  if data.raw.recipe[recipe] then

    if data.raw.recipe[recipe].expensive then
      bobmods.lib.item.remove(data.raw.recipe[recipe].expensive.ingredients, item)
    end
    if data.raw.recipe[recipe].normal then
      bobmods.lib.item.remove(data.raw.recipe[recipe].normal.ingredients, item)
    end
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.remove(data.raw.recipe[recipe].ingredients, item)
    end

  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end


function bobmods.lib.recipe.add_new_ingredient(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then

    if data.raw.recipe[recipe].expensive then
      bobmods.lib.item.add_new(data.raw.recipe[recipe].expensive.ingredients, bobmods.lib.item.basic_item(item))
    end
    if data.raw.recipe[recipe].normal then
      bobmods.lib.item.add_new(data.raw.recipe[recipe].normal.ingredients, bobmods.lib.item.basic_item(item))
    end
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.add_new(data.raw.recipe[recipe].ingredients, bobmods.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(item) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end

function bobmods.lib.recipe.add_ingredient(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then

    if data.raw.recipe[recipe].expensive then
      bobmods.lib.item.add(data.raw.recipe[recipe].expensive.ingredients, bobmods.lib.item.basic_item(item))
    end
    if data.raw.recipe[recipe].normal then
      bobmods.lib.item.add(data.raw.recipe[recipe].normal.ingredients, bobmods.lib.item.basic_item(item))
    end
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.add(data.raw.recipe[recipe].ingredients, bobmods.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end


function bobmods.lib.recipe.add_result(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then

    if data.raw.recipe[recipe].expensive then
      bobmods.lib.result_check(data.raw.recipe[recipe].expensive)
      bobmods.lib.item.add(data.raw.recipe[recipe].expensive.results, item)
    end
    if data.raw.recipe[recipe].normal then
      bobmods.lib.result_check(data.raw.recipe[recipe].normal)
      bobmods.lib.item.add(data.raw.recipe[recipe].normal.results, item)
    end
    if data.raw.recipe[recipe].result or data.raw.recipe[recipe].results then
      bobmods.lib.result_check(data.raw.recipe[recipe])
      bobmods.lib.item.add(data.raw.recipe[recipe].results, item)
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Item " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end

function bobmods.lib.recipe.remove_result(recipe, item)
  if data.raw.recipe[recipe] then

    if data.raw.recipe[recipe].expensive then
      bobmods.lib.result_check(data.raw.recipe[recipe].expensive)
      bobmods.lib.item.remove(data.raw.recipe[recipe].expensive.results, item)
    end
    if data.raw.recipe[recipe].normal then
      bobmods.lib.result_check(data.raw.recipe[recipe].normal)
      bobmods.lib.item.remove(data.raw.recipe[recipe].normal.results, item)
    end
    if data.raw.recipe[recipe].result or data.raw.recipe[recipe].results then
      bobmods.lib.result_check(data.raw.recipe[recipe])
      bobmods.lib.item.remove(data.raw.recipe[recipe].results, item)
    end

  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end



function bobmods.lib.recipe.remove_difficulty_ingredient(recipe, difficulty, item)
  if data.raw.recipe[recipe] then

    if data.raw.recipe[recipe][difficulty] then
      bobmods.lib.item.remove(data.raw.recipe[recipe][difficulty].ingredients, item)
    end

  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end


function bobmods.lib.recipe.add_new_difficulty_ingredient(recipe, difficulty, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) and (difficulty == "normal" or difficulty == "expensive") then

    if data.raw.recipe[recipe][difficulty] then
      bobmods.lib.item.add_new(data.raw.recipe[recipe][difficulty].ingredients, bobmods.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(item) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
    if not (difficulty == "normal" or difficulty == "expensive") then
      log("Difficulty " .. difficulty .. " is invalid.")
    end
  end
end

function bobmods.lib.recipe.add_difficulty_ingredient(recipe, difficulty, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) and (difficulty == "normal" or difficulty == "expensive") then

    if data.raw.recipe[recipe][difficulty] then
      bobmods.lib.item.add(data.raw.recipe[recipe][difficulty].ingredients, bobmods.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
    if not (difficulty == "normal" or difficulty == "expensive") then
      log("Difficulty " .. difficulty .. " is invalid.")
    end
  end
end


function bobmods.lib.recipe.add_difficulty_result(recipe, difficulty, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) and (difficulty == "normal" or difficulty == "expensive") then

    if data.raw.recipe[recipe][difficulty] then
      bobmods.lib.result_check(data.raw.recipe[recipe][difficulty])
      bobmods.lib.item.add(data.raw.recipe[recipe][difficulty].results, item)
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Item " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
    if not (difficulty == "normal" or difficulty == "expensive") then
      log("Difficulty " .. difficulty .. " is invalid.")
    end
  end
end

function bobmods.lib.recipe.remove_difficulty_result(recipe, difficulty, item)
  if data.raw.recipe[recipe] and (difficulty == "normal" or difficulty == "expensive") then

    if data.raw.recipe[recipe][difficulty] then
      bobmods.lib.result_check(data.raw.recipe[recipe][difficulty])
      bobmods.lib.item.remove(data.raw.recipe[recipe][difficulty].results, item)
    end

  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not (difficulty == "normal" or difficulty == "expensive") then
      log("Difficulty " .. difficulty .. " is invalid.")
    end
  end
end


