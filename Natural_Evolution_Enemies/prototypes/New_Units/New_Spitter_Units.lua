
require("prototypes.New_Units.ne-animations")
require ("prototypes.New_Units.Projectiles")

local ne_collision_box = {}
local c1 = 0.093

local ne_spitter_selection_box = {}
local ss1 = 0.188
local ss2 = 0.36218
local ss3 = 0.182
local ss4 = 0.794

local ne_spitter_drawing_box = {}

local ne_scale = {}
local scale = 0.2325

---- Health
local ne_spitter_health = {}
local health_add_3 = 0

--- Tint:
---  Blue 
local ne_blue_tint = {}
local blue_tint_r = 0/255
local blue_tint_g = 0/255
local blue_tint_b = 255/255 

--- Fire Red 
local ne_fire_tint = {}
local fire_tint_r = 255/255
local fire_tint_g = 0/255 
local fire_tint_b = 0/255

--- Pink 
local ne_pink_tint = {}
local pink_tint_r = 255/255
local pink_tint_g = 0/255 
local pink_tint_b = 200/255

--- Purple 
local ne_purple_tint = {}
local purple_tint_r = 150/255 
local purple_tint_g = 50/255
local purple_tint_b = 255/255 

--- Green 
local ne_green_tint = {}
local green_tint_r = 0/255 
local green_tint_g = 255/255
local green_tint_b = 0/255

--- Transparency
local trans = 0.5

---------------------------

--- BASE Spitter Unit
	NE_Base_Spitter_Unit = table.deepcopy(data.raw.unit["small-spitter"])
    NE_Base_Spitter_Unit.name = "ne-spitter-base-unit"
    NE_Base_Spitter_Unit.max_health = 5
	NE_Base_Spitter_Unit.resistances = {}
	NE_Base_Spitter_Unit.loot = {}
    
	data:extend{NE_Base_Spitter_Unit}

		
		

