# This script controls the enemy behavior
class_name Enemy_Control
extends Node2D

func unit_active(active_enemy : Enemy):
	active_enemy.act()
	FightManager.finished_turn.emit()

func get_units() -> Array[Unit]:
	var units : Array[Unit] = []
	
	for child in get_children():
		units.append(Enemy.new(child.my_stats))
	
	return units

func units_alive() -> bool:
	var all_alive = false
	
	for child in get_children():
		if child.current_hp > 0:
			all_alive = true
	
	return all_alive
