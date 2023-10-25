extends Area2D

var inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up") and inside == true:
		if Globais.hidrogenio >= 2 and Globais.oxigenio >= 1:
			Globais.hidrogenio -= 2
			Globais.oxigenio -= 1
			Globais.agua += 1
			print("Água = ", Globais.agua)

func _on_body_entered(body):
	inside = true

func _on_body_exited(body):
	inside = false
