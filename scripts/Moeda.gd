extends Area2D

func _ready():
	pass


func _on_moeda_body_entered(body):
	$audio.play()
	yield($audio,"finished")
	queue_free()
