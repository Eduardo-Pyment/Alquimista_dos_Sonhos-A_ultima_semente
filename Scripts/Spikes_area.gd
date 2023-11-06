extends Area2D
signal  GameOver

func _on_body_entered(body):
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))
		GameOver.emit()
