extends Node2D

func _ready():
	$Enemy.setup($Enemy.MovementType.LEFT_RIGHT)
