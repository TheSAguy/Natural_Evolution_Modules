

-- Remove Alerts from units. 
local units = data.raw["unit"]
for k, v in pairs(units) do
	if v.alert_when_damaged == 'false' then
		break		
	else
		v.alert_when_damaged = 'false'
	end
	
	if v.alert_when_attacking == 'false' then
		break	
	else
		v.alert_when_attacking = 'false'
	end
	
end

--- All other Spawners
local spawners = data.raw["unit-spawner"]
for k, v in pairs(spawners) do
   if not (v.minable and (v.minable.result or v.minable.results)) then
      v.minable = {hardness = 1.5, mining_time = 1.6, results = {{type="item", name="Natural_Evolution_Biter-Spawner-exhausted", amount=1},}}
   end
end

--- All other turrets?
local worms = data.raw["turret"]
for k, v in pairs(worms) do
   if not (v.minable and (v.minable.result or v.minable.results)) then
      v.minable = {hardness = 0.5, mining_time = 1.6, results = {{type="item", name="small-worm-hatching-exhausted", amount=1},}}
   end
end
