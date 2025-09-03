extends Area2D
class_name Card

const OPACITY_HOVER = 0.5
const OPACITY_NORMAL = 1
var energy: int
var sprite: Sprite

func _init(energy:= 0, sprite:= null):
	self.energy = energy
	self.sprite = sprite

func _ready():
	pass
	
func _on_Area2D_mouse_entered():
	# Cambiar la opacidad
	sprite.modulate.a = OPACITY_HOVER

func _on_Area2D_mouse_exited():
	# Reiniciar la opacidad
	sprite.modulate.a = OPACITY_NORMAL
	
func setEnabled(enabled: bool):
	if sprite:	
		if enabled:
			sprite.modulate.a = 1
		else:
			sprite.modulate.a = 0.5
