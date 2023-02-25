extends CanvasLayer

var lives := 3:
	set(value):
		if value < lives:
			var tween = get_tree().create_tween()
			get_node("Control/Lives/Live" + str(value)).scale = Vector2.ZERO
			tween.tween_property(get_node("Control/Lives/Live" + str(value)), 
				"scale", 
				Vector2.ONE, 
				0.8
			)
			get_node("Control/Lives/Live" + str(value)).show()
			tween.play()
		elif value > lives:
			var tween = get_tree().create_tween()
			get_node("Control/Lives/Live" + str(value)).scale = Vector2.ONE
			tween.tween_property(get_node("Control/Lives/Live" + str(value)), 
				"scale", 
				Vector2.ZERO, 
				0.8
			)
			await get_node("Control/Lives/Live" + str(value)).hidden
			tween.play()
			
		lives = value

func reset_lives():
	lives = 1
	
