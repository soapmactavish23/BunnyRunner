extends CanvasLayer

var moeda
var vida
var som_ligado = true

func _ready():
	add_to_group("hud")
	moeda = 0
	vida = 3
	$barra_power.hide()
	$pause.hide()
	update_hud(vida)

func _process(delta):
	if vida <= 0:
		get_tree().call_group("player", "dead")

func update_hud(val):
	if val == moeda:
		$Moedas/txtMoeda.text = "x " + str(moeda)
		$Moedas/txtMoeda2.text = "x " + str(moeda)
	elif val == vida:
		$Vidas/txtVida.text = "x " + str(vida)
		$Vidas/txtVida2.text = "x " + str(vida)

func add_moeda():
	moeda += 1
	update_hud(moeda)

func del_vida():
	vida -= 1
	update_hud(vida)
	


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