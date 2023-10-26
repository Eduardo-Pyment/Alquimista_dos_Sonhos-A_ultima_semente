extends Node2D

@onready var bgmusic_menu: AudioStreamPlayer = $BgMusicMenu

func _ready():
	pass

func play_music():
	bgmusic_menu.play()

func stop_music():
	bgmusic_menu.stop()
