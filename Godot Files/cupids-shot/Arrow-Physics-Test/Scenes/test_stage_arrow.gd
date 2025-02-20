extends Node2D

@onready var arrow: Area2D = $Arrow
@onready var camera_2d: Camera2D = $Camera2D


func _process(delta: float) -> void:
	camera_2d.position = arrow.position
	pass

#Do not press space no more, this was a test
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		print("it did launch")
		arrow._launch_arrow(Vector2(randf()*randi_range(-250,250), -randf()*1000))
		pass
	if event.is_action_pressed("ui_right"):
		pass

#Passed from vector-get, it gets the vector to launch the arrow in that direction
func _launch(direction: Vector2) -> void:
	
	arrow._launch_arrow(direction)
	pass

#godot structure moment, it's easier to just get the vector from the level script than it is for the vecttor-get
#object to get it itself
func get_arrow_location() -> Vector2:
	var location : Vector2 = arrow.position
	return location
