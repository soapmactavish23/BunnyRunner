extends Node2D

var cenas = [
	#0
	"res://scenes/Menu.tscn", 
	#1
	"res://scenes/Loading_1.tscn",
	#2
	"res://scenes/Fase_1.tscn",
	#3
	"res://scenes/Loading_2.tscn",
	#4
	"res://scenes/Fase_2.tscn",
	#5
	"res://scenes/Loading_3.tscn",
	#6
	"res://scenes/Fase_3.tscn",
	#7
	"res://scenes/Ending.tscn"
]

func _ready():
	add_to_group("scenes")

func mudaCena(cena):
	get_tree().change_scene(cena)
	
func stop_song():
	$Player/musica.stop()

func play_song():
	$Player/musica.play()
	
func game_over():
	get_tree().reload_current_scene()
	
func voltar_menu():
	mudaCena(cenas[0])