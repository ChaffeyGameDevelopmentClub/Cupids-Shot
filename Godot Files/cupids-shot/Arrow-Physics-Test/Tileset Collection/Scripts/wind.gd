extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var direction:Vector2

func _ready() -> void:
	animated_sprite_2d.play("default")
	direction = Vector2.UP.rotated(rotation)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = direction*2


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		area.gravity_direction = Vector2(0,1)
