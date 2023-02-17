extends Node2D

func _ready():
	for enemy in $Enemies.get_children():
		enemy.setup(enemy.MovementType.RIGHT)
