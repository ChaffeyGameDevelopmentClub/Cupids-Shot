extends Control

@export var LoseScreen : Control


func _on_restart_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")
