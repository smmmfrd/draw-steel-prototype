# This script handles all player input to their units
class_name Player_Control
extends Node2D

func get_units() -> Array[Unit]:
	var units : Array[Unit] = []
	
	for child in get_children():
		units.append(Player.new(child.starting_hp))
	
	return units

func player_units_alive() -> bool:
	var all_alive = false
	
	for child in get_children():
		if child.current_hp > 0:
			all_alive = true
	
	return all_alive
