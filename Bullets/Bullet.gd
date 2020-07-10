extends Area2D

var speed = 600.0
var direction = Vector2.RIGHT
var damage = 1

func _ready():
	rotation = position.angle_to_point(direction)
	
func _process(delta):
	global_position += direction * speed * delta

func _on_Bullet_visibility_changed():
	if get_viewport_rect().has_point(global_position): 
#		queue_free()
		pass

func _on_Bullet_body_entered(body):
	if body.is_in_group("Solid"):
		queue_free()
	if body.is_in_group("Enemy"):
		body.apply_damage(damage)
	pass # Replace with function body.
