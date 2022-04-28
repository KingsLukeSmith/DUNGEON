extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal close_menu
var focused = true
onready var buttons = $OptionContainer/Buttons
# Called when the node enters the scene tree for the first time.
func _ready():
	focused = true
	var first_button = buttons.get_child(0)
	if first_button is Button:
		first_button.grab_focus()
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and focused:
		queue_free()
		emit_signal("close_menu")


#func _process(delta):
#	pass
