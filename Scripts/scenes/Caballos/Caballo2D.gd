extends KinematicBody2D
class_name Caballo2D

onready var playerAnimation = $AnimationPlayer
onready var buff = $Buff
onready var debuff = $Debuff

var jugador: Caballo
var timer: Timer

func _init(jugador: Caballo):
	# Asignar el jugador (prota o enemigo)
	self.jugador = jugador

func _ready():
	# Empezar en -150 (efecto de inicio de carrera) en X
	# y Y en FIXED_Y
	jugador.position.x = -150
	position.x = -150
	position.y = jugador.FIXED_Y

	# Creamos y configuramos el Timer
	timer = Timer.new()
	timer.wait_time = 1          # cada 1 segundo
	timer.one_shot = false        # se repite
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")  # conectar señal
	
func _physics_process(delta):
	# Movimiento horizontal
	jugador.position.x += jugador.currentSpeed * delta
	position.x = jugador.position.x
	
	# Animar los powerups
	if jugador.currentStatus == jugador.STATUS.NORMAL:
		buff.visible = false
		buff.get_node("AnimationPlayer").stop()
		
		debuff.visible = false
		debuff.get_node("AnimationPlayer").stop()
	elif jugador.currentStatus == jugador.STATUS.BUFF:
		buff.visible = true
		buff.get_node("AnimationPlayer").play("Buff")
		
		debuff.visible = false
		debuff.get_node("AnimationPlayer").stop()
	elif jugador.currentStatus == jugador.STATUS.DEBUFF:
		buff.visible = false
		buff.get_node("AnimationPlayer").stop()
		
		debuff.visible = true
		debuff.get_node("AnimationPlayer").play("Debuff")

# Se ejecuta cada segundo
func _on_timer_timeout():
	# Subir la estamina cada segundo
	jugador.incrementEnergy()
