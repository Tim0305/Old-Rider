extends Node
class_name Carta

var energy: float
var enabled: bool
var duration: float

func _init(energy: int, duration: float):
	self.energy = energy
	self.duration = duration
	enabled = true

func setEnabled(enabled: bool):
	self.enabled = enabled
