extends Area2D

func _on_body_entered(body):
	Globais.agua = 0
	if body.name == 'Player' && body.has_method('take_damage'):
		body.take_damage(Vector2(0, -130))	
