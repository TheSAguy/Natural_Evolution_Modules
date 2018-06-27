

require("prototypes.New_Units.ne-animations")
--require("prototypes.New_Units.Functions")

local ne_collision_box = {}
local c1 = 0.093

local ne_biter_selection_box = {}
local bs1 = 0.177
local bs2 = 0.3255
local bs3 = 0.679

local ne_biter_drawing_box = {}

local ne_scale = {}
local scale = 0.2325

---- Health
local ne_tank_health = {}
local ne_biter_health = {}
local health_add_1 = 0
local health_add_2 = 0

--- Tint:
--- Brown 
local ne_brown_tint = {}
local brown_tint_r = 150/255 
local brown_tint_g = 100/255 
local brown_tint_b = 50/255 

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

--- Yellow 
local ne_yellow_tint = {}
local yellow_tint_r = 255/255
local yellow_tint_g = 255/255 
local yellow_tint_b = 0/255

--- Orange 
local ne_orange_tint = {}
local ne_orange_tint2 = {}
local orange_tint_r = 255/255
local orange_tint_g = 150/255 
local orange_tint_b = 0/255

-- Black 
local ne_black_tint2 = {}
local black_tint_r = 0
local black_tint_g = 0
local black_tint_b = 0

--- Green 
local ne_green_tint = {}
local green_tint_r = 0/255 
local green_tint_g = 255/255
local green_tint_b = 0/255

--- Pink 
local ne_pink_tint = {}
local pink_tint_r = 255/255
local pink_tint_g = 0/255 
local pink_tint_b = 200/255

--- Transparency
local trans = 0.5

---------------------------

--- BASE Biter Unit
	NE_Base_Biter_Unit = table.deepcopy(data.raw.unit["small-biter"])
    NE_Base_Biter_Unit.name = "ne-biter-base-unit"
    NE_Base_Biter_Unit.max_health = 5
	NE_Base_Biter_Unit.resistances = {}
	NE_Base_Biter_Unit.loot = {}
    
	data:extend{NE_Base_Biter_Unit}


