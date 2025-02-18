extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("Bounce_x"):
		area.Bounce_x()





func _on_tb_walls_area_entered(area: Area2D) -> void:
	if area.has_method("Bounce_y"):
		area.Bounce_y()
