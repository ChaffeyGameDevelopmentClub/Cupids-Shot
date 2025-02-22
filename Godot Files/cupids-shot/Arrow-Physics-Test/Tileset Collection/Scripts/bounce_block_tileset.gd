extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		var arrow = area.get_parent()
		var block_to_arrow: Vector2 = global_position - arrow.global_position
		if abs(block_to_arrow.y)>abs(block_to_arrow.x):
			arrow.Bounce_y()
		else:
			arrow.Bounce_x()
