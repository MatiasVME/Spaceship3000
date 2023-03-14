extends Control

@onready var nlives = $VBox/HeaderBG/Lives

var lives := 0:
	set(value):
		if value <= 0:
			lives = value
			Main.lives = value
			Main.game_over()
			return
		
		var current_node = nlives.get_node("Live" + str(value))
		var tween = get_tree().create_tween()
		
		if value > lives:
			tween.tween_property(
				current_node, 
				"scale", 
				Vector2.ONE, 
				0.4
			).from(Vector2.ZERO).set_trans(Tween.TRANS_BOUNCE)
			current_node.show()
		elif value < lives:
			tween.tween_property(
				current_node, 
				"scale", 
				Vector2.ZERO, 
				0.4
			).from(Vector2.ONE).set_trans(Tween.TRANS_BOUNCE)
			current_node.hide()
		
		lives = value
		Main.lives = value
