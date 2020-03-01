extends Area2D

export(int, "up", "down") var tipo_armadilha 

func _ready():
	pass

func _process(delta):
	if tipo_armadilha == 1:
		$down.hide()
	else:
		$up.hide()

func _on_armadilha_body_entered(body):
	get_tree().call_group("hud", "del_vida")
