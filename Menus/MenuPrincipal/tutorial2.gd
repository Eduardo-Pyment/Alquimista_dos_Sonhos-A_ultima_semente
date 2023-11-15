extends CanvasLayer
	
func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/tutorial.tscn")
	
func _on_avancar_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/tutorial3.tscn")
