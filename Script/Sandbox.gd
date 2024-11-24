extends Node2D


func _input(event) -> void:
	if event.is_action_pressed("t"):
		$JustPianoForExperiment.volume_db = 0
	if event.is_action_pressed("k"):
		$Flute1.volume_db = 5
		$ExatraGuitar.volume_db = 5
