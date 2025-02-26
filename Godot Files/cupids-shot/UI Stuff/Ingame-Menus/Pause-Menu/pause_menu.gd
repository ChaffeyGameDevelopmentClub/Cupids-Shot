extends Control

# baby's first pause menu be like

@export var PauseMenu : Control
@export var ButtonDesc : Label

var menu_up = false
var muffle_effect = AudioEffectLowPassFilter.new()

# Again, i refuse to write this 4 times
func pause_menu_button_press():
	PauseMenu.hide()
	AudioBus.play_sound("UI Short")
	AudioServer.remove_bus_effect(0, 0)
	get_tree().paused = false

# So you can use escape
func _input(event):
	if event.is_action_released("ui_cancel"):
		if menu_up:
			PauseMenu.hide()
			AudioServer.remove_bus_effect(0, 0)
			get_tree().paused = false
			menu_up = false
		else:
			PauseMenu.show()
			AudioServer.add_bus_effect(0, muffle_effect, 0)
			get_tree().paused = true
			menu_up = true

func _on_unpause_button_pressed() -> void:
	pause_menu_button_press()
	menu_up = false

func _on_restart_button_pressed() -> void:
	pause_menu_button_press()
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	pause_menu_button_press()
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")

# Hover stuff teehee
func _on_unpause_button_mouse_entered() -> void:
	ButtonDesc.text = "Resume"

func _on_unpause_button_mouse_exited() -> void:
	ButtonDesc.text = ""

func _on_restart_button_mouse_entered() -> void:
	ButtonDesc.text = "Restart"

func _on_restart_button_mouse_exited() -> void:
	ButtonDesc.text = ""

func _on_main_menu_button_mouse_entered() -> void:
	ButtonDesc.text = "Main Menu"

func _on_main_menu_button_mouse_exited() -> void:
	ButtonDesc.text = ""
