extends Control

@export var OpeningTimer: Timer

func _ready() -> void:
	$AnimationPlayer.play("opening")
	OpeningTimer.start()

func _on_opening_timer_timeout() -> void:
	AudioBus.play_music("BGM")
	get_tree().change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")
