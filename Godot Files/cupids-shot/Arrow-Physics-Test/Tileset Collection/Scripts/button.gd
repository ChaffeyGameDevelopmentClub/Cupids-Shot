extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		var direction = Vector2.DOWN.rotated(rotation)
		var arrow_vector = area.true_velocity.normalized()
		
		
		var block_to_arrow: Vector2 = global_position - area.global_position
		if abs(block_to_arrow.y)>abs(block_to_arrow.x):
			area.Bounce_y()
		else:
			area.Bounce_x()
		
		if (arrow_vector.dot(direction)/(arrow_vector.length()*direction.length()) >.5):
			sprite.play("pressed")
