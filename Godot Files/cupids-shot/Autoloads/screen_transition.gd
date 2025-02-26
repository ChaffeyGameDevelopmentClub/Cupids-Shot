extends CanvasLayer

@onready var transitioner: AnimationPlayer = $transitioner

var levels:Array = [
"res://Level assets/Scenes/Levels/level-0.tscn",
"res://Levels/Tutorial/Level 1.tscn",
"res://Levels/Tutorial/Level 2.tscn",
"res://Levels/Tutorial/Level 3.tscn",
"res://Levels/Tutorial/Level 4.tscn"
]

var current_level = 1;

func change_scene_to_file(target: String) -> void:
	AudioServer.remove_bus_effect(0, 0)
	transitioner.play("Scene Change")
	AudioBus.music_transition(-20, 1)
	await transitioner.animation_finished
	AudioBus.music_bus.stop()
	get_tree().change_scene_to_file(target)
	# Music change because I am smart -kev
	if target == "res://UI Stuff/Main-Menu/main_menu.tscn":
		AudioBus.play_music("Menu")
	else:
		AudioBus.play_music("BGM")
	transitioner.play_backwards("Scene Change")
	AudioBus.music_bus.play()
	AudioBus.music_transition(0, 1)
	await transitioner.animation_finished
	transitioner.play("RESET")

func next_level():
	if current_level<levels.size()-1:
		current_level+=1
		change_scene_to_file(levels[current_level])
	else:
		change_scene_to_file("res://UI Stuff/Main-Menu/main_menu.tscn")

func reset_level():
	change_scene_to_file(levels[current_level])
