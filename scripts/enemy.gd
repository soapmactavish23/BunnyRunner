extends Node2D

func _ready():
	pass

func _on_enemy_damage_body_entered(body):
	get_tree().call_group("player", "dead")


func _on_enemy_hurt_body_entered(body):
	$anim.hide()
	$particle.emitting = true
	get_tree().call_group("player", "kill_enemy")
	$audio.play()

func _on_audio_finished():
	queue_free()
