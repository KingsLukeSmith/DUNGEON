extends Resource

class_name Character


#exported variables
export (String) var char_name
export (int) var level
export (int) var base_hp
export (int) var base_mp
export (int) var base_atk
export (int) var base_def
export (int) var xp

#local variables
var max_hp = base_hp 
var max_mp = base_mp

func get_stats():
	return {"base_hp":str(base_hp), "base_mp":str(base_mp),"name":char_name}
