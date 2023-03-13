extends Node

const MAX_LIVES = 5
const MIN_LIVES = 0

enum BulletOwner {
	ENEMY,
	PLAYER
}

var current_level := 1

var lives := 1:
	set(value):
		if value >= MAX_LIVES:
			lives = MAX_LIVES
		elif value <= MIN_LIVES:
			lives = MIN_LIVES
			Signals.game_over.emit()
		else:
			lives = value
			Signals.gain_live.emit()

func _ready():
	Signals.game_over.connect(_on_game_over)

func game_over():
	_on_game_over()

func _on_game_over():
	Curtain.change_scene_to_file("res://MainScreens/GameOver/GameOver.tscn")
