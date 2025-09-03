extends KinematicBody2D
class_name Caballo

const SPEED = 200
const MIN_ENERGY = 0
const MAX_ENERGY = 10

var currentSpeed = SPEED
var energy: int
var FIXED_Y: float
var timer: Timer

func _init(FIXED_Y := 0):
	self.FIXED_Y = FIXED_Y
	energy = 0

func _ready():
	position.x = 0
	position.y = FIXED_Y

	# Creamos y configuramos el Timer
	timer = Timer.new()
	timer.wait_time = 1          # cada 1 segundo
	timer.one_shot = false        # se repite
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")  # conectar señal

func _physics_process(delta):
	# Movimiento horizontal
	position.x += currentSpeed * delta

func setSpeed(percent: float):
	currentSpeed = SPEED * percent

