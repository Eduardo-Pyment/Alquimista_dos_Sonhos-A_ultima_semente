extends CanvasLayer

func _on_reiniciar_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_sair_pressed():
	get_tree().quit()
