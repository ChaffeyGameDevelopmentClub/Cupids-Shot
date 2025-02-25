extends Node2D

@onready var cloud_mover_lol: AnimationPlayer = $"Cloud mover lol"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cloud_mover_lol.play("cloud move")
	await(cloud_mover_lol.animation_finished)
