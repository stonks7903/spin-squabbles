class_name Boss
extends StaticBody3D
@export var healthbar:ProgressBar
var health :float = 40.0;
@export var char1: Character
@export var char2: Character
@export var char3: Character
var attackpower:int = randi_range(2,3)
func _ready() -> void:
	healthbar.max_value = health
	healthbar.value = health


func attack():
	char1.damage(attackpower)
func damage(amount:int):
	health -= amount
	healthbar.value = health
