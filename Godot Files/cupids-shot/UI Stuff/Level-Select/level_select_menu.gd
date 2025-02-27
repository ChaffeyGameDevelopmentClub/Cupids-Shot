extends Control

# Scene paths
@export_file("*.tscn") var lvl1path : String
@export_file("*.tscn") var lvl2path : String
@export_file("*.tscn") var lvl3path : String
@export_file("*.tscn") var lvl4path : String
@export_file("*.tscn") var lvl5path : String
@export_file("*.tscn") var lvl6path : String

# Button function cuz i have decided against writing this 5 times
func lvl_select_button_press(target: String, lvl: int):
	AudioBus.play_sound("UI Long")
	ScreenTransition.current_level = lvl
	ScreenTransition.change_scene_to_file(target, "BGM")

func _on_lv_l_1_button_pressed() -> void:
	lvl_select_button_press(lvl1path, 1)

func _on_lv_l_2_button_pressed() -> void:
	lvl_select_button_press(lvl2path, 2)

func _on_lv_l_3_button_pressed() -> void:
	lvl_select_button_press(lvl3path, 3)

func _on_lv_l_4_button_pressed() -> void:
	lvl_select_button_press(lvl4path, 4)

func _on_lv_l_5_button_pressed() -> void:
	lvl_select_button_press(lvl5path, 5)


func _on_texture_button_pressed() -> void:
	lvl_select_button_press(lvl6path, 6)
