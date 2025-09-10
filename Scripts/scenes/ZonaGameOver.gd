extends Area2D

var ganadores: Array = []
onready var camaraProtagonista: Camera2D = get_parent().get_node("CaballoBlanco/Camera2D")

func _ready():
	pass

# Cada ciclo con tiempo de ejecucion constante
func _physics_process(delta):
	if ganadores.size() > 0:
		# Detener el sonido de fondo
		Hipodromo.sonidoFondo.stop()
		if ganadores.size() == 2:
			# Desactivar la camara del prota
			#desactivarMovimientoAutomaticoCamara(camaraProtagonista)
			Global.mensajeGanador = "Empate"
		elif ganadores[0] == "CaballoBlanco":
			# Desactivar la camara del prota
			#desactivarMovimientoAutomaticoCamara(camaraProtagonista)	
			Global.mensajeGanador = "!Ganaste!"
		elif ganadores[0] == "CaballoCafe":
			Global.mensajeGanador = "Perdiste :("	

		# Ir a la pantalla MenuGanador
		get_tree().change_scene("res://Escenas/MenuGanador.tscn")

func desactivarMovimientoAutomaticoCamara(camara: Camera2D):
	camara.current = false

func _on_ZonaGameOver_body_entered(body):
	# Cada vez que un caballo termine se agrega a la lista
	ganadores.append(body.get_name())
