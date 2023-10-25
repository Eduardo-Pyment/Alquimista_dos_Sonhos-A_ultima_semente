extends CharacterBody2D

@onready var CayTimer = $CayTimer
@onready var PlayerRaycast = $CheckChaoRaycasts
@onready var player_sprite_2d = $PlayerSprite2D

var VelocidadeHorizontal = 250
var Gravidade: float
var VelocidadePulo: float
var PuloDisponivel: bool  # Variável para controlar se o pulo está disponível
var knockback_vector: Vector2 = Vector2.ZERO
var recovering: bool = false
var recovery_duration: float = 0.5  # Tempo de recuperação em segundos

@export var TempoPuloAlturaMax: float = 0.3
@export var PuloAltura: float = 70
@export var PuloDistancia: int = 3

signal player_morreu()

func _ready():
	Gravidade = (2 * PuloAltura / pow(TempoPuloAlturaMax, 2))
	VelocidadePulo = Gravidade * TempoPuloAlturaMax

func _physics_process(delta):
	# Handle Jump.
	if is_on_floor():
		PuloDisponivel = true
	elif PuloDisponivel && CayTimer.is_stopped():
		CayTimer.start()

	if PuloDisponivel && Input.is_action_just_pressed("ui_accept"):
		velocity.y = -VelocidadePulo
		PuloDisponivel = false  # Desativa o pulo após o uso

	# Add gravity.
	if not is_on_floor():
		velocity.y += Gravidade * delta

	# Get the input direction and handle movement/deceleration.
	var direcao = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if direcao:
		velocity.x = lerp(velocity.x, direcao * VelocidadeHorizontal, 0.2)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)

	if direcao != 0:
		$PlayerSprite2D.scale.x = direcao

	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector

	move_and_slide()
	animacao_player()

	if recovering:
		# Se estiver em recuperação, diminua o tempo de recuperação.
		recovery_duration -= delta

		# Quando o tempo de recuperação acabar, redefina o jogador para o estado normal.
		if recovery_duration <= 0:
			recovering = false
			knockback_vector = Vector2.ZERO
			player_sprite_2d.modulate = Color(1, 1, 1, 1)

func animacao_player():
	var animacao = "PlayerOcioso"
	if velocity.y < 0:
		animacao = "PlayerPulo"
	elif abs(velocity.x) > 100:
		animacao = "PlayerCorrer"

	if $AnimationPlayer.assigned_animation != animacao:
		$AnimationPlayer.play(animacao)

func _on_hurtbox_body_entered(body):
	var knockback_force = Vector2.ZERO
	if $Raydireita.is_colliding():
		knockback_force = Vector2(-200, -200)
	elif $Rayesquerda.is_colliding():
		knockback_force = Vector2(200, -200)

func take_damage(knockback_force := Vector2.ZERO):
	if Globais.player_life > 0 and Globais.agua != 1:
		Globais.player_life -= 1
		if knockback_force != Vector2.ZERO:
			knockback_vector = knockback_force
			player_sprite_2d.modulate = Color(1, 0, 0, 1)

			# Inicie o tempo de recuperação.
			recovery_duration = 0.1  # Defina a duração de recuperação desejada.
			recovering = true
	elif Globais.agua != 1:
		queue_free()  # Apenas chame queue_free se Globais.agua não for igual a 1
		emit_signal("player_morreu")
		

