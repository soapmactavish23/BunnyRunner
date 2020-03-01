extends Area2D

func _ready():
	pass

func _on_enemy_2_body_entered(body):
	get_tree().call_group("hud", "del_vida")
