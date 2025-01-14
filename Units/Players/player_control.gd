# This script handles all player input to their units
class_name Player_Control
extends Node2D

var units : Array[Unit] 
var player_turn : bool = false
var active_unit : Player = null

func _input(event: InputEvent) -> void:
	if player_turn and event.is_action_pressed("click"):
		player_turn = false
		active_unit.act()
		FightManager.finished_turn.emit()

func unit_active(player_unit : Player):
	player_turn = true
	active_unit = player_unit

func get_units() -> Array[Unit]:
	units = []
	
	for child in get_children():
		units.append(Player.new(child.my_stats))
	
	return units


func units_alive() -> bool:
	var all_alive = false
	
	for unit in units:
		if unit.current_hp > 0:
			all_alive = true
	
	return all_alive
