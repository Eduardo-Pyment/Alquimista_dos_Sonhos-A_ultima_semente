extends AnimatableBody2D     

@export var Distancia:Vector2
@export var TempoTransicao: float = 6.0
@export_range(0.0, 1.0) var TransicaoDiferencial:float

var Pivo:Vector2
var Tempo:float

func _ready():
	Pivo = global_position

func get_pos(t:float)->Vector2:
	var x:float = Pivo.x + cos(TAU * (t + TransicaoDiferencial)) * Distancia.x
	var y:float = Pivo.y + sin(TAU * t) * Distancia.y
	return Vector2(x, y)
	
func _physics_process(delta:float) -> void:
	Tempo = fmod(Tempo + delta / TempoTransicao, 1.0)
	global_position = get_pos(Tempo)
