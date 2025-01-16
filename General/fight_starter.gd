extends Node2D

@onready var map_collision: TileMapLayer = %"Map Collision"

func _ready() -> void:
	var player_control : Player_Control = %"Player Group"
	var enemy_control : Enemy_Control = %"Enemy Group"
	
	var units = player_control.get_units().duplicate()
	units.append_array(enemy_control.get_units().duplicate())
	
	var battle = Battle.new(player_control, enemy_control, units)
	
	Navigation.init_level(map_collision, units)
	
	FightManager.start_battle(battle)
