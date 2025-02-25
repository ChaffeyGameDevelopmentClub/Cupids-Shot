extends Area2D


func BalloonPop() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("heygafyusgdf")
	if area.is_in_group("arrow"):
		var arrow = area.get_parent()
		var dir = global_position - arrow.global_position;
		arrow.true_velocity = arrow.true_velocity.bounce(dir.normalized())
		queue_free()
