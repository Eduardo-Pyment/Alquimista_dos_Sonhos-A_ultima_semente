extends Area2D

var cl := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
	$"/root/fase-3".spawnar_cl.connect(spawnar_cl)
	$"/root/fase-3".destroy_cl.connect(destroy_cl)
		
func _on_body_entered(_body):
	if _body.name == "Player":
		$animation.play("collected")
		#remover a colisão dupla // espera a colisão acabar para computar a coleta
		Globais.cloro += cl
		print(Globais.cloro)
		
		if Globais.cloro >= 2 and Globais.current_checkpoint != null:
			spawn_atomo2()
			await $collision.call_deferred("queue_free") 
		else:
			spawn_atomo()
			await $collision.call_deferred("queue_free") 
	
func spawn_atomo():
	var sodio_flutuante = load("res://Scenes/Itens/Cl_flutuante.tscn")
	var novo_atomo = sodio_flutuante.instantiate()
	get_node("/root/fase-3/cloro").add_child(novo_atomo)	

func spawn_atomo2():
	var sodio_flutuante = load("res://Scenes/Itens/Cl_flutuante.tscn")
	var novo_atomo = sodio_flutuante.instantiate()
	get_node("/root/fase-3/Checkpoint/cloro").add_child(novo_atomo)	

func spawnar_cl(): 
	print("spawnou cl")
	var cloro = load("res://Scenes/Itens/cloro.tscn")
	var cloro2 = cloro.instantiate()
	add_child(cloro2)

func _on_animated_sprite_2d_animation_finished():
	pass

func destroy_cl():
	print("destorido cloro")
	queue_free()
	
