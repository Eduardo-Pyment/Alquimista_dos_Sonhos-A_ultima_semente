extends Area2D

var silver := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
#	$"/root/Fase_2".spawnar_ag.connect(spawnar_ag)
#	$"/root/Fase_2".destroy_ag.connect(destroy_ag)

func _on_body_entered(_body):
	if _body.name == "Player":
		$animation.play("collected")
		#remover a colisão dupla // espera a colisão acabar para computar a coleta
		Globais.prata += silver
		print(Globais.prata)
		
		if Globais.prata > 1 and Globais.current_checkpoint != null:
			call_deferred("spawn_atomo2")
			$collision.call_deferred("queue_free") 
		else:
			call_deferred("spawn_atomo")
			$collision.call_deferred("queue_free") 

func spawn_atomo():
	var ag_flutuante = load("res://Scenes/Itens/Ag_flutuante.tscn")
	var novo_atomo = ag_flutuante.instantiate()
	get_node("/root/Fase_2/prata").add_child(novo_atomo)	

func spawn_atomo2():
	var ag_flutuante = load("res://Scenes/Itens/Ag_flutuante.tscn")
	var novo_atomo = ag_flutuante.instantiate()
	get_node("/root/Fase_2/CheckpointFase2/prata").add_child(novo_atomo)	

func spawnar_ag(): 
	print("spawnou ag")
	var prata = load("res://Scenes/Itens/prata.tscn")
	var prata2 = prata.instantiate()
	add_child(prata2)

func _on_animation_animation_finished():	
	pass

func destroy_ag():
	print("destorido prata")
	queue_free()
