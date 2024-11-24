extends HBoxContainer

var ammofull = preload("res://Sprites/Full_Heart_Container_Upscaled.png")
var ammoempty = preload("res://Sprites/Empty_Heart_Container_Upscaled_COrrectrefd.png")



func _process(delta: float) -> void:
	update_empty()

func update_empty():
	for i in get_child_count():
		if GlobalVariables.health >= i:
			get_child(i).texture = ammofull
		else:
			get_child(i).texture = ammoempty
