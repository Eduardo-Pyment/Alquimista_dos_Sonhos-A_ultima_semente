extends Area2D

var inside = false

signal gerar_base

func _ready():
	$AnimatedSprite2D.modulate.a = 0

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.sodio >= 1 and Globais.cloro >= 1:
			Globais.sodio -= 1
			Globais.cloro -= 1
			Globais.base = 1
			emit_signal("gerar_base")
			get_node("animation").play("gerando")
			print("base =", Globais.base)

func _on_body_entered(_body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(_body):
	inside = false
	$AnimatedSprite2D.modulate.a = 0
