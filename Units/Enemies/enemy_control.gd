# This script controls the enemy behavior
class_name Enemy_Control
extends Node2D

func get_units() -> Array[Unit]:
	var units : Array[Unit] = []
	
	for child in get_children():
		units.append(Enemy.new(child.starting_hp))
	
	return units

func player_units_alive() -> bool:
	var all_alive = false
	
	for child in get_children():
		if child.current_hp > 0:
			all_alive = true
	
	return all_alive
