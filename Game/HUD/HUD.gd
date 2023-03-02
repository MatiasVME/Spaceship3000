extends CanvasLayer

var lives := 0:
	set(value):
		var current_node = get_node("Control/VBox/HeaderBG/Lives/Live" + str(value))
		var tween = get_tree().create_tween()
		
		if value > lives:
			tween.tween_property(
				current_node, 
				"scale", 
				Vector2.ONE, 
				0.4
			).from(Vector2.ZERO).set_trans(Tween.TRANS_BOUNCE)
			tween.tween_callback(current_node.show)
			current_node.show()
		elif value < lives:
			current_node.scale = Vector2.ONE
			tween.tween_property(
				current_node, 
				"scale", 
				Vector2.ZERO, 
				0.4
			).from(Vector2.ONE).set_trans(Tween.TRANS_BOUNCE)
			tween.tween_callback(current_node.hide)
			current_node.hide()
		
		lives = value
		Main.lives = value
