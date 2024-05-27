extends Area2D

func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('morte'):
		Globais.player_life -= 3
		body.morte(Vector2(0, -130))
