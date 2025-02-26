extends AnimatedSprite2D

var arrow_resource = preload("res://Arrow-Physics-Test/Scenes/arrow-test.tscn")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		pass
		#shoot_arrow()

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
