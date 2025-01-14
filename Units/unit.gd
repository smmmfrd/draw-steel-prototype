class_name Unit
extends Resource

var my_name : String = ""
var current_hp : int = 0

func _init(new_stats : Unit_Stats) -> void:
	my_name = new_stats.name
	current_hp = new_stats.starting_hp

func act() -> void:
	take_turn()

func take_turn() -> void:
	print(my_name + " has no actions.")

func melee_weapon_free_strike(target : Unit) -> void:
	print("I hit " + target.name + " for " + " damage.")
