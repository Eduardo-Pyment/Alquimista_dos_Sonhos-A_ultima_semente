extends Label

@export var state_machine : PlayerstateMachine

func _process(_delta):
	text = "state : " + state_machine.current_state.name
