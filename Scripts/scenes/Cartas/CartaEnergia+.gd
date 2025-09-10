extends Carta2D

func _init().(Global.cartaEnergiaPositiva):
	pass

func _ready():
	sprite =  $Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	# Detectar un clic
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		# Jugar unicamente si la carta esta habilitada
		if Global.cartaEnergiaPositiva.enabled:
			# Jugar la carta con el protagonista
			Global.isCartaEnergiaPositiva = true
			# Completed para saber cuando la funcion se termino de ejecutar
			yield(Global.playCartaEnergiaPositiva(Global.protagonista), "completed")
			Global.isCartaEnergiaPositiva = false
