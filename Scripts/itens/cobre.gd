extends Area2D

var copper := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
	$"/root/Fase_2".spawnar_cu.connect(spawnar_cu)
	$"/root/Fase_2".destroy_cu.connect(destroy_cu)

func _on_body_entered(_body):
	if _body.name == "Player":
		$animation.play("collected")
		#remover a colisão dupla // espera a colisão acabar para computar a coleta
		Globais.cobre += copper
		print(Globais.cobre)
	
		if Globais.cobre > 1 and Globais.current_checkpoint != null:
			call_deferred("spawn_atomo2")
			$collision.call_deferred("queue_free") 
		else:
			call_deferred("spawn_atomo")
			$collision.call_deferred("queue_free") 

func spawn_atomo():
	var cobre_flutuante = load("res://Scenes/Itens/Cu_flutuante.tscn")
	var novo_atomo = cobre_flutuante.instantiate()
	get_node("/root/Fase_2/cobre").add_child(novo_atomo)	

func spawn_atomo2():
	var cobre_flutuante = load("res://Scenes/Itens/Cu_flutuante.tscn")
	var novo_atomo = cobre_flutuante.instantiate()
	get_node("/root/Fase_2/CheckpointFase2/cobre").add_child(novo_atomo)	

func spawnar_cu():
	print("spawnou cu")
	var cobre = load("res://Scenes/Itens/cobre.tscn")
	var cobre2 = cobre.instantiate()
	add_child(cobre2)
	
func _on_animation_animation_finished():	
	pass

func destroy_cu():
	queue_free()
