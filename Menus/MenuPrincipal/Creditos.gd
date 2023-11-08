extends Node2D

var ispaused = false

func _ready():
	$AnimationPlayer.play("Creditos")

func pausescene():
	ispaused = true
	get_tree().paused = true
	
func resumescene():
	ispaused = false
	get_tree().paused = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")

