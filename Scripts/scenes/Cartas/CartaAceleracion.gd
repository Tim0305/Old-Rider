extends Carta2D

func _init().(Global.cartaAceleracion):
	pass
	
func _ready():
	sprite = $Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	# Detectar un clic
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Global.cartaAceleracion.enabled:
			# Jugar la carta con el protagonista
			Global.isCartaAceleracion = true
			# Completed para saber cuando la funcion se termino de ejecutar
			yield(Global.playCartaAceleracion(Global.protagonista), "completed")
			Global.isCartaAceleracion = false
