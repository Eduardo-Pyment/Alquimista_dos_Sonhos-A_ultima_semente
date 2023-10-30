extends Control

@onready var vida = $"coraçao vida/vida" as Label
@onready var player = $"../../Player"
@onready var clock_timer = $clock_timer
@onready var timer_numero = $container/timer_hud/timer_numero as Label
@onready var control = $"."

var minutos = 0
var segundos = 0
@export_range(0,5) var padrao_minutos := 1
@export_range(0,59) var padrao_segundos := 0

signal time_is_up()

# Called when the node enters the scene tree for the first time.
func _ready():
	vida.text = str(Globais.player_life).pad_zeros(3)
	timer_numero.text = str("%02d" % padrao_minutos ) + ":" + str("%02d" % padrao_segundos)
	control.time_is_up.connect(reload_game)
	player.player_morreu.connect(reload_game)
	Globais.player_life = 3
	reset_clock_timer()	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	vida.text = str(Globais.player_life).pad_zeros(3)
	
	if minutos == 0 and segundos == 0:
		emit_signal("time_is_up")
	
func reload_game():
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()


func _on_clock_timer_timeout():
	if segundos == 0:
		if minutos > 0:
			minutos -= 1
			segundos = 59
		else:
			minutos = 0
			segundos = 0
	else:
		segundos -= 1

	timer_numero.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

	
func reset_clock_timer():
	minutos = padrao_minutos
	segundos = padrao_segundos
