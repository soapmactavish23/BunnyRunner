extends Node2D

func _ready():
	pass

func fade_out():
	$AnimationPlayer.play("fade_out")
	yield($AnimationPlayer, "animation_finished")
	get_tree().call_group("scenes", "victory")