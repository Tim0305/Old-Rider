extends Node

const DELTA_BASICA_ENERGIA = 1 # 100%
const DELTA_INCREMENTO_ENERGIA = 1.5 # 150%
const DELTA_DECREMENTO_ENERGIA = -1.5 # -150%
const DELTA_INCREMENTO_VELOCIDAD = 1.25 # 125% 
const DELTA_DECREMENTO_VELOCIDAD = 0.75 # 75%

# Jugadores
var protagonista: Caballo = Caballo.new(190)
var enemigo: Caballo = Caballo.new(150)
var mensajeGanador: String = ""

# Cartas
var cartaAceleracion: Carta = Carta.new(5, 3)
var cartaDesaceleracion: Carta = Carta.new(5, 3)
var cartaEnergiaPositiva: Carta = Carta.new(2, 3)
var cartaEnergiaNegativa: Carta = Carta.new(2, 3)

# Banderas para saber cuando una carta esta siendo utilizada
var isCartaAceleracion: bool = false
var isCartaDesaceleracion: bool = false
var isCartaEnergiaPositiva: bool = false
var isCartaEnergiaNegativa: bool = false

# Sonido de fondo
var sonido

# Funciones

func resetGame():
	# Jugadores
	protagonista = Caballo.new(190)
	enemigo = Caballo.new(150)
	mensajeGanador = ""

	# Cartas
	cartaAceleracion = Carta.new(5, 3)
	cartaDesaceleracion = Carta.new(5, 3)
	cartaEnergiaPositiva = Carta.new(2, 3)
	cartaEnergiaNegativa = Carta.new(2, 3)

	# Banderas para saber cuando una carta esta siendo utilizada
	isCartaAceleracion = false
	isCartaDesaceleracion = false
	isCartaEnergiaPositiva = false
	isCartaEnergiaNegativa = false
	
func playCartaAceleracion(jugador: Caballo):
	# Verificar si el jugador tiene energia suficiente
	if jugador.energy >= cartaAceleracion.energy:
		# Activar la animacion de powerup
		jugador.currentStatus = jugador.STATUS.BUFF
		# Restar la energia
		jugador.energy -= cartaAceleracion.energy
		# Aumentar la velocidad a un 125% por tres segundos
		jugador.currentSpeed = jugador.SPEED * DELTA_INCREMENTO_VELOCIDAD
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaAceleracion.duration), "timeout")
		# Reiniciar la velocidad
		jugador.currentSpeed = jugador.SPEED
		# Desactivar la animacion de powerup
		jugador.currentStatus = jugador.STATUS.NORMAL
	else:
		# si no tiene energía, devolvemos un timer vacío para no enviar un null
		return yield(wait(0), "timeout")

func playCartaDesaceleracion(jugador: Caballo, enemigo: Caballo):
	# Verificar si el jugador tiene energia suficiente
	if jugador.energy >= cartaDesaceleracion.energy:
		enemigo.currentStatus = enemigo.STATUS.DEBUFF
		# Restar la energia
		jugador.energy -= cartaDesaceleracion.energy
		# Disminuir la velocidad del enemigo a un 75% por tres segundos
		enemigo.currentSpeed = enemigo.SPEED * DELTA_DECREMENTO_VELOCIDAD
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaAceleracion.duration), "timeout")
		# Reiniciar la velocidad
		enemigo.currentSpeed = enemigo.SPEED
		# Desactivar la animacion de powerup
		enemigo.currentStatus = enemigo.STATUS.NORMAL
	else:
		# si no tiene energía, devolvemos un timer vacío para no enviar un null
		return yield(wait(0), "timeout")

func playCartaEnergiaPositiva(jugador: Caballo):
	# Verificar si el jugador tiene energia suficiente
	if jugador.energy >= cartaEnergiaPositiva.energy:
		jugador.currentStatus = jugador.STATUS.BUFF
		# Restar la energia
		jugador.energy -= cartaEnergiaPositiva.energy
		# Aumentar la energia del jugador mas rapido
		jugador.deltaEnergy = DELTA_INCREMENTO_ENERGIA
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaEnergiaPositiva.duration), "timeout")
		# Reiniciar el delta
		jugador.deltaEnergy = DELTA_BASICA_ENERGIA
		jugador.currentStatus = jugador.STATUS.NORMAL
	else:
		# si no tiene energía, devolvemos un timer vacío para no enviar un null
		return yield(wait(0), "timeout")
		
func playCartaEnergiaNegativa(jugador: Caballo, enemigo: Caballo):
	# Verificar si el jugador tiene energia suficiente
	if jugador.energy >= cartaEnergiaNegativa.energy:
		enemigo.currentStatus = enemigo.STATUS.DEBUFF
		# Restar la energia
		jugador.energy -= cartaEnergiaNegativa.energy
		# Quitar energia del enemigo 
		enemigo.deltaEnergy = DELTA_DECREMENTO_ENERGIA
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaEnergiaNegativa.duration), "timeout")
		# Reiniciar el delta
		enemigo.deltaEnergy = DELTA_BASICA_ENERGIA
		enemigo.currentStatus = enemigo.STATUS.NORMAL
	else:
		# si no tiene energía, devolvemos un timer vacío para no enviar un null
		return yield(wait(0), "timeout")

func _process(delta):
	# Deshabilitar y Habilitar las cartas disponibles del protagonista
	# Si no se uso y hay suficiente energia, habilitarla
	# Carta Aceleracion
	if protagonista.energy >= cartaAceleracion.energy and not isCartaAceleracion:
		cartaAceleracion.setEnabled(true)
	else:
		cartaAceleracion.setEnabled(false)
	
	# Carta Desaceleracion
	if protagonista.energy >= cartaDesaceleracion.energy and not isCartaDesaceleracion:
		cartaDesaceleracion.setEnabled(true)
	else:
		cartaDesaceleracion.setEnabled(false)
		
	# Carta Energia Positiva
	if protagonista.energy >= cartaEnergiaPositiva.energy and not isCartaEnergiaPositiva:
		cartaEnergiaPositiva.setEnabled(true)
	else:
		cartaEnergiaPositiva.setEnabled(false)
		
	# Carta Energia Negativa
	if protagonista.energy >= cartaEnergiaNegativa.energy and not isCartaEnergiaNegativa:
		cartaEnergiaNegativa.setEnabled(true)
	else:
		cartaEnergiaNegativa.setEnabled(false)
		

# Timer
func wait(seconds: float):
	# Crear un timer
	return get_tree().create_timer(seconds) 
