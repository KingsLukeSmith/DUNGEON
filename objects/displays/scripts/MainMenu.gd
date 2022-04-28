extends Control


var focused = true
onready var buttons = $OptionContainer/Buttons
var previous_menu_item 

func _ready():
	buttons.get_child(0).grab_focus()
	
	
func disable_focus():
	focus_mode = 0
	for button in buttons.get_children():
		button.focus_mode = 0
	focused = false
		
func allow_focus():
	print("ready")
	for button in buttons.get_children():
		button.focus_mode = 2
	previous_menu_item.grab_focus()
	focused = true


#ADD VARIOUS MENUS BASED ON BUTTON PRESSED
func _on_BtnItems_pressed():
	disable_focus() 
	previous_menu_item = $OptionContainer/Buttons/BtnItems
	var m = load("res://objects/displays/ItemsListMenu.tscn").instance()
	get_parent().add_child(m) 
	m.connect("close_menu",self,"allow_focus")
	
