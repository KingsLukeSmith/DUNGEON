extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal close_menu
var focused = true
onready var buttons = $OptionContainer/Buttons

var previous_menu_item 

#GET FOCUS and LOAD ITEMS
func _ready():
	focused = true
	load_items()
	var first_button = buttons.get_child(0)
	if first_button is Button:
		first_button.grab_focus()
	
#LOAD ITEMS FROM INVENTORY. CURRENTLY TESTING ONLY LOADS PLACEHOLDERS	
func load_items():
	for i in range(10):
		var btn = load("res://objects/displays/Item.tscn").instance()
		buttons.add_child(btn)
		btn.connect("pressed",self,"open_sub_menu")

#WHEN AN ITEM IS SELECTED LOAD THE SUB MENU
func open_sub_menu():
	print("clicked me")
	disable_focus()
	var sub_menu = load("res://objects/displays/ItemsSubMenu.tscn").instance()
	get_parent().add_child(sub_menu)
	sub_menu.connect("close_menu",self,"allow_focus")
	
#DISABLE THE FOCUS ON THE BUTTON GROUPS
func disable_focus():
	focus_mode = 0
	for button in buttons.get_children():
		button.focus_mode = 0
	focused = false
	previous_menu_item = get_focus_owner()

#ALLOW THE FOCUS ON THE BUTTON GROUPS		
func allow_focus():
	print("ready")
	for button in buttons.get_children():
		button.focus_mode = 2
	previous_menu_item.grab_focus()
	focused = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and focused:
		queue_free()
		emit_signal("close_menu")


#func _process(delta):
#	pass
