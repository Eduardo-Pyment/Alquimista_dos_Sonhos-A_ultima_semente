extends Area2D
@export var gpu_particles_2d: GPUParticles2D
@export var gpu_particles_2d2: GPUParticles2D

func _ready():
	$"/root/fase-3/maquina_base".gerar_base.connect(neutralizar_base)

func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
		
func neutralizar_base():
	if Globais.base >= 1:
		print(Globais.base)
		await get_tree().create_timer(5.0).timeout
		$"/root/fase-3/acido_maquina/CollisionShape2D".queue_free()
		get_node("AnimatedSprite2D").play("aguinha")
		get_node("AnimatedSprite2D5").play("aguinha")
		get_node("AnimatedSprite2D2").play("aguinha")
		get_node("AnimatedSprite2D3").play("aguinha")
		get_node("AnimatedSprite2D4").play("aguinha")
		get_node("AnimatedSprite2D6").play("aguinha")
		get_node("AnimatedSprite2D7").play("aguinha")
		get_node("AnimatedSprite2D8").play("aguinha")
		get_node("AnimatedSprite2D9").play("aguinha")
		get_node("AnimatedSprite2D10").play("aguinha")
		get_node("AnimatedSprite2D11").play("aguinha")
		get_node("AnimatedSprite2D12").play("aguinha")
		get_node("AnimatedSprite2D13").play("aguinha")
		get_node("AnimatedSprite2D14").play("aguinha")
		get_node("AnimatedSprite2D15").play("aguinha")
		get_node("AnimatedSprite2D16").play("aguinha")
		get_node("AnimatedSprite2D17").play("aguinha")
		get_node("AnimatedSprite2D18").play("aguinha")
		gpu_particles_2d.queue_free()
		gpu_particles_2d2.queue_free()
		
