extends Node2D

func _ready():
	pass
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "run-right":
		$KinematicBody2D/sprite.flip_h = true
		$AnimationPlayer.play("run-left")
	elif anim_name == "run-left":
		$KinematicBody2D/sprite.flip_h = false
		$AnimationPlayer.play("run-right")