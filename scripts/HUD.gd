extends CanvasLayer

var moeda

var som_ligado = true

func _ready():
	add_to_group("hud")
	moeda = 0
	$pause.hide()

func add_moeda():
	moeda += 1
	$txtMoeda.text = "x " + str(moeda)
	$txtMoeda2.text = "x " + str(moeda)

func _on_btnPause_pressed():
	get_tree().paused = true
	$pause.show()

func _on_btnStart_pressed():
	get_tree().paused = false
	$pause.hide()

func _on_btnSair_pressed():
	get_tree().quit()

func _on_btnSound_pressed():
	if som_ligado:
		$pause/btnSound/anim.play("off")
		som_ligado = false
		get_tree().call_group("scenes", "stop_song")
	else:
		$pause/btnSound/anim.play("on")
		som_ligado = true
		get_tree().call_group("scenes", "play_song")
		
