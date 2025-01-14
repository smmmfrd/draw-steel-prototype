class_name Player
extends Unit

func take_turn() -> void:
	var targets = FightManager.get_enemies()
	
	var target = targets.pick_random()
	
	melee_weapon_free_strike(target)
