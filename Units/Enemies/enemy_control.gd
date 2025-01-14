# This script controls the enemy behavior
class_name Enemy_Control
extends Node2D

var units : Array[Unit]

func unit_active(active_enemy : Enemy):
	active_enemy.act()
	
	await get_tree().create_timer(0.1).timeout
	
	FightManager.finished_turn.emit()

func get_units() -> Array[Unit]:
	units = []
	
	for child in get_children():
		units.append(Enemy.new(child.my_stats))
	
	return units

func units_alive() -> bool:
	var all_alive = false
	
	for unit in units:
		if unit.current_hp > 0:
			all_alive = true
	
	return all_alive
