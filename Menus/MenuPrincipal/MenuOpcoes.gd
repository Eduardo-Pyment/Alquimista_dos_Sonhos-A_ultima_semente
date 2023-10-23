extends Control

@onready var music_slider: HSlider = %MusicaSlider
@onready var full_screen = %FullScreen

var SETTINGS_FILE_PATH = "user://options.cfg"
var config = ConfigFile.new()

func _ready():
	load_opcoes()

func _on_voltar_pressed():
	save_opcoes()
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/menu_principal.tscn")

func load_opcoes():
	var error = config.load(SETTINGS_FILE_PATH)
	if error == OK:
		music_slider.value = config.get_value("SETTINGS_MENU_SECTION", "MUSIC_SLIDER_VALUE", 0.5)
		
		#Essa linha não ta funcionando:
		#full_screen.pressed = config.get_value("SETTINGS_MENU_SECTION", "FULLSCREEN_VALUE")
	else:
		print("Erro ao carregar configurações.")

func save_opcoes():
	config.set_value("SETTINGS_MENU_SECTION", "MUSIC_SLIDER_VALUE", music_slider.value)
	
	#Essa linha complementa a de cima e não está funcionando
	#config.set_value("SETTINGS_MENU_SECTION", "FULLSCREEN_VALUE", full_screen.pressed)
	var error = config.save(SETTINGS_FILE_PATH)
	if error == OK:
		print("Configurações salvas com sucesso.")
	else:
		print("Erro ao salvar configurações.")

func _on_musica_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value / 10.0))

func _on_full_screen_toggled(button_pressed: bool):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if button_pressed:
		print("Botão Full Screen pressionado")
	else:
		print("Tá não em")
