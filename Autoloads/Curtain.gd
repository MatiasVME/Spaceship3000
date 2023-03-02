extends Control

func change_scene_to_file(scene):
	await get_tree().create_timer(1.0).timeout
	
	$Anim.play("show")
	get_tree().change_scene_to_file(scene)
	$Anim.play_backwards("show")
	
	await get_tree().create_timer(1.0).timeout
