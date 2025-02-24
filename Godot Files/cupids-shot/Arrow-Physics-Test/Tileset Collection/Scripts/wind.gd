extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = Vector2(0,-2)


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = Vector2(0,1)
