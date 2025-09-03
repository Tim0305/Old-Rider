extends Node2D

const MIN_VALUE = 0
const MAX_VALUE = 10
var textureProgress: TextureProgress

func _ready():
	pass
	
func setTextureProgress(textureProgress: TextureProgress):
	self.textureProgress = textureProgress
	
func setEstamina(value: float):
	if textureProgress:
		textureProgress.value = clamp(value, MIN_VALUE, MAX_VALUE)
