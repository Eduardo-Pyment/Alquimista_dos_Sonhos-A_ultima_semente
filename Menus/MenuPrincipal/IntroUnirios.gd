extends Node2D

func _ready():
	$AnimationPlayer.play("Fade In")
	await(get_tree().create_timer(4)).timeout
	$AnimationPlayer.play("Fade Out")
	await(get_tree().create_timer(2)).timeout
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")
	MusicController.play_music()
