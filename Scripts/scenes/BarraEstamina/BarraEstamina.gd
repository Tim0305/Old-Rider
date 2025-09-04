extends Node2D

onready var textureProgress = $TextureProgress

func _ready():
	textureProgress.min_value = Global.protagonista.MIN_ENERGY
	textureProgress.max_value = Global.protagonista.MAX_ENERGY
	textureProgress.value = Global.protagonista.energy
	pass

# Actualizar el nivel de estamina con la energia del protagonista	
func _process(delta):
	if textureProgress:
		textureProgress.value = Global.protagonista.energy

	
