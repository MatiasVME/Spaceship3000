extends Node2D

func _ready():
	create_enemies()
	$HUD.lives = 1
	
	Signals.dead.connect(_on_dead)


func create_enemies():
	for enemy in $Enemies.get_children():
		enemy.setup(enemy.MovementType.RIGHT)


func _on_dead(lives):
	$HUD.lives = lives
