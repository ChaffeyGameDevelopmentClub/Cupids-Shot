extends Area2D

#Set up a max so we can't make it too strong
@export var maximum_length : float = 200.00
var touch_down = false
var position_start = Vector2.ZERO
var position_end = Vector2.ZERO

var new_vector = Vector2.ZERO

var arrow = null

@export var base_rotation = 0


@onready var trajectory: Line2D = $Line2D
@onready var bow: Sprite2D = $Bow



func _process(delta: float) -> void:
	
	if arrow && touch_down:
		update_trajectory(new_vector, delta)

func _input(event: InputEvent) -> void:
	
	if !arrow:
		return
	
	
	if event.is_action_pressed("left_click"):
		touch_down = true
		
	
	if not touch_down:
		return

		
	if event.is_action_released("left_click"):
		touch_down = false
		arrow._launch_arrow(new_vector*2)
		var cameraTween:Tween = get_tree().create_tween()
		cameraTween.tween_property(arrow.get_child(1), "position", Vector2(165, 0), .5)
		trajectory.clear_points()

		
	if event is InputEventMouseMotion and touch_down:
		new_vector =  get_global_mouse_position() - global_position
		if new_vector.length() > maximum_length:
			new_vector = new_vector.normalized()*maximum_length
		bow.rotation = new_vector.angle()

		print(arrow.rotation)
		arrow.rotation = bow.rotation


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		arrow = area.get_parent()
		arrow.arrowLaunched = false
		var positionTween:Tween = get_tree().create_tween()
		positionTween.tween_property(arrow, "global_position", global_position, 1)
		var rotationTween:Tween = get_tree().create_tween()
		rotationTween.tween_property(arrow, "rotation", base_rotation, 1)
		var cameraTween:Tween = get_tree().create_tween()
		cameraTween.tween_property(arrow.get_child(1), "position", Vector2(0,0), 1)


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		arrow = null

func update_trajectory(input:Vector2, delta:float):
	var max_points = 300
	var vel = input
	trajectory.clear_points()
	var pos = Vector2.ZERO
	for i in max_points:
		trajectory.add_point(pos)
		vel.y += 40 * delta
		pos += vel * delta
