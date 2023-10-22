extends Control

signal start_game

func show_game_over():
	$StartButton.show()

func _on_start_button_pressed():
	$modalGameOver.hide()
	start_game.emit()



