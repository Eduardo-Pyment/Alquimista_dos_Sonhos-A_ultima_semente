extends CharacterBody2D

@onready var CayTimer = $CayTimer
@onready var PlayerRaycast = $CheckChaoRaycasts
@onready var player_sprite_2d = $PlayerSprite2D

var VelocidadeHorizontal = 250
var Gravidade: float
var VelocidadePulo: float
var PuloDisponivel: bool
var knockback_vector: Vector2 = Vector2.ZERO
var recovering: bool = false
var recovery_duration: float = 0.1

@export var TempoPuloAlturaMax: float = 0.3
@export var PuloAltura: float = 70
@export var PuloDistancia: int = 3

signal player_morreu()

func _ready():
	Globais.oxigenio = 0
	Globais.hidrogenio = 0 
	Globais.agua = 0
	Gravidade = (2 * PuloAltura / pow(TempoPuloAlturaMax, 2))
	VelocidadePulo = Gravidade * TempoPuloAlturaMax
	$CPUParticles2D.emitting = false  # Desliga as partículas iniciais

func _physics_process(delta):
	# Handle Jump.
	if is_on_floor():
		PuloDisponivel = true
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			$CPUParticles2D.emitting = true
			$CPUParticles2D.position.y = player_sprite_2d.position.y + 10
	elif PuloDisponivel && CayTimer.is_stopped():
		CayTimer.start()

	if PuloDisponivel && Input.is_action_just_pressed("ui_accept"):
		velocity.y = -VelocidadePulo
		PuloDisponivel = false
		$CPUParticles2D.emitting = true
		$CPUParticles2D.position.y = player_sprite_2d.position.y + 20
		$CPUParticles2D.position.x = player_sprite_2d.position.x / 2

	# Add gravity.
	if not is_on_floor():
		velocity.y += Gravidade * delta

	# Get the input direction and handle movement/deceleration.
	var direcao = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if direcao:
		velocity.x = lerp(velocity.x, direcao * VelocidadeHorizontal, 0.2)

		if is_on_floor():
			$CPUParticles2D.emitting = true
			$CPUParticles2D.position.y = player_sprite_2d.position.y + 10
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)

	if direcao != 0:
		player_sprite_2d.scale.x = direcao

	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector

	move_and_slide()
	animacao_player()

	if recovering:
		recovery_duration -= delta

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

	take_damage(knockback_force)

func take_damage(knockback_force := Vector2.ZERO):
	if Globais.player_life > 0 and Globais.agua != 1:
		Globais.player_life -= 1
		if knockback_force != Vector2.ZERO:
			knockback_vector = knockback_force
			player_sprite_2d.modulate = Color(1, 0, 0, 1)
			recovery_duration = 0.1
			recovering = true
	elif Globais.agua != 1:
		queue_free()
		emit_signal("player_morreu")

# Parte relacionada à água e interação
var inside = false

func _process(delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.hidrogenio >= 2 and Globais.oxigenio >= 1:
			Globais.hidrogenio -= 2
			Globais.oxigenio -= 1
			Globais.agua += 1
			print("Água =", Globais.agua)

func _on_body_entered(body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1

func _on_body_exited(body):
	inside = false
	$AnimatedSprite2D.modulate.a = 0
