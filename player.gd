extends KinematicBody2D

class_name Player

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 160 # Pixels/second

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up") or Input.is_key_pressed(KEY_W):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("move_bottom") or Input.is_key_pressed(KEY_S):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("move_left") or Input.is_key_pressed(KEY_A):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("move_right") or Input.is_key_pressed(KEY_D):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
