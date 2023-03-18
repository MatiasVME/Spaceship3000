extends Node2D

func _ready():
	create_enemies()
	
	Main.lives = 1
	
	Signals.dead.connect(_on_dead)
	Signals.game_over.connect(_on_game_over)


func _input(event):
	if event.is_action_pressed("+"):
		Main.lives += 1
	elif event.is_action_pressed("-"):
		Main.lives -= 1


func create_enemies():
	for enemy in $Enemies.get_children():
		enemy.setup(enemy.MovementType.RIGHT)


func _on_dead(lives):
	$HUD.lives = lives


func _on_game_over():
	Curtain.change_scene_to_file("res://MainScreens/GameOver/GameOver.tscn")
