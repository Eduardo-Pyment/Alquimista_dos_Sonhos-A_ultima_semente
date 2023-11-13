extends Node2D

@onready var bg_music_fase_1 = $BgMusicFase1
@onready var bg_music_fase_2 = $BgMusicFase2
@onready var bg_music_fase_3 = $BgMusicFase3

@export var level_1 = Node
@export var level_2 = Node
@export var level_3 = Node

func _ready():
	if get_tree().current_scene == level_1:
		MusicController.bg_music_fase_1.stop()
		MusicController.bg_music_fase_2.stop()
		MusicController.bg_music_fase_3.stop()
		bg_music_fase_1.play()
	if get_tree().current_scene == level_2:
		MusicController.bg_music_fase_1.stop()
		MusicController.bg_music_fase_2.stop()
		MusicController.bg_music_fase_3.stop()
		bg_music_fase_2.play()
	if get_tree().current_scene == level_3:
		MusicController.bg_music_fase_1.stop()
		MusicController.bg_music_fase_2.stop()
		MusicController.bg_music_fase_3.stop()
		bg_music_fase_3.play()
