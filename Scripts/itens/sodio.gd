extends Area2D

var sod := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
	$"/root/fase-3".spawnar_na.connect(spawnar_na)
	$"/root/fase-3".destroy_na.connect(destroy_na)
		
func _on_body_entered(_body):
	if _body.name == "Player":
		$animation.play("collected")
		#remover a colisão dupla // espera a colisão acabar para computar a coleta
		Globais.sodio += sod
		print(Globais.sodio)
		
		if Globais.sodio >= 2 and Globais.current_checkpoint != null:
			spawn_atomo2()
			await $collision.call_deferred("queue_free") 
		else:
			spawn_atomo()
			await $collision.call_deferred("queue_free") 
	
func spawn_atomo():
	var sodio_flutuante = load("res://Scenes/Itens/Na_flutuante.tscn")
	var novo_atomo = sodio_flutuante.instantiate()
	get_node("/root/fase-3/sodio").add_child(novo_atomo)	

func spawn_atomo2():
	var sodio_flutuante = load("res://Scenes/Itens/Na_flutuante.tscn")
	var novo_atomo = sodio_flutuante.instantiate()
	get_node("/root/fase-3/Checkpoint/sodio").add_child(novo_atomo)	
	
func spawnar_na(): 
	print("spawnou NA")
	var sodio = load("res://Scenes/Itens/sodio.tscn")
	var sodio2 = sodio.instantiate()
	add_child(sodio2)
		
func _on_animated_sprite_2d_animation_finished():
	pass

func destroy_na():
	print("destroido")
	queue_free()
