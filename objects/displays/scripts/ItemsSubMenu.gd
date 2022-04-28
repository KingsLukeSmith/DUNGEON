extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var buttons = $OptionContainer/Buttons

func _ready():

	var first_button = buttons.get_child(0)
	if first_button is Button:
		first_button.grab_focus()
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()
		emit_signal("close_menu")
		print("bye")



