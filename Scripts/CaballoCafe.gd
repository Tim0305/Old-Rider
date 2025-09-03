extends Caballo

func _init().(150):
	pass

func _ready():
	$AnimationPlayer.play("Corriendo")

# Se ejecuta cada segundo
func _on_timer_timeout():
	energy = clamp(energy + 1, MIN_ENERGY, MAX_ENERGY)
