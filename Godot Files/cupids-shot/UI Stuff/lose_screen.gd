extends Control

@export var LoseScreen : Control
@export var ButtonDesc : Label

func _on_restart_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn", "Menu")

# Hover over Buttons
func _on_restart_button_mouse_entered() -> void:
	ButtonDesc.text = "Restart"

func _on_restart_button_mouse_exited() -> void:
	ButtonDesc.text = ""

func _on_main_menu_button_mouse_entered() -> void:
	ButtonDesc.text = "Main Menu"

func _on_main_menu_button_mouse_exited() -> void:
	ButtonDesc.text = ""
