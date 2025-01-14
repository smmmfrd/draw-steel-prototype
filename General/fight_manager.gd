# A global script that manages the battles.
extends Node2D

var battle : Battle
var line : Array[Unit]

var current_unit

signal finished_turn

func start_battle(new_battle : Battle) -> void:
	battle = new_battle
	
	finished_turn.connect(next_turn)
	
	next_turn()

func next_turn():
	if line.size() > 0:
		current_unit = line.pop_front()
		current_unit.act()
