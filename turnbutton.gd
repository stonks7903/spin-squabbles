extends TextureButton


@export var turn_type:Label
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _pressed() -> void:
	Signals.turn_button_pressed.emit(turn_type.text)
	
func skill_name(name):
	if typeof(name) == TYPE_STRING:
		turn_type.show()
		turn_type.text = name
	else:
		hide()
		turn_type.hide()
