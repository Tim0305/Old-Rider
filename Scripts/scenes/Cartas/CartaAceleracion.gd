extends Carta2D

func _init().(Global.cartaAceleracion):
	pass
	
func _ready():
	sprite = $Sprite

func _on_Area2D_input_event(viewport, event, shape_idx):
	# Detectar un clic
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		# Jugar la carta con el protagonista
		print("Aqui")
		Global.playCartaAceleracion(Global.protagonista)
		print("Aca")
