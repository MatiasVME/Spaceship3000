extends Area2D

class_name Enemy

@export
var limit_left := 40
@export
var limit_right := 300

enum MovementType {
	RIGHT,
	LEFT
}

@export
var movement_type : MovementType

var speed := 100

var dir := Vector2.ZERO
var mov := Vector2.ZERO

var time := 0.0

func setup(_movement_type : MovementType):
	movement_type = _movement_type
	
	match movement_type:
		MovementType.RIGHT:
			dir.x = 1
		MovementType.LEFT:
			dir.x = -1


func _process(delta):
	match movement_type:
		MovementType.RIGHT:
			movement_right(delta)
		MovementType.LEFT:
			movement_left(delta)


func movement_right(delta):
	time += delta
	
	if global_position.x < limit_right:
		mov.x = dir.x * delta * speed
		mov.y = sin(time * 5) * 1
	else:
		movement_type = MovementType.LEFT
	
	global_position += mov


func movement_left(delta):
	time -= delta
	
	if global_position.x > limit_left:
		mov.x = -(dir.x * delta * speed)
		mov.y = -(sin(time * 5) * 1)
	else:
		movement_type = MovementType.RIGHT
	
	global_position += mov


func dead():
	$Anim.play("destroy")


func _on_anim_animation_finished(anim_name):
	if anim_name == "destroy":
		queue_free()
