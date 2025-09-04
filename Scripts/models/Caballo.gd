extends Node
class_name Caballo

const SPEED = 200
const MIN_ENERGY = 0
const MAX_ENERGY = 10

# Delta de incrementacion de la energia
var deltaEnergy: float
var currentSpeed: float
var energy: float
var FIXED_Y: float
var position: Vector2

func _init(FIXED_Y := 0):
	self.FIXED_Y = FIXED_Y
	deltaEnergy = 1
	currentSpeed = SPEED
	energy = 0
	position = Vector2(0, FIXED_Y)

func incrementEnergy():
	energy = clamp(energy + deltaEnergy, MIN_ENERGY, MAX_ENERGY)
