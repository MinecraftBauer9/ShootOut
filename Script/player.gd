extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")
@onready var projectile = load("res://Scenes/friendly_bullet.tscn")
signal die

var SPEED = 300.0

func _ready() -> void:
	Waves.waves = 1
	Waves.timeout = 0

func _physics_process(delta: float) -> void:
	
	var slowdown := Input.get_axis("slowdown", "speedup")
	if slowdown == -1:
		SPEED = 150
	else: if slowdown == 1:
		SPEED = 400
	else:
		SPEED = 300
	
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event) -> void:
	if event.is_action_pressed("Shoot") and GlobalVariables.Bulletcount != -1 and GlobalVariables.reloadlockout == 0:
		shoot()
		GlobalVariables.Bulletcount -= 1
	if event.is_action_pressed("Reload") and GlobalVariables.reloadlockout == 0:
		GlobalVariables.reloadlockout = 1
		await get_tree().create_timer(1.0).timeout
		GlobalVariables.Bulletcount = GlobalVariables.Bulletcapacity
		GlobalVariables.reloadlockout = 0
	if GlobalVariables.health == -1:
		$TopDown.visible = false
		$Sprite2D.visible = false
		$Die.visible = true
		$Die/AnimationPlayer.play("Die")
		await get_tree().create_timer(0.6).timeout
		emit_signal("die")
		queue_free()

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	instance.speed = 500
	main.add_child.call_deferred(instance)
