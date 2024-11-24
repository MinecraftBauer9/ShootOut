extends Node2D

func _on_player_die() -> void:
	$GameOver.visible = true
	$GuitarAlwaysPlay.stop()
	$Lose.play()

func _input(event) -> void:
	if event.is_action_pressed("End"):
		get_tree().quit()
