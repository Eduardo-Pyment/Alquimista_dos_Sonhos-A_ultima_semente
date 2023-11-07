extends Area2D

var zinc := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")

func _on_body_entered(_body):
	$animation.play("collected")
	#remover a colisão dupla // espera a colisão acabar para computar a coleta
	Globais.zinco += zinc
	print(Globais.zinco)
	call_deferred("spawn_atomo")
	await $collision.call_deferred("queue_free") 

func spawn_atomo():
	var zn_flutuante = load("res://Scenes/Itens/Zn_flutuante.tscn")
	var novo_atomo = zn_flutuante.instantiate()
	get_node("/root/Fase_2/zinco").add_child(novo_atomo)	
	
func _on_animation_animation_finished():	
	pass
