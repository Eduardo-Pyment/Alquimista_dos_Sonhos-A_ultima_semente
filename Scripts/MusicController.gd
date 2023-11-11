extends Node2D

@onready var bgmusic_menu: AudioStreamPlayer = $BgMusicMenu
@onready var bg_music_fase_1 = $BgMusicFase1
@onready var bg_music_fase_2 = $BgMusicFase2
@onready var bg_music_fase_3 = $BgMusicFase3

@onready var level_1 = $"/root/Level1"
@onready var level_2 = $"/root/Fase_2"
@onready var level_3 = $"/root/fase-3"

func _ready():
	if get_tree().current_scene == level_1:
		MusicController.bg_music_fase_1.stop()
		MusicController.bg_music_fase_2.stop()
		MusicController.bg_music_fase_3.stop()
		bg_music_fase_1.play()
	if get_tree().current_scene == level_2:
		MusicController.bg_music_fase_1.stop()
		bg_music_fase_2.play()
	if get_tree().current_scene == level_3:
		MusicController.bg_music_fase_2.stop()
		bg_music_fase_3.play()
