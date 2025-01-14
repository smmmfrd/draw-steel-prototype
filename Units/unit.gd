class_name Unit
extends Resource

var my_name : String = ""
var current_hp : int = 0

var stats : Unit_Stats

func _init(new_stats : Unit_Stats) -> void:
	my_name = new_stats.name
	current_hp = new_stats.starting_hp
	stats = new_stats

func act() -> void:
	take_turn()

func take_turn() -> void:
	print(my_name + " has no actions.")

func take_damage(damage:int) -> void:
	current_hp -= damage

func melee_weapon_free_strike(target : Unit) -> void:
	target.take_damage(stats.damage)
	print(my_name + " hit " + target.my_name + " for " + str(stats.damage) + " damage.")
