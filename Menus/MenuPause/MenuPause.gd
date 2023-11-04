extends CanvasLayer


func _ready():
	visible = false
	#connect("pressed", self, "_on_button_pressed")


func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

func _on_reiniciar_pressed():
	var game_scene = get_tree().get_root().get_node("GameScene")
	if game_scene:
		game_scene.queue_free()
		var new_game_scene = preload("res://Fases/fase_1.tscn")
		var instance = new_game_scene.instance()
		get_tree().get_root().add_child(instance)

func _on_opcoes_pressed():
	pass # Replace with function body.


func _on_sair_pressed():
	get_tree().quit()

func _on_resume_pressed():
	get_tree().paused = false
	visible = false
