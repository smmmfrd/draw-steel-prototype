extends Node2D

func _ready() -> void:
	var player_control : Player_Control = %"Player Group"
	var enemy_control : Enemy_Control = %"Enemy Group"
	
	var units = player_control.get_units().duplicate()
	units.append_array(enemy_control.get_units().duplicate())
	
	var battle = Battle.new(player_control, enemy_control, units)
	
	FightManager.start_battle(battle)
