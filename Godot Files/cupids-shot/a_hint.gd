extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_finished = false


func _process(delta: float) -> void:
	if !is_finished:
		is_finished=true
		animation_player.play("left_key")
		await(animation_player.animation_finished)
		animation_player.play_backwards("left_key")
		await(animation_player.animation_finished)
		animation_player.play("right_key")
		await(animation_player.animation_finished)
		animation_player.play_backwards("right_key")
		await(animation_player.animation_finished)
		is_finished = false
		pass
