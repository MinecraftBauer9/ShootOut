extends TextureRect

func _process(delta: float) -> void:
	if GlobalVariables.reloadlockout == 0:
		position = Vector2(50000,0)
	else:
		position = Vector2(50,150)
