extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		AudioBus.play_sound("Glass Break")
		sprite.play("Break")
		await get_tree().create_timer(1).timeout
		queue_free()
