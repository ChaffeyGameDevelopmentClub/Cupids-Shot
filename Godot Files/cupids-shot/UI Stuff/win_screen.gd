extends Control

@export var WinScreen : Control
@export var ButtonDesc : Label

func _on_next_level_button_pressed() -> void:
	AudioBus.play_sound("UI Long")
	WinScreen.hide()
	WinLose.reset()
	ScreenTransition.next_level()

func _on_restart_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	WinLose.reset()
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")

# Button Hovers
func _on_main_menu_button_mouse_entered() -> void:
	ButtonDesc.text = "Main Menu"

func _on_main_menu_button_mouse_exited() -> void:
	ButtonDesc.text = ""

func _on_restart_button_mouse_entered() -> void:
	ButtonDesc.text = "Restart"

func _on_restart_button_mouse_exited() -> void:
	ButtonDesc.text = ""

func _on_next_level_button_mouse_entered() -> void:
	ButtonDesc.text = "Next Level"

func _on_next_level_button_mouse_exited() -> void:
	ButtonDesc.text = ""
