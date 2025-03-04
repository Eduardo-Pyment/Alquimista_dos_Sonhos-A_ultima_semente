extends Control

@onready var vida = $"coraçao vida/vida" as Label
@onready var player = $"../../Player"
@onready var clock_timer = $clock_timer
@onready var timer_numero = $container/timer_hud/timer_numero as Label
@onready var control = "."
@onready var game_over = $"../../GameOver"

var minutos = 0
var segundos = 0
var is_timer_running = false

signal time_is_up

func _ready():
	show()
	vida.text = str(Globais.player_life).pad_zeros(3)
	timer_numero.text = "00:00"  # Inicie o temporizador em 00:00
	player.GameOver.connect(PlayerMorreuGameOver)
	Globais.player_life = 3
	reset_clock_timer()
	start_clock_timer()

func _process(_delta):
	vida.text = str(Globais.player_life).pad_zeros(1)
	
func PlayerMorreuGameOver():
	game_over.visible = true
	get_tree().paused = true
	hide()

func _on_clock_timer_timeout():
	if is_timer_running:
		segundos += 1
		if segundos >= 60:
			segundos = 0
			minutos += 1

		timer_numero.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

func start_clock_timer():
	is_timer_running = true
	$clock_timer.start()  # Inicie o temporizador

func stop_clock_timer():
	is_timer_running = false
	$clock_timer.stop()  # Pare o temporizador

func reset_clock_timer():
	minutos = 0
	segundos = 0

func check_time_up():
	if minutos >= 5:  # Defina a condição em que você deseja emitir o sinal
		emit_signal("time_is_up")
