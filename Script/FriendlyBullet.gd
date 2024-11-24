extends CharacterBody2D

var speed : int
var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,-speed).rotated(dir)
	move_and_slide()




func _on_friend_b_area_entered(area: Area2D) -> void:
	if area.name == "Enemy":
		queue_free()
