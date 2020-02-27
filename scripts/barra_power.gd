extends Node2D

onready var size = $bar.rect_size
var time = 5
func _ready():
	add_to_group("hud")

func ativar_asas():
	show()
	$tween.interpolate_method(self, "count", 1, 0 , time, Tween.TRANS_LINEAR, Tween.EASE_IN, 0)
	$tween.start()
	
func count(val):
	print(val)
	$bar.rect_size = Vector2(size.x * val, size.y)


func _on_tween_tween_completed(object, key):
	hide()
	$tween.stop_all()
	get_tree().call_group("player", "powerup_finished")
