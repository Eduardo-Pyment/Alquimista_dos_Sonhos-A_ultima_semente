extends Node2D

@onready var player := $Player as CharacterBody2D
@onready var player_scene = preload("res://Scenes/player.tscn")

signal spawnar_na
signal spawnar_cl
signal destroy_na
signal destroy_cl
signal spawnar_na_check
signal spawnar_cl_check
signal destroy_na_flutuante
signal destroy_cl_flutuante

func _ready():
	$"/root/fase-3/GameOver".apertou_restart.connect(menu_aberto)
	Globais.player = player
	Globais.player.GameOver.connect(PlayerMorreuGameOver)
	Globais.player_life = 3

func menu_aberto():
	print("reiniciar apertado")
	if Globais.current_checkpoint == null:
		get_tree().reload_current_scene()
		get_tree().paused = false
	var Player = player_scene.instantiate()
	add_child(Player)
	Globais.player = Player
	Globais.player.GameOver.connect(PlayerMorreuGameOver)
	Globais.player_life = 3
	$"/root/fase-3/GameOver".visible = false
	get_tree().paused = false
	print()
	
	if Globais.sodio == 1:
		emit_signal("destroy_na")
		emit_signal("spawnar_na_check")
	if Globais.cloro == 1:
		emit_signal("destroy_cl")
		emit_signal("spawnar_cl_check")
	if Globais.sodio > 1:
		emit_signal("spawnar_na_check")
		emit_signal("destroy_na_flutuante")
	if Globais.cloro > 1:
		emit_signal("spawnar_cl_check")
		emit_signal("destroy_cl_flutuante")
		
	if Globais.current_checkpoint == null:
		Globais.sodio = 0
		Globais.cloro = 0
	
	Globais.respawn_player()

func PlayerMorreuGameOver():
	$"/root/fase-3/GameOver".visible = true
	get_tree().paused = true
