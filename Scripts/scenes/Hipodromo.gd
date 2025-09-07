extends Node2D

onready var sonidoFondo = $SonidoFondo

func _ready():
	OS.center_window()
	Hipodromo.sonidoFondo = sonidoFondo
