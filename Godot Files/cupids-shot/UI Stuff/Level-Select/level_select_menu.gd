extends Control

# Scene paths
@export_file("*.tscn") var lvl1path : String
@export_file("*.tscn") var lvl2path : String
@export_file("*.tscn") var lvl3path : String
@export_file("*.tscn") var lvl4path : String
@export_file("*.tscn") var lvl5path : String

# Buttons

func _on_lv_l_1_button_pressed() -> void:
	get_tree().change_scene_to_file(lvl1path)

func _on_lv_l_2_button_pressed() -> void:
	get_tree().change_scene_to_file(lvl2path)

func _on_lv_l_3_button_pressed() -> void:
	get_tree().change_scene_to_file(lvl3path)

func _on_lv_l_4_button_pressed() -> void:
	get_tree().change_scene_to_file(lvl4path)

func _on_lv_l_5_button_pressed() -> void:
	get_tree().change_scene_to_file(lvl5path)
