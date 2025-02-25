extends Area2D




func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		AudioBus.play_sound("Glass Break")
		queue_free()
