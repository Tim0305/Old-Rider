extends Carta2D

func _init().(Global.cartaEnergiaNegativa):
	pass

func _ready():
	sprite =  $Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	# Detectar un clic
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Global.cartaEnergiaNegativa.enabled:
			# Jugar la carta con el protagonista
			Global.isCartaEnergiaNegativa = true
			# Completed para saber cuando la funcion se termino de ejecutar
			yield(Global.playCartaEnergiaNegativa(Global.protagonista, Global.enemigo), "completed")
			Global.isCartaEnergiaNegativa = false
