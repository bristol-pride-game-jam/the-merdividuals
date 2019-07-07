tool
extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var active

onready var player = get_node("/root/colworld/player");

func show(text:String, texture:Texture):
	$Node2D/BubbleText.text = text;
	$Node2D/Sprite.texture = texture;
	$Node2D.visible = true;
	get_tree().paused = true
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D.visible = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("hat_off"):
		$Node2D.visible = false;
		get_tree().paused = false;