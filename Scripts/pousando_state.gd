extends state

class_name pousando_state

@export var animacao_pouso : String = "Pouso"
@export var chao_state : state

func _on_animation_tree_animation_finished(anim_name):
			if (anim_name == animacao_pouso):
				Proximo_state = chao_state
