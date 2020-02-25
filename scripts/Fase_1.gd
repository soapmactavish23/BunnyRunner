extends "res://scripts/Game.gd"

func _ready():
	add_to_group("scenes")
	pass
	
func victory():
	mudaCena(cenas[0])
