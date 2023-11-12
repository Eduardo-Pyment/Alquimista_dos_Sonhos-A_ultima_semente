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
		

