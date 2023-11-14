extends Area2D

@export var cena_atual: Node

@export var level_1 = Node
@export var level_2 = Node
@export var level_3 = Node

func _on_body_entered(body):
	if body.name == 'Player':
		$PortalFx.play()
		if cena_atual == level_1:
			TransicaoDeCena.cena_transicao("res://Fases/fase_2.tscn")
		elif cena_atual == level_2:
			TransicaoDeCena.cena_transicao("res://Fases/fase_3.tscn")
		elif cena_atual == level_3:
			TransicaoDeCena.cena_transicao("res://Menus/MenuPrincipal/Creditos.tscn")
