extends Area2D

func _ready():
	pass

func _on_moeda_body_entered(body):
	$anim.hide()
	$Particles2D.emitting = true
	yield($audio,"finished")
	get_tree().call_group("hud", "add_moeda")
	$audio.play()

func _on_audio_finished():
	queue_free()
