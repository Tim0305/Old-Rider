extends Carta2D

func _init().(Global.cartaDesaceleracion):
	pass
	
func _ready():
	sprite = $Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	# Detectar un clic
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Global.cartaDesaceleracion.enabled:
			# Jugar la carta con el protagonista
			Global.isCartaDesaceleracion = true
			# Completed para saber cuando la funcion se termino de ejecutar
			yield(Global.playCartaDesaceleracion(Global.protagonista, Global.enemigo), "completed")
			Global.isCartaDesaceleracion = false
