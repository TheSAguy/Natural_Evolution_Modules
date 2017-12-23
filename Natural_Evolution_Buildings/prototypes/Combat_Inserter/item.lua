
--- Combat Inserter
local combatInserter = util.table.deepcopy(data.raw["item"]["fast-inserter"])
combatInserter.name = "combat-inserter"
combatInserter.icon = "__Natural_Evolution_Buildings__/graphics/icons/combat_inserter.png"
combatInserter.icon_size = 32
combatInserter.place_result = "combat-inserter"
data:extend({combatInserter})


