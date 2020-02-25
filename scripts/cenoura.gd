extends Area2D

func _ready():
	pass

func _on_cenoura_body_entered(body):
	get_tree().call_group("player", "happy")
	get_tree().call_group("scenes", "stop_song")
	$audio.play()
	yield($audio, "finished")
	get_tree().call_group("fade", "fade_out")