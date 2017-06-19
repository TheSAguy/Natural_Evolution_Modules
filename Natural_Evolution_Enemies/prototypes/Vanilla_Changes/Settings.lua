
require "prototypes.Vanilla_Changes.Functions"
if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value


	
	-- Healthy
	-- Damage 1 = Physical
	
	-- Infected:
	-- Damage 1 = Poison
	-- Damage 2 = Physical
	
	-- Mutated:
	-- Damage 1 = Acid
	-- Damage 2 = Physical
	
Damage = {
	Small_Biter = Biter_Melee_Attack_Healthy(10*NE_Enemies.Settings.NE_Difficulty),
	Small_Biter_Mk2 = Biter_Melee_Attack_Infected(8*NE_Enemies.Settings.NE_Difficulty,5*NE_Enemies.Settings.NE_Difficulty),
	Small_Biter_Mk3 = Biter_Melee_Attack_Mutated(12*NE_Enemies.Settings.NE_Difficulty,5*NE_Enemies.Settings.NE_Difficulty),
	Medium_Biter = Biter_Melee_Attack_Healthy(35*NE_Enemies.Settings.NE_Difficulty),
	Medium_Biter_Mk2 = Biter_Melee_Attack_Infected(30*NE_Enemies.Settings.NE_Difficulty,10*NE_Enemies.Settings.NE_Difficulty),
	Medium_Biter_Mk3 = Biter_Melee_Attack_Mutated(35*NE_Enemies.Settings.NE_Difficulty,10*NE_Enemies.Settings.NE_Difficulty),
	Big_Biter = Biter_Melee_Attack_Healthy(80*NE_Enemies.Settings.NE_Difficulty),
	Big_Biter_Mk2 = Biter_Melee_Attack_Infected(70*NE_Enemies.Settings.NE_Difficulty,30*NE_Enemies.Settings.NE_Difficulty),
	Big_Biter_Mk3 = Biter_Melee_Attack_Mutated(80*NE_Enemies.Settings.NE_Difficulty,30*NE_Enemies.Settings.NE_Difficulty),
	Behemoth_Biter = Biter_Melee_Attack_Healthy(175*NE_Enemies.Settings.NE_Difficulty)
	}
	
	
Health = {
	Small_Biter = 15,
	Small_Biter_Mk2 = 20*NE_Enemies.Settings.NE_Difficulty,
	Small_Biter_Mk3 = 45*NE_Enemies.Settings.NE_Difficulty,
	Medium_Biter = 75*NE_Enemies.Settings.NE_Difficulty,
	Medium_Biter_Mk2 = 150*NE_Enemies.Settings.NE_Difficulty,
	Medium_Biter_Mk3 = 225*NE_Enemies.Settings.NE_Difficulty,
	Big_Biter = 450*NE_Enemies.Settings.NE_Difficulty,
	Big_Biter_Mk2 = 900*NE_Enemies.Settings.NE_Difficulty,
	Big_Biter_Mk3 = 1800*NE_Enemies.Settings.NE_Difficulty,
	Behemoth_Biter = 5000*NE_Enemies.Settings.NE_Difficulty,
	Small_Spitter = 10,
	Small_Spitter_Mk2 = 15*NE_Enemies.Settings.NE_Difficulty,
	Small_Spitter_Mk3 = 20*NE_Enemies.Settings.NE_Difficulty,
	Medium_Spitter = 50*NE_Enemies.Settings.NE_Difficulty,
	Medium_Spitter_Mk2 = 100*NE_Enemies.Settings.NE_Difficulty,
	Medium_Spitter_Mk3 = 150*NE_Enemies.Settings.NE_Difficulty,
	Big_Spitter = 200*NE_Enemies.Settings.NE_Difficulty,
	Big_Spitter_Mk2 = 450*NE_Enemies.Settings.NE_Difficulty,
	Big_Spitter_Mk3 = 700*NE_Enemies.Settings.NE_Difficulty,
	Behemoth_Spitter = 2000*NE_Enemies.Settings.NE_Difficulty,
	Small_Worm = 200 + 100 * NE_Enemies.Settings.NE_Difficulty,
	Medium_Worm = 200 + 200 * NE_Enemies.Settings.NE_Difficulty,
	Big_Worm = 400 + 200 * NE_Enemies.Settings.NE_Difficulty,
	
	
	}



