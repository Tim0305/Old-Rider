extends Node2D

func _ready():
	# Inicializar la barra de estamina con la escena del arbol (manualmente)
	BarraEstamina.setTextureProgress($CanvasLayer/BarraEstamina/Estamina)
	
	# Inicializar las cartas
	# CardManager.addCard($CanvasLayer/CartaAceleracion)
