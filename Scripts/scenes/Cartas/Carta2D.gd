extends Area2D
class_name Carta2D

const OPACITY_DISABLED = 0.5
const OPACITY_ENABLED = 1
const OPACITY_HOVER = 0.8

var carta: Carta
var sprite: Sprite
var isMouseEntered: bool

func _init(carta: Carta, sprite:= null):
	self.carta = carta
	self.sprite = sprite
	isMouseEntered = false

func _ready():
	pass

func _process(delta):
	if carta.enabled:
		if not isMouseEntered:
			sprite.modulate.a = OPACITY_ENABLED
	else:
		sprite.modulate.a = OPACITY_DISABLED
	
func _on_Area2D_mouse_entered():
	isMouseEntered = true
	if carta.enabled:
		# Cambiar la opacidad
		sprite.modulate.a = OPACITY_HOVER

func _on_Area2D_mouse_exited():
	isMouseEntered = false
	if carta.enabled:
		# Cambiar la opacidad
		sprite.modulate.a = OPACITY_ENABLED
