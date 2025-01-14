extends Node2D

@export var battle : Array[Unit]

func _ready() -> void:
	FightManager.start_battle(battle)
