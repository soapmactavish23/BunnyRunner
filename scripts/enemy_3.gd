extends Area2D

var vel = 2

func _ready():
	pass

func _process(delta):
	translate(Vector2(vel ,0))

func _on_enemy_3_body_entered(body):
	get_tree().call_group("hud","del_vida")
