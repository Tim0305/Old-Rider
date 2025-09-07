extends Caballo2D

func _init().(Global.protagonista):
	pass

func _ready():
	playerAnimation.play("Corriendo")
	
func _physics_process(delta):
	# Reproducir el sonido de fondo
	if not Hipodromo.sonidoFondo.is_playing():
		Hipodromo.sonidoFondo.play()
