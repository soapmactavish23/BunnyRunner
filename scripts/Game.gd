extends Node2D

var cenas = [
	"res://scenes/Menu.tscn", 
	"res://scenes/Loading_1.tscn"
]

func mudaCena(cena):
	get_tree().change_scene(cena)

func _ready():
	pass
