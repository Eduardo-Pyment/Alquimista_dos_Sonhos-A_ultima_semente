extends CanvasLayer

func _ready():
	visible = false

func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
	
func reload_game():
	get_tree().reload_current_scene()

func _on_reiniciar_pressed():
	reload_game()
	get_tree().paused = false

func _on_opcoes_pressed():
	pass # Replace with function body.


func _on_sair_pressed():
	get_tree().quit()

func _on_resume_pressed():
	get_tree().paused = false
	visible = false
