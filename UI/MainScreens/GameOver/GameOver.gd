extends Control


func _on_timer_timeout():
	Curtain.change_scene_to_file("res://UI/MainScreens/MenuScreen/MenuScreen.tscn")
