extends state

class_name air_state

@export var pouso_state : state
@export var animacao_pousando : String = "Pouso"

func state_process(delta):
	if(Player.is_on_floor()):
		Proximo_state = pouso_state

func on_exit():
	if (Proximo_state == pouso_state):
		playback.travel(animacao_pousando)
