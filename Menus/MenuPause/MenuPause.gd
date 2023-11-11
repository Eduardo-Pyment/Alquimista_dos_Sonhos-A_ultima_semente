extends CanvasLayer

@onready var control_pause = $ControlPause
@onready var control_opcoes = $ControlOpcoes
@onready var color_rect = $ColorRect

@onready var music_slider: HSlider = %MusicaSlider
@onready var sfx_slider = $ControlOpcoes/ScrollContainer/ColorRect/Control/SFXSlider
@onready var full_screen: CheckButton = %FullScreen

var config = ConfigFile.new()


func _ready():
	control_pause.visible = false
	control_opcoes.visible = false
	color_rect.visible = false
	load_opcoes()


func _process(delta):
	pass
	
func _unhandled_input(event):
	if control_opcoes.visible:
		if event.is_action_pressed("ui_cancel"):
			save_opcoes()
			load_opcoes()
	# Se o menu de opções estiver visível, feche-o
			control_opcoes.visible = false
			get_tree().paused = false
			color_rect.visible = false
		return

	if event.is_action_pressed("ui_cancel"):
		save_opcoes()
		load_opcoes()
		if control_pause.visible:	
# Se o menu de pausa estiver visível, feche-o
			get_tree().paused = false
			control_pause.visible = false
			color_rect.visible = false
		else:
# Caso contrário, abra o menu de pausa
			control_pause.visible = true
			color_rect.visible = true
			get_tree().paused = true


func reload_game():
	get_tree().reload_current_scene()

func _on_reiniciar_pressed():
	save_opcoes()
	reload_game()
	get_tree().paused = false

func _on_opcoes_pressed():
	control_pause.visible = false
	control_opcoes.visible = true


func _on_sair_pressed():
	save_opcoes()
	get_tree().quit()

func _on_resume_pressed():
	get_tree().paused = false
	control_pause.visible = false
	color_rect.visible = false

func _on_voltar_pressed():
	save_opcoes()
	control_pause.visible = true
	control_opcoes.visible = false
	
func _on_menu_btn_pressed():
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")

func save_opcoes():
	config.set_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, music_slider.value)
	config.set_value(OptionsConstants.section_name, OptionsConstants.sound_effects_key_name, sfx_slider.value)
	config.set_value(OptionsConstants.section_name, OptionsConstants.fullscreen_key_name, full_screen.button_pressed)
	
	config.save(OptionsConstants.config_file_name)

func load_opcoes():
	var err = config.load(OptionsConstants.config_file_name)
	
	var music_volum = config.get_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, 1.0)
	var sfx_volum = config.get_value(OptionsConstants.section_name, OptionsConstants.sound_effects_key_name, 1.0)
	var fullscreen_button = config.get_value(OptionsConstants.section_name, OptionsConstants.fullscreen_key_name, false)
	
	music_slider.value = music_volum
	sfx_slider.value = sfx_volum
	full_screen.button_pressed = fullscreen_button

func _on_musica_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value / 10.0))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value / 100.0))

func _on_full_screen_toggled(button_pressed):
	if button_pressed:
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


