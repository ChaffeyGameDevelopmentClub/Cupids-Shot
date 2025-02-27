extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("default")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = Vector2(0,-2)


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = Vector2(0,1)
