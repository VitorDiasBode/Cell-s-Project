extends Node2D

export(PackedScene) var shot_scene = load("res://Bullets/Bullet.tscn")
export var shoot_cooldown = 0.3
var shoot_timer = 0.0

func _process(delta):
	if Input.is_action_pressed("shoot") and shoot_timer == 0:
		var shot = shot_scene.instance()
		shot.direction = get_shoot_direction()
		get_parent().get_parent().add_child(shot)
		shot.global_position = $ShootPosition.global_position
		shoot_timer = shoot_cooldown
	if shoot_timer > 0:
		shoot_timer = max(shoot_timer - delta, 0)
		

func get_shoot_direction():
	var shoot_direction = Vector2()
	shoot_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	shoot_direction.y = int(Input.is_action_pressed("look_down")) - int(Input.is_action_pressed("look_up"))
	if !shoot_direction:
		shoot_direction.x = get_parent().look_direction
	return shoot_direction
