extends Node3D
@export var char1: Character
@export var char2: Character
@export var char3: Character
@export var boss: Boss
var turn: int = 0
var turn_count: int = 1
var turn_order: Array[Character]
func _ready() -> void:
	turn_order = [char1,char2,char3]
	turn_order[turn].when_turn()
	Signals.turn_button_pressed.connect(turn_process)

func turn_process(turn_type):
	match turn_type:
		"Attack":
			turn_order[turn].attack(boss)
			turn_ended()
		"Skill":
			turn_order[turn].skill_menu()
		"Defend":
			turn_ended()
		"Spin!":
			turn_order[turn].spin()
		"Back":
			turn_order[turn].skill_menu_off()
		_:
			if turn_order[turn].skill(turn_type):
				turn_ended()
	

func turn_ended():
	turn += 1
	if turn >= 3:
		boss.attack()
		turn = 0
	turn_order[(turn-1)%3].turn_over()
	turn_order[turn].when_turn()
