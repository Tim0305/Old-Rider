extends Node2D

onready var BarraEstamina = $TextureProgress

const MIN_VALUE = 0
const MAX_VALUE = 10

func _ready():
	BarraEstamina.min_value = MIN_VALUE
	BarraEstamina.max_value = MAX_VALUE
	BarraEstamina.value = 0
	
func setEstamina(value: float):
	BarraEstamina.value = clamp(value, MIN_VALUE, MAX_VALUE)

