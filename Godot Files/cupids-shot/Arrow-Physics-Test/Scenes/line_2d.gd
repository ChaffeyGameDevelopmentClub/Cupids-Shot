extends Line2D

@export var length = 100
@export var is_drawing = true;
var point : Vector2 


func _process(delta: float) -> void:
	if is_drawing:
		length = 500
		global_position = Vector2(0,0)
		global_rotation = 0
		point = get_parent().global_position
		add_point(to_local(point))
		while get_point_count()>length:
			remove_point(0)
	elif !is_drawing and get_point_count()>2:
		
		global_position = Vector2(0,0)
		global_rotation = 0
		point = get_parent().global_position
		add_point(to_local(point))
		while get_point_count()>lerp(length,100,.1):
			remove_point(0)
	pass
