extends CanvasLayer

@onready var transitioner: AnimationPlayer = $transitioner

var levels:Array = [
"res://Level assets/Scenes/Levels/level-0.tscn",
"res://Levels/Tutorial/Level 1.tscn",
"res://Levels/Tutorial/Level 2.tscn",
"res://Levels/Tutorial/Level 3.tscn",
"res://Levels/Tutorial/Level 4.tscn",
"res://Levels/Tutorial/Level 5.tscn",
"res://Levels/Tutorial/level_6.tscn",
"res://Levels/Tutorial/level_7.tscn",
"res://Levels/Tutorial/level_8.tscn",
"res://Levels/Tutorial/level_9.tscn",
"res://Levels/Tutorial/level_10.tscn",
"res://Levels/Tutorial/level_11.tscn",
"res://Levels/Tutorial/level_12.tscn",
"res://Levels/Tutorial/level_13.tscn",
"res://Levels/Tutorial/level_14.tscn",
"res://Levels/Tutorial/Level 15 BONUS.tscn"
]

var current_level = 1;

func change_scene_to_file(target: String, music:String = "") -> void:
	transitioner.play("Scene_Heart_Change_Start")
	AudioBus.music_transition(-20, 1)
	await transitioner.animation_finished
	get_tree().change_scene_to_file(target)
	transitioner.play("Scene_Heart_Change_End")
	AudioBus.music_transition(0, 1, music)
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
