extends Area2D

@export var isLover:bool = false
@export var sprite:AnimatedSprite2D


func _ready() -> void:
	sprite.play("Default")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		
		if isLover:
			AudioBus.play_sound("Arrow Success")
			sprite.play("Love")
			WinLose.Win()
			#Play love sound
			#Put up win screen
		else:
			AudioBus.play_sound("Arrow Fail")
			sprite.play("Love")
			WinLose.Lose()
			pass
			#Play sad love sound
			#put up lose screen
