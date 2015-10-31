
require "prototypes.Vanilla_Changes.Functions"

Damage = {
	Small_Biter = Biter_Melee_Attack_Healthy(5),
	Small_Biter_Mk2 = Biter_Melee_Attack_Infected(8,5),
	Small_Biter_Mk3 = Biter_Melee_Attack_Mutated(10,5),
	Medium_Biter = Biter_Melee_Attack_Healthy(25),
	Medium_Biter_Mk2 = Biter_Melee_Attack_Infected(25,10),
	Medium_Biter_Mk3 = Biter_Melee_Attack_Mutated(30,15),
	Big_Biter = Biter_Melee_Attack_Healthy(65),
	Big_Biter_Mk2 = Biter_Melee_Attack_Infected(60,30),
	Big_Biter_Mk3 = Biter_Melee_Attack_Mutated(65,35),
	Behemoth_Biter = Biter_Melee_Attack_Healthy(150)
	}
	
	
Health = {
	Small_Biter = 15,
	Small_Biter_Mk2 = 20,
	Small_Biter_Mk3 = 45,
	Medium_Biter = 75,
	Medium_Biter_Mk2 = 150,
	Medium_Biter_Mk3 = 225,
	Big_Biter = 375,
	Big_Biter_Mk2 = 750,
	Big_Biter_Mk3 = 1125,
	Behemoth_Biter = 5000,
	Small_Spitter = 10,
	Small_Spitter_Mk2 = 15,
	Small_Spitter_Mk3 = 20,
	Medium_Spitter = 50,
	Medium_Spitter_Mk2 = 100,
	Medium_Spitter_Mk3 = 150,
	Big_Spitter = 200,
	Big_Spitter_Mk2 = 450,
	Big_Spitter_Mk3 = 700,
	Behemoth_Spitter = 2000
	}



Resistances = {
	-- Healthy
	Small_Biter = {
	  {type = "fire", decrease = 0, percent = -45},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 1, percent = 0},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 1, percent = 0}},
	
	-- Infected  
	Small_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -45},
      {type = "physical", decrease = 3, percent = 5},
      {type = "impact", decrease = 2, percent = 0},
      {type = "explosion", decrease = 2, percent = 0},
      {type = "acid", decrease = 2, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	  
	-- Mutated  
	Small_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -40},
      {type = "physical", decrease = 0, percent = 5},
      {type = "impact", decrease = 3, percent = 0},
      {type = "explosion", decrease = 3, percent = 0},
      {type = "acid", decrease = 3, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 3, percent = 5}},
	
	-- Healthy
	Medium_Biter = {
	  {type = "fire", decrease = 0, percent = -35},
      {type = "physical", decrease = 5, percent = 5},
      {type = "impact", decrease = 5, percent = 0},
      {type = "explosion", decrease = 5, percent = 5},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 5, percent = 5}},
	
	-- Infected  
	Medium_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -35},
      {type = "physical", decrease = 10, percent = 10},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 5},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Mutated  
	Medium_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -30},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 5},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 10, percent = 10}},
	
	-- Healthy
	Big_Biter = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 10, percent = 20},
      {type = "impact", decrease = 10, percent = 10},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 10, percent = 10}},
	
	-- Infected  
	Big_Biter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 15, percent = 25},
      {type = "impact", decrease = 10, percent = 10},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 5, percent = 10}},
	
	-- Mutated  
	Big_Biter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 5, percent = 20},
      {type = "impact", decrease = 10, percent = 10},
      {type = "explosion", decrease = 10, percent = 10},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 15, percent = 25}},
	
	-- Healthy	
	Behemoth_Biter = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 15, percent = 30},
      {type = "impact", decrease = 15, percent = 15},
      {type = "explosion", decrease = 15, percent = 15},
      {type = "acid", decrease = 15, percent = 15},
      {type = "poison", decrease = 0, percent = 15},
      {type = "laser", decrease = 15, percent = 15}},
	
	-- Healthy
	Small_Spitter = {
	  {type = "fire", decrease = 0, percent = -45},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 1, percent = 5,},
      {type = "acid", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Infected  
	Small_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -45},
      {type = "physical", decrease = 2, percent = 5},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 2, percent = 5,},
      {type = "acid", decrease = 2, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0}},
	
	-- Mutated  
	Small_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -40},
      {type = "physical", decrease = 0, percent = 0},
      {type = "impact", decrease = 0, percent = 0},
      {type = "explosion", decrease = 3, percent = 5,},
      {type = "acid", decrease = 3, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "laser", decrease = 2, percent = 5}},
	
	-- Healthy
	Medium_Spitter = {
	  {type = "fire", decrease = 0, percent = -35},
      {type = "physical", decrease = 5, percent = 0},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 10},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 5, percent = 0}},
	
	-- Infected  
	Medium_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -35},
      {type = "physical", decrease = 10, percent = 10},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 10},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 0, percent = 5}},
	
	-- Mutated  
	Medium_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -30},
      {type = "physical", decrease = 0, percent = 5},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 5, percent = 10},
      {type = "acid", decrease = 5, percent = 5},
      {type = "poison", decrease = 0, percent = 5},
      {type = "laser", decrease = 10, percent = 10}},
	
	-- Healthy
	Big_Spitter = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 5, percent = 10},
      {type = "impact", decrease = 5, percent = 5},
      {type = "explosion", decrease = 10, percent = 20},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 5, percent = 10}},
	
	-- Infected  
	Big_Spitter_Mk2 = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 10, percent = 15},
      {type = "impact", decrease = 5, percent = 10},
      {type = "explosion", decrease = 10, percent = 20},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 0, percent = 10}},
	
	-- Mutated  
	Big_Spitter_Mk3 = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 5, percent = 5},
      {type = "impact", decrease = 5, percent = 10},
      {type = "explosion", decrease = 10, percent = 20},
      {type = "acid", decrease = 10, percent = 10},
      {type = "poison", decrease = 0, percent = 10},
      {type = "laser", decrease = 15, percent = 15}},
	
	-- Healthy
	Behemoth_Spitter = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 10, percent = 10},
      {type = "impact", decrease = 15, percent = 15},
      {type = "explosion", decrease = 15, percent = 30},
      {type = "acid", decrease = 15, percent = 15},
      {type = "poison", decrease = 0, percent = 15},
      {type = "laser", decrease = 15, percent = 15}},
	
	
	Spawner = {
	  {type = "fire", decrease = 0, percent = -25},
      {type = "physical", decrease = 5, percent = 10},
      {type = "impact", decrease = 15, percent = 15},
      {type = "explosion", decrease = 15, percent = 30},
      {type = "acid", decrease = 15, percent = 15},
      {type = "poison", decrease = 0, percent = 15},
      {type = "laser", decrease = 10, percent = 15}},
	Fire = {
      {type = "fire", decrease = 0, percent = 75}},
}