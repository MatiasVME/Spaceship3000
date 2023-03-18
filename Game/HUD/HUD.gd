extends Control

@onready var nlives = $VBox/HeaderBG/Lives

var lives := 0:
	set(value):
		if value <= 0:
			lives = value
			Signals.game_over.emit()
		
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


func _ready():
	Signals.gain_live.connect(_on_gain_live)
	Signals.dead.connect(_on_dead)


func _on_gain_live():
	lives += 1


func _on_dead():
	# NOTA: Cuando quito una vida con la tecla "-" no pasa por acá
	lives -= 1

