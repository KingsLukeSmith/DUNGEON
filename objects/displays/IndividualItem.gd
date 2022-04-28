extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var submenu = preload("res://objects/displays/ItemsSubMenu.tscn")
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	


func _on_Button_pressed():
	var i = submenu.instance()
	get_parent().get_parent().get_parent()._disable_focus()
	get_node("CanvasLayer").add_child(i)
	i.rect_global_position = rect_global_position + Vector2(40,40)
