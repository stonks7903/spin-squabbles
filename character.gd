class_name Character
extends StaticBody3D

@export var hpbar:ProgressBar
@export var spbar:ProgressBar
@export var hpnumber:Label
@export var spnumber:Label
@export var Name:Label
@export var spintex:TextureRect
@export var skillbox:Control
var hp:int = randi_range(10,20)
var sp:int = randi_range(10,20)
var attackpower:int = randi_range(2,3)
var spin_types: Array[String] = ["attack", "defense", "support"]
var spincycle :int = 0
var spin_changed:bool = false
var skills:Array = ["Poison", "Heavy Wind", "Light Wind", null, null, null, null]
func _ready() -> void:
	hpbar.max_value = hp
	spbar.max_value = sp
	update_hpsp(hp,sp)
	
func skill_menu():
	skillbox.skill_menu_init.emit(skills)
func skill_menu_off():
	skillbox.hide()
func spin():
	if !spin_changed:
		spincycle = (spincycle + 1) % 3
		spintex.texture = load("res://spin_" + spin_types[spincycle] + ".png")
		spin_changed = true
func attack(boss:Boss):
	boss.damage(attackpower)
func damage(amount:int):
	update_hpsp(hp - amount if (hp - amount) > 0 else 0,sp)
func skill(type:String) -> bool:
	return false
func update_hpsp(new_hp:int,new_sp:int):
	hp = new_hp
	hpbar.value = hp
	hpnumber.text = str(hp)
	sp = new_sp
	spbar.value = sp
	spnumber.text = str(sp)
	
func when_turn():
	Name.label_settings.font_color = Color(0.0,1.0,0.0,1.0)
	
func turn_over():
	Name.label_settings.font_color = Color(1.0,1.0,1.0,1.0)
	spin_changed = false
