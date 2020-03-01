extends Node2D

var cenas = [
	"res://scenes/Menu.tscn", 
	"res://scenes/Loading_1.tscn",
	"res://scenes/Fase_1.tscn",
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