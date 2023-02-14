extends CharacterBody2D

var speed = 300

var dir = 0
var move := Vector2.ZERO


func _process(delta):
	dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if dir == 1 and global_position.x < 660:
		move.x = dir * delta * speed
	elif dir == -1  and global_position.x > 60:
		move.x = dir * delta * speed
	else:
		move.x = 0
	
	move_and_collide(move)
