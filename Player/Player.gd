extends KinematicBody2D

var walk_speed = 400.0
var jump_speed = 500.0
var fall_speed = 100.0
var jump_max_time = 0.2
var jump_time = 0.0
var jump_multiplier = 0.09
var can_jump = true

var max_fall_speed = 20000.0

var velocity = Vector2()
var move_direction = 1
var look_direction = 1

const GRAVITY = 30

func _physics_process(delta):
	move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if move_direction != 0:
		look_direction = move_direction 
	velocity.x = move_direction*walk_speed
	
	velocity.y += GRAVITY 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		can_jump = true
		velocity.y = -jump_speed
	if Input.is_action_pressed("jump") and can_jump:
		velocity.y -= jump_speed * jump_multiplier
		jump_time += delta
	
	if jump_time >= jump_max_time or Input.is_action_just_released("jump") or is_on_ceiling():
		can_jump = false
		jump_time = 0.0
	
	velocity = move_and_slide(velocity, Vector2.UP)


