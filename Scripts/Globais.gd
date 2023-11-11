extends Node

var hidrogenio := 0
var oxigenio := 0
var agua := 0
var player_life := 3
var sodio := 0
var cloro := 0
var base := 0
var cobre := 0
var zinco := 0
var prata := 0
var solido := 0
var player = null
var current_checkpoint = null

func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
	player.position = player.position
