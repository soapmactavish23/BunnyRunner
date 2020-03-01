extends "res://scripts/Game.gd"

func _ready():
	pass

func _process(delta):
	$texto.translate(Vector2(0, -2))
	
	if $texto.position.y < -280:
		mudaCena(cenas[0])