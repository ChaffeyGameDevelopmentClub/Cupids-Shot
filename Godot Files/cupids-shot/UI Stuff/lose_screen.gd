extends Control

@export var LoseScreen : Control


func _on_restart_button_pressed() -> void:
	WinLose.reset()
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	WinLose.reset()
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")
