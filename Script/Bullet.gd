extends CharacterBody2D

var speed : int
var dir : float
var spawnPos : Vector2
var spawnRot : float
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(delta: float) -> void:
	velocity = Vector2(rng.randi_range(-50,50),speed).rotated(dir)
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	#print(body.name)
	if body.name == "BottomWall":
		queue_free()
	if body.name == "Player" and GlobalVariables.immune == 0:
		GlobalVariables.health -= 1
		GlobalVariables.immune = 1
		speed = 0
		visible = false
		await get_tree().create_timer(2.5).timeout
		GlobalVariables.immune = 0
		queue_free()
