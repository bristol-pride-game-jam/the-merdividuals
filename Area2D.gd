tool
extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var world = get_node("..");
export var color:Color = ColorN("pink");
export var sprite:Texture setget set_sprite;
export var character_sprite:Texture;
export var removes:PoolStringArray;
export var firstText:String;
export var firstTexture:Texture;

var dropped = false;
var first = true;

func set_sprite(value):
	sprite = value
	if has_node("Sprite"):
		$Sprite.texture=value
		
func _ready():
	print("hat ready",self);
	$Sprite.texture = sprite
	#self.connect("body_entered",self,"_on_Area2D_body_entered")

func _on_Hat_body_entered(body):
	if dropped or !(body is Player) or body.hat != null:
		return
	world.clearWall(removes)
	world.color = color
	body.sheet = character_sprite
	body.hat = self
	self.visible = false
	self.collision_mask = 0
	$PickupSound.play(0)
	
	if (first):
		first = false;
		get_node("/root/colworld/SpeachOverlay").show(firstText,firstTexture);
	

func _on_Hat_body_exited(body):
	if body is Player:
		dropped = false;
