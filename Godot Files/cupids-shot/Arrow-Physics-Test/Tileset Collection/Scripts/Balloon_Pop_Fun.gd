extends Area2D

@onready var balloon_normal: Sprite2D = $"Balloon Normal"
@onready var balloon_popped: AnimatedSprite2D = $BalloonPopped
const CONFETTI_PARTICLES = preload("res://Sprites-And-Stuff/Scenes/Confetti/Confetti Particles.tscn")
func BalloonPop() -> void:
	balloon_normal.visible = false
	balloon_popped.visible = true
	balloon_popped.play("popped")
	var new_confetti_spawn = CONFETTI_PARTICLES.instantiate()
	new_confetti_spawn.position = position
	get_parent().add_child(new_confetti_spawn)
	await(balloon_popped.animation_looped)
	
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("heygafyusgdf")
	if area.is_in_group("arrow"):
		var dir = global_position - area.global_position;
		area.true_velocity = area.true_velocity.bounce(dir.normalized())
		BalloonPop()
