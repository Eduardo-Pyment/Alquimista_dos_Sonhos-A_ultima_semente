extends Area2D

var zinc := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
#	$"/root/Fase_2".spawnar_zn.connect(spawnar_zn)
#	$"/root/Fase_2".destroy_zn.connect(destroy_zn)

func _on_body_entered(_body):
	if _body.name == "Player":
		$animation.play("collected")
		#remover a colisão dupla // espera a colisão acabar para computar a coleta
		Globais.zinco += zinc
		print(Globais.zinco)
		
		if Globais.zinco > 1 and Globais.current_checkpoint != null:
			call_deferred("spawn_atomo2")
			$collision.call_deferred("queue_free") 
		else:
			call_deferred("spawn_atomo")
			$collision.call_deferred("queue_free") 

func spawn_atomo():
	var zn_flutuante = load("res://Scenes/Itens/Zn_flutuante.tscn")
	var novo_atomo = zn_flutuante.instantiate()
	get_node("/root/Fase_2/zinco").add_child(novo_atomo)	

func spawn_atomo2():
	var zn_flutuante = load("res://Scenes/Itens/Zn_flutuante.tscn")
	var novo_atomo = zn_flutuante.instantiate()
	get_node("/root/Fase_2/CheckpointFase2/zinco").add_child(novo_atomo)	

func spawnar_zn(): 
	print("spawnou ag")
	var zinco = load("res://Scenes/Itens/zinco.tscn")
	var zinco2 = zinco.instantiate()
	add_child(zinco2)
	
func _on_animation_animation_finished():	
	pass

func destroy_zn():
	queue_free()