Resistances = {
	-- Healthy (Physical)
	Small_Biter = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 1, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Infected (Poison / Explosion)
	Small_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -85},
      {type = "physical", decrease = 1, percent = 0},
      {type = "impact", decrease = 1, percent = 0},
      {type = "explosion", decrease = 2, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 2, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 1, percent = 0}},
	  
	-- Mutated (Acid / Laser)  
	Small_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -80},
      {type = "physical", decrease = 4, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 2, percent = 0},
      {type = "explosion", decrease = 2, percent = 0},
      {type = "acid", decrease = 2, percent = 0},
      {type = "poison", decrease = 2, percent = 0},
      {type = "laser", decrease = 4, percent = 5*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)
	Medium_Biter = {
	  {type = "fire", decrease = 0, percent = -75},
      {type = "physical", decrease = 6, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 4, percent = 0},
      {type = "explosion", decrease = 4, percent = 0},
      {type = "acid", decrease = 4, percent = 0},
      {type = "poison", decrease = 4, percent = 0},
      {type = "laser", decrease = 4, percent = 0}},
	
	-- Infected (Poison / Explosion)
	Medium_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 6, percent = 0},
      {type = "impact", decrease = 6, percent = 0},
      {type = "explosion", decrease = 8, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 6, percent = 0},
      {type = "poison", decrease = 8, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 6, percent = 0}},
	
	-- Mutated (Acid / Laser)  
	Medium_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -65},
      {type = "physical", decrease = 8, percent = 0},
      {type = "impact", decrease = 8, percent = 0},
      {type = "explosion", decrease = 8, percent = 0},
      {type = "acid", decrease = 10, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 8, percent = 0},
      {type = "laser", decrease = 10, percent = 10*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)
	Big_Biter = {
	  {type = "fire", decrease = 0, percent = -60},
      {type = "physical", decrease = 14, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 10, percent = 0},
      {type = "explosion", decrease = 10, percent = 0},
      {type = "acid", decrease = 10, percent = 0},
      {type = "poison", decrease = 10, percent = 0},
      {type = "laser", decrease = 10, percent = 0}},
	
	-- Infected (Poison / Explosion) 
	Big_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -55},
      {type = "physical", decrease = 12, percent = 0},
      {type = "impact", decrease = 12, percent = 0},
      {type = "explosion", decrease = 16, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 12, percent = 0},
      {type = "poison", decrease = 16, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 12, percent = 0}},
		
	-- Mutated (Acid / Laser)  
	Big_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 14, percent = 0},
      {type = "impact", decrease = 14, percent = 0},
      {type = "explosion", decrease = 14, percent = 0},
      {type = "acid", decrease = 18, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 14, percent = 0},
      {type = "laser", decrease = 18, percent = 15*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)	
	Behemoth_Biter = {
	  {type = "fire", decrease = 0, percent = -40},
      {type = "physical", decrease = 20, percent = 20*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 16, percent = 0},
      {type = "explosion", decrease = 16, percent = 0},
      {type = "acid", decrease = 16, percent = 0},
      {type = "poison", decrease = 16, percent = 0},
      {type = "laser", decrease = 16, percent = 0}},
	
	-- Healthy (Physical)
	Small_Spitter = {
	  {type = "fire", decrease = 0, percent = -90},
      {type = "physical", decrease = 1, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Infected (Poison / Explosion) 
	Small_Spitter_Mk2 = {
	  {type = "fire", decrease = 1, percent = -85},
      {type = "physical", decrease = 1, percent = 0},
      {type = "impact", decrease = 1, percent = 0},
      {type = "explosion", decrease = 2, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 2, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 1, percent = 0}},
	
	-- Mutated (Acid / Laser)  
	Small_Spitter_Mk3 = {
	  {type = "fire", decrease = 2, percent = -80},
      {type = "physical", decrease = 2, percent = 0},
      {type = "impact", decrease = 2, percent = 0},
      {type = "explosion", decrease = 2, percent = 0},
      {type = "acid", decrease = 3, percent = 5*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 2, percent = 0},
      {type = "laser", decrease = 3, percent = 5*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)
	Medium_Spitter = {
	  {type = "fire", decrease = 0, percent = -75},
      {type = "physical", decrease = 4, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 3, percent = 0},
      {type = "explosion", decrease = 3, percent = 0},
      {type = "acid", decrease = 3, percent = 0},
      {type = "poison", decrease = 3, percent = 0},
      {type = "laser", decrease = 3, percent = 0}},
	
	-- Infected (Poison / Explosion) 
	Medium_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 4, percent = 0},
      {type = "impact", decrease = 4, percent = 0},
      {type = "explosion", decrease = 5, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 4, percent = 0},
      {type = "poison", decrease = 5, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 4, percent = 0}},
	
	-- Mutated (Acid / Laser)   
	Medium_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -65},
      {type = "physical", decrease = 5, percent = 0},
      {type = "impact", decrease = 5, percent = 0},
      {type = "explosion", decrease = 5, percent = 0},
      {type = "acid", decrease = 6, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 5, percent = 0},
      {type = "laser", decrease = 6, percent = 10*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)
	Big_Spitter = {
	  {type = "fire", decrease = 0, percent = -60},
      {type = "physical", decrease = 8, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 6, percent = 0},
      {type = "explosion", decrease = 6, percent = 0},
      {type = "acid", decrease = 6, percent = 0},
      {type = "poison", decrease = 6, percent = 0},
      {type = "laser", decrease = 6, percent = 0}},
	
	-- Infected (Poison / Explosion) 
	Big_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -55},
      {type = "physical", decrease = 7, percent = 0},
      {type = "impact", decrease = 7, percent = 0},
      {type = "explosion", decrease = 9, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 7, percent = 0},
      {type = "poison", decrease = 9, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 7, percent = 0}},
	
	-- Mutated (Acid / Laser)  
	Big_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -50},
      {type = "physical", decrease = 8, percent = 0},
      {type = "impact", decrease = 8, percent = 0},
      {type = "explosion", decrease = 8, percent = 0},
      {type = "acid", decrease = 10, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 8, percent = 0},
      {type = "laser", decrease = 10, percent = 15*NE_Enemies.Settings.NE_Difficulty}},
	
	-- Healthy (Physical)
	Behemoth_Spitter = {
	  {type = "fire", decrease = 0, percent = -40},
      {type = "physical", decrease = 14, percent = 20*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 10, percent = 0},
      {type = "explosion", decrease = 10, percent = 0},
      {type = "acid", decrease = 10, percent = 0},
      {type = "poison", decrease = 10, percent = 0},
      {type = "laser", decrease = 10, percent = 0}},
	
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
	  {type = "fire", decrease = 0, percent = -80},
      {type = "physical", decrease = 10, percent = 10},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 5, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 10, percent = 10}},

	
	Big_Worm = {
	  {type = "fire", decrease = 0, percent = -70},
      {type = "physical", decrease = 15, percent = 15},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 15, percent = 15},
      {type = "acid", decrease = 10, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 15, percent = 15}},
	  	  
	  --- Spawner
	
	Spawner = {
	  {type = "fire", decrease = 0, percent = -75},
      {type = "physical", decrease = 5, percent = 10*NE_Enemies.Settings.NE_Difficulty},
      {type = "impact", decrease = 15, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "explosion", decrease = 15, percent = 30*NE_Enemies.Settings.NE_Difficulty},
      {type = "acid", decrease = 15, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "poison", decrease = 0, percent = 15*NE_Enemies.Settings.NE_Difficulty},
      {type = "laser", decrease = 10, percent = 15*NE_Enemies.Settings.NE_Difficulty}},
	Fire = {
      {type = "fire", decrease = 0, percent = 75}},
}