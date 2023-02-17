extends Area2D

const REC_BULLET = preload("res://Game/Bullet/Bullet.tscn")

var speed = 300

var dir = 0
var mov := Vector2.ZERO

var fire

func _process(delta):
	## Movement
	dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if dir == 1 and global_position.x < 660:
		mov.x = dir * delta * speed
	elif dir == -1  and global_position.x > 60:
		mov.x = dir * delta * speed
	else:
		mov.x = 0
	
	global_position += mov
	
	## Fire bullets
	fire = Input.is_action_just_pressed("ui_accept")
	
	if fire:
		var inst_bullet = REC_BULLET.instantiate()
		get_parent().add_child(inst_bullet)
		inst_bullet.direction = inst_bullet.BulletDirection.TOP
		inst_bullet.global_position = $BulletSpawn.global_position
	
