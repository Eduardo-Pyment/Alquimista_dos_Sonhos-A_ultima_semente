extends Area2D

var inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.sodio >= 1 and Globais.cloro >= 1:
			Globais.sodio -= 1
			Globais.cloro -= 1
			Globais.base += 1
			print("NaCl =", Globais.base)

func _on_body_entered(_body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(_body):
	inside = false
	$AnimatedSprite2D.modulate.a = 0
