extends "res://scripts/Game.gd"


func _ready():
	pass

func _on_btnJogar_pressed():
	mudaCena(cenas[1])
	
func _on_btnCreditos_pressed():
	print("creditos")
	
func _on_btnSair_pressed():
	get_tree().quit()
