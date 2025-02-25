extends CanvasLayer

@onready var transitioner: AnimationPlayer = $transitioner


func change_scene_to_file(target: String) -> void:
	transitioner.play("Scene Change")
	await transitioner.animation_finished
	get_tree().change_scene_to_file(target)
	transitioner.play_backwards("Scene Change")
	await transitioner.animation_finished
	transitioner.play("RESET")
