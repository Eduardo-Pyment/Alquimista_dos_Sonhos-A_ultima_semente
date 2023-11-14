extends Node2D

var ispaused = false

@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("Creditos")

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")

