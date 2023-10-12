extends Area2D

var oxigen := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$animation.play("collected")
	await $collision.call_deferred("queue_free") 
	Globais.oxigenio += oxigen
	print(Globais.oxigenio)


func _on_animation_animation_finished():	
	queue_free()
