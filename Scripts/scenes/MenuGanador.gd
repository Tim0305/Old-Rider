extends Control

func _ready():
	$Label.text = Global.mensajeGanador

func _on_StartButton_pressed():
	# Reiniciar el valor de las variables globales
	Global.resetGame()
	# Iniciar otra vez el juego
	get_tree().change_scene("res://Escenas/Hipodromo.tscn")

func _on_QuitButton_pressed():
	# Salir del juego
	get_tree().quit()
