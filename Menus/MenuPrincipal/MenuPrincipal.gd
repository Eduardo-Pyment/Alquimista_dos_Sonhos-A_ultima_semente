extends Control

func _ready():
	pass

func _on_jogar_pressed():
	TransicaoDeCena.cena_transicao("res://Fases/fase_1.tscn")
	MusicController.stop_music()


func _on_opcoes_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_opcoes.tscn")


func _on_sair_pressed():
	get_tree().quit()




func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/Creditos.tscn")
	

