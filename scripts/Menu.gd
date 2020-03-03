extends "res://scripts/Game.gd"

var somLigado = true
var musicaLigado = true

func _ready():
	pass

func _on_btnJogar_pressed():
	mudaCena(cenas[1])

func _on_btnSelect_pressed():
	$HUD_menu.hide()
	$HUD_capitulos.show()

func _on_btnSair_pressed():
	get_tree().quit()

func _on_btnSom_pressed():
	if somLigado:
		somLigado = false
		$HUD_menu/btnSom/anim.play("off")
		print("som desligado")
	else:
		somLigado = true
		$HUD_menu/btnSom/anim.play("on")
		print("som ligado")

func _on_btnMusica_pressed():
	if musicaLigado:
		musicaLigado = false
		$HUD_menu/btnMusica/anim.play("off")
		$musica.stop()
	else:
		musicaLigado = true
		$HUD_menu/btnMusica/anim.play("on")
		$musica.play()

func _on_btnBack_pressed():
	$HUD_menu.show()
	$HUD_capitulos.hide()


func _on_btnFase_1_pressed():
	mudaCena(cenas[1])