for i = 1, 100 do
	-- Tint	TANK
	table.insert(ne_brown_tint, {r=brown_tint_r, g=brown_tint_g, b=brown_tint_b, a=trans})		
	table.insert(ne_black_tint2, {r=black_tint_r, g=black_tint_g, b=black_tint_b, a=0.4})		
	
	-- Tint	Breeder (Biter & Spitter)
	table.insert(ne_blue_tint, {r=blue_tint_r, g=blue_tint_g, b=blue_tint_b, a=trans})		
	--- + Black
	
	-- Tint	Fire (Biter & Spitter)
	table.insert(ne_fire_tint, {r=fire_tint_r, g=fire_tint_g, b=fire_tint_b, a=trans})		
	table.insert(ne_orange_tint2, {r=orange_tint_r, g=orange_tint_g, b=orange_tint_b, a=0.4})		

	-- Tint	Greenish / Yellow - FAST
	table.insert(ne_yellow_tint, {r=yellow_tint_r, g=yellow_tint_g, b=yellow_tint_b, a=trans})		
	table.insert(ne_blue_tint, {r=blue_tint_r, g=blue_tint_g, b=blue_tint_b, a=0.4})		

	-- Tint	Orange (Turtle)
	table.insert(ne_orange_tint, {r=orange_tint_r, g=orange_tint_g, b=orange_tint_b, a=trans})		
	table.insert(ne_green_tint, {r=green_tint_r, g=green_tint_g, b=green_tint_b, a=0.4})	

	trans = trans + 0.005
	
	
	-- Collision Box
	c1 = c1 + 0.007 --- from 0.1 to 0.8 with min 0.15
	if c1 <= 0.15 then c1 = 0.15 end
	table.insert(ne_collision_box, {{-(c1), -(c1)}, {(c1), (c1)}})	
	
	-- Selection Box
	bs1 = bs1 + 0.023 --- from 0.2 to 2.5 with min 0.4
	if bs1 <= 0.4 then bs1 = 0.4 end
	bs2 = bs2 + 0.0245
	if bs2 <= 0.35 then bs2 = 0.35 end
	bs3 = bs3 + 0.021 --- from 0.7 to 2.8
	table.insert(ne_biter_selection_box, {{-(bs1), -(bs2)}, {(bs3), (0.4)}})	

	-- Drawing Box
	table.insert(ne_biter_drawing_box, {{-(bs1+0.5), -(bs2+0.5)}, {(bs3+0.5), (0.4+0.5)}})		
	
	-- Scale
	scale = scale + 0.0175
	table.insert(ne_scale, scale)
	
	-- Health
	-- Tank Health
	health_add_1 = ((100 - i) / 100)*(1.088905 ^ i) + ((i/100)*(50 * i)) -- 5,000 health
	table.insert(ne_tank_health, health_add_1)

	-- Biter Health
	health_add_2 = ((100 - i) / 100)*(1.0833561 ^ i) + ((i/100)*(30 * i)) -- 3,000 health
	table.insert(ne_biter_health, health_add_2)

	
	--- TANK Biter
	NE_Biter_Tank_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Biter_Tank_Unit.name = "ne-biter-tank-" .. i
	NE_Biter_Tank_Unit.collision_box = ne_collision_box[i]
	NE_Biter_Tank_Unit.selection_box = ne_biter_selection_box[i]
	NE_Biter_Tank_Unit.drawing_box = ne_biter_drawing_box[i]
    -- Extra Health 
	NE_Biter_Tank_Unit.max_health = ne_tank_health[i]
	NE_Biter_Tank_Unit.healing_per_tick = 0.2 -- Vanilla 0.1
	
	NE_Biter_Tank_Unit.corpse = "ne-biter-tank-corpse" .. i
	NE_Biter_Tank_Unit.attack_parameters.animation = ne_biter_attack_animation(ne_scale[i], ne_brown_tint[i], ne_pink_tint[i])
	NE_Biter_Tank_Unit.run_animation = ne_biter_run_animation(ne_scale[i], ne_brown_tint[i], ne_pink_tint[i])
    
	data:extend{NE_Biter_Tank_Unit}

	--- Breeder Biter
	NE_Biter_Breeder_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Biter_Breeder_Unit.name = "ne-biter-breeder-" .. i
	NE_Biter_Breeder_Unit.collision_box = ne_collision_box[i]
	NE_Biter_Breeder_Unit.selection_box = ne_biter_selection_box[i]
	NE_Biter_Breeder_Unit.drawing_box = ne_biter_drawing_box[i]
    NE_Biter_Breeder_Unit.max_health = ne_biter_health[i]
	NE_Biter_Breeder_Unit.corpse = "ne-biter-breeder-corpse" .. i
	NE_Biter_Breeder_Unit.attack_parameters.animation = ne_biter_attack_animation(ne_scale[i], ne_blue_tint[i], ne_black_tint2[i])
	NE_Biter_Breeder_Unit.run_animation = ne_biter_run_animation(ne_scale[i], ne_blue_tint[i], ne_black_tint2[i])
    
	data:extend{NE_Biter_Breeder_Unit}

	--- Fire Biter (Explodes)
	NE_Biter_Fire_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Biter_Fire_Unit.name = "ne-biter-fire-" .. i
	NE_Biter_Fire_Unit.collision_box = ne_collision_box[i]
	NE_Biter_Fire_Unit.selection_box = ne_biter_selection_box[i]
	NE_Biter_Fire_Unit.drawing_box = ne_biter_drawing_box[i]
    NE_Biter_Fire_Unit.max_health = ne_biter_health[i]
	NE_Biter_Fire_Unit.corpse = "ne-biter-fire-corpse" .. i
	NE_Biter_Fire_Unit.attack_parameters.animation = ne_biter_attack_animation(ne_scale[i], ne_fire_tint[i], ne_fire_tint[i])
	NE_Biter_Fire_Unit.run_animation = ne_biter_run_animation(ne_scale[i], ne_fire_tint[i], ne_fire_tint[i])
    
	data:extend{NE_Biter_Fire_Unit}

	
	--- Fast Biter (Greenish)
	NE_Biter_Fast_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Biter_Fast_Unit.name = "ne-biter-fast-" .. i
	NE_Biter_Fast_Unit.collision_box = ne_collision_box[i]
	NE_Biter_Fast_Unit.selection_box = ne_biter_selection_box[i]
	NE_Biter_Fast_Unit.drawing_box = ne_biter_drawing_box[i]
    NE_Biter_Fast_Unit.max_health = ne_biter_health[i]
	--- Fast
	NE_Biter_Fast_Unit.min_pursue_time = 20 * 60  -- v 10 * 60
    NE_Biter_Fast_Unit.max_pursue_distance = 100  -- v 50
	NE_Biter_Fast_Unit.vision_distance = 45 -- v 30
    NE_Biter_Fast_Unit.movement_speed = 0.25 -- v 0.17,
    NE_Biter_Fast_Unit.distance_per_frame = 0.4-- v0.2,
	
	NE_Biter_Fast_Unit.corpse = "ne-biter-fast-corpse" .. i
	NE_Biter_Fast_Unit.attack_parameters.animation = ne_biter_attack_animation(ne_scale[i], ne_yellow_tint[i], ne_blue_tint[i])
	NE_Biter_Fast_Unit.run_animation = ne_biter_run_animation(ne_scale[i], ne_yellow_tint[i], ne_blue_tint[i])
    
	data:extend{NE_Biter_Fast_Unit}

	--- Turtle Biter (Orange)
	NE_Biter_Turtle_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Biter_Turtle_Unit.name = "ne-biter-turtle-" .. i
	NE_Biter_Turtle_Unit.collision_box = ne_collision_box[i]
	NE_Biter_Turtle_Unit.selection_box = ne_biter_selection_box[i]
	NE_Biter_Turtle_Unit.drawing_box = ne_biter_drawing_box[i]
    NE_Biter_Turtle_Unit.max_health = ne_biter_health[i]
	NE_Biter_Turtle_Unit.corpse = "ne-biter-turtle-corpse" .. i
	NE_Biter_Turtle_Unit.attack_parameters.animation = ne_biter_attack_animation(ne_scale[i], ne_orange_tint[i], ne_black_tint2[i])
	NE_Biter_Turtle_Unit.run_animation = ne_biter_run_animation(ne_scale[i], ne_orange_tint[i], ne_black_tint2[i])
    
	data:extend{NE_Biter_Turtle_Unit}

	

	---- Corpses
	-- TANKS
	NE_Biter_Tank_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Tank_Unit_Corpse.name = "ne-biter-tank-corpse" .. i
	NE_Biter_Tank_Unit_Corpse.selection_box = ne_biter_selection_box[i]
	NE_Biter_Tank_Unit_Corpse.animation = ne_biter_die_animation(ne_scale[i], ne_brown_tint[i], ne_brown_tint[i])
    
	data:extend{NE_Biter_Tank_Unit_Corpse}
	
	--- Breeder
	NE_Biter_Breeder_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Breeder_Unit_Corpse.name = "ne-biter-breeder-corpse" .. i
	NE_Biter_Breeder_Unit_Corpse.selection_box = ne_biter_selection_box[i]
	NE_Biter_Breeder_Unit_Corpse.animation = ne_biter_die_animation(ne_scale[i], ne_blue_tint[i], ne_black_tint2[i])
    
	data:extend{NE_Biter_Breeder_Unit_Corpse}

	--- Fire Biter
	NE_Biter_Fire_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Fire_Unit_Corpse.name = "ne-biter-fire-corpse" .. i
	NE_Biter_Fire_Unit_Corpse.selection_box = ne_biter_selection_box[i]
	NE_Biter_Fire_Unit_Corpse.animation = ne_biter_die_animation(ne_scale[i], ne_fire_tint[i], ne_fire_tint[i])
    
	data:extend{NE_Biter_Fire_Unit_Corpse}

	--- Fast Biter
	NE_Biter_Fast_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Fast_Unit_Corpse.name = "ne-biter-fast-corpse" .. i
	NE_Biter_Fast_Unit_Corpse.selection_box = ne_biter_selection_box[i]
	NE_Biter_Fast_Unit_Corpse.animation = ne_biter_die_animation(ne_scale[i], ne_yellow_tint[i], ne_blue_tint[i])
    
	data:extend{NE_Biter_Fast_Unit_Corpse}	

	--- Turtle Biter
	NE_Biter_Turtle_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Turtle_Unit_Corpse.name = "ne-biter-turtle-corpse" .. i
	NE_Biter_Turtle_Unit_Corpse.selection_box = ne_biter_selection_box[i]
	NE_Biter_Turtle_Unit_Corpse.animation = ne_biter_die_animation(ne_scale[i], ne_orange_tint[i], ne_black_tint2[i])
    
	data:extend{NE_Biter_Turtle_Unit_Corpse}

end




  
