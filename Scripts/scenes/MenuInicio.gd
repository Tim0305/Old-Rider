extends Control

func _ready():
	pass

func _on_StartButton_pressed():
	# Empezar el juego
	get_tree().change_scene("res://Escenas/Hipodromo.tscn")
