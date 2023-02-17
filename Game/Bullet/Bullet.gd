extends Area2D

@export var speed := 300

enum BulletDirection {
	TOP,
	BOTTOM
}

@export 
var direction : BulletDirection


func _process(delta):
	match direction:
		BulletDirection.BOTTOM:
			global_position.y += delta * speed
		BulletDirection.TOP:
			global_position.y -= delta * speed


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is Enemy:
		area.dead()
		dead()


func dead():
	$Anim.play("destroy")
	$Collision.call_deferred("set_disabled", true)


func _on_anim_animation_finished(anim_name):
	if anim_name == "destroy":
		queue_free()
