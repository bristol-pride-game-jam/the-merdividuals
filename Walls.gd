extends TileMap

class_name togglable_wall

var enabled setget set_enabled,get_enabled;

func get_enabled():
	return visible;

func set_enabled(value):
	visible = value;
	collision_layer = 1 if value else 0;
	collision_mask = 1 if value else 0;