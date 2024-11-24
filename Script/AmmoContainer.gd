extends HBoxContainer

var ammofull = preload("res://Sprites/Revolver_Full.png")
var ammoempty = preload("res://Sprites/Revolver_Spent.png")



func _process(delta: float) -> void:
	update_empty()

func update_empty():
	for i in get_child_count():
		if GlobalVariables.Bulletcount >= i:
			get_child(i).visible = true
			get_child(i).texture = ammofull
		else: if GlobalVariables.Bulletcapacity < i:
			get_child(i).visible = false
		else:
			get_child(i).visible = true
			get_child(i).texture = ammoempty
