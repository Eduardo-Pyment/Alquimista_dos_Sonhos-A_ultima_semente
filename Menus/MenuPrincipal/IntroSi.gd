extends Node2D

func _ready():
	MusicController.stop_music()
	$AnimationPlayer.play("Fade In")
	await(get_tree().create_timer(4)).timeout
	$AnimationPlayer.play("Fade Out")
	await(get_tree().create_timer(2)).timeout
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/intro_unirios.tscn")
