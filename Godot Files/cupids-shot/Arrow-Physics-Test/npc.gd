extends Area2D

@export var isLover:bool = false





func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		
		if isLover:
			AudioBus.play_sound("Arrow Success")
			pass
			#Play love sound
			#Put up win screen
		else:
			AudioBus.play_sound("Arrow Fail")
			pass
			#Play sad love sound
			#put up lose screen
