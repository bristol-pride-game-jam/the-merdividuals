extends MarginContainer

func _process(delta):
	if Input.is_action_just_pressed("hat_off"):
		get_tree().change_scene("res://colworld.tscn")