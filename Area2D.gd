tool
extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var world = get_node("..");
export var color:Color = ColorN("pink");
export var sprite:Texture setget set_sprite
export var removes:String;

func set_sprite(value):
	sprite = value
	if($Sprite or Engine.editor_hint):
		$Sprite.texture=value
		
func _ready():
		$Sprite.texture = sprite

func _on_Area2D_body_entered(body):
	if !(body is Player):
		return
	world.clearWall(removes);
	world.color = color;
	