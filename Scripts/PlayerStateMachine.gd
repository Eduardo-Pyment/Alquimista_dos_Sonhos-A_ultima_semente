extends Node

class_name PlayerstateMachine

@export var Player : CharacterBody2D
@export var current_state : state
@export var state_machine_tree : AnimationTree


var states : Array[state]

func _ready():
	for child in get_children():
		if child is state:
			states.append(child)
			child.Player = Player
			child.playback = state_machine_tree["parameters/playback"]
		else:
			push_warning("child" + child.name)

func _physics_process(delta):
	if (current_state.Proximo_state != null):
		mudar_state(current_state.Proximo_state)
		
	current_state.state_process(delta)
func _check_pode_correr():
	return current_state.pode_correr

func mudar_state(novo_state : state):
	if (current_state !=null):
		current_state.on_exit()
		current_state.Proximo_state = null
	current_state = novo_state
	
	current_state.on_enter()
	
func _input(event : InputEvent):
	current_state.state_input(event)
