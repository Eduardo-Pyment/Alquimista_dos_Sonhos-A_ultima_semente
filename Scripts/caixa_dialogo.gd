extends Control

var playerHasCollided = false  # Variável de controle para rastrear se o jogador colidiu.

# Chamado quando o nó entra na árvore da cena pela primeira vez.
func _ready():
	# Oculta o controle quando a cena é carregada.
	hide()
	
# Chamado quando o jogador entra em contato com a CollisionShape.
func _on_area_2d_body_entered(body):
	if body.name == "Player" and !playerHasCollided:
		show()
		playerHasCollided = true  # Marca a interação como ocorrida.
		

# Chamado quando o jogador sai da área da CollisionShape.
func _on_area_2d_body_exited(body):
	if body.name == "Player" and playerHasCollided:
		hide()
		playerHasCollided = false
		


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_2_body_exited(body):
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_3_body_exited(body):
	pass # Replace with function body.


