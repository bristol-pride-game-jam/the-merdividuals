tool
extends KinematicBody2D

class_name Player

#Refrence to to the hat the player has on so they can drop it
var hat;

#Pass through setter to the sheet below
export var sheet:Texture setget set_sheet

onready var origSheet = sheet;
	
func set_sheet(value):
	sheet=value
	if $sprite or Engine.editor_hint:
		$sprite.texture = value

# Member variables
const MOTION_SPEED = 160 # Pixels/second

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("move_bottom"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
	
	if hat != null && Input.is_action_just_pressed("hat_off"):
		get_parent().add_child(hat)
		hat.position = position;
		hat.visible = true
		hat.collision_mask = 1
		hat.dropped = true;
		hat._ready();
		hat=null;
		set_sheet(origSheet)