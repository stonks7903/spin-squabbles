extends MarginContainer
signal skill_menu_init(skills:Array)
@export var buttons:Array[TextureButton]
func _ready() -> void:
	skill_menu_init.connect(init_buttons)



func init_buttons(strings:Array):
	for x in 7:
		buttons[x].show()
		buttons[x].skill_name(strings[x])
	show()
