extends Node

const DELTA_BASICA_ENERGIA = 1 # 100%
const DELTA_INCREMENTO_ENERGIA = 1.5 # 150%
const DELTA_DECREMENTO_ENERGIA = -1.5 # -150%
const DELTA_INCREMENTO_VELOCIDAD = 1.25 # 125% 
const DELTA_DECREMENTO_VELOCIDAD = 0.75 # 75%

# Jugadores
var protagonista: Caballo = Caballo.new(190)
var enemigo: Caballo = Caballo.new(150)

# Cartas
var cartaAceleracion: Carta = Carta.new(5, 3)
var cartaDesaceleracion: Carta = Carta.new(5, 3)
var cartaEnergiaPositiva: Carta = Carta.new(2, 3)
var cartaEnergiaNegativa: Carta = Carta.new(2, 3)

# Funciones
func playCartaAceleracion(jugador: Caballo):
	# Verificar si el jugador tiene la energia suficiente
	if (jugador.energy >= cartaAceleracion.energy):
		# Restar la energia
		jugador.energy -= cartaAceleracion.energy
		# Aumentar la velocidad a un 125% por tres segundos
		jugador.currentSpeed = jugador.SPEED * DELTA_INCREMENTO_VELOCIDAD
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaAceleracion.duration), "timeout")
		# Reiniciar la velocidad
		jugador.currentSpeed = jugador.SPEED

func playCartaDesaceleracion(jugador: Caballo, enemigo: Caballo):
	# Verificar si el jugador tiene la energia suficiente
	if (jugador.energy >= cartaDesaceleracion.energy):
		# Restar la energia
		jugador.energy -= cartaDesaceleracion.energy
		# Disminuir la velocidad del enemigo a un 75% por tres segundos
		enemigo.currentSpeed = enemigo.SPEED * DELTA_DECREMENTO_VELOCIDAD
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaAceleracion.duration), "timeout")
		# Reiniciar la velocidad
		enemigo.currentSpeed = enemigo.SPEED

func playCartaEnergiaPositiva(jugador: Caballo):
	# Verificar si el jugador tiene la energia suficiente
	if (jugador.energy >= cartaEnergiaPositiva.energy):
		# Restar la energia
		jugador.energy -= cartaEnergiaPositiva.energy
		# Aumentar la energia del jugador mas rapido
		jugador.deltaEnergy = DELTA_INCREMENTO_ENERGIA
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaEnergiaPositiva.duration), "timeout")
		# Reiniciar el delta
		jugador.deltaEnergy = DELTA_BASICA_ENERGIA
		
func playCartaEnergiaNegativa(jugador: Caballo, enemigo: Caballo):
	# Verificar si el jugador tiene la energia suficiente
	if (jugador.energy >= cartaEnergiaNegativa.energy):
		# Restar la energia
		jugador.energy -= cartaEnergiaNegativa.energy
		# Quitar energia del enemigo 
		enemigo.deltaEnergy = DELTA_DECREMENTO_VELOCIDAD
		# Esperar a que el timer termine con el signal timeout
		yield(wait(cartaEnergiaNegativa.duration), "timeout")
		# Reiniciar el delta
		enemigo.deltaEnergy = DELTA_BASICA_ENERGIA
		
# Timer
func wait(seconds: float):
	# Crear un timer
	return get_tree().create_timer(seconds) 
