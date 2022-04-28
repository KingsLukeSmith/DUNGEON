extends Node

export (Resource) var character

onready var char_name = $CenterContainer/VBoxContainer/HboxName/Name
onready var current_hp = $CenterContainer/VBoxContainer/HboxHP/Current
onready var current_mp = $CenterContainer/VBoxContainer/HboxMP/Current
onready var max_hp = $CenterContainer/VBoxContainer/HboxHP/Max
onready var max_mp = $CenterContainer/VBoxContainer/HboxMP/Max

func _ready():
	var char_stats = character.get_stats()
	if character:
		char_name.text = char_stats["name"]
		current_hp.text = char_stats["base_hp"]
		max_hp.text = char_stats["base_hp"]
		
		current_mp.text = char_stats["base_mp"]
		max_mp.text = char_stats["base_mp"]
