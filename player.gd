tool
extends KinematicBody2D

class_name Player

#Refrence to to the hat the player has on so they can drop it
var hat;

# -1 for left, 0 for idle, 1 for right
var animation = 0

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
	if motion.x > 0 and animation != 1:		
		animation = 1
		$sprite/AnimationPlayer.play("right")
	elif motion.x < 0 and animation != -1:
		animation = -1
		$sprite/AnimationPlayer.play("left")
	elif motion.x == 0 and motion.y == 0:
		if animation != 0:
			animation = 0
			$sprite/AnimationPlayer.play("idle")
		elif randi() % 180 == 0:
			$sprite/AnimationPlayer.play("idle_rare")
			$sprite/AnimationPlayer.queue("idle")
	
	if hat != null && Input.is_action_just_pressed("hat_off"):
		hat.position = position;
		hat.visible = true
		hat.collision_mask = 1
		hat.dropped = true;
		hat=null;
		set_sheet(origSheet)
		get_parent().defaultWalls()