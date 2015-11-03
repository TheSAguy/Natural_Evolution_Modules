require "scripts.detectmod" --Detect supported Mods, currently DyTechWar and Bob's Enemies and others

 
 if NEConfig.mod.NEEnemies then
	data:extend({
    {
    type = "fluid",
    name = "NE_alien-toxin",
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=0.8, g=0.8, b=0.0},
    flow_color = {r=1.0, g=1.0, b=0.5},
    icon = "__Natural_Evolution_Buildings__/graphics/icons/fluid/alien-toxin.png",
    --order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },

})  
end