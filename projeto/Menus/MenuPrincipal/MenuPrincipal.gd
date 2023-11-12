extends Control

func _ready():
	pass

func _on_jogar_pressed():
	$SelecionarBtn.play()
	TransicaoDeCena.cena_transicao("res://Fases/fase_1.tscn")


func _on_opcoes_pressed():
	$SelecionarBtn.play()
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_opcoes.tscn")


func _on_sair_pressed():
	$SelecionarBtn.play()
	get_tree().quit()
	

func _on_creditos_pressed():
	$SelecionarBtn.play()
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/Creditos.tscn")
	

