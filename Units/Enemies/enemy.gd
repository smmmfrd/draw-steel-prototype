class_name Enemy
extends Unit

func take_turn() -> void:
	var targets = FightManager.get_players()
	
	var target = targets.pick_random()
	
	melee_weapon_free_strike(target)
