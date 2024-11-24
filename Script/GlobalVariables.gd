extends Node

var Bulletcapacity = 5
var Bulletcount = 5
var rng = RandomNumberGenerator.new()
var health = 4
var maxhealth = 4
var identiftier = 0
var enemiesactive = 0
var reloadlockout = 0
var immune = 0

var entities = {
	"initialx" : [],
	"initialy" : [],
	"midx" : [],
	"midy" : [],
	"endx" : [],
	"endy" : [],
	"speed" : [],
	"pattern" : []
}

func _ready() -> void:
	rng.randomize()

func CreateEnemy(inx : float, iny: float, midx : float, midy : float, endx : float, endy : float, speed : int, pattern: int):
	entities["initialx"].append(inx)
	entities["initialy"].append(iny) 
	entities["midx"].append(midx) 
	entities["midy"].append(midy) 
	entities["endx"].append(endx) 
	entities["endy"].append(endy)
	entities["speed"].append(speed)
	entities["pattern"].append(pattern)
	var Enemy = load("res://Scenes/Enemy.tscn")
	var EnemyInstance = Enemy.instantiate()
	var target = get_node("/root/Game")
	target.add_child(EnemyInstance)
	identiftier += 1
	enemiesactive += 1
	print(enemiesactive)
	#Game.summonenemy()
#func _input(event) -> void:
	#if event.is_action_pressed("t"):
		#CreateEnemy(1,1,1,1,1,1,200,1)
		#CreateEnemy(1,1,1,1,1,1,500,1)
		#CreateEnemy(1,2053,8,2,7,3,600,5)
		#CreateEnemy(5,0,0,0,0,0,2000,0)
		#CreateEnemy(22,0,0,0,0,0,500,0)

func randenemy():
	GlobalVariables.CreateEnemy(rng.randi_range(-700, -100), rng.randi_range(-100, -400), rng.randi_range(-700, -100), rng.randi_range(-100, -400), rng.randi_range(-700, -100), rng.randi_range(-100, -400), 300, rng.randi_range(0,1))
