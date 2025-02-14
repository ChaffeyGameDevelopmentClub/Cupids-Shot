extends Node2D

@onready var arrow: Area2D = $Arrow

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		print("it did launch")
		arrow._launch_arrow(Vector2(randf()*randi_range(-250,250), -randf()*1000))
		pass
	if event.is_action_pressed("ui_right"):
		pass
