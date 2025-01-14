class_name Battle
extends Resource

var player_control : Player_Control
var enemy_control : Enemy_Control
var units : Array[Unit]

func _init(n_player_control : Player_Control, n_enemy_control : Enemy_Control, n_units : Array[Unit]) -> void:
	player_control = n_player_control
	enemy_control = n_enemy_control
	units = n_units

func battle_ended() -> bool:
	return false
