# A global script that manages the battles.
extends Node2D

var battle : Battle
var line : Array[Unit]

var rounds = 0

var current_unit

signal finished_turn

func start_battle(new_battle : Battle) -> void:
	battle = new_battle
	refresh_line()
	
	finished_turn.connect(next_turn)
	
	next_turn()

func refresh_line():
	rounds += 1
	print("\n--- refreshed the line, round %d --- \n" % rounds)
	line = battle.units.duplicate()

func next_turn():
	if not battle.player_control.units_alive():
		print("enemies won")
		return
	
	if not battle.enemy_control.units_alive():
		print("player won")
		return
	
	if line.size() == 0:
		refresh_line()
	
	current_unit = line.pop_front()
	
	if current_unit is Player:
		print("Players, you're up.")
		battle.player_control.unit_active(current_unit)
	
	elif current_unit is Enemy:
		print("Enemies, you're up.")
		battle.enemy_control.unit_active(current_unit)
	
	else:
		print("Current unit is null.")

func get_players() -> Array[Unit]:
	var player_units = battle.player_control.units
	
	return player_units

func get_enemies() -> Array[Unit]:
	var enemy_units = battle.enemy_control.units
	
	return enemy_units
