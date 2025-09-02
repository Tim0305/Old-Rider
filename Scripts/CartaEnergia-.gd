extends Area2D

onready var sprite = $Sprite

func _ready():
	pass

func _on_Area2D_mouse_entered():
	# Cambiar la opacidad
	sprite.modulate.a = 0.8


func _on_Area2D_mouse_exited():
	# Reiniciar la opacidad
	sprite.modulate.a = 1
