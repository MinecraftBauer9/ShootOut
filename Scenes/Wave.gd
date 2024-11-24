extends Sprite2D

signal clear

func wait(time : float):
	await get_tree().create_timer(time).timeout

func _process(delta: float) -> void:
	if Waves.timeout == 0:
		Waves.timeout = 1
		for h in 999999999:
			for i in Waves.waves * 2:
				for n in Waves.waves:
					GlobalVariables.randenemy()
				for n in 5:
					GlobalVariables.randenemy()
			await get_tree().create_timer(5.0).timeout
			GlobalVariables.randenemy()
			await clear
	if GlobalVariables.enemiesactive == 0:
		emit_signal("clear")
