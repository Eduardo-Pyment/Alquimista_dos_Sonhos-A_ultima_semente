extends Area2D

var inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
<<<<<<< HEAD
func _process(delta):
=======
func _process(_delta):
>>>>>>> origin/main
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.hidrogenio >= 2 and Globais.oxigenio >= 1:
			Globais.hidrogenio -= 2
			Globais.oxigenio -= 1
			Globais.agua += 1
			print("Água =", Globais.agua)

<<<<<<< HEAD
func _on_body_entered(body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(body):
=======
func _on_body_entered(_body):
	inside = true
	$AnimatedSprite2D.modulate.a += 1 

func _on_body_exited(_body):
>>>>>>> origin/main
	inside = false
	$AnimatedSprite2D.modulate.a = 0
