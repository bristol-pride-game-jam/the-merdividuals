extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


var enabled setget set_enabled,get_enabled;

func get_enabled():
	return visible;

func set_enabled(value):
	visible = value;
	collision_layer = 1 if value else 0;
	collision_mask = 1 if value else 0;