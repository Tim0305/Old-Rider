extends KinematicBody2D

const SPEED = -120
# Cambiar para determinar el valor inicial en x
const INITIAL_X = 250

func _ready():
	# El caballo blanco alcanza al caballo cafe moviendo hacia la izquierda el caballo cafe
	# Posicion inical en 600 y debe llegar a INITIAL_X
	position.x = 600

func _process(delta):
	# Animar el inicio de la carrera
	$AnimationPlayer.play("Corriendo")
	if (position.x >= INITIAL_X):
		position.x += SPEED * delta
