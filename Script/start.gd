extends Button

var unable = 0
signal cutscene

func _on_pressed() -> void:
	if unable == 0:
		emit_signal("cutscene")

func _input(event) -> void:
	if event.is_action_pressed("Spacebar") and unable == 0:
		emit_signal("cutscene")
		unable = 1



#get_tree().change_scene_to_file("res://Scenes/game.tscn")
