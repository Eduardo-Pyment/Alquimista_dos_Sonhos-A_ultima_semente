extends Area2D

@onready var gpu_particles_2d = $GPUParticles2D

func _ready():
	$"/root/Fase_2/maquina_solida".gerar_solido.connect(solidificador)

func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
		
func solidificador():
	if Globais.solido >= 1:
		print(Globais.solido)
		gpu_particles_2d.emitting = true
		await get_tree().create_timer(5.0).timeout
		$"/root/Fase_2/Zona_mercurio_maquina/CollisionShape2D".queue_free()
		get_node("AnimatedSprite2D").stop()
		get_node("AnimatedSprite2D5").stop()
		get_node("AnimatedSprite2D2").stop()
		get_node("AnimatedSprite2D3").stop()
		get_node("AnimatedSprite2D4").stop()
		get_node("AnimatedSprite2D6").stop()
		get_node("AnimatedSprite2D7").stop()
		get_node("AnimatedSprite2D8").stop()
		get_node("AnimatedSprite2D9").stop()
		get_node("AnimatedSprite2D10").stop()
		get_node("AnimatedSprite2D11").stop()
		
		
