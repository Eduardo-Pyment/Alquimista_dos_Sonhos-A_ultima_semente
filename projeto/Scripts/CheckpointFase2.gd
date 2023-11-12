extends Area2D

var is_active = false

func _ready():
	$"/root/Fase_2".spawnar_ag_check.connect(spawnar_ag_check)
	$"/root/Fase_2".spawnar_zn_check.connect(spawnar_zn_check)
	$"/root/Fase_2".spawnar_cu_check.connect(spawnar_cu_check)

func _on_body_entered(body):
	if body.name != "Player" or is_active:
		$animation.play("default")
		return
	activate_checkpoint()

func activate_checkpoint():
	Globais.current_checkpoint = self
	print("Entrou")
	is_active = true

func spawnar_ag_check():
	print("spawnou ag no check")
	var prata = load("res://Scenes/Itens/prata.tscn")
	var prata2 = prata.instantiate()
	add_child(prata2)
	
func spawnar_zn_check():
	print("spawnou zn no check")
	var zinco = load("res://Scenes/Itens/zinco.tscn")
	var zinco2 = zinco.instantiate()
	add_child(zinco2)

func spawnar_cu_check():
	print("spawnou cu no check")
	var cobre = load("res://Scenes/Itens/cobre.tscn")
	var cobre2 = cobre.instantiate()
	add_child(cobre2)
