extends state

class_name chao_state

@export var VelocidadePulo: float = 466.666666666667
@export var ar_state : state
@export var animacao_pulo : String = "Pulo"
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

func state_input(event : InputEvent): 
	if (event.is_action_pressed("ui_accept")):
		pular()
func pular():
	Player.velocity.y = -VelocidadePulo
	Proximo_state = ar_state
	playback.travel("Pulo")

