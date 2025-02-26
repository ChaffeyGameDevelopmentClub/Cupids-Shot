extends AnimatedSprite2D

class_name Cupid
#position Vector2(173, 3.5)
var arrow_resource = preload("res://Arrow-Physics-Test/Scenes/arrow-test.tscn")

func shoot_arrow():
	play("Shoot")
	AudioBus.play_sound("Arrow Charge")
	await get_tree().create_timer(2.4).timeout
	
	AudioBus.play_sound("Arrow Shoot")
	var arrow = arrow_resource.instantiate()
	get_parent().add_child(arrow)
	arrow.global_position = global_position + Vector2(8,3.5)
	arrow._launch_arrow(Vector2(150,0))
	arrow.get_child(1).make_current()
