extends KinematicBody2D

const SPEED = 200
var currentSpeed = SPEED
const FIXED_Y = 150

func _ready():
	position.x = 0
	position.y = FIXED_Y
	$AnimationPlayer.play("Corriendo")

func _physics_process(delta):
	position.x += currentSpeed * delta

func setSpeed(percent: float):
	currentSpeed = SPEED * percent


