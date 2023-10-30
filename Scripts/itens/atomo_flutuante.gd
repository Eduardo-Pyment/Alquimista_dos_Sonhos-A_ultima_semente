extends CharacterBody2D

@export var VelocidadeMovimeto: float = 200.0
@export var AlvoMovimento: Node2D
@export var AgenteNavegacao: NavigationAgent2D

func _ready():
	AgenteNavegacao.path_desired_distance = 4.0
	AgenteNavegacao.target_desired_distance = 4.0
	call_deferred("actor_setup")
	
func actor_setup():
	await get_tree().physics_frame
	set_alvo_movimento(AlvoMovimento.position)
	
func set_alvo_movimento(PontoAlvo: Vector2):
	AgenteNavegacao.target_position = PontoAlvo

func _physics_process(delta):
	if AgenteNavegacao.is_navigation_finished():
		return
	var PosicaoAgenteAtual: Vector2 = global_position
	var ProximaPosicaoCaminho: Vector2 = AgenteNavegacao.get_next_path_position()
	var NovaVelocidade: Vector2 = ProximaPosicaoCaminho - PosicaoAgenteAtual
	NovaVelocidade = NovaVelocidade.normalized()
	NovaVelocidade = NovaVelocidade * VelocidadeMovimeto
	velocity = NovaVelocidade
	move_and_slide()
