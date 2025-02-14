extends Area2D

 #Set up a max so we can't make it too strong
@export var maximum_length : float = 200.00
var touch_down = false
var position_start = Vector2.ZERO
var position_end = Vector2.ZERO

var new_vector = Vector2.ZERO

#This is not real maybe
#Get the parent of the level, it might work per level but honestly I don't know, it might be better 
#and optimal just to do
#var current_level = get_parent(), but as it turns out it's always NULL
#IDK WHY
@onready var test_world: Node2D = $".."

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
	
	if not touch_down:
		return
		
	if event.is_action_released("left_click"):
		touch_down = false
		test_world._launch(new_vector)
		
		
	if event is InputEventMouseMotion and touch_down:
		position_end = event.position
		new_vector = -(position_end - position_start)
		new_vector = new_vector.clamp(Vector2(-200,-200),Vector2(200,200))
		queue_redraw()

#Follows the arrow while bouncing
func _process(delta: float) -> void:
	arrow_location = test_world.get_arrow_location()
	position = arrow_location
	pass
#Lets the input function happen
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		touch_down = true
		position_start = event.position
	pass # Replace with function body.
