tool
extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var world = get_node("..");
export var color:Color = ColorN("pink");
export var sprite:Texture setget set_sprite;
export var character_sprite:Texture;
export var removes:String;

var dropped = false;

func set_sprite(value):
	sprite = value
	if($Sprite or Engine.editor_hint):
		$Sprite.texture=value
		
func _ready():
	print("hat ready",self);
	$Sprite.texture = sprite
	self.connect("body_entered",self,"_on_Area2D_body_entered")

func _on_Area2D_body_entered(body):
	if dropped or !(body is Player):
		return
	print("hits");
	world.clearWall(removes);
	world.color = color;
	body.sheet = character_sprite;
	body.hat = self
	self.visible = false
	self.collision_layer = 0
	

func _on_Hat_body_exited(body):
	if body is Player:
		dropped = false;
