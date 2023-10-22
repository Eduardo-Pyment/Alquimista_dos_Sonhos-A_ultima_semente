extends Control

func _ready():
	pass

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")



func _on_opcoes_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_opcoes.tscn")


func _on_sair_pressed():
	get_tree().quit()
