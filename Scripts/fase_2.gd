extends Node2D

@onready var player := $Player as CharacterBody2D
@onready var player_scene = preload("res://Scenes/player.tscn")

signal spawnar_ag
signal spawnar_zn
signal spawnar_cu
signal destroy_ag
signal destroy_zn
signal destroy_cu
signal spawnar_ag_check
signal spawnar_zn_check
signal spawnar_cu_check
signal destroy_ag_flutuante
signal destroy_zn_flutuante
signal destroy_cu_flutuante

func _ready():
	$"/root/Fase_2/GameOver".apertou_restart.connect(menu_aberto)
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
	$"/root/Fase_2/GameOver".visible = false
	get_tree().paused = false
	print()
	
	if Globais.prata == 1:
		emit_signal("destroy_ag")
		emit_signal("spawnar_ag_check")
	if Globais.zinco == 1:
		emit_signal("destroy_zn")
		emit_signal("spawnar_zn_check")
	if Globais.cobre == 1:
		emit_signal("destroy_cu")
		emit_signal("spawnar_cu_check")
	if Globais.prata > 1:
		emit_signal("spawnar_ag_check")
		emit_signal("destroy_ag_flutuante")
	if Globais.zinco > 1:
		emit_signal("spawnar_zn_check")
		emit_signal("destroy_zn_flutuante")
	if Globais.cobre > 1:
		emit_signal("spawnar_cu_check")
		emit_signal("destroy_cu_flutuante")
		
	if Globais.current_checkpoint == null:
		Globais.prata = 0
		Globais.zinco = 0
		Globais.cobre = 0
	
	Globais.respawn_player()

func PlayerMorreuGameOver():
	$"/root/Fase_2/GameOver".visible = true
	get_tree().paused = true
