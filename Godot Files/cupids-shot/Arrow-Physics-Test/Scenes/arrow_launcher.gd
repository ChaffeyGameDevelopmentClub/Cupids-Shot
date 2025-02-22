extends Area2D

 #Set up a max so we can't make it too strong
@export var maximum_length : float = 200.00
var touch_down = false
var position_start = Vector2.ZERO
var position_end = Vector2.ZERO

var new_vector = Vector2.ZERO

var arrow = null

@export var base_rotation = 0

#Messing with the force
var force = Vector2.ZERO
@export var force_influence : int

#Uh, getting the position of the actual arrow so this always follows
#DO NOT MAKE IT A CHILD, it makes it super awkward
var arrow_location = Vector2.ZERO

#Draws the vector, pretty standard
func _draw() -> void:
	if touch_down:
		draw_line(position_start - global_position, (position_end - global_position), Color.BLUE_VIOLET,10)
	
		draw_line(position_start - global_position, (position_start - global_position + new_vector), Color.DARK_RED,16)
	pass
#Basic inputs, basically release gets the new vector into the arrow while holding still draws the vector
func _input(event: InputEvent) -> void:
	
	if !arrow:
		return
		
	if not touch_down:
		return
		
	if event.is_action_released("left_click"):
		touch_down = false
		#force = Vector2(abs(new_vector.x) / force_influence, abs(new_vector.y) /force_influence)
		arrow._launch_arrow(new_vector*2)
		queue_redraw()
		
		
	if event is InputEventMouseMotion and touch_down:
		position_end = event.global_position
		new_vector = (position_start - position_end)
		if new_vector.length() > maximum_length:
			new_vector = new_vector.normalized()*maximum_length
		queue_redraw()

	
#Lets the input function happen
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		touch_down = true
		position_start = event.global_position


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		arrow = area.get_parent()
		arrow.arrowLaunched = false
		var positionTween:Tween = get_tree().create_tween()
		positionTween.tween_property(arrow, "global_position", global_position, 1)
		var rotationTween:Tween = get_tree().create_tween()
		rotationTween.tween_property(arrow, "rotation", base_rotation, 1)


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		arrow = null
