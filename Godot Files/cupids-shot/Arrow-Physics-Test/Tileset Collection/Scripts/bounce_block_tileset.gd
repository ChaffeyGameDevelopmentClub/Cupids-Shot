extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		var block_to_arrow: Vector2 = global_position - area.global_position
		if abs(block_to_arrow.y)>abs(block_to_arrow.x):
			area.Bounce_y()
		else:
			area.Bounce_x()
