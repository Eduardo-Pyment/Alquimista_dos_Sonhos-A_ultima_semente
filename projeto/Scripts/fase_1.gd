extends Node2D

@onready var player := $Player as CharacterBody2D
@onready var player_scene = preload("res://Scenes/player.tscn")

func _ready():
	$"/root/Level1/GameOver".apertou_restart.connect(menu_aberto)
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
	$"/root/Level1/GameOver".visible = false
	get_tree().paused = false
	print()
	
	Globais.respawn_player()

func PlayerMorreuGameOver():
	$"/root/Level1/GameOver".visible = true
	get_tree().paused = true
