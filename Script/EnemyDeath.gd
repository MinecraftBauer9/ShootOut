extends Area2D

var enehealth = Waves.waves * 2
signal died

func _on_body_entered(body: Node2D) -> void:
	#print(body.name)
	if body.name == "Enem":
		print("lol sigma")
		enehealth -= 1
		if enehealth == 0:
			emit_signal("died")


func _on_area_entered(area: Area2D) -> void:
	#print(area.name)
	if area.name == "FriendB":
		enehealth -= 1
		if enehealth == 0:
			emit_signal("died")
