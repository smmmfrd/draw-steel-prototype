# A global script that manages the battles.
extends Node2D

var line : Array[Unit]

var current_unit

signal finished_turn

func start_battle(new_line : Array[Unit]) -> void:
	line = new_line
	
	finished_turn.connect(next_turn)
	
	next_turn()

func next_turn():
	if line.size() > 0:
		current_unit = line.pop_front()
		current_unit.act()
