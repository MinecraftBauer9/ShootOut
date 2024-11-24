extends AnimationPlayer

signal Beginwaves

func _on_start_cutscene() -> void:
	play("Starting Cutscene")

func _on_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
