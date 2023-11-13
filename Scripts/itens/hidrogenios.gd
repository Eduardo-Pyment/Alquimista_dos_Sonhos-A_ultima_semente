extends Area2D

var hidro :=1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
		
func _on_body_entered(_body):
	$animation.play("collected")
	#remover a colisão dupla // espera a colisão acabar para computar a coleta
	Globais.hidrogenio += hidro
	print(Globais.hidrogenio)
	call_deferred("spawn_atomo")
	$collision.call_deferred("queue_free") 
	
func spawn_atomo():
	var hidrogenio_flutuante = load("res://Scenes/Itens/H_flutuante.tscn")
	var novo_atomo = hidrogenio_flutuante.instantiate()
	get_node("/root/Level1/Hidrogenio2").add_child(novo_atomo)	
		
func _on_animated_sprite_2d_animation_finished():
	pass
	
