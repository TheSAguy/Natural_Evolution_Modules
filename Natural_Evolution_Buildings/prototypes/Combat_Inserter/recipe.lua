
--- Combat Inserter
local NEcombatInserter = util.table.deepcopy(data.raw["recipe"]["fast-inserter"])
NEcombatInserter.name = "ne-combat-inserter"
NEcombatInserter.category = "advanced-crafting"
NEcombatInserter.energy_required = 30
NEcombatInserter.ingredients = 
{
    {"fast-inserter", 4},   
	{"steel-plate", 4},   
    {type = "fluid", name = "lubricant", amount = 4}
}
NEcombatInserter.result = "combat-inserter"
data:extend({NEcombatInserter})

