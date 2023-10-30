extends Control

func _ready():
	pass

func _on_jogar_pressed():
<<<<<<< HEAD
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
=======
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
>>>>>>> origin/main
	MusicController.stop_music()


func _on_opcoes_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_opcoes.tscn")


func _on_sair_pressed():
	get_tree().quit()
