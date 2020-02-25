extends Area2D

func _ready():
	pass


func _on_mola_body_entered(body):
	$anim.play("enable")
	get_tree().call_group("player","pulo_mola")


func _on_anim_animation_finished():
	$anim.play("disable")
