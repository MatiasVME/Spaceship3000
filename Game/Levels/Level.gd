extends Node2D

const REC_PLAYER = preload("res://Game/Players/Player.tscn")

const INITAL_POS = Vector2(360, 670)


func _ready():
	create_enemies()
	player_spawn()
	
	Main.lives = 1
	
	Signals.dead.connect(_on_dead)


func _input(event):
	# Para testeo de la vidas
	if event.is_action_pressed("+"):
		Main.lives += 1
	elif event.is_action_pressed("-"):
		Main.lives -= 1


func player_spawn():
	var new_player = REC_PLAYER.instantiate()
	add_child(new_player)
	new_player.global_position = INITAL_POS


func create_enemies():
	for enemy in $Enemies.get_children():
		enemy.setup(enemy.MovementType.RIGHT)


func _on_dead():
	player_spawn()
