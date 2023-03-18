extends Node

const MAX_LIVES = 5
const MIN_LIVES = 0

enum BulletOwner {
	ENEMY,
	PLAYER
}

var current_level := 1

var lives := 0:
	set(value):
		if lives >= MAX_LIVES:
			lives = MAX_LIVES
		elif value <= MIN_LIVES:
			lives = MIN_LIVES
			Signals.game_over.emit()
		else:
			lives = value
			Signals.gain_live.emit()
		
		print_debug(value)
