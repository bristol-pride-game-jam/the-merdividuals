extends Node2D

var default_color = Color(179, 250, 1)

# Controls the background colour for the level
export var color:Color = default_color setget set_color
func set_color(value):
	color=value
	VisualServer.set_default_clear_color(value)

func _ready():
	set_color(color);

# Enables all walls except the specified wall
# If none are specified then none are disabled
func clearWall(wallName:PoolStringArray=[]):
	for x in get_children():
		if x is togglable_wall:
			x.enabled = true
	for x in wallName:
		get_node(x).enabled = false;

# Spacebar - resets current hats
func _input(event):
	if (event is InputEventKey and
		event.pressed and
		not event.echo and
		event.scancode == KEY_SPACE):
			clearWall(["AgenderWalls"])
			set_color(default_color)