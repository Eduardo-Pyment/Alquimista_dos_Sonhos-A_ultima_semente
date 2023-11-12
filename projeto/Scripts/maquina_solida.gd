extends Area2D

var inside = false

signal gerar_solido

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.prata >= 1 and Globais.zinco >= 1 and Globais.cobre:
			Globais.prata -= 1
			Globais.zinco -= 1
			Globais.cobre -= 1
			Globais.solido += 1
			emit_signal("gerar_solido")
			get_node("animation").play("gerando")
			get_node("collision").queue_free()
			print("solido =", Globais.solido)

func _on_body_entered(_body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(_body):
	inside = false
	$AnimatedSprite2D.modulate.a = 0
