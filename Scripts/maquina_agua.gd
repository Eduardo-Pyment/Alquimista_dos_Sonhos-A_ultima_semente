extends Area2D

var inside = false

signal gerar_agua

func _ready():
	$AnimatedSprite2D.modulate.a = 0

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.hidrogenio >= 2 and Globais.oxigenio >= 1:
			Globais.hidrogenio -= 2
			Globais.oxigenio -= 1
			Globais.agua = 1
			emit_signal("gerar_agua")
			get_node("animation").play("gerando")
			print("Água =", Globais.agua)

func _on_body_entered(_body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(_body):
	inside = false
	$AnimatedSprite2D.modulate.a = 0
