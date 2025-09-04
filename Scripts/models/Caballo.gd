extends Node
class_name Caballo

const SPEED = 200
const MIN_ENERGY = 0
const MAX_ENERGY = 10

var currentSpeed = SPEED
var energy: int = 0
var FIXED_Y: float
var position = Vector2()

func _init(FIXED_Y := 0):
	self.FIXED_Y = FIXED_Y
	position.x = 0
	position.y = FIXED_Y

func setEnergy(energy: int):
	self.energy = clamp(energy, MIN_ENERGY, MAX_ENERGY)
