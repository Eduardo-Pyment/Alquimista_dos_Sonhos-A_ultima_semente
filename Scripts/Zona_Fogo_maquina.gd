extends Area2D
@onready var cpu_particles_2d = $"../CPUParticles2D"

func _ready():
	$"/root/Level1/LevelProps/Maquina_agua".gerar_agua.connect(apagar_fogo)

func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
		
func apagar_fogo():
	if Globais.agua >= 1:
		print(Globais.agua)
		cpu_particles_2d.emitting = true
		queue_free()
		Globais.agua = 0
