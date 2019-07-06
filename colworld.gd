extends Node2D

var default_color = ColorN("gray")

# Controls the background colour for the level
export var color:Color = default_color setget set_color
func set_color(value):
	color=value
	VisualServer.set_default_clear_color(value)

func _ready():
	set_color(color);

# Enables all walls except the specified wall
# If none are specified then none are disabled
func clearWall(wallName=null):
	for x in get_children():
		if x is togglable_wall:
			x.enabled = true
	if wallName != null:
		get_node(wallName).enabled = false;

# Spacebar - resets current hats
func _input(event):
	if (event is InputEventKey and
		event.pressed and
		not event.echo and
		event.scancode == KEY_SPACE):
			clearWall()
			set_color(default_color)