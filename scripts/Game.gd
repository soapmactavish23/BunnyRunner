extends Node2D

var cenas = [
	"res://scenes/Menu.tscn", 
	"res://scenes/Loading_1.tscn",
	"res://scenes/Fase_1.tscn"
]

var moeda

func _ready():
	add_to_group("scenes")
	moeda = 0

func mudaCena(cena):
	get_tree().change_scene(cena)

func add_moeda():
	moeda += 1
	print(moeda)
	
func stop_song():
	$musica.stop()