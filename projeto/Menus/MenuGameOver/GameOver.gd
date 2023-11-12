extends CanvasLayer

signal apertou_restart

func _on_reiniciar_pressed():
	emit_signal("apertou_restart")
	get_tree().paused = false

func _on_sair_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")
	get_tree().paused = false
	
