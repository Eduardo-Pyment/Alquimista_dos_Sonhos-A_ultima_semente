extends Node

class_name state

@export var pode_correr : bool = true


var Player : CharacterBody2D
var Proximo_state : state
var playback : AnimationNodeStateMachinePlayback

func state_process(delta):
	pass
	
func state_input(event : InputEvent): 
	pass

func on_enter():
	pass
	
func on_exit():
	pass
