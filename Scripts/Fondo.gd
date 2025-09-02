extends Sprite

const SCREEN_WIDTH = 600
const SPEED = -120

func _ready():
	pass # Replace with function body.

# Scroll infinito
func _process(delta):
	position += Vector2(SPEED * delta, 0)
	# Validar el limite de la pantalla
	if position.x <= 0:
		position.x += SCREEN_WIDTH
