extends Area2D

@export var isLover:bool = false
@export var sprite:AnimatedSprite2D


func _ready() -> void:
	sprite.play("Default")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		
		var arrow = area.get_parent()
		arrow.stuck = true
		var posTween:Tween = get_tree().create_tween()
		posTween.tween_property(arrow.get_child(1), "position", Vector2(0,0), 1)
		
		var volumeTween:Tween = get_tree().create_tween()
		volumeTween.tween_property(AudioBus.music_bus, "volume_db", -20, 1.5)
		
		if isLover:
			AudioBus.play_sound("Arrow Success")
			sprite.play("Love")
			await get_tree().create_timer(4).timeout 
			WinLose.Win()
			#Play love sound
			#Put up win screen
		else:
			AudioBus.play_sound("Arrow Fail")
			sprite.play("Love")
			await get_tree().create_timer(3).timeout 
			WinLose.Lose()
			pass
			#Play sad love sound
			#put up lose screen
