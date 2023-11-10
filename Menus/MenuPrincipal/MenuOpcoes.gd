extends Control

@onready var music_slider: HSlider = %MusicaSlider
@onready var full_screen: CheckButton = %FullScreen


var config = ConfigFile.new()

func _ready():
	get_tree().paused = false
	load_opcoes()

func _on_voltar_pressed():
	$SelecionarBtn.play()
	save_opcoes()
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")

func save_opcoes():
	config.set_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, music_slider.value)
	config.set_value(OptionsConstants.section_name, OptionsConstants.fullscreen_key_name, full_screen.button_pressed)
	
	config.save(OptionsConstants.config_file_name)

func load_opcoes():
	var err = config.load(OptionsConstants.config_file_name)
	
	var music_volum = config.get_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, 1.0)
	var fullscreen_button = config.get_value(OptionsConstants.section_name, OptionsConstants.fullscreen_key_name, false)
	
	music_slider.value = music_volum
	full_screen.button_pressed = fullscreen_button

func _on_musica_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value / 10.0))

func _on_full_screen_toggled(button_pressed):
	if button_pressed:
		$SelecionarBtn.play()
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		$SelecionarBtn.play()
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

