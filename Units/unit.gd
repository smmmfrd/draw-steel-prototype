class_name Unit
extends Node

func act() -> void:
	take_turn()

func take_turn() -> void:
	print(self.name + " has no actions.")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		FightManager.finished_turn.emit()

func melee_weapon_free_strike(target : Unit) -> void:
	print("I hit " + target.name + " for " + " damage.")
