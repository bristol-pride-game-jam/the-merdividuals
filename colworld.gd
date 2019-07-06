extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var baseWalls = get_node("BaseWalls");
onready var maleWalls = get_node("MaleWalls");
onready var femaleWalls = get_node("FemaleWalls");

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.scancode == KEY_E:
			baseWalls.enabled = !baseWalls.enabled
		if event.scancode == KEY_R:
			maleWalls.enabled = !maleWalls.enabled
		if event.scancode == KEY_T:
			femaleWalls.enabled = !femaleWalls.enabled