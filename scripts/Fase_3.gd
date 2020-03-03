extends "res://scripts/Game.gd"

func _ready():
	add_to_group("scenes")
	
func victory():
	mudaCena(cenas[7])