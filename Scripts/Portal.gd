extends Area2D

@export var cena_atual: Node

func _on_body_entered(body):
	if body.name == 'Player':
		$PortalFx.play()
		if cena_atual == $"/root/Level1":
			TransicaoDeCena.cena_transicao("res://Fases/fase_2.tscn")
		elif cena_atual == $"/root/Fase_2":
			TransicaoDeCena.cena_transicao("res://Fases/fase_3.tscn")
		elif cena_atual == $"/root/fase-3":
			TransicaoDeCena.cena_transicao("res://Menus/MenuPrincipal/Creditos.tscn")
