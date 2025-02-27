extends Node2D

@onready var line_2d: Line2D = $Line2D

func set_drawing_false():
	line_2d.is_drawing = false
	
func set_drawing_true():
	line_2d.is_drawing = true
