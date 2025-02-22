extends Control

func _on_test_lvl_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Arrow-Physics-Test/Scenes/test-stage-arrow.tscn")
