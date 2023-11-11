extends Area2D

var is_active = false

func _ready():
	$"/root/fase-3".spawnar_cl_check.connect(spawnar_cl_check)
	$"/root/fase-3".spawnar_na_check.connect(spawnar_na_check)

func _on_body_entered(body):
	if body.name != "Player" or is_active:
		return
	activate_checkpoint()

func activate_checkpoint():
	Globais.current_checkpoint = self
	print("Entrou")
	is_active = true

func spawnar_cl_check():
	print("spawnou cl no check")
	var cloro = load("res://Scenes/Itens/cloro.tscn")
	var cloro2 = cloro.instantiate()
	add_child(cloro2)
	
func spawnar_na_check():
	print("spawnou NA no check")
	var sodio = load("res://Scenes/Itens/sodio.tscn")
	var sodio2 = sodio.instantiate()
	add_child(sodio2)

