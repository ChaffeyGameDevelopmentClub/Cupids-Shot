extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var balloon_normal: Sprite2D = $"Balloon Normal"
@onready var balloon_popped: AnimatedSprite2D = $BalloonPopped
const CONFETTI_PARTICLES = preload("res://Sprites-And-Stuff/Scenes/Confetti/Confetti Particles.tscn")
func BalloonPop() -> void:
	balloon_normal.visible = false
	balloon_popped.visible = true
	balloon_popped.play("popped")
	collision_shape_2d.queue_free()
	var new_confetti_spawn = CONFETTI_PARTICLES.instantiate()
	new_confetti_spawn.position = position
	get_parent().add_child(new_confetti_spawn)
	await(balloon_popped.animation_looped)
	balloon_popped.hide()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("heygafyusgdf")
	if area.is_in_group("arrow"):
		var arrow = area.get_parent()
		var dir = global_position - arrow.global_position;
		arrow.true_velocity = arrow.true_velocity.bounce(dir.normalized())
		BalloonPop()
