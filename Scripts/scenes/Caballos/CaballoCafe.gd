extends Caballo2D

func _init().(Global.enemigo):
	pass
	
func _ready():
	# Inicializar la semilla del random
	randomize()
	$AnimationPlayer.play("Corriendo")
	startEnemyGame()

func startEnemyGame():
	# Crear la jugada del enemigo
	while(true):
		# Obtener un numero random
		var opcion = randi() % 4 # 0 -> 3
		
		if opcion == 0:
			# Carta aceleracion
			yield(Global.playCartaAceleracion(Global.enemigo), "completed")
		elif opcion == 1:
			# Carta desaceleracion
			yield(Global.playCartaDesaceleracion(Global.enemigo, Global.protagonista), "completed")
		elif opcion == 2:
			# Carta energia +
			yield(Global.playCartaEnergiaPositiva(Global.enemigo), "completed")
		elif opcion == 4:
			# Carta energia -
			yield(Global.playCartaEnergiaNegativa(Global.enemigo, Global.protagonista), "completed")