for i = 1, 100 do

	-- Spitters
	-- Tint	Breeder (Biter & Spitter)
	table.insert(ne_blue_tint, {r=blue_tint_r, g=blue_tint_g, b=blue_tint_b, a=trans})		
		
	-- Tint	Fire (Biter & Spitter)
	table.insert(ne_fire_tint, {r=fire_tint_r, g=fire_tint_g, b=fire_tint_b, a=trans})		
	
	-- Tint	Pink (Mine Layer)
	table.insert(ne_pink_tint, {r=pink_tint_r, g=pink_tint_g, b=pink_tint_b, a=trans})		

	-- Tint	Purple (Unit Launcher)
	table.insert(ne_purple_tint, {r=purple_tint_r, g=purple_tint_g, b=purple_tint_b, a=trans})		

	-- Tint	Green (Wall Breakerr)
	table.insert(ne_green_tint, {r=green_tint_r, g=green_tint_g, b=green_tint_b, a=trans})		
	
	trans = trans + 0.005
	
	
	-- Collision Box
	c1 = c1 + 0.007 --- from 0.1 to 0.8 with min 0.15
	if c1 <= 0.15 then c1 = 0.15 end
	table.insert(ne_collision_box, {{-(c1), -(c1)}, {(c1), (c1)}})	

	-- Selection Box
	ss1 = ss1 + 0.012 --- from 0.2 to 1.4 with min 0.4
	if ss1 <= 0.4 then ss1 = 0.4 end
	ss2 = ss2 + 0.03782 --- from 0.4 to 4 
	ss3 = ss3 + 0.018 --- from 0.2 to 2
	ss4 = ss4 + 0.006 --- from 0.8 to 1.4
	table.insert(ne_spitter_selection_box, {{-(ss1), -(ss2)}, {(ss3), (ss4)}})	

	-- Drawing Box
	table.insert(ne_spitter_drawing_box, {{-(ss1+0.5), -(ss2+0.5)}, {(ss3+0.5), (ss4+0.5)}})
	
	-- Scale
	scale = scale + 0.0175
	table.insert(ne_scale, scale)
	
	-- Spitter Health
	health_add_3 = ((100 - i) / 100)*(1.07897 ^ i) + ((i/100)*(20 * i)) -- 2,000 health
	table.insert(ne_spitter_health, health_add_3)
		

	------ SPITTERS
	---- Breeder Spitter
	NE_Spitter_Breeder_Unit = table.deepcopy(data.raw.unit["ne-spitter-base-unit"])
    NE_Spitter_Breeder_Unit.name = "ne-spitter-breeder-" .. i
	NE_Spitter_Breeder_Unit.collision_box = ne_collision_box[i]
	NE_Spitter_Breeder_Unit.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Breeder_Unit.drawing_box = ne_spitter_drawing_box[i]
    NE_Spitter_Breeder_Unit.max_health = ne_spitter_health[i]
	NE_Spitter_Breeder_Unit.corpse = "ne-spitter-breeder-corpse" .. i
	NE_Spitter_Breeder_Unit.attack_parameters.animation = ne_spitter_attack_animation(ne_scale[i], ne_blue_tint[i])
	NE_Spitter_Breeder_Unit.run_animation = ne_spitter_run_animation(ne_scale[i], ne_blue_tint[i])
    
	data:extend{NE_Spitter_Breeder_Unit}

	
	---- Fire Spitter
	NE_Spitter_Fire_Unit = table.deepcopy(data.raw.unit["ne-spitter-base-unit"])
    NE_Spitter_Fire_Unit.name = "ne-spitter-fire-" .. i
	NE_Spitter_Fire_Unit.collision_box = ne_collision_box[i]
	NE_Spitter_Fire_Unit.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Fire_Unit.drawing_box = ne_spitter_drawing_box[i]
    NE_Spitter_Fire_Unit.max_health = ne_spitter_health[i]
	NE_Spitter_Fire_Unit.corpse = "ne-spitter-fire-corpse" .. i
	NE_Spitter_Fire_Unit.attack_parameters = Spitter_Attack_Stream({range=13,
                                                 cooldown=100,
                                                 damage_modifier=1.1,
                                                 scale=ne_scale[i],
                                                 tint=ne_fire_tint[i],
                                                 roarvolume=0.7,})
	--NE_Spitter_Fire_Unit.attack_parameters.animation = ne_spitter_attack_animation(ne_scale[i], ne_fire_tint[i])
	NE_Spitter_Fire_Unit.run_animation = ne_spitter_run_animation(ne_scale[i], ne_fire_tint[i])
    
	data:extend{NE_Spitter_Fire_Unit}
	
	
	---- Mine Spitter (Pink)
	NE_Spitter_Mine_Unit = table.deepcopy(data.raw.unit["ne-spitter-base-unit"])
    NE_Spitter_Mine_Unit.name = "ne-spitter-mine-" .. i
	NE_Spitter_Mine_Unit.collision_box = ne_collision_box[i]
	NE_Spitter_Mine_Unit.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Mine_Unit.drawing_box = ne_spitter_drawing_box[i]
    NE_Spitter_Mine_Unit.max_health = ne_spitter_health[i]
	NE_Spitter_Mine_Unit.corpse = "ne-spitter-mine-corpse" .. i
	NE_Spitter_Mine_Unit.attack_parameters = Spitter_Attack_Projectile({range=13,
                                                 cooldown=100,
                                                 damage_modifier=1.1,
                                                 scale=ne_scale[i],
                                                 tint=ne_pink_tint[i],
                                                 roarvolume=0.7,
												-- projectile="Mine-Projectile"})
												 projectile="Mine-Projectile-"..i})
	NE_Spitter_Mine_Unit.run_animation = ne_spitter_run_animation(ne_scale[i], ne_pink_tint[i])
    
	data:extend{NE_Spitter_Mine_Unit}

		
	---- Unit Launcher Spitter (Purple)
	NE_Spitter_ULaunch_Unit = table.deepcopy(data.raw.unit["ne-spitter-base-unit"])
    NE_Spitter_ULaunch_Unit.name = "ne-spitter-ulaunch-" .. i
	NE_Spitter_ULaunch_Unit.collision_box = ne_collision_box[i]
	NE_Spitter_ULaunch_Unit.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_ULaunch_Unit.drawing_box = ne_spitter_drawing_box[i]
    NE_Spitter_ULaunch_Unit.max_health = ne_spitter_health[i]
	NE_Spitter_ULaunch_Unit.corpse = "ne-spitter-ulaunch-corpse" .. i
	NE_Spitter_ULaunch_Unit.attack_parameters.animation = ne_spitter_attack_animation(ne_scale[i], ne_purple_tint[i])
	NE_Spitter_ULaunch_Unit.run_animation = ne_spitter_run_animation(ne_scale[i], ne_purple_tint[i])
    
	data:extend{NE_Spitter_ULaunch_Unit}


		
	---- Wall Breaker Spitter (Green)
	NE_Spitter_Breakwall_Unit = table.deepcopy(data.raw.unit["ne-spitter-base-unit"])
    NE_Spitter_Breakwall_Unit.name = "ne-spitter-wallbreak-" .. i
	NE_Spitter_Breakwall_Unit.collision_box = ne_collision_box[i]
	NE_Spitter_Breakwall_Unit.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Breakwall_Unit.drawing_box = ne_spitter_drawing_box[i]
    NE_Spitter_Breakwall_Unit.max_health = ne_spitter_health[i]
	NE_Spitter_Breakwall_Unit.corpse = "ne-spitter-wallbreak-corpse" .. i
	NE_Spitter_Breakwall_Unit.attack_parameters.animation = ne_spitter_attack_animation(ne_scale[i], ne_green_tint[i])
	NE_Spitter_Breakwall_Unit.run_animation = ne_spitter_run_animation(ne_scale[i], ne_green_tint[i])
    
	data:extend{NE_Spitter_Breakwall_Unit}
	

	--- Spitters
	---- Breeder Spitter
	NE_Spitter_Breeder_Unit_Corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
    NE_Spitter_Breeder_Unit_Corpse.name = "ne-spitter-breeder-corpse" .. i
	NE_Spitter_Breeder_Unit_Corpse.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Breeder_Unit_Corpse.animation = ne_spitter_dying_animation(ne_scale[i], ne_blue_tint[i])
    
	data:extend{NE_Spitter_Breeder_Unit_Corpse}
	
	---- Fire Spitter
	NE_Spitter_Fire_Unit_Corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
    NE_Spitter_Fire_Unit_Corpse.name = "ne-spitter-fire-corpse" .. i
	NE_Spitter_Fire_Unit_Corpse.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Fire_Unit_Corpse.animation = ne_spitter_dying_animation(ne_scale[i], ne_fire_tint[i])
    
	data:extend{NE_Spitter_Fire_Unit_Corpse}
	
	---- Mine Spitter
	NE_Spitter_Mine_Unit_Corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
    NE_Spitter_Mine_Unit_Corpse.name = "ne-spitter-mine-corpse" .. i
	NE_Spitter_Mine_Unit_Corpse.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Mine_Unit_Corpse.animation = ne_spitter_dying_animation(ne_scale[i], ne_pink_tint[i])
    
	data:extend{NE_Spitter_Mine_Unit_Corpse}
	
	---- Unit Launcher Spitter
	NE_Spitter_ULaunch_Unit_Corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
    NE_Spitter_ULaunch_Unit_Corpse.name = "ne-spitter-ulaunch-corpse" .. i
	NE_Spitter_ULaunch_Unit_Corpse.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_ULaunch_Unit_Corpse.animation = ne_spitter_dying_animation(ne_scale[i], ne_purple_tint[i])
    
	data:extend{NE_Spitter_ULaunch_Unit_Corpse}
	
	---- Unit Launcher Spitter
	NE_Spitter_Breakwall_Unit_Corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
    NE_Spitter_Breakwall_Unit_Corpse.name = "ne-spitter-wallbreak-corpse" .. i
	NE_Spitter_Breakwall_Unit_Corpse.selection_box = ne_spitter_selection_box[i]
	NE_Spitter_Breakwall_Unit_Corpse.animation = ne_spitter_dying_animation(ne_scale[i], ne_green_tint[i])
    
	data:extend{NE_Spitter_Breakwall_Unit_Corpse}
end




  
