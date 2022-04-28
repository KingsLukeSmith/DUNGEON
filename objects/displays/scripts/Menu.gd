extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var focused = true
var previous_button 

onready var buttons = $OptionContainer/Buttons
# Called when the node enters the scene tree for the first time.
func _ready():


	var first_button = buttons.get_child(0)
	print(first_button)
	if first_button is Button:
		first_button.grab_focus()
	
func _disable_focus():
	for button in buttons.get_children():
		button.focus_mode = 0
	focused = false
		
func _allow_focus():
	print("ready")
	for button in buttons.get_children():
		button.focus_mode = 2
	buttons.get_child(0).grab_focus()
	focused = true

func _on_BtnItems_pressed():
	_disable_focus()
	var i = load("res://objects/displays/ItemsList.tscn").instance()
	get_parent().add_child(i) # Replace with function body.
	i.connect("close_menu",self,"_allow_focus")

	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and focused:
		queue_free()

