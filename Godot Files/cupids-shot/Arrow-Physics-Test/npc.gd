extends Area2D

@export var isLover:bool = false





func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		
		if isLover:
			pass
			#Play love sound
			#Put up win screen
		else:
			pass
			#Play sad love sound
			#put up lose screen
