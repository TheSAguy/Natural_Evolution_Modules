
require "prototypes.Vanilla_Changes.Functions"
require "config"

--- Difficulty settings	
	if NE_Difficulty == nil then
      NE_Difficulty = 1
	end
	if NE_Enemies_Config.Set_Difficulty == 1 then
		NE_Difficulty = 1 -- Normal difficulty
		else NE_Difficulty  = 2 -- Hard difficulty
	end
	
	
Damage = {
	Small_Biter = Biter_Melee_Attack_Healthy(5*NE_Difficulty),
	Small_Biter_Mk2 = Biter_Melee_Attack_Infected(8*NE_Difficulty,5*NE_Difficulty),
	Small_Biter_Mk3 = Biter_Melee_Attack_Mutated(10*NE_Difficulty,5*NE_Difficulty),
	Medium_Biter = Biter_Melee_Attack_Healthy(25*NE_Difficulty),
	Medium_Biter_Mk2 = Biter_Melee_Attack_Infected(25*NE_Difficulty,10*NE_Difficulty),
	Medium_Biter_Mk3 = Biter_Melee_Attack_Mutated(30*NE_Difficulty,15*NE_Difficulty),
	Big_Biter = Biter_Melee_Attack_Healthy(65*NE_Difficulty),
	Big_Biter_Mk2 = Biter_Melee_Attack_Infected(60*NE_Difficulty,30*NE_Difficulty),
	Big_Biter_Mk3 = Biter_Melee_Attack_Mutated(65*NE_Difficulty,35*NE_Difficulty),
	Behemoth_Biter = Biter_Melee_Attack_Healthy(150*NE_Difficulty)
	}
	
	
Health = {
	Small_Biter = 15,
	Small_Biter_Mk2 = 20*NE_Difficulty,
	Small_Biter_Mk3 = 45*NE_Difficulty,
	Medium_Biter = 75*NE_Difficulty,
	Medium_Biter_Mk2 = 150*NE_Difficulty,
	Medium_Biter_Mk3 = 225*NE_Difficulty,
	Big_Biter = 375*NE_Difficulty,
	Big_Biter_Mk2 = 750*NE_Difficulty,
	Big_Biter_Mk3 = 1125*NE_Difficulty,
	Behemoth_Biter = 5000*NE_Difficulty,
	Small_Spitter = 10,
	Small_Spitter_Mk2 = 15*NE_Difficulty,
	Small_Spitter_Mk3 = 20*NE_Difficulty,
	Medium_Spitter = 50*NE_Difficulty,
	Medium_Spitter_Mk2 = 100*NE_Difficulty,
	Medium_Spitter_Mk3 = 150*NE_Difficulty,
	Big_Spitter = 200*NE_Difficulty,
	Big_Spitter_Mk2 = 450*NE_Difficulty,
	Big_Spitter_Mk3 = 700*NE_Difficulty,
	Behemoth_Spitter = 2000*NE_Difficulty,
	Small_Worm = 400*NE_Difficulty,
	Medium_Worm = 700*NE_Difficulty,
	Big_Worm = 1000*NE_Difficulty
	
	
	}



