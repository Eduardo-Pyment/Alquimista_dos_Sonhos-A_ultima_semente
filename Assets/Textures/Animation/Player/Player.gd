extends CharacterBody2D

@onready var CayTimer = $CayTimer
@onready var PlayerRaycast = $CheckChaoRaycasts

var VelocidadeHorizontal = 250
var Gravidade:float
var VelocidadePulo:float
var PuloDisponivel:bool

@export var TempoPuloAlturaMax:float = .3
@export var PuloAltura:float = 70
@export var PuloDistancia:int = 3



func _ready():
	Gravidade = (2 * PuloAltura/pow(TempoPuloAlturaMax,2))
	VelocidadePulo = Gravidade * TempoPuloAlturaMax
func _physics_process(delta):
	# Handle Jump.
	# Controla os pulos.
	if is_on_floor():
		PuloDisponivel = true
	elif PuloDisponivel == true && CayTimer.is_stopped():
		CayTimer.start()
	if PuloDisponivel == true && Input.is_action_just_pressed("ui_accept"):
		velocity.y = -VelocidadePulo
		
	# Add the gravity.
	# Implementa a gravidade.
	if not is_on_floor():
		velocity.y += Gravidade * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direcao = Input.get_axis("ui_left", "ui_right")
	if direcao:
		velocity.x = lerp(velocity.x, direcao * VelocidadeHorizontal, 0.2)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)
	
	if direcao != 0:
		$PlayerSprite2D.scale.x = direcao
	move_and_slide()		
	animacao_player()
	
func animacao_player():
	var animacao = "PlayerOcioso"
	if velocity.y < 0:
		animacao = "PlayerPulo"
	elif velocity.x > 100 || velocity.x < -100:
		animacao = "PlayerCorrer"
	
	if $AnimationPlayer.assigned_animation != animacao:
		$AnimationPlayer.play(animacao)
		

func _on_timer_timeout():
	PuloDisponivel = false
