extends CharacterBody2D

var limit1 := Vector2.ZERO
var limit2 := Vector2(720, 600)

var speed := 200

var dir := Vector2.ZERO
var mov := Vector2.ZERO

enum MovementType {
	LEFT_RIGHT,
	RIGHT_LEFT
}

@export
var movement_type : MovementType


func setup(_movement_type : MovementType):
	movement_type = _movement_type
	
	match movement_type:
		MovementType.LEFT_RIGHT:
			dir.x = 1
		MovementType.RIGHT_LEFT:
			dir.x = -1


func _process(delta):
	match movement_type:
		MovementType.LEFT_RIGHT:
			movement_left_right(delta)


func movement_left_right(delta):
	mov.x = dir.x * delta * speed
	
	
