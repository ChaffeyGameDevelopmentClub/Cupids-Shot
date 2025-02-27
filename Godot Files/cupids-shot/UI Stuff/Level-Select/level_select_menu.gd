extends Control

# Scene paths
@export_file("*.tscn") var lvl1path : String
@export_file("*.tscn") var lvl2path : String
@export_file("*.tscn") var lvl3path : String
@export_file("*.tscn") var lvl4path : String
@export_file("*.tscn") var lvl5path : String
@export_file("*.tscn") var lvl6path : String
@export_file("*.tscn") var lvl7path : String
@export_file("*.tscn") var lvl8path : String
@export_file("*.tscn") var lvl9path : String
@export_file("*.tscn") var lvl10path : String
@export_file("*.tscn") var lvl11path : String
@export_file("*.tscn") var lvl12path : String
@export_file("*.tscn") var lvl13path : String
@export_file("*.tscn") var lvl14path : String
@export_file("*.tscn") var lvl15path : String
@export_file("*.tscn") var lvl16path : String
@export_file("*.tscn") var lvl17path : String
@export_file("*.tscn") var lvl18path : String
@export_file("*.tscn") var lvl19path : String
@export_file("*.tscn") var lvl20path : String

# Button function cuz i have decided against writing this 5 times
func lvl_select_button_press(target: String, lvl: int):
	AudioBus.play_sound("UI Long")
	ScreenTransition.current_level = lvl
	ScreenTransition.change_scene_to_file(target, "BGM")

# Button signals, had I known we'd might have more i would have automated it but alas 3:
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

func _on_lv_l_6_button_pressed() -> void:
	lvl_select_button_press(lvl6path, 6)

func _on_lv_l_7_button_pressed() -> void:
	lvl_select_button_press(lvl7path, 7)

func _on_lv_l_8_button_pressed() -> void:
	lvl_select_button_press(lvl8path, 8)

func _on_lv_l_9_button_pressed() -> void:
	lvl_select_button_press(lvl9path, 9)

func _on_lv_l_10_button_pressed() -> void:
	lvl_select_button_press(lvl10path, 10)

func _on_lv_l_11_button_pressed() -> void:
	lvl_select_button_press(lvl11path, 11)

func _on_lv_l_12_button_pressed() -> void:
	lvl_select_button_press(lvl12path, 12)

func _on_lv_l_13_button_pressed() -> void:
	lvl_select_button_press(lvl13path, 13)

func _on_lv_l_14_button_pressed() -> void:
	lvl_select_button_press(lvl14path, 14)

func _on_lv_l_15_button_pressed() -> void:
	lvl_select_button_press(lvl15path, 15)

func _on_lv_l_16_button_pressed() -> void:
	lvl_select_button_press(lvl16path, 16)

func _on_lv_l_17_button_pressed() -> void:
	lvl_select_button_press(lvl17path, 17)

func _on_lv_l_18_button_pressed() -> void:
	lvl_select_button_press(lvl18path, 18)

func _on_lv_l_19_button_pressed() -> void:
	lvl_select_button_press(lvl19path, 19)

func _on_lv_l_20_button_pressed() -> void:
	lvl_select_button_press(lvl20path, 20)
