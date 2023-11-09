extends state

class_name chao_state

@export var VelocidadePulo: float = 466.666666666667
@export var ar_state : state
@export var animacao_pulo : String = "Pulo"
@onready var CayTimer = $"../../CayTimer"
@onready var particulas = $"../../CPUParticles2D"
var PuloDisponivel: bool
	# Handle Jump.
#if is_on_floor():
#	PuloDisponivel = true
#
#elif PuloDisponivel && CayTimer.is_stopped():
#	CayTimer.start()
#
#if PuloDisponivel && Input.is_action_just_pressed("ui_accept"):
#	velocity.y = -VelocidadePulo
#	PuloDisponivel = false
func state_process(delta):
	if(!Player.is_on_floor()):
		Proximo_state = ar_state
	if Player.is_on_floor():
		PuloDisponivel = true
	elif PuloDisponivel && CayTimer.is_stopped():
		CayTimer.start()
func state_input(event : InputEvent): 
	if (event.is_action_pressed("ui_accept")):
		pular()
		
func pular():
	Player.velocity.y = -VelocidadePulo
	Proximo_state = ar_state
	playback.travel("Pulo")
	PuloDisponivel = false
	particulas.emitting = true
	particulas.position.y = Player.position.y + 10	
	print("debug particulas",particulas.emitting)
	
