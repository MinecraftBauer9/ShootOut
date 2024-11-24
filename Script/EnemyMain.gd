extends CharacterBody2D


var SPEED = 300.0

func _physics_process(delta: float) -> void:
	
	var slowdown := Input.get_axis("slowdown", "speedup")
	if slowdown == -1:
		SPEED = 150
	else: if slowdown == 1:
		SPEED = 400
	else:
		SPEED = 300
	
	velocity.y = 0
	
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = -(directionx) * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
