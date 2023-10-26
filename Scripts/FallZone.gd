extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var gpu_particles_2d = $GPUParticles2D
@onready var vapor = $"../Vapor"

# Called when the node enters the scene tree for the first time.
func _ready():
	vapor.emitting = false


func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
	if Globais.agua >= 1:
		await queue_free()
		particulas()
		
func particulas():
	vapor.emitting = true
