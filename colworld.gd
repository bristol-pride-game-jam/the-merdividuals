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
			maleWalls.enabled = true;
			femaleWalls.enabled = true;
			VisualServer.set_default_clear_color(Color8(130,130,130))
		if event.scancode == KEY_R:
			maleWalls.enabled = true;
			femaleWalls.enabled = false;
			VisualServer.set_default_clear_color(Color8(255,130,110))
		if event.scancode == KEY_T:
			maleWalls.enabled = false;
			femaleWalls.enabled = true;
			VisualServer.set_default_clear_color(Color8(20,45,230))