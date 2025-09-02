extends KinematicBody2D

func _ready():
	pass

func _process(delta):
	$AnimationPlayer.play("Corriendo")
