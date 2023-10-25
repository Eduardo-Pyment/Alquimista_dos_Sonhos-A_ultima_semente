extends Area2D

var hidro :=1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$animation.play("collected")
	#remover a colisão dupla // espera a colisão acabar para computar a coleta
	await $collision.call_deferred("queue_free") 
	Globais.hidrogenio += hidro
	print(Globais.hidrogenio)
func _on_animated_sprite_2d_animation_finished():
	queue_free()


func _on_body_exited(body):
	pass # Replace with function body.
