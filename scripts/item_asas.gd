extends Area2D

func _ready():
	pass


func _on_item_asas_body_entered(body):
	get_tree().call_group("player", "ativar_asas")
	get_tree().call_group("hud", "ativar_asas")
	$powerup_wings.hide()
	$audio.play()


func _on_audio_finished():
	queue_free()
