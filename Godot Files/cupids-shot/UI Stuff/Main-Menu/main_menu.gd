extends Control

@export var TitleLabel: Label

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_start_game_pressed() -> void:
	# Currently ends you to the game scene
	get_tree().change_scene_to_file("res://Arrow-Physics-Test/Scenes/test-stage-arrow.tscn")

func _on_options_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
