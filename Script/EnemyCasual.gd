extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Game")
@onready var projectile = load("res://Scenes/bullet.tscn")

var rng = RandomNumberGenerator.new()
var phase = 1
var id = GlobalVariables.identiftier
var x = 10
var y = 10
var pattern = 0
var pos = position
var SPEED = 250
var destination = Vector2(x, y)
var health = Waves.waves * 5
var setshot = 1

func _ready() -> void:
	#print(id, GlobalVariables.identiftier)
	x = GlobalVariables.entities["initialx"][id]
	y = GlobalVariables.entities["initialy"][id]
	SPEED = GlobalVariables.entities["speed"][id]
	pattern = GlobalVariables.entities["pattern"][id]
	destination = Vector2(x, y)
	position = Vector2(rng.randi_range(-1000, 200), rng.randi_range(-1300, -2000))

func _process(delta: float) -> void:
	position += position.direction_to(destination) * SPEED * delta
	pos = position
	#print(abs(destination.x) + abs(destination.y))
	#print(abs(round(pos.x)) + abs(round(pos.y)))
	if abs(destination.x) + abs(destination.y) - 5 < abs(round(pos.x)) + abs(round(pos.y)) and abs(round(pos.x)) + abs(round(pos.y)) < abs(destination.x) + abs(destination.y) + 5:
		if phase != 3:
			phase += 1
		else:
			phase = 1
		if phase == 1:
			if pattern == 1:
				x = rng.randi_range(-700, -100)
				y = rng.randi_range(-100, -400)
			else:
				x = GlobalVariables.entities["initialx"][id]
				y = GlobalVariables.entities["initialy"][id]
		else: if phase == 2:
			if pattern == 1:
				x = rng.randi_range(-700, -100)
				y = rng.randi_range(-100, -400)
			else:
				x = GlobalVariables.entities["midx"][id]
				y = GlobalVariables.entities["midy"][id]
		else: if phase == 3:
			if pattern == 1:
				x = rng.randi_range(-700, -100)
				y = rng.randi_range(-100, -400)
			else:
				x = GlobalVariables.entities["endx"][id]
				y = GlobalVariables.entities["endy"][id]
		destination = Vector2(x, y)
		if phase == setshot:
			shoot()
			setshot = rng.randi_range(1,3)

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	instance.speed = rng.randi_range(SPEED * 3.00, SPEED * 0.25)
	main.add_child.call_deferred(instance)


func _on_enemy_died() -> void:
	GlobalVariables.enemiesactive -= 1
	print(GlobalVariables.enemiesactive)
	$Dissapear.visible = true
	$Sprite2D.visible = false
	$TopDown.visible = false
	$Dissapear/AnimationPlayer.play("Death")
	await get_tree().create_timer(0.6).timeout
	queue_free()
