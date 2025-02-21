extends Area2D


func BalloonPop() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		var dir = global_position - area.global_position;
		area.true_velocity = area.true_velocity.bounce(dir.normalized())
		queue_free()
