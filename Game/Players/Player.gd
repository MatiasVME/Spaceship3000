extends CharacterBody2D

const SPEED = 1

var dir = 0
var move := Vector2.ZERO


func _process(delta):
	dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if dir != 0:
		move.x = dir * delta * 300
	else:
		move.x = 0
	
	
	
	move_and_collide(move)
