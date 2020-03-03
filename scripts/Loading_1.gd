extends "res://scripts/Game.gd"

func _ready():
	pass

func _on_Timer_timeout():
	print("acabou")
	mudaCena(cenas[2])
