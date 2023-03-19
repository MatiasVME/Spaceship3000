extends Node2D

func _ready():
	create_enemies()
	
	Main.lives = 1
	
	Signals.dead.connect(_on_dead)


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
