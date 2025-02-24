extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var slide_path: Path2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		var arrow = area.get_parent()
		var direction = Vector2.DOWN.rotated(rotation)
		var arrow_vector = arrow.true_velocity.normalized()
		
		
		var block_to_arrow: Vector2 = global_position - arrow.global_position
		if abs(block_to_arrow.y)>abs(block_to_arrow.x):
			arrow.Bounce_y()
		else:
			arrow.Bounce_x()
		
		if (arrow_vector.dot(direction)/(arrow_vector.length()*direction.length()) >.5):
			sprite.play("pressed")
			slide_path.type = 3 #start slide path
