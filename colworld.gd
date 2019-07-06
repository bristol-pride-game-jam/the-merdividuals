extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var baseWalls = get_node("BaseWalls");
onready var maleWalls = get_node("MaleWalls");
onready var femaleWalls = get_node("FemaleWalls");

var color setget set_color

func set_color(value):
	color=value
	VisualServer.set_default_clear_color(value)


func clearWall(wallName):
	for x in get_children():
		if x is togglable_wall:
			x.enabled = true
	get_node(wallName).enabled = false;

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.scancode == KEY_E:
			maleWalls.enabled = true;
			femaleWalls.enabled = true;
		if event.scancode == KEY_R:
			maleWalls.enabled = true;
			femaleWalls.enabled = false;
		if event.scancode == KEY_T:
			maleWalls.enabled = false;
			femaleWalls.enabled = true;