Resistances = {
	-- Healthy
	Small_Biter = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 1, percent = 0},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 1, percent = 0}},
	
	-- Infected  
	Small_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 3, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 2, percent = 0},
      {type = "explosion", decrease = 2, percent = 0},
      {type = "acid", decrease = 2, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	  
	-- Mutated  
	Small_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -80},
      {type = "physical", decrease = 0, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 3, percent = 0},
      {type = "explosion", decrease = 3, percent = 0},
      {type = "acid", decrease = 3, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 3, percent = 5*NE_Difficulty}},
	
	-- Healthy
	Medium_Biter = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 5, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 0},
      {type = "explosion", decrease = 5, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 5, percent = 5*NE_Difficulty}},
	
	-- Infected  
	Medium_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 8, percent = 8*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 5, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Mutated  
	Medium_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -60},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 5, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 8, percent = 8*NE_Difficulty}},
	
	-- Healthy
	Big_Biter = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 8, percent = 15*NE_Difficulty},
      {type = "impact", decrease = 8, percent = 8*NE_Difficulty},
      {type = "explosion", decrease = 8, percent = 8*NE_Difficulty},
      {type = "acid", decrease = 8, percent = 8*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 8*NE_Difficulty},
      {type = "laser", decrease = 8, percent = 8*NE_Difficulty}},
	
	-- Infected  
	Big_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 15, percent = 20*NE_Difficulty},
      {type = "impact", decrease = 10, percent = 10*NE_Difficulty},
      {type = "explosion", decrease = 10, percent = 10*NE_Difficulty},
      {type = "acid", decrease = 10, percent = 10*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 10*NE_Difficulty},
      {type = "laser", decrease = 5, percent = 10*NE_Difficulty}},
	
	-- Mutated  
	Big_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 5, percent = 20*NE_Difficulty},
      {type = "impact", decrease = 10, percent = 10*NE_Difficulty},
      {type = "explosion", decrease = 10, percent = 10*NE_Difficulty},
      {type = "acid", decrease = 10, percent = 10*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 10*NE_Difficulty},
      {type = "laser", decrease = 15, percent = 20*NE_Difficulty}},
	
	-- Healthy	
	Behemoth_Biter = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 15, percent = 30*NE_Difficulty},
      {type = "impact", decrease = 15, percent = 15*NE_Difficulty},
      {type = "explosion", decrease = 15, percent = 15*NE_Difficulty},
      {type = "acid", decrease = 15, percent = 15*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 15*NE_Difficulty},
      {type = "laser", decrease = 15, percent = 15*NE_Difficulty}},
	
	-- Healthy
	Small_Spitter = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 1, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Infected  
	Small_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 2, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 2, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 2, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Mutated  
	Small_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -80},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 3, percent = 5*NE_Difficulty},
      {type = "acid", decrease = 3, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 2, percent = 5*NE_Difficulty}},
	
	-- Healthy
	Medium_Spitter = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 5, percent = 0},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 5, percent = 10*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 5, percent = 0}},
	
	-- Infected  
	Medium_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 10, percent = 10*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 5, percent = 10*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 0, percent = 5*NE_Difficulty}},
	
	-- Mutated  
	Medium_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -60},
      {type = "physical", decrease = 0, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 5, percent = 10*NE_Difficulty},
      {type = "acid", decrease = 5, percent = 5*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 5*NE_Difficulty},
      {type = "laser", decrease = 10, percent = 10*NE_Difficulty}},
	
	-- Healthy
	Big_Spitter = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 5, percent = 10*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 5*NE_Difficulty},
      {type = "explosion", decrease = 10, percent = 20*NE_Difficulty},
      {type = "acid", decrease = 10, percent = 10*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 10*NE_Difficulty},
      {type = "laser", decrease = 5, percent = 10*NE_Difficulty}},
	
	-- Infected  
	Big_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 10, percent = 15*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 10*NE_Difficulty},
      {type = "explosion", decrease = 10, percent = 20*NE_Difficulty},
      {type = "acid", decrease = 10, percent = 10*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 10*NE_Difficulty},
      {type = "laser", decrease = 0, percent = 10*NE_Difficulty}},
	
	-- Mutated  
	Big_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 5, percent = 5*NE_Difficulty},
      {type = "impact", decrease = 5, percent = 10*NE_Difficulty},
      {type = "explosion", decrease = 10, percent = 20*NE_Difficulty},
      {type = "acid", decrease = 10, percent = 10*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 10*NE_Difficulty},
      {type = "laser", decrease = 15, percent = 15*NE_Difficulty}},
	
	-- Healthy
	Behemoth_Spitter = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 10, percent = 10*NE_Difficulty},
      {type = "impact", decrease = 15, percent = 15*NE_Difficulty},
      {type = "explosion", decrease = 15, percent = 30*NE_Difficulty},
      {type = "acid", decrease = 15, percent = 15*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 15*NE_Difficulty},
      {type = "laser", decrease = 15, percent = 15*NE_Difficulty}},
	
	---- Worms
	Small_Worm = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 0, percent = 5},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 5, percent = 0},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 5, percent = 5}},
	
	Medium_Worm = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 10, percent = 10},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 10, percent = 10}},

	
	Big_Worm = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 15, percent = 15},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 15, percent = 15},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 15, percent = 15}},
	  	  
	  --- Spawner
	
	Spawner = {
	  {type = "fire", decrease = 0, percent = -100},
      {type = "physical", decrease = 5, percent = 10*NE_Difficulty},
      {type = "impact", decrease = 15, percent = 15*NE_Difficulty},
      {type = "explosion", decrease = 15, percent = 30*NE_Difficulty},
      {type = "acid", decrease = 15, percent = 15*NE_Difficulty},
      {type = "poison", decrease = 0, percent = 15*NE_Difficulty},
      {type = "laser", decrease = 10, percent = 15*NE_Difficulty}},
	Fire = {
      {type = "fire", decrease = 0, percent = 75}},
}