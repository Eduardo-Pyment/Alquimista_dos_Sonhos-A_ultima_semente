extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var gpu_particles_2d = $GPUParticles2D

func _on_body_entered(body):
	if Globais.agua >= 1:
		$" ../GPUParticles2D".emitting = true
		queue_free()
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
