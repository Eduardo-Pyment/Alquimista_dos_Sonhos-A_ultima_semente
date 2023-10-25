extends Control

var playerHasCollided = false  # Variável de controle para rastrear se o jogador colidiu.

# Chamado quando o nó entra na árvore da cena pela primeira vez.
func _ready():
	# Oculta o controle quando a cena é carregada.
	hide()

# Chamado quando o jogador entra em contato com a CollisionShape.
func _on_area_2d_body_entered(body):
	if body.name == "Player" and !playerHasCollided:
		show()  # Torna o nó visível.
		playerHasCollided = true  # Marca a interação como ocorrida.

# Chamado quando o jogador sai da área da CollisionShape.
func _on_area_2d_body_exited(body):
	if body.name == "Player" and playerHasCollided:
		hide()  # Oculta o controle.

# Chamado quando uma entrada de teclado é detectada.
func _input(event):
	if event is InputEventKey and event.keycode == KEY_ENTER:
		# Verifica se a tecla pressionada é "Enter".
		if is_visible():
			hide()  # Oculta o controle quando a tecla "Enter" é pressionada.
