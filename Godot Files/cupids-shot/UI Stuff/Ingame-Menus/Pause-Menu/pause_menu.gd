extends Control

# baby's first pause menu be like

@export var PauseMenu : Control

var menu_up = false
var muffle_effect = AudioEffectLowPassFilter.new()

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
	PauseMenu.hide()
	AudioServer.remove_bus_effect(0, 0)
	get_tree().paused = false
	menu_up = false

func _on_restart_button_pressed() -> void:
	PauseMenu.hide()
	get_tree().paused = false
	AudioServer.remove_bus_effect(0, 0)
	ScreenTransition.reset_level()

func _on_main_menu_button_pressed() -> void:
	PauseMenu.hide()
	get_tree().paused = false
	AudioServer.remove_bus_effect(0, 0)
	ScreenTransition.change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")
